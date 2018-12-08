using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace SevenWonders.WebAPI.Models
{
    [Table("RoomsPhotos")]
    public class RoomPhoto
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public string PhotoLink { get; set; }
        [ForeignKey("RoomId")]
        [Newtonsoft.Json.JsonIgnore]
        public virtual Room Room { get; set; }
        public bool IsDeleted { get; set; }

        public int? RoomId { get; set; }

    }
}