using Microsoft.AspNetCore.Identity;
using Bank_Insuarance.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Bank_Insurance.Areas.Identity.Pages.Account
{
    [Authorize(Roles = "Admin")]
    public class ResetpasswordNewModel : PageModel
    {
        private readonly UserManager<ApplicationUser> _userManager;

        public ResetpasswordNewModel(UserManager<ApplicationUser> userManager)
        {
            _userManager = userManager;
        }

        [BindProperty]
        public string SelectedUserId { get; set; }

        [BindProperty]
        [DataType(DataType.Password)]
        public string NewPassword { get; set; }

        public List<SelectListItem> UserSelectList { get; set; }

        public async Task<IActionResult> OnGetAsync()
        {
            await PopulateUserListAsync();
            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                await PopulateUserListAsync();
                return Page();
            }

            var user = await _userManager.FindByIdAsync(SelectedUserId);
            if (user == null)
            {
                ModelState.AddModelError(string.Empty, "User not found.");
                await PopulateUserListAsync();
                return Page();
            }

            var passwordValidator = new PasswordValidator<ApplicationUser>();
            var result = await passwordValidator.ValidateAsync(_userManager, null, NewPassword);
            if (!result.Succeeded)
            {
                foreach (var error in result.Errors)
                {
                    ModelState.AddModelError(string.Empty, error.Description);
                }
                await PopulateUserListAsync();
                return Page();
            }

            var token = await _userManager.GeneratePasswordResetTokenAsync(user);
            result = await _userManager.ResetPasswordAsync(user, token, NewPassword);
            if (result.Succeeded)
            {
                return RedirectToPage("/Home/Index");
            }
            else
            {
                foreach (var error in result.Errors)
                {
                    ModelState.AddModelError(string.Empty, error.Description);
                }
                await PopulateUserListAsync();
                return Page();
            }
        }

        private async Task PopulateUserListAsync()
        {
            var users = await _userManager.Users.ToListAsync();
            UserSelectList = users.Select(u => new SelectListItem { Value = u.Id, Text = u.UserName }).ToList();
        }
    }
}
