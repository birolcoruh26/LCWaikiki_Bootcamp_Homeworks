using Dtos;
using EntityLayer.Concrete;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Services
{
    public interface ICategoryService
    {
        CategoryDto AddService(CategoryAddDto item);
        void UpdateService(int id,CategoryUpdateDto item);
        void DeleteService(int id);
        List<CategoryDto> GetAllService();
        CategoryDto GetByIdService(int id);
        IEnumerable<CategoryDto> Search([FromQuery] Category search);
    }
}
