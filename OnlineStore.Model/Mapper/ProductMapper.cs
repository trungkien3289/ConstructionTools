﻿using OnlineStore.Infractructure.Helper;
using OnlineStore.Infractructure.Utility;
using OnlineStore.Model.Context;
using OnlineStore.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineStore.Model.Mapper
{
    public static class ProductMapper
    {
        public static ProductFullView ConvertToProductFullView(this ecom_Products product)
        {
            ProductFullView productFullView = new ProductFullView()
            {
                Id = product.Id,
                ProductCode = product.ProductCode,
                Name = product.Name,
                Price = product.Price,
                OldPrice = product.OldPrice,
                Quantity = product.Quantity,
                Unit = product.Unit,
                BrandId = product.BrandId,
                CoverImageId = product.CoverImageId,
                Description = product.Description,
                Description2 = product.Description2,
                Specification = product.Specification,
                TotalView = product.TotalView,
                TotalBuy = product.TotalBuy,
                Tags = product.Tags,
                IsNewProduct = product.IsNewProduct,
                IsBestSellProduct = product.IsBestSellProduct,
                SortOrder = product.SortOrder,
                Status = product.Status,
                share_Images = product.share_Images.ConvertToImageProductViewModels()
            };

            return productFullView;
        }

        public static ImageProductViewModel ConvertToImageProductViewModel(this share_Images image)
        {
            ImageProductViewModel imageViewModel = new ImageProductViewModel()
            {
                Id = image.Id,
                ImageName = image.ImageName,
                ImagePath = image.ImagePath,
                IsActive = image.Status == (int)Define.Status.Active? true:false
            };

            return imageViewModel;
        }

        public static IEnumerable<ImageProductViewModel> ConvertToImageProductViewModels(this IEnumerable<share_Images> images)
        {
            IList<ImageProductViewModel> listImages = new List<ImageProductViewModel>();
            foreach (share_Images image in images)
            {
                listImages.Add(image.ConvertToImageProductViewModel());
            }

            return listImages;
        }

        public static ProductSummaryView ConvertToProductSummaryView(this ecom_Products product)
        {
            ProductSummaryView productSummaryView = new ProductSummaryView()
            {
                Id = product.Id,
                Name = product.Name,
                BrandName = product.ecom_Brands !=null? product.ecom_Brands.Name:"",
                PriceFormatCurrency = FormatHelper.FormatMoney(product.Price,"VND"),
                OldPriceFormatCurrency = product.OldPrice!=null?FormatHelper.FormatMoney((decimal)product.OldPrice, "VND"):null,
                Price = product.Price,
                OldPrice = product.OldPrice,
                SaleOff = product.OldPrice!=null && product.OldPrice!=0? FormatHelper.CalculatePercetage(product.Price,(decimal)product.OldPrice):0,
                CoverImageUrl = product.CoverImage != null ? product.CoverImage.ImagePath : DisplayProductConstants.NoImagePath,
                IsNew = product.IsNewProduct,
                ShortDescription = product.Description
            };

            return productSummaryView;
        }

        public static IEnumerable<ProductSummaryView> ConvertToProductSummaryViews(this IEnumerable<ecom_Products> products)
        {
            ICollection<ProductSummaryView> productSummaryViews = new List<ProductSummaryView>();
            foreach (var product in products)
            {
                productSummaryViews.Add(product.ConvertToProductSummaryView());
            }

            return productSummaryViews;
        }
    }
}