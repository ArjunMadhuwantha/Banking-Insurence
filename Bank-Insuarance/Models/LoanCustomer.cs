using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Bank_Insurance.Models
{
    public class LoanCustomer
    {
        [Key]
        public string? CustomerPolicyNo { get; set; }

        public string? CustomerName { get; set; }

        public string? ID { get; set; }

        public string? Address { get; set; }

        public string? ProjectName { get; set; }

        public DateOnly LoanIssueDate { get; set; }

        public DateOnly LoanEndDate { get; set; }

        public string? TeamNo { get; set; }

        public double LoanValue { get; set;}

        
    }
}