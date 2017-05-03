//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OnlineStore.Model.Context
{
    using System;
    using System.Collections.Generic;
    
    public partial class ecom_Products
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ecom_Products()
        {
            this.ecom_OrderDetails = new HashSet<ecom_OrderDetails>();
            this.ecom_Categories = new HashSet<ecom_Categories>();
            this.share_Images = new HashSet<share_Images>();
            this.ecom_ProductGroups = new HashSet<ecom_ProductGroups>();
        }
    
        public int Id { get; set; }
        public string ProductCode { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public Nullable<int> Quantity { get; set; }
        public Nullable<int> Unit { get; set; }
        public Nullable<int> BrandId { get; set; }
        public Nullable<int> CoverImageId { get; set; }
        public string Description { get; set; }
        public string Description2 { get; set; }
        public Nullable<int> TotalView { get; set; }
        public Nullable<int> TotalBuy { get; set; }
        public string Tags { get; set; }
        public bool IsNewProduct { get; set; }
        public bool IsBestSellProduct { get; set; }
        public Nullable<int> SortOrder { get; set; }
        public Nullable<int> Status { get; set; }
        public Nullable<System.Guid> CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<System.Guid> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public string Specification { get; set; }
    
        public virtual ecom_Brands ecom_Brands { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ecom_OrderDetails> ecom_OrderDetails { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ecom_Categories> ecom_Categories { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<share_Images> share_Images { get; set; }
        public virtual share_Images CoverImage { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ecom_ProductGroups> ecom_ProductGroups { get; set; }
    }
}
