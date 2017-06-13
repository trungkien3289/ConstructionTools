using LinqKit;
using OnlineStore.Infractructure.Utility;
using OnlineStore.Model.Context;
using OnlineStore.Model.Repository;
using OnlineStore.Model.ViewModel;
using OnlineStore.Service.Interfaces;
using OnlineStore.Service.Messaging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OnlineStore.Model.Mapper;
using System.IO;
using OnlineStore.Infractructure.Helper;

namespace OnlineStore.Service.Implements
{
    public class DisplayProductService : IDisplayProductService
    {
        #region Properties

        private static OnlineStoreMVCEntities context;
        private ProductRepository db;
        private CategoryRepository categoryRepository;
        private ProductGroupRepository productGroupRepository;
        private BrandRepository branchRepository;
        private const int classicStyleCategoryId = 4;
        private const int moderntyleCategoryId = 3;

        #endregion

        #region Constructures

        public DisplayProductService()
        {
            context = new OnlineStoreMVCEntities();
            db = new ProductRepository(context);
            categoryRepository = new CategoryRepository(context);
            productGroupRepository = new ProductGroupRepository(context);
            branchRepository = new BrandRepository(context);
        }

        #endregion

        #region Private functions

        /// <summary>
        /// Get list product with selected category, seach string, order, filter after price range, filter after brands, paging
        /// </summary>
        /// <param name="request">conditions for filter</param>
        /// <returns>list product matching with conditions</returns>
        private IEnumerable<ecom_Products> GetAllProductsMatchingQueryAndSort(GetProductsByCategoryRequest request)
        {
            var searchQuery = PredicateBuilder.True<ecom_Products>();

            if (request.BrandIds.Count() > 0)
            {
                searchQuery = searchQuery.And(p => request.BrandIds.Contains((int)p.BrandId));
            }
            if (request.BeginPrice != null)
            {
                searchQuery = searchQuery.And(p => p.Price >= request.BeginPrice);
            }
            if (request.EndPrice != null)
            {
                searchQuery = searchQuery.And(p => p.Price <= request.EndPrice);
            }
            if (request.SearchString != null && request.SearchString != string.Empty)
            {
                searchQuery = searchQuery.And(p => p.Name.Contains(request.SearchString));
            }
            if (request.CategoryId != null)
            {
                searchQuery = searchQuery.And(p => p.ecom_Categories.Select(c => c.Id).Contains((int)request.CategoryId));
            }

            searchQuery = searchQuery.And(p => p.Status == (int)Define.Status.Active);

            IEnumerable<ecom_Products> productsMatchingRefinement = db.Get(
                filter: searchQuery, includeProperties: "ecom_Brands,ecom_Categories,share_Images");
            switch (request.SortBy)
            {
                case ProductsSortBy.PriceLowToHigh:
                    productsMatchingRefinement = productsMatchingRefinement
                    .OrderBy(p => p.Price);
                    break;
                case ProductsSortBy.PriceHighToLow:
                    productsMatchingRefinement = productsMatchingRefinement
                    .OrderByDescending(p => p.Price);
                    break;
                case ProductsSortBy.ProductNameAToZ:
                    productsMatchingRefinement = productsMatchingRefinement
                    .OrderBy(p => p.Name);
                    break;
                case ProductsSortBy.ProductNameZToA:
                    productsMatchingRefinement = productsMatchingRefinement
                    .OrderByDescending(p => p.Name);
                    break;
            }

            return productsMatchingRefinement.ToList();

        }

