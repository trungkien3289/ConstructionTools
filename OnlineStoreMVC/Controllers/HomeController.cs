using OnlineStore.Infractructure.Utility;
using OnlineStore.Model.MessageModel;
using OnlineStore.Model.ViewModel;
using OnlineStore.Service.Implements;
using OnlineStore.Service.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace OnlineStoreMVC.Controllers
{
    public class HomeController : BaseController
    {
        #region Properties

        IBannerService _bannerService;
        ICMSNewsService _cmsNewsService;
        ICategoryManagementService _categoryService;
        #endregion

        #region Constructures

        public HomeController()
        {
            _bannerService = new BannerService();
            _cmsNewsService = new CMSNewsService();
            _categoryService = new CategoryManagementService();
        }

        #endregion

        #region Private functions

        private IEnumerable<OnlineStore.Model.ViewModel.ProductSummaryView> GetTopProduct(int mainCategoryId,int top)
        {
            try{
                return service.GetTopProductsByCategoryId(mainCategoryId, top);
            }catch(Exception ex){
                return null;
            }
        }

        #endregion

        #region Actions

        public ActionResult Index()
        {
            PopulateNewProductList();
            PopulateBestSellProductList();
           
            //PopulateHighPriorityOrderProductList();
            PopulateCategoryList();
            //PopulateTopCategoryList();

            //ViewBag.Banner2 = _bannerService.GetBanners2ForHomePage();
            //ViewBag.BannerPopup = _bannerService.GetActivePopupForHomePage();
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";
            ViewBag.ContentNews = _cmsNewsService.GetCMSNewsById(OnlineStore.Infractructure.Utility.Define.ID_PAGE_INTRODUCTION).ContentNews;

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Liên Hệ";
            return View();
        }

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
                    return RedirectToAction("Sent");
                }
            }
            return View(model);
        }

        public ActionResult Sent()
        {
            return View();
        }

        public ActionResult _HeaderPartial(int? searchType)
        {
            PopulateSearchType(searchType!=null?(SearchType)searchType:SearchType.AllProduct);
            PopulateCategoryList();
            PopulateTopCategoryList();
            ViewBag.BakeryCategoryList = GetChildrenCategories(21);
            ViewBag.KitchenToolsCategoryList = GetChildrenCategories(22);
            return PartialView();
        }

        public ActionResult BannerPartial()
        {
            return PartialView(_bannerService.GetBanners1ForHomePage());
        }

        public ActionResult BlogPartial()
        {
            return PartialView(_cmsNewsService.GetCMSNewsForHomePage());
        }

        [ChildActionOnly]
        public ActionResult GroupProductPatial(int categoryId)
        {
            try
            {
                GroupProductViewModel model = new GroupProductViewModel();
                model.products = GetTopProduct(categoryId, 10);
                model.CategoryId = categoryId;
                model.CategoryName = _categoryService.GetCategoryById(categoryId).Name;
                model.childrenCategories = _categoryService.getChidrenCategories(categoryId);
                return PartialView("GroupProductPatial", model);
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
        }

        #endregion
    }
}