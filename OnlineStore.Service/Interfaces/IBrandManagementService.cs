using OnlineStore.Model.Context;
using OnlineStore.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineStore.Service.Interfaces
{
    public interface IBrandManagementService : IDisposable
    {
        /// <summary>
        /// Get brand with conditions(sort, filter, paging, search)
        /// </summary>
        /// <param name="pageNumber">current page index</param>
        /// <param name="pageSize">number of product per page</param>
        /// <param name="totalItems">return total products</param>
        /// <returns>list product of current page</returns>
        IEnumerable<ecom_Brands> GetBrands(int pageNumber, int pageSize, out int totalItems);

        /// <summary>
        /// Get all brands
        /// </summary>
        /// <returns></returns>
        IList<BrandSummaryView> GetBrands();

        /// <summary>
        /// Get information of a brand
        /// </summary>
        /// <param name="id">id of brand</param>
        /// <returns>return a view model to display on client side</returns>
        DetailsBrandManagementView GetDetailBrand(int id);
        /// <summary>
        /// Add new brand
        /// </summary>
        /// <param name="brand">information of new brand</param>
        /// <returns></returns>
        bool AddBrand(ecom_Brands brand);
        /// <summary>
        /// Get information of brand 
        /// </summary>
        /// <param name="id">id of brand</param>
        /// <returns></returns>
        ecom_Brands GetBrandById(int id);

        /// <summary>
        /// Get information of brand 
        /// </summary>
        /// <param name="id">id of brand</param>
        /// <returns></returns>
        //ecom_Brands GetBrandById(int id, string includes);

        /// <summary>
        /// Update information of brand
        /// </summary>
        /// <param name="brand"></param>
        /// <returns></returns>
        bool UpdateBrand(ecom_Brands request);
        /// <summary>
        /// Delete brand
        /// </summary>
        /// <param name="id">id of brand</param>
        /// <returns></returns>
        bool DeleteBrand(int id);

        /// <summary>
        /// Get a list random brands
        /// </summary>
        /// <param name="count">number of brand</param>
        /// <returns>list brand</returns>
        IList<BrandSummaryView> GetRandomBrands(int count = 10);
    }
}
