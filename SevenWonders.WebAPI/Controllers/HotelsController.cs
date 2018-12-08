using SevenWonders.DAL.Context;
using SevenWonders.WebAPI.DTO.Hotels;
using SevenWonders.WebAPI.Models;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Routing;
using System.IO;
using System;
using System.Web.Helpers;
using SevenWonders.WebAPI.DTO.Tours;
using SevenWonders.WebAPI.DTO.Shared;

namespace SevenWonders.WebAPI.Controllers
{
    public class HotelsController : ApiController
    {
        private SevenWondersContext db = new SevenWondersContext();

        [HttpGet]
        public IHttpActionResult GetHotels(int pageIndex, int pageSize, int? countryId = null, int? cityId = null, int? foodTypeId = null, int? starsId = null)
        {
            var data = db.Hotels.Where(h => !h.IsDeleted
            && !h.City.IsDeleted
            && !h.City.Country.IsDeleted);

            if (countryId.HasValue)
            {
                data = data.Where(h=>h.City.CountryId == countryId.Value);
            }
            if (cityId.HasValue)
            {
                data = data.Where(h => h.CityId== cityId.Value);
            }
            if (foodTypeId.HasValue)
            {
                data = data.Where(h => h.FoodTypeId == foodTypeId.Value);
            }
            if (starsId.HasValue)
            {
                data = data.Where(h => h.RatingId == starsId.Value);
            }
            int dataCount = data.Count();

            data = data.OrderBy(x => x.Name)
            .Skip(pageIndex * pageSize)
            .Take(pageSize);

            List<HotelShortInfoModel> hotels = new List<HotelShortInfoModel>();
            data.ToList().ForEach(x =>
            {
                hotels.Add(convertToHotelModel(x));
            });
            return Ok(new { hotels = hotels, dataCount = dataCount });
        }

        [HttpGet]
        public IHttpActionResult GetHotelsForSearch(int? cityId = null)
        {
            var hotels = db.Hotels.Where(h=>!h.IsDeleted && !h.City.IsDeleted && !h.City.Country.IsDeleted).ToList();
            if (cityId.HasValue)
            {
                hotels = hotels.Where(x => x.CityId == cityId.Value ).ToList();
            }
            return Ok(hotels);
        }

        [HttpPost]
        public IHttpActionResult AddPhotos(int id)
        {
            var keys = System.Web.HttpContext.Current.Request.Files.AllKeys;
            string path = AppDomain.CurrentDomain.BaseDirectory + "static\\Content\\img\\Hotels\\Hotel" + id + "\\";
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            foreach (var key in keys)
            {
                var picture = System.Web.HttpContext.Current.Request.Files[key];
                string imgpath = path + picture.FileName;

                WebImage img = new WebImage(picture.InputStream);
                if (img.Width > 600 || img.Height > 350)
                    img.Resize(600, 350, false, true);
                img.Save(imgpath);

                HotelPhoto hotelPhoto = new HotelPhoto();
                hotelPhoto.PhotoLink = String.Format("../../static/Content/img/Hotels/Hotel{0}/{1}", id, picture.FileName);
                hotelPhoto.HotelId = id;
                db.HotelsPhotos.Add(hotelPhoto);
                db.SaveChanges();
            }
            return Ok();
        }

        [HttpPost]
        [Authorize(Roles = "manager")]
        public IHttpActionResult AddHotel([FromBody]HotelShortInfoModel model)
        {
            Hotel hotel = new Hotel();
            if (model.Id == -1)
            {
                hotel.Name = model.Name;
                hotel.Address = model.Address;
                hotel.Description = model.Description;
                hotel.CityId = model.CityId;
                hotel.FoodPrice = model.FoodPrice;
                hotel.FoodTypeId = model.FoodTypeId;
                hotel.RatingId = model.Rating;

                db.Hotels.Add(hotel);

                if (model.Facilities!= null)
                {
                    foreach (var f in model.Facilities)
                    {
                        Facility facility = db.Facilities.FirstOrDefault(e => e.Id.ToString() == f);
                        facility.Hotels.Add(hotel);
                    }
                }
            }
            else
            {
                hotel = db.Hotels.FirstOrDefault(x => x.Id == model.Id);
                hotel.Name = model.Name;
                hotel.Address = model.Address;
                hotel.Description = model.Description;
                hotel.CityId = model.CityId;
                hotel.FoodPrice = model.FoodPrice;
                hotel.FoodTypeId = model.FoodTypeId;
                hotel.RatingId = model.Rating;
                var photosForDeleting = hotel.HotelsPhotos.Where(x => !model.HotelPhotos.Any(y => y.Id == x.Id));
                foreach (var photo in photosForDeleting)
                {
                    string path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, photo.PhotoLink.Remove(0,6).Replace("/", "\\"));
                    if (System.IO.File.Exists(path))
                    { 
                        System.IO.File.Delete(path);
                    }

                    photo.IsDeleted = true;
                    db.Entry(photo).State = EntityState.Modified;
                }

                hotel.Facilities.RemoveRange(0, hotel.Facilities.Count);
                if (model.Facilities != null)
                {
                    foreach (var eq in model.Facilities)
                    {
                        Facility facility = db.Facilities.FirstOrDefault(e => e.Id.ToString() == eq);
                        hotel.Facilities.Add(facility);
                    }
                }
                db.Entry(hotel).State = EntityState.Modified;
           }
            db.SaveChanges();
            return Ok(hotel.Id);
        }

