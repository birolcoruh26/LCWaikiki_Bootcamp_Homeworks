using Dtos;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.Validation
{
    public class ProductValidator: AbstractValidator<ProductDto>
    {
        public ProductValidator() 
        {
            //RuleFor(x => x.Name).NotNull().WithMessage("{PropertyName} gerekli").NotEmpty().WithMessage("{PropertyName} gerekli");
            //RuleFor(x => x.Price).InclusiveBetween(1, int.MaxValue).WithMessage("{PropertyName} 0'dan büyük olmalıdır");
            //RuleFor(x => x.Stock).InclusiveBetween(1, int.MaxValue).WithMessage("{PropertyName} 0'dan büyük olmalıdır");
            //RuleFor(x => x.CategoryId).InclusiveBetween(1, int.MaxValue).WithMessage("{PropertyName} 0'dan büyük olmalıdır");
        } 
    }
}
