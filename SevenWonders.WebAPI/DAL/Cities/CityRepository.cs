using SevenWonders.DAL.Context;
using SevenWonders.WebAPI.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace SevenWonders.WebAPI.DAL.Cities
{
    public class CityRepository : ICityRepository
    {
        SevenWondersContext context;

        public CityRepository()
        {
            context = new SevenWondersContext();
        }

        public CityRepository(SevenWondersContext c)
        {
            context = c;
        }

        public IEnumerable<City> GetCities()
        {
            return context.Cities.Where(x => !x.IsDeleted && !x.Country.IsDeleted).ToList();
        }

        public City GetCityById(int id)
        {
            return context.Cities.FirstOrDefault(x=>x.Id == id);
        }

        public void AddCity(City сity)
        {
            context.Cities.Add(сity);
            Save();
        }

        public void DeleteCity(int id)
        {
            City city = GetCityById(id);
            city.IsDeleted = true;

            context.Entry(city).State = EntityState.Modified;
            Save();
        }

        public void UpdateCity(City city)
        {
            context.Entry(city).State = EntityState.Modified;
            Save();
        }

        public void Save()
        {
            context.SaveChanges();
        }

        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    context.Dispose();
                }
            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}