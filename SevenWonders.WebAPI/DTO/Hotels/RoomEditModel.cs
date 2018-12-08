using SevenWonders.WebAPI.DTO.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SevenWonders.WebAPI.DTO.Hotels
{
    public class RoomEditModel
    {
        public int Id { get; set; }
        public int HotelId { get; set; }
        public int CountOfRooms { get; set; }
        public int RoomType{ get; set; }
        public int MaxPeople { get; set; }
        public string WindowView { get; set; }
        public decimal Price { get; set; }
        public List<int> Equipments { get; set; }
        public virtual List<PhotoModel> RoomPhotos { get; set; }
    }
}