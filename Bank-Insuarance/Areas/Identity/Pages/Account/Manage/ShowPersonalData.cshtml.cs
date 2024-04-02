using Bank_Insuarance.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.BlazorIdentity.Pages.Manage;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace Bank_Insuarance.Areas.Identity.Pages.Account.Manage
{
    public class ShowPersonalDataModel : PageModel

    {
        private readonly UserManager<ApplicationUser> _userManager;

        public ShowPersonalDataModel(UserManager<ApplicationUser> userManager)
        {
            _userManager = userManager;
        }


        public string id { get; set; }
        public string FullName { get; set; }
        public string PhoneNumber { get; set; }
        public string Profession { get; set; }
        public DateOnly DOB { get; set; }
        public string NicNo { get; set; }
        public string Address { get; set; }

        public string Email { get; set; }
        public string Username { get; set; }



        public async Task<IActionResult> OnGetAsync()
        {
            var user = await _userManager.GetUserAsync(User);
            if (user == null)
            {
                return NotFound();
            }

            id = user.Id;


            FullName = user.FullName;
            PhoneNumber = user.PhoneNumber;
            Profession = user.Profession;
            DOB = user.DOB;
            NicNo = user.NicNo;
            Address = user.Address;
            Email = user.Email;
            Username = user.UserName;
            // Set more properties as needed

            return Page();
        }
    }
}
