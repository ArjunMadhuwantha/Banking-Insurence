using Bank_Insuarance.Models;
using Bank_Insurance.Data;
using Bank_Insurance.Models;
using Bank_Insurance.Repository.Abiprerana;
using Bank_Insurance.Repository.AppRole;
using Bank_Insurance.Repository.Branch;
using Bank_Insurance.Repository.Compensation;
using Bank_Insurance.Repository.InsuarancePayment;
using Bank_Insurance.Repository.Loan;
using Bank_Insurance.Repository.Parithoshitha;
using Bank_Insurance.Repository.Summary;
using Bank_Insurance.Repository.Zone;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System;

var builder = WebApplication.CreateBuilder(args);

//Add services to the container.
//var connectionString = builder.Configuration.GetConnectionString("DefaultConnection") ?? throw new InvalidOperationException("Connection string 'DefaultConnection' not found.");
//builder.Services.AddDbContext<ApplicationDbContext>(options =>
//    options.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString)));
//builder.Services.AddDatabaseDeveloperPageExceptionFilter();

builder.Services.AddControllersWithViews();

var connectionString = builder.Configuration.GetConnectionString("BankConnection");
builder.Services.AddDbContext<ApplicationDbContext>(option =>
{
    option.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString));

});

builder.Services.AddDefaultIdentity<ApplicationUser>()
    .AddSignInManager<SignInManager<ApplicationUser>>()
    .AddUserManager<UserManager<ApplicationUser>>()
    .AddDefaultTokenProviders()
    .AddRoles<IdentityRole>()
    .AddEntityFrameworkStores<ApplicationDbContext>();

//builder.Services.AddIdentityCore<ApplicationUser>(options => options.SignIn.RequireConfirmedAccount = true)
//    .AddEntityFrameworkStores<ApplicationDbContext>()
//    .AddDefaultTokenProviders()
//    .AddRoles<IdentityRole>();


//builder.Services.AddRazorPages();
//builder.Services.AddAuthorization(options =>
//{
//    options.AddPolicy("RequireAdministratorRole",
//               policy => policy.RequireRole("Administrator"));
//});







builder.Services.AddScoped<IAppRoleRepository<IdentityRole>, AppRoleRepository>();

builder.Services.AddScoped<IzoneRepository, zoneRepository>();
builder.Services.AddScoped<IbranchRepository, BranchRepository>();
builder.Services.AddScoped<IinsuarancePaymentRepository, InsuarancePaymentRepository>();
builder.Services.AddScoped<ICompensationRepository, CompensationRepository>();
builder.Services.AddScoped<ILoanRepository, LoanRepository>();
builder.Services.AddScoped<ISummaryRepository, SummaryRepository>();
builder.Services.AddScoped<IParithoshithaRepository, ParithoshithaRepository>();
builder.Services.AddScoped<IAbipreranaRepository, AbipreranaRepository>();







var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseMigrationsEndPoint();
}
else
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}




app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");
app.MapRazorPages();

app.Run();
