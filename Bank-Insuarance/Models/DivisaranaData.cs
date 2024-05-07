using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;

namespace Bank_Insurance.Models
{
    public class DivisaranaData
    {
        [Key]
        public string? CustomerPolicyNo { get; set; }
        public string? Fullname { get; set; }

        public string? Address { get; set; }

        [Required(ErrorMessage = "NIC number is required")]
        [Remote("IsNicNumberAvailable", "Divisarana", HttpMethod = "POST", ErrorMessage = "NIC number already exists")]
        public string? ID { get; set; }

        public string? BankMemberNo { get; set; }

        public DateOnly DOB { get; set; }

        public string? Job { get; set; }

        public string? Succssor { get; set; }
    }
}
