using Microsoft.AspNetCore.Mvc;

namespace Bank_Insuarance.Controllers
{
    public class AdminController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
