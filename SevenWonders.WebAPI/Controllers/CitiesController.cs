using SevenWonders.DAL.Context;
using SevenWonders.WebAPI.DAL.Cities;
using SevenWonders.WebAPI.DTO.Cities;
using SevenWonders.WebAPI.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SevenWonders.WebAPI.Controllers
{
    public class CitiesController : ApiController
    {
        SevenWondersContext db = new SevenWondersContext();

        ICityRepository citiesRepository;

        public CitiesController()
        {
            citiesRepository = new CityRepository();
        }
        public CitiesController(ICityRepository _citiesRepository)
        {
            citiesRepository = _citiesRepository;
        }

        [HttpGet]
        public IHttpActionResult GetCities(int? countryId = null)
        {
            var cities = citiesRepository.GetCities().OrderBy(x=>x.Country.Name).ThenBy(x=>x.Name).ToList();
            if (countryId.HasValue)
            {
                cities = cities.Where(x => x.CountryId == countryId).ToList();
            }

            List<CityModel> result = new List<CityModel>();
            cities.ForEach(x =>
            {
                result.Add(convertToCityModel(x));
            });
            return Ok(result);
        }

        [HttpPost]
        [Authorize(Roles = "manager")]
        public void AddCity([FromBody]CityModel model)
        {
            if (ModelState.IsValid)
            {
                if (model.Id == 0)
                {
                    City city = new City()
                    {
                        Id = model.Id,
                        Name = model.Name,
                        CountryId =model.CountryId,
                        IsDeleted = false
                    };
                    citiesRepository.AddCity(city);
                }
                if (model.Id != 0)
                {
                    City city = citiesRepository.GetCityById(model.Id);
                    city.Name = model.Name;
                    city.CountryId = model.CountryId;
                    citiesRepository.UpdateCity(city);
                }
            }
        }

        [HttpGet]
        public IHttpActionResult GetCity(int id)
        {
            City city = citiesRepository.GetCityById(id);
            return Ok(city);
        }

        [HttpPost]
        [Authorize(Roles = "manager")]
        public IHttpActionResult DeleteCity([FromBody]int id)
        {
            citiesRepository.DeleteCity(id);
            return Ok();
        }

        [HttpGet]
        public IHttpActionResult IsNameValid(int id, string name, int countryId)
        {
            bool contain = citiesRepository.GetCities()
                .Any(x => x.Id != id && x.Name == name && x.CountryId==countryId);

            return Ok(!contain);
        }

        private CityModel convertToCityModel(City city)
        {
            return new CityModel()
            {
                Id = city.Id,
                Name = city.Name,
                CountryId=city.CountryId.Value,
                CountryName=city.Country.Name
            };
        }
    }
}