        [HttpPost]
        [Authorize(Roles = "manager")]
        public IHttpActionResult DeleteHotel([FromBody]int id)
        {
            Hotel hotel = db.Hotels.Find(id);
            hotel.IsDeleted = true;

            db.Entry(hotel).State = EntityState.Modified;
            db.SaveChanges();
            return Ok();
        }

        [HttpGet]
        public IHttpActionResult GetFoodTypes()
        {
            var data = db.FoodTypes.ToList();

            return Ok(data);
        }

        [HttpGet]
        public IHttpActionResult GetStars()
        {
            var data = db.Ratings.ToList();

            return Ok(data);
        }

        [HttpGet]
        public IHttpActionResult GetHotelShortInfo(int id)
        {
            var data = db.Hotels.FirstOrDefault(x => x.Id == id);
            var hotel = convertToHotelModel(data);

            return Ok(hotel);
        }

        [HttpGet]
        public IHttpActionResult GetFacilities(int? hotelId = null)
        {
            List<Facility> facilities = db.Facilities.ToList();
            var result = facilities.Select(x =>
                new DropDownListItem()
                {
                    Id = x.Id.ToString(),
                    Text = x.Name,
                    IsChecked = false
                });

            if (hotelId.HasValue)
            {
                Hotel hotel = db.Hotels.First(x => x.Id == hotelId);
                result = result
                    .Select(x =>
                    {
                        x.IsChecked = hotel.Facilities.Any(eq => eq.Id.ToString() == x.Id) ? true : false;
                        return x;
                    });
            }
            return Ok(result);
        }

        [HttpPost]
        public IHttpActionResult AddFacility([FromBody]string itemName)
        {
            var facility = db.Facilities.FirstOrDefault(eq => eq.Name == itemName);
            if (facility != null)
            {
                return BadRequest();
            }
            Facility newFacility = new Facility();
            newFacility.Name = itemName;
            db.Facilities.Add(newFacility);
            db.SaveChanges();

            return Ok(newFacility);
        }

        [HttpGet]
        public IHttpActionResult GetRooms(int pageIndex, int pageSize, int? hotelId = null )
        {
            var data = db.Rooms.Where(r => !r.IsDeleted
                && !r.Hotel.IsDeleted
                && !r.Hotel.City.IsDeleted
                && !r.Hotel.City.Country.IsDeleted);

            if (hotelId.HasValue)
            {
                data = data.Where(r => r.HotelId == hotelId.Value);
            }
            int dataCount = data.Count();

            data = data.OrderBy(x => x.HotelId)
                .ThenBy(x=>x.MaxPeople)
                .Skip(pageIndex * pageSize)
                .Take(pageSize);

            List<RoomShortInfoModel> rooms = new List<RoomShortInfoModel>();
            data.ToList().ForEach(x =>
            {
                rooms.Add(convertToRoomShortInfoModel(x));
            });
            return Ok(new { rooms = rooms, dataCount = dataCount });
        }

        [HttpPost]
        [Authorize(Roles = "manager")]
        public IHttpActionResult DeleteRoom([FromBody]int id)
        {
            Room room = db.Rooms.Find(id);
            room.IsDeleted = true;

            db.Entry(room).State = EntityState.Modified;
            db.SaveChanges();
            return Ok();
        }

