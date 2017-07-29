using OnlineStore.Service.Implements;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace OnlineStoreMVC
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            Application["OnlineVisitors"] = 0;
            Application["TotalVisitors"] = (new SystemConfigService()).GetTotalVisitors();

            // Removing all the view engines
            ViewEngines.Engines.Clear();

            //Add Razor Engine
            ViewEngines.Engines.Add(new MyCustomViewEngine());
        }

        protected void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            (new SystemConfigService()).UpdateTotalVisitors();

            Application.Lock();
            Application["OnlineVisitors"] = (int)Application["OnlineVisitors"] + 1;
            Application["TotalVisitors"] = (int)Application["TotalVisitors"] + 1;
            Application.UnLock();
        }

        protected void Session_End(object sender, EventArgs e)
        {
            Application.Lock();
            Application["OnlineVisitors"] = (int)Application["OnlineVisitors"] - 1;
            Application.UnLock();
        }
    }

    public class MyCustomViewEngine : RazorViewEngine
    {
        public MyCustomViewEngine()
        {
            base.AreaViewLocationFormats = new string[] { "~/Areas/{2}/Views/{1}/{0}.cshtml", "~/Areas/{2}/Views/Shared/{0}.cshtml" };
            base.AreaMasterLocationFormats = new string[] { "~/Areas/{2}/Views/{1}/{0}.cshtml", "~/Areas/{2}/Views/Shared/{0}.cshtml" };
            base.AreaPartialViewLocationFormats = new string[] { "~/Areas/{2}/Views/{1}/{0}.cshtml", "~/Areas/{2}/Views/Shared/{0}.cshtml" };
            base.ViewLocationFormats = new string[] { "~/Views/{1}/{0}.cshtml", "~/Views/Shared/{0}.cshtml" };
            base.MasterLocationFormats = new string[] { "~/Views/{1}/{0}.cshtml", "~/Views/Shared/{0}.cshtml" };
            base.PartialViewLocationFormats = new string[] { "~/Views/{1}/{0}.cshtml", "~/Views/Shared/{0}.cshtml" };
            base.FileExtensions = new string[] { "cshtml" };
        }
    }
}
