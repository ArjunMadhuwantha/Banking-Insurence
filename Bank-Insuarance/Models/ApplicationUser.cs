using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace Bank_Insuarance.Models
{
    public class ApplicationUser: IdentityUser
    {
        [Required]
        public string? FullName { get; set; }
        public string? Profession { get; set; }
        public DateOnly DOB { get; set; }
        public string? NicNo { get; set; }
        public string? Address { get; set; }
        
    }
}