        /// <summary>
        /// Get list product match conditions(seach string, best sell products, new products, sort, filter, paging...)
        /// </summary>
        /// <param name="request">condition filters</param>
        /// <param name="searchType">seach type(seach string or best products or new products)</param>
        /// <returns>list product matched with conditions</returns>
        private IEnumerable<ecom_Products> GetAllProductsMatchingSearchString(SearchProductRequest request, SearchType searchType = SearchType.AllProduct)
        {
            var searchQuery = PredicateBuilder.True<ecom_Products>();

            if (request.SearchString != null && request.SearchString != string.Empty)
            {
                searchQuery = searchQuery.And(p => p.Name.Contains(request.SearchString));
            }

            if (searchType == SearchType.NewProducts)
            {
                searchQuery = searchQuery.And(p => p.IsNewProduct == true);
            }

            if (searchType == SearchType.BestSellProducts)
            {
                searchQuery = searchQuery.And(p => p.IsBestSellProduct == true);
            }

            searchQuery = searchQuery.And(p => p.Status == (int)OnlineStore.Infractructure.Utility.Define.Status.Active);

            IEnumerable<ecom_Products> productsMatchingRefinement = db.Get(
                filter: searchQuery, includeProperties: "ecom_Brands,ecom_Categories");
            switch (request.SortBy)
            {
                case ProductsSortBy.PriceLowToHigh:
                    productsMatchingRefinement = productsMatchingRefinement
                    .OrderBy(p => p.Price);
                    break;
                case ProductsSortBy.PriceHighToLow:
                    productsMatchingRefinement = productsMatchingRefinement
                    .OrderByDescending(p => p.Price);
                    break;
                case ProductsSortBy.ProductNameAToZ:
                    productsMatchingRefinement = productsMatchingRefinement
                    .OrderBy(p => p.Name);
                    break;
                case ProductsSortBy.ProductNameZToA:
                    productsMatchingRefinement = productsMatchingRefinement
                    .OrderByDescending(p => p.Name);
                    break;
            }

            return productsMatchingRefinement.ToList();
        }

        /// <summary>
        /// Crop list product result to satisfy current page
        /// </summary>
        /// <param name="productsFound">list product need to paging</param>
        /// <param name="pageIndex">current index of page on Layout</param>
        /// <param name="numberOfResultsPerPage">total product displayed on a page</param>
        /// <returns>list product result</returns>
        private IEnumerable<ecom_Products> CropProductListToSatisfyGivenIndex(IEnumerable<ecom_Products> productsFound, int pageIndex, int numberOfResultsPerPage)
        {
            if (pageIndex > 1)
            {
                int numToSkip = (pageIndex - 1) * numberOfResultsPerPage;
                return productsFound.Skip(numToSkip)
                .Take(numberOfResultsPerPage).ToList();
            }
            else
            {
                return productsFound.Take(numberOfResultsPerPage).ToList();
            }
        }

        /// <summary>
        /// Get path of large size image of product 
        /// </summary>
        /// <param name="imageName">image name</param>
        /// <returns>large image path</returns>
        private string GetLargeProductImagePathFromSmallImage(string imageName)
        {
            if (imageName != null)
            {
                return DisplayProductConstants.LargeProductImageFolderPath + imageName;
            }
            else
            {
                return "/Content/Images/no-image.png";
            }
        }

        /// <summary>
        /// Get all branchs belong to products in selected category
        /// </summary>
        /// <returns></returns>
        private IEnumerable<BrandSummaryView> GetAllBranchInSelectedCategory(int? categoryId)
        {
            try
            {
                IEnumerable<ecom_Products> products = db.Get(
               filter: p => p.ecom_Categories.Select(c => c.Id).Contains((int)categoryId) && p.Status == (int)Define.Status.Active, includeProperties: "ecom_Brands").ToList();
                return products.Select(p => p.ecom_Brands).Where(b => b != null).Distinct().ToList().ConvertToBrandSummaryViews();
            }
            catch (Exception ex)
            {
                return null;
            }

        }

        #endregion

        #region Public functions

