using OnlineStore.Infractructure.Utility;
using OnlineStore.Model.Context;
using OnlineStore.Model.ViewModel;
using OnlineStore.Service.Messaging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineStore.Service.Interfaces
{
    public interface IDisplayProductService:IDisposable
    {
        void RefreshAll();
        IEnumerable<ProductSummaryView> GetTopProductsByCategoryId(int categoryId, int top);
        IEnumerable<ProductSummaryView> GetRandomProductsByCategoryId(int categoryId, int count);
        GetProductsByCategoryResponse GetProductsByCategory(GetProductsByCategoryRequest request);
        ProductDetailsView GetProductDetails(int id);
        IEnumerable<ProductSummaryView> GetAllNewProduct();
        IEnumerable<ProductSummaryView> GetAllBestSellProduct();
        IEnumerable<ProductSummaryView> GetListHighPriorityOrderProduct();

        /// <summary>
        /// Get list children categories of a specific category
        /// </summary>
        /// <param name="parentId">the parent category identifier</param>
        /// <returns></returns>
        IList<SummaryCategoryViewModel> GetCategoryChildrenById(int? parentId);

        /// <summary>
        /// Get top categories
        /// </summary>
        /// <returns></returns>
        IEnumerable<SummaryCategoryViewModel> GetTopCategories();
        SearchProductResponse SearchByProductName(SearchProductRequest request, SearchType searchType);
        IEnumerable<SummaryCategoryTreeViewItemModel> GetCategoryTreeViewData();
        
        /// <summary>
        /// Get list products in a specific group
        /// </summary>
        /// <param name="groupId">group id</param>
        /// <returns></returns>
        GetProductInGroupReponse GetProductsInGroup(int groupId, int pageIndex, int sortBy, int numberOfResultsPerPage);

        /// <summary>
        /// Get a number of products, which belong to the same brand. 
        /// </summary>
        /// <param name="branchId">the brand identifier</param>
        /// <param name="numberOfResultsPerPage">number of items</param>
        /// <returns>list view model brand</returns>
        GetProductsOfBranchResponse GetProductsOfBranch(int branchId, int numberOfResultsPerPage);

        /// <summary>
        /// Get a number of products belong to the same brand with paging options
        /// </summary>
        /// <param name="branchId">the brand identifier</param>
        /// <param name="Categories">list selected categories using for filter</param>
        /// <param name="pageIndex">the current index page</param>
        /// <param name="sortBy">the sort type</param>
        /// <param name="numberOfResultsPerPage">the number of results per page</param>
        /// <returns>list product view model</returns>
        GetFilteredProductsOfBranchResponse GetProductsOfBranch(int branchId, List<int> Categories, int pageIndex, int sortBy, int numberOfResultsPerPage);

        /// <summary>
        /// Get list products belong to same brand with selected product
        /// </summary>
        /// <param name="productId">selected product identifier</param>
        /// <param name="branchId">the brand identifier</param>
        /// <param name="numberOfProduct">the number of results</param>
        /// <returns>list product view models</returns>
        IEnumerable<ProductSummaryView> GetProductHasSameBranch(int productId, int branchId, int numberOfProduct);

        /// <summary>
        /// Get list products belong to the same group with selected product
        /// </summary>
        /// <param name="productId">the selected product identifier</param>
        /// <param name="numberOfProduct">the number of results</param>
        /// <returns>list result product view models</returns>
        IEnumerable<ProductSummaryView> GetListProductHasSameGroup(int productId, int numberOfProduct);

        /// <summary>
        /// Get path of selected category
        /// </summary>
        /// <param name="categoryId">category identifier</param>
        /// <returns>list category in path</returns>
        IList<ecom_Categories> GetCategoryPath(int categoryId);
    }
}
