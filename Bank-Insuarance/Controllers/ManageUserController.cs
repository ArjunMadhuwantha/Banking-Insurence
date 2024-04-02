using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Bank_Insurance.Controllers
{
    [Authorize]
    public class ManageUserController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
