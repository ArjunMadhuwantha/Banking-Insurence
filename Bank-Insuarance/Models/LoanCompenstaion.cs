using System.ComponentModel.DataAnnotations.Schema;

namespace Bank_Insurance.Models
{
    public class LoanCompenstaion
    {
        public int LoanCompenstaionID { get; set; }
        public string? FullName { get; set; }

        public string? BranchId { get; set; }
        public Double Value { get; set; }
        public Double CompenstaionValue { get; set; }
        public string? Requirement { get; set; }
        public string? Comment { get; set; }
        public DateOnly Date { get; set; }



        [ForeignKey("LoanCustomer")]
        public string? CustomerPolicyNo { get; set; }

        public LoanCustomer LoanCustomer { get; set; }
    }
}