        public IEnumerable<ProductSummaryView> GetTopProductsByCategoryId(int categoryId, int top)
        {
            var searchQuery = PredicateBuilder.True<ecom_Products>();
            searchQuery = searchQuery.And(p => p.ecom_Categories.Select(c => c.Id).Contains(categoryId));
            searchQuery = searchQuery.And(p => p.Status == (int)Define.Status.Active);
            IEnumerable<ecom_Products> productsMatchingRefinement = db.Get(
                filter: searchQuery, includeProperties: "ecom_Brands,ecom_Categories,share_Images").Take(top).OrderBy(p => p.Name).ToList();

            return productsMatchingRefinement.ConvertToProductSummaryViews();
        }

        /// <summary>
        /// Get random a number product belong to a specific category
        /// </summary>
        /// <param name="categoryId">category id</param>
        /// <param name="count">number of products</param>
        /// <returns></returns>
        public IEnumerable<ProductSummaryView> GetRandomProductsByCategoryId(int categoryId, int count)
        {
            var searchQuery = PredicateBuilder.True<ecom_Products>();
            searchQuery = searchQuery.And(p => p.ecom_Categories.Select(c => c.Id).Contains(categoryId));
            searchQuery = searchQuery.And(p => p.Status == (int)Define.Status.Active);
            IEnumerable<ecom_Products> productsMatchingRefinement = db.Get(
                filter: searchQuery, includeProperties: "ecom_Brands,ecom_Categories,share_Images").OrderBy(c => Guid.NewGuid()).Take(count).OrderBy(p => p.Name).ToList();

            return productsMatchingRefinement.ConvertToProductSummaryViews();
        }

        /// <summary>
        /// Get list product after category
        /// </summary>
        /// <param name="request">condition for filter</param>
        /// <returns>matched condition products</returns>
        public GetProductsByCategoryResponse GetProductsByCategory(GetProductsByCategoryRequest request)
        {
            string categoryName = categoryRepository.GetByID(request.CategoryId).Name;
            IEnumerable<ecom_Products> foundProducts = GetAllProductsMatchingQueryAndSort(request);

            GetProductsByCategoryResponse reponse = new GetProductsByCategoryResponse()
            {
                SelectedCategoryName = categoryName,
                SelectedCategory = request.CategoryId,
                BeginPrice = request.BeginPrice,
                EndPrice = request.EndPrice,
                NumberOfTitlesFound = foundProducts.Count(),
                TotalNumberOfPages = (int)Math.Ceiling((double)foundProducts.Count() / request.NumberOfResultsPerPage),
                CurrentPage = request.Index,
                TotalProducts = foundProducts.Count(),
                SearchString = request.SearchString,
                SortBy = (int)request.SortBy,
                BrandIds = request.BrandIds,
                Products = CropProductListToSatisfyGivenIndex(foundProducts, request.Index, request.NumberOfResultsPerPage).ConvertToProductSummaryViews(),
                Brands = GetAllBranchInSelectedCategory(request.CategoryId)// return list Brand exist in group product belong to selected category
            };

            return reponse;
        }

