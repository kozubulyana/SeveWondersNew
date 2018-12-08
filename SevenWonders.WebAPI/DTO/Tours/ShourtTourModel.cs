using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SevenWonders.WebAPI.DTO.Tours
{
    public class ShourtTourModel
    {
        public int HotelId { get; set; }
        public string  CustomerName{ get; set; }

        public string RoomType { get; set; }
        public DateTime LeaveDate { get; set; }
        public DateTime ReturnDate { get; set; }
    }
}