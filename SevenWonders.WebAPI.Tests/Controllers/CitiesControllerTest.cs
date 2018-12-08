using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using SevenWonders.WebAPI.Controllers;
using SevenWonders.WebAPI.DAL.Cities;
using SevenWonders.WebAPI.DTO.Cities;
using SevenWonders.WebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http.Results;

namespace SevenWonders.WebAPI.Tests.Controllers
{
    [TestClass]
    public class CitiesControllerTest
    {
        CitiesController citiesController;
        Mock<ICityRepository> cityRepository;

        [TestInitialize]
        public void Initialize()
        {
            cityRepository = new Mock<ICityRepository>();

            var country1 = new Country
            {
                Id = 1,
                Name = "Ukraine",
                IsDeleted = false
            };
            var country2 = new Country
            {
                Id = 2,
                Name = "Poland",
                IsDeleted = false
            };
            var citiesList = new List<City>
            {
                new City
                {
                    Id = 1,
                    Name = "Lviv",
                    CountryId = 1,
                    Country = country1,
                    IsDeleted = false
                },
                new City
                {
                    Id = 2,
                    Name = "Kyiv",
                    CountryId = 1,
                    Country = country1,
                    IsDeleted = false
                },
                new City
                {
                    Id = 3,
                    Name = "Krakow",
                    CountryId = 2,
                    Country = country2,
                    IsDeleted = false
                }
            };
            cityRepository.Setup(mr => mr.GetCities()).Returns(citiesList);

            citiesController = new CitiesController(cityRepository.Object);
        }

        [TestMethod]
        public void GetCitiesTest()
        {
            var result = citiesController.GetCities() as OkNegotiatedContentResult<List<CityModel>>;
            Assert.IsNotNull(result);
            Assert.AreEqual(result.Content[0].Name, "Krakow");
        }

        //[TestMethod]
        //public void GetCityTest()
        //{
        //    var result = citiesController.GetCity(1) as OkNegotiatedContentResult<City>;
        //    Assert.IsNotNull(result);
        //    Assert.AreEqual(result.Content.Name, "Lviv");
        //}

        [TestMethod]
        public void AddCityTest()
        {
            var newCity = new CityModel
            {
                Name = "Paititi",
                CountryName = "Inka Empire",
                CountryId = 228
            };

            citiesController.AddCity(newCity);
        }

        [TestMethod]
        public void DeleteCityTest()
        {
            var result = citiesController.DeleteCity(1);
            Assert.IsNotNull(result);
            Assert.IsInstanceOfType(result, typeof(OkResult));
        }
    }
}
