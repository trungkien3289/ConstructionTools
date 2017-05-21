using OnlineStore.Infractructure.Utility;
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
        IList<SummaryCategoryViewModel> GetCategoryChildrenById(int? parentId);
        IEnumerable<SummaryCategoryViewModel> GetTopCategories();
        SearchProductResponse SearchByProductName(SearchProductRequest request, SearchType searchType);
        IEnumerable<SummaryCategoryTreeViewItemModel> GetCategoryTreeViewData();
        
        /// <summary>
        /// Get list products in a specific group
        /// </summary>
        /// <param name="groupId">group id</param>
        /// <returns></returns>
        GetProductInGroupReponse GetProductsInGroup(int groupId, int pageIndex, int sortBy, int numberOfResultsPerPage);
        GetProductsOfBranchResponse GetProductsOfBranch(int branchId, int numberOfResultsPerPage);
        GetFilteredProductsOfBranchResponse GetProductsOfBranch(int branchId, List<int> Categories, int pageIndex, int sortBy, int numberOfResultsPerPage);
        IEnumerable<ProductSummaryView> GetProductHasSameBranch(int productId, int branchId, int numberOfProduct);

        IEnumerable<ProductSummaryView> GetListProductHasSameGroup(int productId, int numberOfProduct);
    }
}
