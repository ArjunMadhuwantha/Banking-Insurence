using Bank_Insuarance.Models;
using Bank_Insurance.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Bank_Insurance.Areas.Identity.Pages.Account
{
    public class DetailsManageModel : PageModel
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ILogger<DetailsManageModel> _logger;

        public DetailsManageModel(
            UserManager<ApplicationUser> userManager,
            ILogger<DetailsManageModel> logger)
        {
            _userManager = userManager;
            _logger = logger;
        }
        public void OnGet()
        {
        }
    }
}
