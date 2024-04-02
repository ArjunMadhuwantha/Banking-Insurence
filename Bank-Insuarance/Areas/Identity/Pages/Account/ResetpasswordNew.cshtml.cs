using Bank_Insuarance.Models;
using Bank_Insurance.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;

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
            // Populate the select list with all user IDs
            var users = await _userManager.Users.ToListAsync();
            UserSelectList = users.Select(u => new SelectListItem { Value = u.Id, Text = u.UserName }).ToList();
            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            var user = await _userManager.FindByIdAsync(SelectedUserId);
            if (user == null)
            {
                // Handle invalid user ID
                return NotFound();
            }

            var result = await _userManager.ResetPasswordAsync(user, await _userManager.GeneratePasswordResetTokenAsync(user), NewPassword);
            if (result.Succeeded)
            {
                // Password reset successful
                return RedirectToPage("/Home/Index"); // Redirect to a suitable page
            }
            else
            {
                // Password reset failed, handle errors
                foreach (var error in result.Errors)
                {
                    ModelState.AddModelError("", error.Description);
                }
                return Page(); // Return the page with error messages
            }
        }
    }
}


































    //public async Task<IActionResult> OnPostAsync()
    //{
    //    if (ModelState.IsValid)
    //    {
    //        var user = await _userManager.FindByIdAsync(SelectedUserId);
    //        if (user == null)
    //        {
    //            ModelState.AddModelError(string.Empty, "User not found");
    //            return Page();
    //        }

    //        var token = await _userManager.GeneratePasswordResetTokenAsync(user);
    //        var result = await _userManager.ResetPasswordAsync(user, token, NewPassword);
    //        if (result.Succeeded)
    //        {
    //            return RedirectToPage("ResetPasswordConfirmation");
    //        }

    //        foreach (var error in result.Errors)
    //        {
    //            ModelState.AddModelError(string.Empty, error.Description);
    //        }
    //    }

    //    return Page();
    //}

    //public async Task OnGetAsync()
    //{
    //    var users = await _userManager.Users.ToListAsync();
    //    UserSelectList = users.Select(u => new SelectListItem
    //    {
    //        Value = u.Id,
    //        Text = u.Email
    //    }).ToList();
    //}














    //public void OnGet()
    //{

    //}
        
  

