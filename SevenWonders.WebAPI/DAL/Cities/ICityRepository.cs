using SevenWonders.WebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SevenWonders.WebAPI.DAL.Cities
{
    public interface ICityRepository : IDisposable
    {
        IEnumerable<City> GetCities();
        City GetCityById(int id);
        void AddCity(City city);
        void DeleteCity(int id);
        void UpdateCity(City city);
        void Save();
    }
}