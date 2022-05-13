using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using BusinessLayer.Services;
using Dtos;
using EntityLayer.Concrete;
using BusinessLayer.Exceptions;

namespace StoreApi_Ef.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        ICategoryService _categoryService;
       

        public CategoryController(ICategoryService categoryService)
        {
            _categoryService = categoryService;
        }
        [HttpPost]
        public IActionResult InsertCategory(CategoryAddDto category)
        {
           _categoryService.AddService(category);
            
            return Ok();
          
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteCategory(int id)
        {
            try
            {
               _categoryService.DeleteService(id);
            }
            catch (NotFoundException)
            {
                return NotFound();
            }

            return Ok();
        }

        [HttpPut("{id}")]
        public IActionResult UpdateCategory(int id, [FromBody] CategoryUpdateDto category)
        {
            var result = _categoryService.GetByIdService(category.Id);
            if (result == null)
            {
                return NotFound("Kategori Bulunamadı");
            }
            _categoryService.UpdateService(id,category);
            return Ok();
        }

        [HttpGet]
        public IActionResult GetAllCategories()
        {
            List<CategoryDto> categories = _categoryService.GetAllService();
            return Ok(categories);
        }

        [HttpGet("{id}")]
        public  ActionResult<CategoryDto> GetCategoryById(int id)
        {
            var category = _categoryService.GetByIdService(id);

            if (category == null)
            {
                return NotFound("Kategori bulunamadı");
            }
            return Ok(category);
        }

        [HttpGet("search")]
        public ActionResult<CategoryDto> GetCategoryBySearch([FromQuery] Category query)
        {
            IEnumerable<CategoryDto> categories = _categoryService.Search(query);
            return Ok(categories);
        }
    }
}
