using System.ComponentModel.DataAnnotations;

namespace Bank_Insurance.ViewModel
{
    public class BranchViewModel
    {
        [Required(ErrorMessage = "Branch ID is required.")]
        public string? BranchId { get; set; }

        public string? Branch_name { get; set; }

        public string? Address { get; set; }

        public string? TpNo { get; set; }

        public string? City { get; set; }


        public string? ZoneId { get; set; }
    }
}
