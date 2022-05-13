using DataAccessLayer.Abstract;
using DataAccessLayer.Concrete;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.EntityFramework
{
    public class EfGenericRepository<T>:IGenericDal<T> where T : class 
    {
        Context _context;
        public EfGenericRepository(Context context)
        {
            _context = context;
        }
        public void Delete(T item)
        {
            
            _context.Remove(item);
            _context.SaveChanges();
        }

        public List<T> GetAll()
        {
            
            return _context.Set<T>().ToList(); 
        }

        public T GetById(int id)
        {
            
            return _context.Set<T>().Find(id);
        }

        public void Insert(T item)
        {
            
            _context.Add(item);
            _context.SaveChanges();
        }

        public void Update(T item)
        {
           
            _context.Update(item);
            _context.SaveChanges();
        }
       
        public IEnumerable<T> Search([FromQuery] T search)
        {

            IQueryable<T> query = _context.Set<T>();

            return  query.ToList();
        }
    }
}
