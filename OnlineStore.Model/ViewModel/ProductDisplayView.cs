﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineStore.Model.ViewModel
{
    public class ProductSummaryView
    {
        public int Id { get; set; }
        public string BrandName { get; set; }
        public string Name { get; set; }
        public string PriceFormatCurrency { get; set; }
        public decimal Price { get; set; }
        public string CoverImageUrl { get; set; }
        public bool IsNew { get; set; }
        public string ShortDescription { get; set; }
    }

    public class BrandSummaryView
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    public class ProductDetailsView
    {
        public int Id { get; set; }
        public string ProductCode { get; set; }
        public string Name { get; set; }
        public string PriceFormatCurrency { get; set; }
        public decimal Price { get; set; }
        public string BrandName { get; set; }
        public ImageInfor CoverImageUrl { get; set; }
        //public string SmallCoverImageUrl { get; set; }
        public string Description { get; set; }
        public string Description2 { get; set; }
        public string Specification { get; set; }
        public string Tags { get; set; }
        public bool IsNewProduct { get; set; }
        public bool IsBestSellProduct { get; set; }

        public List<ImageInfor> share_Images { get; set; }
    }

    public class ImageInfor
    {
        public string smallImagePath { get; set; }
        public string largeImagePath { get; set; }
    }

    /// <summary>
    /// Using for GroupProductPatial PartialView in Home Page
    /// </summary>
    public class GroupProductViewModel
    {
        public GroupProductViewModel()
        {
            products = new List<ProductSummaryView>();
            childrenCategories = new List<SummaryCategoryViewModel>();
        }
        public int CategoryId { get; set; }
        public string CategoryName { get; set; }
        public IEnumerable<ProductSummaryView> products { get; set; }
        public IEnumerable<SummaryCategoryViewModel> childrenCategories { get; set; }
    }
}
