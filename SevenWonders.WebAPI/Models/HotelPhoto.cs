using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace SevenWonders.WebAPI.Models
{
    [Table("HotelsPhotos")]
    public class HotelPhoto
    {
        [Key]
        public int Id { get; set; }
        [ForeignKey("HotelId")]
        [Newtonsoft.Json.JsonIgnore]
        public virtual Hotel Hotel { get; set; }
        [Required]
        public string PhotoLink { get; set; }
        public bool IsDeleted { get; set; }
        [Required]
        public int? HotelId { get; set; }
    }
}