        /// <summary>
        /// Get details product
        /// </summary>
        /// <param name="id">id of product</param>
        /// <returns>Product details object</returns>
        public ProductDetailsView GetProductDetails(int id)
        {
            ecom_Products product = db.GetProductById(id);
            if (product == null)
            {
                return null;
            }
            else
            {
                BranchSummary branch = null;
                if (product.ecom_Brands != null)
                {
                    branch = new BranchSummary()
                    {
                        Id = product.ecom_Brands.Id,
                        Name = product.ecom_Brands.Name
                    };
                }
                ProductDetailsView productViewModel = new ProductDetailsView()
                {
                    Id = product.Id,
                    ProductCode = product.ProductCode,
                    Name = product.Name,
                    PriceFormatCurrency = FormatHelper.FormatMoney(product.Price),
                    OldPriceFormatCurrency = product.OldPrice !=null?FormatHelper.FormatMoney((decimal)product.OldPrice):"",
                    Price = product.Price,
                    OldPrice = product.OldPrice,
                    Description = product.Description,
                    Description2 = product.Description2,
                    Specification = product.Specification,
                    Tags = product.Tags,
                    IsNewProduct = product.IsNewProduct,
                    IsBestSellProduct = product.IsBestSellProduct,
                    Branch = branch,
                    Groups = product.ecom_ProductGroups.Select(g => new ProductGroupSummary()
                    {
                        Id = g.Id,
                        Name = g.Name,
                        Description = g.Description
                    }).ToList()
                };

                ImageInfor coverImage;
                if (product.CoverImage != null)
                {
                    coverImage = new ImageInfor()
                    {
                        smallImagePath = product.CoverImage.ImagePath,
                        largeImagePath = GetLargeProductImagePathFromSmallImage(product.CoverImage.ImageName)
                    };
                }
                else
                {
                    coverImage = new ImageInfor()
                    {
                        smallImagePath = "/Content/Images/no-image.png",
                        largeImagePath = "/Content/Images/no-image.png"
                    };
                }


                List<ImageInfor> productImages = product.share_Images.Select(i => new ImageInfor()
                {
                    smallImagePath = i.ImagePath,
                    largeImagePath = GetLargeProductImagePathFromSmallImage(i.ImageName)
                }).ToList();

                productViewModel.CoverImageUrl = coverImage;
                productViewModel.Images = productImages;

                return productViewModel;
            }
        }

        /// <summary>
        /// Get list new product in system
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ProductSummaryView> GetAllNewProduct()
        {
            IEnumerable<ecom_Products> products = db.Get(filter: p => p.IsNewProduct == true && p.Status == (int)Define.Status.Active).Take(10);

            return products.ConvertToProductSummaryViews();
        }

        /// <summary>
        /// Get list best sell product
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ProductSummaryView> GetAllBestSellProduct()
        {
            IEnumerable<ecom_Products> products = db.Get(filter: p => p.IsBestSellProduct == true && p.Status == (int)Define.Status.Active).Take(10);

            return products.ConvertToProductSummaryViews();
        }

        /// <summary>
        /// Get list product have high priority order
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ProductSummaryView> GetListHighPriorityOrderProduct()
        {
            IEnumerable<ecom_Products> products = db.Get(filter: p => p.Status == (int)Define.Status.Active, orderBy: p => p.OrderBy(x => x.SortOrder)).Take(10);

            return products.ConvertToProductSummaryViews();
        }

        /// <summary>
        /// Get list summary category, which have status is Active or Deactive
        /// </summary>
        /// <returns></returns>
        public IEnumerable<SummaryCategoryViewModel> GetTopCategories()
        {
            return categoryRepository.GetAllActiveCategories().ConvertToIndexCategoryViews();
        }

        /// <summary>
        /// Get list children categories of a specific category 
        /// </summary>
        /// <param name="parentId">parent identifier</param>
        /// <returns></returns>
        public IList<SummaryCategoryViewModel> GetCategoryChildrenById(int? parentId)
        {
            IList<SummaryCategoryViewModel> returnList = new List<SummaryCategoryViewModel>();
            IEnumerable<ecom_Categories> subCategories = categoryRepository.GetChildrenByParentCategoryId(parentId);
            foreach (ecom_Categories item in subCategories)
            {
                SummaryCategoryViewModel viewModelItem = item.ConvertToIndexCategoryView();
                if (item.ecom_Products.Count() > 0)
                {
                    viewModelItem.SubCategories = GetCategoryChildrenById(item.Id);
                }
                returnList.Add(viewModelItem);
            }

            return returnList;
        }

        /// <summary>
        /// Get treeview data source of category
        /// </summary>
        /// <returns></returns>
        public IEnumerable<SummaryCategoryTreeViewItemModel> GetCategoryTreeViewData()
        {
            IEnumerable<SummaryCategoryTreeViewItemModel> retList = new List<SummaryCategoryTreeViewItemModel>();
            // get list root categories
            IEnumerable<ecom_Categories> mainCategories = categoryRepository.GetChildrenByParentCategoryId(null);
            retList = from category in mainCategories
                      select new SummaryCategoryTreeViewItemModel
                      {
                          Id = category.Id,
                          Name = category.Name,
                          SortOrder = category.SortOrder,
                          Status = EnumHelper.GetDescriptionFromEnum((Define.Status)category.Status),
                          Items = GetChildrenCategoriesOfTreeView(category.Id)
                      };

            return retList;
        }

