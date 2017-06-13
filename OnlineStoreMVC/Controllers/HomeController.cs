using OnlineStore.Infractructure.Utility;
using OnlineStore.Model.MessageModel;
using OnlineStore.Model.ViewModel;
using OnlineStore.Service.Implements;
using OnlineStore.Service.Interfaces;
using System;
using System.Collections.Generic;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace OnlineStoreMVC.Controllers
{
    public class HomeController : BaseController
    {
        #region Properties

        IBannerService _bannerService;
        ICMSNewsService _cmsNewsService;
        ICategoryManagementService _categoryService;
        IBrandManagementService _brandService;
        #endregion

        #region Constructures

        public HomeController()
        {
            _bannerService = new BannerService();
            _cmsNewsService = new CMSNewsService();
            _categoryService = new CategoryManagementService();
            _brandService = new BrandManagementService();
        }

        #endregion

        #region Private functions

        private IEnumerable<ProductSummaryView> GetTopProduct(int mainCategoryId, int top)
        {
            try
            {
                return service.GetTopProductsByCategoryId(mainCategoryId, top);
            }
            catch (Exception)
            {
                return null;
            }
        }

        /// <summary>
        /// Get random a number of product in a specific category
        /// </summary>
        /// <param name="mainCategoryId">category id</param>
        /// <param name="count">number of products</param>
        /// <returns></returns>
        private IEnumerable<ProductSummaryView> GetRandomProducts(int mainCategoryId, int count)
        {
            try
            {
                return service.GetRandomProductsByCategoryId(mainCategoryId, count);
            }
            catch (Exception)
            {
                return null;
            }
        }

        private IEnumerable<SummaryCategoryViewModel> GetTopCategoriesList()
        {
            return _categoryService.GetTopCategories();
        }

        #endregion

        #region Actions

        /// <summary>
        /// Home page
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            PopulateNewProductList();
            PopulateBestSellProductList();
            PopulateCategoryList();

            return View();
        }

        /// <summary>
        /// About page
        /// </summary>
        /// <returns></returns>
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";
            ViewBag.ContentNews = _cmsNewsService.GetCMSNewsById(OnlineStore.Infractructure.Utility.Define.ID_PAGE_INTRODUCTION).ContentNews;

            return View();
        }

        /// <summary>
        /// Contact page
        /// </summary>
        /// <returns></returns>
        public ActionResult Contact()
        {
            ViewBag.Message = "Liên Hệ";
            return View();
        }

        /// <summary>
        /// Sent email for admin in Contact page
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Contact(EmailFormModel model)
        {
            if (ModelState.IsValid)
            {
                var body = "<p>Email From: {0} ({1})</p><p>Message:</p><p>{2}</p>";
                var message = new MailMessage();
                message.To.Add(new MailAddress("trungkien3289@gmail.com")); //replace with valid value
                message.Subject = "Your email subject";
                message.Body = string.Format(body, model.Name, model.Email, model.Message);
                message.IsBodyHtml = true;
                using (var smtp = new SmtpClient())
                {
                    await smtp.SendMailAsync(message);
                    return RedirectToAction("SentMailSuccessfully");
                }
            }

            return View(model);
        }

        /// <summary>
        /// Inforn user send email successfully page
        /// </summary>
        /// <returns></returns>
        public ActionResult SentMailSuccessfully()
        {
            return View();
        }

        /// <summary>
        /// Get list item to show on main banner of home page
        /// </summary>
        /// <returns></returns>
        public ActionResult BannerPartial()
        {
            return PartialView(_bannerService.GetBanners1ForHomePage());
        }

        /// <summary>
        /// Get list news for home page
        /// </summary>
        /// <returns></returns>
        public ActionResult BlogPartial()
        {
            return PartialView(_cmsNewsService.GetCMSNewsForHomePage());
        }

        /// <summary>
        /// Render top panel contain search group elements
        /// </summary>
        /// <param name="searchType"></param>
        /// <returns></returns>
        public ActionResult RenderHeaderPartial(int? searchType)
        {
            PopulateSearchType(searchType != null ? (SearchType)searchType : SearchType.AllProduct);
            PopulateCategoryList();

            return PartialView("_HeaderPartial");
        }

        /// <summary>
        /// Get list random products of a specific category to show on home page
        /// (normally that are showed on a horizonal bar)
        /// </summary>
        /// <param name="categoryId"></param>
        /// <returns></returns>
        [ChildActionOnly]
        public ActionResult GroupProductPatial(int categoryId)
        {
            try
            {
                GroupProductViewModel model = new GroupProductViewModel();
                model.products = GetRandomProducts(categoryId, 10);
                model.CategoryId = categoryId;
                model.CategoryName = _categoryService.GetCategoryById(categoryId).Name;
                model.childrenCategories = _categoryService.getChidrenCategories(categoryId);

                return PartialView("GroupProductPatial", model);
            }
            catch (Exception)
            {
                return null;
            }
        }

        /// <summary>
        /// Get list brands and show on a horizontal bar
        /// </summary>
        /// <returns></returns>
        [ChildActionOnly]
        public ActionResult GetListBrands()
        {
            IList<BrandSummaryView> brands = _brandService.GetBrands();

            if (brands == null || brands.Count == 0)
            {
                return null;
            }
            else
            {
                return PartialView("_ListBrands", brands);
            }
        }

        /// <summary>
        /// Get random a number of brands, which are used for showing on a horizontal bar in home page
        /// </summary>
        /// <returns></returns>
        [ChildActionOnly]
        public ActionResult GroupBanners()
        {
            try
            {
                IList<BrandSummaryView> brands = _brandService.GetRandomBrands(8);
                return PartialView("_BrandBanner", brands);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion

        #region Release resources

        /// <summary>
        /// Dispose database connection
        /// </summary>
        /// <param name="disposing"></param>
        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
            _cmsNewsService.Dispose();
            _categoryService.Dispose();
            _bannerService.Dispose();
            _brandService.Dispose();
        }

        #endregion
    }
}