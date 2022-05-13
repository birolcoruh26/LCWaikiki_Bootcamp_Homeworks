using AutoMapper;
using BusinessLayer.Manager;
using BusinessLayer.Mapping;
using BusinessLayer.Services;
using DataAccessLayer.Abstract;
using DataAccessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using Microsoft.EntityFrameworkCore;


var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();

var mapperConfig = new MapperConfiguration(mc =>
{
    mc.AddProfile(new MapProfile());
});

IMapper mapper = mapperConfig.CreateMapper();

builder.Services.AddScoped<DbContext, Context>();
builder.Services.AddScoped<IProductDal, EfProductRepository>();
builder.Services.AddScoped<ICategoryDal, EfCategoryRepository>();
builder.Services.AddScoped<IProductService, ProductManager>();
builder.Services.AddScoped<ICategoryService, CategoryManager>();

builder.Services.AddSingleton(mapper);

builder.Services.AddHttpClient();

builder.Services.AddDbContext<Context>(
options =>
{
    options.UseSqlServer("Data Source=DESKTOP-0685COT\\BIROL;Database=StoreDb;User ID=sa;Password=birolcoruh;Trusted_Connection=True;");
});

builder.Services.AddMemoryCache();

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();



var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseAuthorization();

app.MapControllers();

app.Run();
