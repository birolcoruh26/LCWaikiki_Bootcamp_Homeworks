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

        public class CategoryManager : ICategoryService
        {
        ICategoryDal _categoryDal;
        IMapper _mapper;
        public CategoryManager(ICategoryDal categoryDal,IMapper mapper)
        {
            _categoryDal = categoryDal;
            _mapper = mapper;
        }
        public CategoryDto AddService(CategoryAddDto item)
        {
            Category Category = _mapper.Map<CategoryAddDto, Category>(item);
            _categoryDal.Insert(Category);

            return _mapper.Map<Category, CategoryDto>(Category);
        }

        public void DeleteService(int id)
        {
            Category category = _categoryDal.GetById(id);
            if (category == null)
            {
               throw new NotFoundException("SilineceK kategori bulunamadı");
            }
            _categoryDal.Delete(category);
        }

        public List<CategoryDto> GetAllService()
        {
            return _mapper.Map<List<Category>, List<CategoryDto>>(_categoryDal.GetAll());
        }

        public CategoryDto GetByIdService(int id)
        {
            return _mapper.Map<Category, CategoryDto>(_categoryDal.GetById(id));
        }

        public IEnumerable<CategoryDto> Search([FromQuery] Category search)
        {
            IEnumerable<Category> categories = _categoryDal.Search(search);

            return _mapper.Map<IEnumerable<Category>, IEnumerable<CategoryDto>>(categories);
        }

        public void UpdateService(int id,CategoryUpdateDto item)
        {
            Category category = _categoryDal.GetById(id);

            Category updateCategory = _mapper.Map(item, category);

           _categoryDal.Update(updateCategory);

        }
    }
}
