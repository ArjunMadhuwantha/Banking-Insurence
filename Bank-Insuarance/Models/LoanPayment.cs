using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Bank_Insurance.Models
{
    public class LoanPayment
    {
        [Key]
        public int PaymentId { get; set; }

        public DateOnly PaymentDate { get; set; }

        public double Paymentvalue { get; set; }

        [ForeignKey("LoanCustomer")]
        public string? CustomerPolicyNo { get; set; }

        public LoanCustomer LoanCustomer { get; set; }
    }
}
