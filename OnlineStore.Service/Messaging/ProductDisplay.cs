using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OnlineStore.Infractructure.Utility;
using OnlineStore.Model.ViewModel;
using OnlineStore.Model.Context;

namespace OnlineStore.Service.Messaging
{
    public class GetProductsByCategoryRequest
    {
        public GetProductsByCategoryRequest()
        {
            BrandIds = new List<int>();
        }

        public int? CategoryId { get; set; }
        public List<int> BrandIds { get; set; }
        public ProductsSortBy SortBy { get; set; }
        public decimal? BeginPrice { get; set; }
        public decimal? EndPrice { get; set; }
        public int Index { get; set; }
        public string SearchString { get; set; }
        public int NumberOfResultsPerPage { get; set; }

    }

    public class BreadcrumItem
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    public class GetProductsByCategoryResponse
    {
        public string SelectedCategoryName { get; set; }
        public int? SelectedCategory { get; set; }
        public decimal? BeginPrice { get; set; }
        public decimal? EndPrice { get; set; }
        public List<int> BrandIds { get; set; }
        public int NumberOfTitlesFound { get; set; }
        public int TotalNumberOfPages { get; set; }
        public int CurrentPage { get; set; }
        public string SearchString { get; set; }
        public int SortBy { get; set; }
        public int TotalProducts { get; set; }
        public IEnumerable<ProductSummaryView> Products { get; set; }
        public IEnumerable<BrandSummaryView> Brands { get; set; }
        public IList<BreadcrumItem> Path { get; set; }
    }

    public class SearchProductRequest
    {
        public SearchProductRequest()
        {
            CategoryIds = new List<int>();
            BrandIds = new List<int>();
        }
        public List<int> CategoryIds { get; set; }
        public List<int> BrandIds { get; set; }
        public ProductsSortBy SortBy { get; set; }
        public int Index { get; set; }
        public string SearchString { get; set; }
        public int NumberOfResultsPerPage { get; set; }
    }

    public class SearchProductResponse
    {
        public List<int> CategoryIds { get; set; }
        public List<int> BrandIds { get; set; }
        public int NumberOfTitlesFound { get; set; }
        public int TotalNumberOfPages { get; set; }
        public int CurrentPage { get; set; }
        public string SearchString { get; set; }
        public int SortBy { get; set; }
        public IEnumerable<ProductSummaryView> Products { get; set; }
        public IEnumerable<BrandSummaryView> Brands { get; set; }
        public IEnumerable<ecom_Categories> Categories { get; set; }
    }

    public class GetProductsByAjaxResponse
    {
        public bool Success { get; set; }
        public object ListProductView { get; set; }
        public GetProductsByCategoryResponse Model { get; set; }
    }

    public class GetProductInGroupReponse
    {
        public int GroupId { get; set; }
        public string GroupName { get; set; }
        public int NumberOfTitlesFound { get; set; }
        public int TotalNumberOfPages { get; set; }
        public int CurrentPage { get; set; }
        public int SortBy { get; set; }
        public IEnumerable<ProductSummaryView> Products { get; set; }
    }

    public class GetFilteredProductsOfBranchResponse
    {
        public int BranchId { get; set; }
        public int NumberOfTitlesFound { get; set; }
        public int TotalNumberOfPages { get; set; }
        public int CurrentPage { get; set; }
        public int SortBy { get; set; }
        public IEnumerable<ProductSummaryView> Products { get; set; }
        public List<int> Categories { get; set; }
    }

    public class GetProductsOfBranchResponse
    {
        public int BranchId { get; set; }
        public string BranchName { get; set; }
        public int NumberOfTitlesFound { get; set; }
        public int TotalNumberOfPages { get; set; }
        public IEnumerable<ProductSummaryView> Products { get; set; }
        public List<CategoryFilterItem> Categories { get; set; }
    }
}
