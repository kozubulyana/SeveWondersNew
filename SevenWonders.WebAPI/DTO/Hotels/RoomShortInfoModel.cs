using SevenWonders.WebAPI.DTO.Hotels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SevenWonders.WebAPI.DTO.Hotels
{
    public class RoomShortInfoModel
    {
        public int Id { get; set; }
        public int HotelId { get; set; }
        public int CountOfRooms { get; set; }
        public string RoomType { get; set; }
        public int RoomTypeId { get; set; }
        public int MaxPeople { get; set; }
        public string WindowView { get; set; }
        public decimal Price { get; set; }
        public List<string> Equipments { get; set; }
        public virtual List<PhotoModel> RoomPhotos { get; set; }
    }
}