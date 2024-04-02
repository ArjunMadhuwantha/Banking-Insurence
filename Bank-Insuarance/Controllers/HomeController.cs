using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using Bank_Insurance.Models;
using Microsoft.AspNetCore.Identity;
using Bank_Insuarance.Models;



namespace Bank_Insurance.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {

        private readonly ILogger<HomeController> _logger;
        private readonly UserManager<ApplicationUser> _userManager;
       

        public HomeController(ILogger<HomeController> logger, UserManager<ApplicationUser> userManager)
        {
            _logger = logger;
            _userManager = userManager;
            
        }

        //public IActionResult Index()
        //{
        //    return View();
        //}


        public async Task<IActionResult> IndexAsync()
        {
            // Get the current logged-in user
            ApplicationUser user = await _userManager.GetUserAsync(User);

            if (user != null)
            {
                string fullName = user.FullName;
                // Now you have the full name, you can use it as needed
                ViewData["FullName"] = fullName;
            }

            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
