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
    public interface IProductService
    {
        ProductDto AddService(ProductAddDto item);
        void UpdateService(int id, ProductUpdateDto item);
        void DeleteService(int id);
        List<ProductDto> GetAllService();
        ProductDto GetByIdService(int id);
        IEnumerable<ProductDto> Search([FromQuery] Product search);
    }
}
