using OnlineStore.Infractructure.Helper;
using OnlineStore.Infractructure.Utility;
using OnlineStore.Model.ViewModel;
using OnlineStore.Service.Implements;
using OnlineStore.Service.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineStoreMVC.Controllers
{
    public class BaseController : Controller
    {
        #region Properties

        public IDisplayProductService service;

        #endregion
        
        #region Constructures

        public BaseController()
        {
            service = new DisplayProductService();
        }

        #endregion

        #region Private functions

        /// <summary>
        /// Create list new products in system
        /// </summary>
        protected void PopulateNewProductList()
        {
            ViewBag.NewProductList = service.GetAllNewProduct();
        }

        /// <summary>
        /// Create list best sell products in system
        /// </summary>
        protected void PopulateBestSellProductList()
        {
            ViewBag.BestSellProductList = service.GetAllBestSellProduct();
        }

        /// <summary>
        /// Create list products have high priority order in system
        /// </summary>
        protected void PopulateHighPriorityOrderProductList()
        {
            ViewBag.HighPriorityOrderProductList = service.GetListHighPriorityOrderProduct();
        }

        /// <summary>
        /// Create list category using in top vertical menu bar
        /// </summary>
        protected void PopulateCategoryList()
        {
            ViewBag.CategoryList = service.GetTopCategories();
        }
       
        /// <summary>
        /// Create list category using in top horizontal menu bar
        /// </summary>
        protected void PopulateTopCategoryList()
        {
            ViewBag.TopCategoryList = (new MenuService()).GetMenuByType((int)OnlineStore.Infractructure.Utility.Define.MenuEnum.User).Take(6).ToList();
        }

        /// <summary>
        /// Populate search types
        /// </summary>
        /// <param name="option">selected item</param>
        protected void PopulateSearchType(SearchType option = SearchType.AllProduct)
        {
            IEnumerable<SearchType> values = Enum.GetValues(typeof(SearchType)).Cast<SearchType>();
            IEnumerable<SelectListItem> items = from value in values
                                                select new SelectListItem
                                                {
                                                    Text = EnumHelper.GetDescriptionFromEnum((SearchType)value),
                                                    Value = ((int)value).ToString(),
                                                    Selected = value == option,
                                                };

            ViewBag.searchType = items;
        }

        /// <summary>
        /// Get children categories of a specific category
        /// </summary>
        /// <param name="parentId">parent category identifier</param>
        /// <returns></returns>
        protected IList<SummaryCategoryViewModel> GetChildrenCategories(int? parentId)
        {
            return service.GetCategoryChildrenById(parentId);
        }

        #endregion

        #region Actions

        public ActionResult SubCategoriesPatial(int? parentId)
        {
            IEnumerable<SummaryCategoryViewModel> children = GetChildrenCategories(parentId);

            return PartialView("_ListSubCategory", children);
        } 

        #endregion

        #region Release resources

        /// <summary>
        /// Dispose database connection
        /// </summary>
        /// <param name="disposing"></param>
        protected override void Dispose(bool disposing)
        {
            //service.Dispose();
            base.Dispose(disposing);
        }

        #endregion
    }
}