        [HttpPost]
        [Authorize(Roles = "manager")]
        public IHttpActionResult AddRoom([FromBody]RoomEditModel model)
        {
            Room room = new Room();
            try
            {
                if (model.Id == -1)
                {
                    room.MaxPeople = model.MaxPeople;
                    room.WindowView = model.WindowView;
                    room.Price = model.Price;
                    room.RoomTypeId = model.RoomType;
                    room.HotelId = model.HotelId;
                    db.Rooms.Add(room);

                    if (model.Equipments != null)
                    {
                        foreach (var eq in model.Equipments)
                        {
                            Equipment equipment = db.Equipments.FirstOrDefault(e => e.Id == eq);
                            equipment.Rooms.Add(room);;
                        }
                    }
                    for (int i = 0; i < model.CountOfRooms; i++)
                    {
                        RoomItem roomItem = new RoomItem()
                        {
                            RoomId = room.Id,
                            Room = room,
                            IsDeleted = false
                        };
                        db.RoomItems.Add(roomItem);
                    }
                }
                else
                {
                    room = db.Rooms.FirstOrDefault(x => x.Id == model.Id);
                    room.HotelId = model.HotelId;
                    room.MaxPeople = model.MaxPeople;
                    room.WindowView = model.WindowView;
                    room.Price = model.Price;
                    room.RoomTypeId = model.RoomType;

                    var photosForDeleting = room.RoomPhotos.Where(x => !model.RoomPhotos.Any(y => y.Id == x.Id));
                    foreach (var photo in photosForDeleting)
                    {
                        string path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, photo.PhotoLink.Remove(0, 6).Replace("/", "\\"));
                        if (System.IO.File.Exists(path))
                        {
                            System.IO.File.Delete(path);
                        }

                        photo.IsDeleted = true;
                        db.Entry(photo).State = EntityState.Modified;
                    }

                    room.Equipments.RemoveRange(0, room.Equipments.Count);
                    if (model.Equipments != null)
                    {
                        foreach (var eq in model.Equipments)
                        {
                            Equipment equipment = db.Equipments.FirstOrDefault(e => e.Id == eq);
                            room.Equipments.Add(equipment);
                        }
                    }

                    var countOfRoomItems = room.RoomItems.Where(x => !x.IsDeleted).Count();
                    if (model.CountOfRooms > countOfRoomItems)
                    {
                        for (int i = 0; i < model.CountOfRooms - countOfRoomItems; i++)
                        {
                            RoomItem roomItem = new RoomItem()
                            {
                                RoomId = room.Id,
                                IsDeleted = false
                            };
                            db.RoomItems.Add(roomItem);
                        }
                    }
                    else if (model.CountOfRooms < countOfRoomItems)
                    {
                        for (int i = 0; i < countOfRoomItems - model.CountOfRooms; i++)
                        {
                            RoomItem roomItem = db.RoomItems.FirstOrDefault(x => x.RoomId == model.Id && !x.IsDeleted);
                            roomItem.IsDeleted = true;
                            db.Entry(roomItem).State = EntityState.Modified;
                        }
                    }
                    db.Entry(room).State = EntityState.Modified;
                }

                db.SaveChanges();
            }
            catch (Exception ex)
            {
                int i = 2 + 4;
            }
            return Ok(room.Id);
        }

        [HttpGet]
        public IHttpActionResult GetRoomTypes(int? roomId = null)
        {
            List<RoomType> roomTypes = db.RoomTypes.ToList();
            var result = roomTypes.Select(x =>
                new DropDownListItem()
                {
                    Id = x.Id.ToString(),
                    Text = x.Name,
                    IsChecked = false /*(x.Id == room.RoomTypeId) ? true : false*/
                });

            if (roomId.HasValue)
            {
                Room room = db.Rooms.First(x => x.Id == roomId);

                result = result
                    .Select(x =>
                    {
                        x.IsChecked = x.Id == room.RoomTypeId.ToString() ? true : false;
                        return x;
                    });
            }
            return Ok(result);
        }

        [HttpGet]
        public IHttpActionResult GetEquipments(int? roomId = null)
        {
            List<Equipment> equipments = db.Equipments.ToList();
            var result = equipments.Select(x =>
                new DropDownListItem()
                {
                    Id = x.Id.ToString(),
                    Text = x.Name,
                    IsChecked = false
                });

            if (roomId.HasValue)
            {
                Room room = db.Rooms.First(x => x.Id == roomId);
                result = result
                    .Select(x => 
                        {
                            x.IsChecked = room.Equipments.Any(eq => eq.Id.ToString() == x.Id) ? true : false;
                            return x;
                        });
            }
            return Ok(result);
        }

        public IHttpActionResult AddPhotosForRoom(int id)
        {
            var keys = System.Web.HttpContext.Current.Request.Files.AllKeys;
            string path = AppDomain.CurrentDomain.BaseDirectory + "static\\Content\\img\\Rooms\\Room" + id + "\\";
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            foreach (var key in keys)
            {
                var picture = System.Web.HttpContext.Current.Request.Files[key];
                string imgpath = path + picture.FileName;

                WebImage img = new WebImage(picture.InputStream);
                if (img.Width > 600 || img.Height > 350)
                    img.Resize(600, 350, false, true);
                img.Save(imgpath);

                RoomPhoto roomPhoto = new RoomPhoto();
                roomPhoto.PhotoLink = String.Format("../../static/Content/img/Rooms/Room{0}/{1}", id, picture.FileName);
                roomPhoto.RoomId = id;
                db.RoomsPhotos.Add(roomPhoto);
                db.SaveChanges();
            }
            return Ok();
        }

        [HttpPost]
        public IHttpActionResult AddEquipment([FromBody]string itemName)
        {
            var equipment = db.Equipments.FirstOrDefault(eq => eq.Name == itemName);
            if(equipment != null)
            {
                return BadRequest();
            }
            Equipment newEquipment = new Equipment();
            newEquipment.Name = itemName;
            db.Equipments.Add(newEquipment);
            db.SaveChanges();

            return Ok(newEquipment);
        }

        [HttpPost]
        public IHttpActionResult AddRoomType([FromBody]string itemName)
        {
            var roomType = db.RoomTypes.FirstOrDefault(eq => eq.Name == itemName);
            if (roomType != null)
            {
                return BadRequest();
            }
            Equipment newRoomType = new Equipment();
            newRoomType.Name = itemName;
            db.Equipments.Add(newRoomType);
            db.SaveChanges();

            return Ok(newRoomType);
        }

        private ShourtTourModel convertToShourtTourModel(Tour tour)
        {
            return new ShourtTourModel()
            {
                HotelId = tour.Reservation.RoomItem.Room.HotelId.Value,
                LeaveDate = tour.Reservation.LeaveDate,
                ReturnDate = tour.Reservation.ReturnDate,
                CustomerName = tour.Customer.FirstName + " " + tour.Customer.LastName,
                RoomType = tour.Reservation.RoomItem.Room.RoomType.Name
            };
        }

        private HotelShortInfoModel convertToHotelModel(Hotel hotel)
        {
            return new HotelShortInfoModel()
            {
                Id = hotel.Id,
                Name = hotel.Name,
                Description = hotel.Description,
                Rating = hotel.Rating.Id,
                CountryId = hotel.City.CountryId.Value,
                Country = hotel.City.Country.Name,
                City = hotel.City.Name,
                CityId = hotel.CityId.Value,
                Address = hotel.Address,
                FoodType = hotel.FoodType.Name,
                FoodTypeId = hotel.FoodTypeId.Value,
                FoodPrice = hotel.FoodPrice,
                Facilities = hotel.Facilities
                    .Select(x => {
                        return x.Name;
                    }).ToList(),
                HotelPhotos = hotel.HotelsPhotos
                    .Where(x=>!x.IsDeleted)
                    .Select(x => new PhotoModel() { Id = x.Id, PhotoLink = x.PhotoLink }).ToList(),
            };
        }

        private RoomShortInfoModel convertToRoomShortInfoModel(Room room)
        {
            return new RoomShortInfoModel()
            {
                Id = room.Id,
                HotelId = room.HotelId.Value,
                RoomType = room.RoomType.Name,
                RoomTypeId = room.RoomTypeId.Value,
                MaxPeople = room.MaxPeople,
                Price = room.Price,
                WindowView = room.WindowView,
                Equipments = room.Equipments.Select(x => x.Name).ToList(),
                RoomPhotos = room.RoomPhotos.Where(x=>!x.IsDeleted)
                    .Select(x => new PhotoModel() { Id = x.Id, PhotoLink = x.PhotoLink }).ToList(),
                CountOfRooms = room.RoomItems.Where(x=>!x.IsDeleted).Count()
            };
        }
    }
}