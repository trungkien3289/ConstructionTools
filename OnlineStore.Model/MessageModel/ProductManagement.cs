﻿using OnlineStore.Model.Context;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineStore.Model.MessageModel
{
    public class CreateProductPostRequest{
        [Required]
        [DisplayName("Mã sản phẩm")]
        public string ProductCode { get; set; }
        [Required]
        [DisplayName("Tên sản phẩm")]
        public string Name { get; set; }
        [DisplayName("Giá bán")]
        [Required]
        public decimal Price { get; set; }
        [Required]
        [DisplayName("Giá bán cũ")]
        public decimal OldPrice { get; set; }
        [DisplayName("Xuất xứ")]
        public string MadeIn { get; set; }
        [DisplayName("Bảo hành")]
        public string WarrantyPeriod { get; set; }
        [DisplayName("Số lượng")]
        public Nullable<int> Quantity { get; set; }
        [DisplayName("Đơn vị")]
        public Nullable<int> Unit { get; set; }
        [DisplayName("Thương hiệu")]
        public Nullable<int> BrandId { get; set; }
        [DisplayName("Ảnh đại diện")]
        public Nullable<int> CoverImageId { get; set; }
        [DisplayName("Mô tả")]
        public string Description { get; set; }
        [DisplayName("Mô tả chi tiết")]
        public string Description2 { get; set; }
        [DisplayName("Thông số kỹ thuật")]
        public string Specification { get; set; }
        [DisplayName("Từ khóa tìm kiếm")]
        public string Tags { get; set; }
        [DisplayName("Sản phẩm mới?")]
        public bool IsNewProduct { get; set; }
        [DisplayName("Sản phẩm bán chạy?")]
        public bool IsBestSellProduct { get; set; }
        [DisplayName("Ưu tiên sắp xếp")]
        public Nullable<int> SortOrder { get; set; }
        [DisplayName("Trạng thái")]
        public Nullable<int> Status { get; set; }
        [DisplayName("Danh mục sản phẩm")]
        public int[] CategoryId { get; set; }
    }
    public class UpdateProductImageRequest
    {
        public int productId{get;set;}
        public int ImageId{get;set;}
        public string Name{get;set;}
        public bool IsActive{get;set;}
        public bool IsCoverImage{get;set;}
    }
}
