using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineStore.Model.MessageModel
{
    public class CreateBrandPostRequest
    {
        public int Id { get; set; }
        [Required]
        [DisplayName("TÊN THƯƠNG HIỆU")]
        public string Name { get; set; }
        public int? ImageId { get; set; }
        [Required]
        [DisplayName("MÔ TẢ")]
        public string Description { get; set; }
        [DisplayName("TRẠNG THÁI")]
        public Nullable<int> Status { get; set; }
    }
}