        /// <summary>
        /// Get List category childrent items of a parent category, that using for build category treeview
        /// </summary>
        /// <param name="parentId"></param>
        /// <returns></returns>
        public IEnumerable<SummaryCategoryTreeViewItemModel> GetChildrenCategoriesOfTreeView(int parentId)
        {
            IEnumerable<SummaryCategoryTreeViewItemModel> retList = new List<SummaryCategoryTreeViewItemModel>();
            IEnumerable<ecom_Categories> subCategories = categoryRepository.GetChildrenByParentCategoryId(parentId);
            retList = from category in subCategories
                      select new SummaryCategoryTreeViewItemModel
                      {
                          Id = category.Id,
                          Name = category.Name,
                          SortOrder = category.SortOrder,
                          Status = EnumHelper.GetDescriptionFromEnum((Define.Status)category.Status)
                      };

            return retList;
        }

        /// <summary>
        /// Search product by name
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public SearchProductResponse SearchByProductName(SearchProductRequest request, SearchType searchType)
        {
            IEnumerable<ecom_Products> foundProducts = GetAllProductsMatchingSearchString(request, searchType);
            SearchProductResponse response = new SearchProductResponse()
            {
                CategoryIds = request.CategoryIds,
                NumberOfTitlesFound = foundProducts.Count(),
                TotalNumberOfPages = (int)Math.Ceiling((double)foundProducts.Count() / request.NumberOfResultsPerPage),
                CurrentPage = request.Index,
                SearchString = request.SearchString,
                SortBy = (int)request.SortBy,
                BrandIds = request.BrandIds,
                Products = CropProductListToSatisfyGivenIndex(foundProducts, request.Index, request.NumberOfResultsPerPage).ConvertToProductSummaryViews(),
                Brands = foundProducts.Select(p => p.ecom_Brands).Where(b => b != null).Distinct().ToList().ConvertToBrandSummaryViews()// return list Brand exist in group product belong to selected category
            };
            return response;
        }

        /// <summary>
        /// Get list products in a specific group
        /// </summary>
        /// <param name="groupId"></param>
        /// <returns></returns>
        public GetProductInGroupReponse GetProductsInGroup(int groupId, int pageIndex, int sortBy, int numberOfResultsPerPage)
        {
            var group = productGroupRepository.GetGroupById(groupId);
            if (group == null)
            {
                return null;
            }
            else
            {
                var foundProducts = db.GetProductsInGroup(groupId);
                switch (sortBy)
                {
                    case (int)ProductsSortBy.PriceLowToHigh:
                        foundProducts = foundProducts.OrderBy(p => p.Price);
                        break;
                    case (int)ProductsSortBy.PriceHighToLow:
                        foundProducts = foundProducts.OrderByDescending(p => p.Price);
                        break;
                    case (int)ProductsSortBy.ProductNameAToZ:
                        foundProducts = foundProducts.OrderBy(p => p.Name);
                        break;
                    case (int)ProductsSortBy.ProductNameZToA:
                        foundProducts = foundProducts.OrderByDescending(p => p.Name);
                        break;
                }
                GetProductInGroupReponse respone = new GetProductInGroupReponse()
                {
                    GroupId = groupId,
                    GroupName = group.Name,
                    NumberOfTitlesFound = foundProducts.Count(),
                    TotalNumberOfPages = (int)Math.Ceiling((double)foundProducts.Count() / numberOfResultsPerPage),
                    CurrentPage = pageIndex,
                    SortBy = sortBy,
                    Products = CropProductListToSatisfyGivenIndex(foundProducts, pageIndex, numberOfResultsPerPage).ConvertToProductSummaryViews()
                };

                return respone;
            }
        }

