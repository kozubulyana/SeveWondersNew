using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace SevenWonders.WebAPI.Models
{
    public class Reservation
    { 
        [Key]
        public int Id { get; set; }
        [ForeignKey("RoomItemId")]
        [Newtonsoft.Json.JsonIgnore]
        public virtual RoomItem RoomItem { get; set; }
        [Required]
        public int PersonAmount { get; set; }
        [ForeignKey("LeaveScheduleId")]
        [Newtonsoft.Json.JsonIgnore]
        public virtual Schedule LeaveSchedule { get; set; }
        [ForeignKey("ReturnScheduleId")]
        [Newtonsoft.Json.JsonIgnore]
        public virtual Schedule ReturnSchedule { get; set; }
        [Required]
        [DataType(DataType.Date)]
        public DateTime LeaveDate { get; set; }
        [Required]
        [DataType(DataType.Date)]
        public DateTime ReturnDate { get; set; }
        public bool IsDeleted { get; set; }
        [Required]
        public bool WithoutFood { get; set; }

        [Required]
        public int? RoomItemId { get; set; }
        [Required]
        public int? LeaveScheduleId { get; set; }
        [Required]
        public int? ReturnScheduleId { get; set; }
    }
}