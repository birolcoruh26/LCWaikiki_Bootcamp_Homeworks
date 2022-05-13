using AutoMapper;
using BusinessLayer.Exceptions;
using BusinessLayer.Services;
using DataAccessLayer.Abstract;
using Dtos;
using EntityLayer.Concrete;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Manager
{
    public class ProductManager : IProductService
    {
        IProductDal _productDal;
        IMapper _mapper;
        public ProductManager(IProductDal productDal, IMapper mapper)
        {
            _productDal = productDal;
            _mapper = mapper;
        }
        public ProductDto AddService(ProductAddDto item)
        {
            Product product = _mapper.Map<ProductAddDto, Product>(item);
            _productDal.Insert(product);

            return _mapper.Map<Product, ProductDto>(product);
        }

        public void DeleteService(int id)
        {
            Product Product = _productDal.GetById(id);
            if (Product == null)
            {
                throw new NotFoundException("SilineceK ürün bulunamadı");
            }
            _productDal.Delete(Product);
        }

        public List<ProductDto> GetAllService()
        {
            return _mapper.Map<List<Product>, List<ProductDto>>(_productDal.GetAll());
        }

        public ProductDto GetByIdService(int id)
        {
            return _mapper.Map<Product, ProductDto>(_productDal.GetById(id));
        }

        public IEnumerable<ProductDto> Search([FromQuery] Product search)
        {
            IEnumerable<Product> product = _productDal.Search(search);

            return _mapper.Map<IEnumerable<Product>, IEnumerable<ProductDto>>(product);
        }

        public void UpdateService(int id, ProductUpdateDto item)
        {
            Product Product = _productDal.GetById(id);

            Product updateProduct = _mapper.Map(item, Product);

            _productDal.Update(updateProduct);

        }
    }
}