        public GetProductsOfBranchResponse GetProductsOfBranch(int branchId, int numberOfResultsPerPage)
        {
            var branch = branchRepository.GetByID(branchId);
            if (branch == null)
            {
                throw new ApplicationException("Branch cannot found");
            }

            var searchQuery = PredicateBuilder.True<ecom_Products>();

            searchQuery = searchQuery.And(p => p.BrandId == branchId);
            IEnumerable<ecom_Products> productsMatchingRefinement = db.Get(
                filter: searchQuery, includeProperties: "ecom_Categories,share_Images");
            productsMatchingRefinement = productsMatchingRefinement.Distinct().OrderBy(p => p.Name);

            GetProductsOfBranchResponse response = new GetProductsOfBranchResponse()
            {
                Categories = productsMatchingRefinement.SelectMany(p => p.ecom_Categories).Distinct()
                .Select(c => new CategoryFilterItem()
                {
                    Id = c.Id,
                    Name = c.Name,
                }
                ).ToList(),
                NumberOfTitlesFound = productsMatchingRefinement.Count(),
                TotalNumberOfPages = (int)Math.Ceiling((double)productsMatchingRefinement.Count() / numberOfResultsPerPage),
                BranchId = branchId,
                BranchName = branch.Name,
                Products = CropProductListToSatisfyGivenIndex(productsMatchingRefinement, 1, numberOfResultsPerPage).ConvertToProductSummaryViews(),
            };
            return response;
        }

        /// <summary>
        /// Get products of a specific branch
        /// </summary>
        /// <param name="branchId">branch id</param>
        /// <param name="pageIndex">current page for paging</param>
        /// <param name="sortBy">type of sorting products</param>
        /// <param name="numberOfResultsPerPage">number items per page</param>
        /// <returns></returns>
        public GetFilteredProductsOfBranchResponse GetProductsOfBranch(int branchId, List<int> categories, int pageIndex, int sortBy, int numberOfResultsPerPage)
        {

            var branch = branchRepository.GetByID(branchId);
            if (branch == null)
            {
                throw new ApplicationException("Branch cannot found");
            }

            var searchQuery = PredicateBuilder.True<ecom_Products>();
            searchQuery = searchQuery.And(p => p.BrandId == branchId);
            searchQuery = searchQuery.And(p => p.Status == (int)Define.Status.Active);
            if (categories != null && categories.Count() > 0)
            {
                var filterCategoryQuery = PredicateBuilder.False<ecom_Products>();
                for (int i = 0; i < categories.Count(); i++)
                {
                    int categoryId = categories[i];
                    filterCategoryQuery = filterCategoryQuery.Or(p => p.ecom_Categories.Select(c => c.Id).Contains(categoryId));
                }
                searchQuery = searchQuery.And(filterCategoryQuery.Expand());
            }
            IEnumerable<ecom_Products> productsMatchingRefinement = db.Get(
                filter: searchQuery, includeProperties: "ecom_Categories,share_Images");
            productsMatchingRefinement = productsMatchingRefinement.Distinct();
            switch (sortBy)
            {
                case (int)ProductsSortBy.PriceLowToHigh:
                    productsMatchingRefinement = productsMatchingRefinement
                    .OrderBy(p => p.Price);
                    break;
                case (int)ProductsSortBy.PriceHighToLow:
                    productsMatchingRefinement = productsMatchingRefinement
                    .OrderByDescending(p => p.Price);
                    break;
                case (int)ProductsSortBy.ProductNameAToZ:
                    productsMatchingRefinement = productsMatchingRefinement
                    .OrderBy(p => p.Name);
                    break;
                case (int)ProductsSortBy.ProductNameZToA:
                    productsMatchingRefinement = productsMatchingRefinement
                    .OrderByDescending(p => p.Name);
                    break;
            }

            GetFilteredProductsOfBranchResponse response = new GetFilteredProductsOfBranchResponse()
            {
                Categories = categories,
                NumberOfTitlesFound = productsMatchingRefinement.Count(),
                TotalNumberOfPages = (int)Math.Ceiling((double)productsMatchingRefinement.Count() / numberOfResultsPerPage),
                CurrentPage = pageIndex,
                SortBy = sortBy,
                BranchId = branchId,
                Products = CropProductListToSatisfyGivenIndex(productsMatchingRefinement, pageIndex, numberOfResultsPerPage).ConvertToProductSummaryViews(),
            };
            return response;
        }

