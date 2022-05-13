using BusinessLayer.Exceptions;
using BusinessLayer.Services;
using Dtos;
using EntityLayer.Concrete;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace StoreApi_Ef.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        IProductService _productService;

        public ProductController(IProductService productService)
        {
            _productService = productService;
        }
        [HttpPost]
        public IActionResult InsertProduct(ProductAddDto category)
        {
            _productService.AddService(category);

            return Ok();

        }

        [HttpDelete("{id}")]
        public IActionResult DeleteProduct(int id)
        {
            try
            {
                _productService.DeleteService(id);
            }
            catch (NotFoundException)
            {
                return NotFound();
            }

            return Ok();
        }

        [HttpPut("{id}")]
        public IActionResult UpdateProduct(int id, [FromBody] ProductUpdateDto product)
        {
            var result = _productService.GetByIdService(product.Id);
            if (result == null)
            {
                return NotFound("Ürün Bulunamadı");
            }
            _productService.UpdateService(id, product);
            return Ok();
        }

        [HttpGet]
        public IActionResult GetAllProducts()
        {
            List<ProductDto> products = _productService.GetAllService();
            return Ok(products);
        }

        [HttpGet("{id}")]
        public ActionResult<CategoryDto> GetProductById(int id)
        {
            var product= _productService.GetByIdService(id);

            if (product == null)
            {
                return NotFound("Ürün bulunamadı");
            }
            return Ok(product);
        }

        [HttpGet("search")]
        public ActionResult<ProductDto> GetProductBySearch([FromQuery] Product query)
        {
            IEnumerable<ProductDto> products = _productService.Search(query);
            return Ok(products);
        }
    }
}

