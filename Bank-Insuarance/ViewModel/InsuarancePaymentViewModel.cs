using System.ComponentModel.DataAnnotations;

namespace Bank_Insurance.ViewModel
{
    public class InsuarancePaymentViewModel
    {
        public DateOnly Date { get; set; }

        [Required(ErrorMessage = "Branch Name is required.")]
        public string? BranchId { get; set; }

        public string? Branch_name { get; set; }
        public double SavingAmount { get; set; }
        public double BuildingAmount { get; set; }
        public double HealthAmount { get; set; }
        public double TreasuaryAmount { get; set; }
        public double BankingAmount { get; set; }

        public string? TreasuaryName { get; set; }
    }
}