        /// <summary>
        /// Get list products belong to same brand with selected product
        /// </summary>
        /// <param name="productId">the selected product identifier</param>
        /// <param name="branchId">the brand identifier</param>
        /// <param name="numberOfProduct">the number of results</param>
        /// <returns>list product view models</returns>
        public IEnumerable<ProductSummaryView> GetProductHasSameBranch(int productId, int branchId, int numberOfProduct)
        {
            var branch = branchRepository.GetByID(branchId);
            if (branch == null)
            {
                throw new ApplicationException("Branch cannot found");
            }

            var searchQuery = PredicateBuilder.True<ecom_Products>();
            searchQuery = searchQuery.And(p => p.BrandId == branchId);
            searchQuery = searchQuery.And(p => p.Id != productId);
            searchQuery = searchQuery.And(p => p.Status == (int)Define.Status.Active);
            IEnumerable<ecom_Products> productsMatchingRefinement = db.Get(
                filter: searchQuery, includeProperties: "ecom_Categories,share_Images");

            return productsMatchingRefinement.Take(numberOfProduct).ConvertToProductSummaryViews();
        }

        /// <summary>
        /// Get list products belong to the same group with selected product
        /// </summary>
        /// <param name="productId">the selected product identifier</param>
        /// <param name="numberOfProduct">the number of results</param>
        /// <returns>list result product view models</returns>
        public IEnumerable<ProductSummaryView> GetListProductHasSameGroup(int productId, int numberOfProduct)
        {
            ecom_Products product = db.GetProductById(productId);
            if (product == null)
            {
                throw new ApplicationException("Cannot found the product");
            }

            List<int> groups = product.ecom_ProductGroups.Select(g => g.Id).ToList();

            var searchQuery = PredicateBuilder.True<ecom_Products>();
            searchQuery = searchQuery.And(p => p.Id != productId);
            if (groups == null || groups.Count() == 0)
            {
                return null;
            }else
            {
                var subQuery = PredicateBuilder.False<ecom_Products>();
                foreach (var groupId in groups)
                {
                    subQuery = subQuery.Or(p => p.ecom_ProductGroups.Select(g => g.Id).Contains(groupId));
                }
                searchQuery = searchQuery.And(subQuery.Expand());
            }
            searchQuery = searchQuery.And(p => p.Status == (int)Define.Status.Active);
            IEnumerable<ecom_Products> productsMatchingRefinement = db.Get(
                filter: searchQuery, includeProperties: "ecom_Categories,share_Images");
            productsMatchingRefinement = productsMatchingRefinement.Distinct();

            return productsMatchingRefinement.Take(numberOfProduct).ConvertToProductSummaryViews();
        }

        #endregion

        #region Release resources

        /// <summary>
        /// Refresh entities to clean cache of Entity framework
        /// </summary>
        public void RefreshAll()
        {
            foreach (var entity in context.ChangeTracker.Entries())
            {
                entity.Reload();
            }
        }

        /// <summary>
        /// Dispose database connection using in repositories, which used in this service
        /// </summary>
        public void Dispose()
        {
            db.Dispose();
            categoryRepository.Dispose();
            productGroupRepository.Dispose();
            branchRepository.Dispose();
        }

        #endregion
    }
}