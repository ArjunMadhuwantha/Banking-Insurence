using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Bank_Insurance.Models
{
    public class DivisaranaPayment
    {
        [Key]
        public  int PaymentId { get; set; }
        public string? BranchId { get; set; }
        public string? Fullname { get; set; }
        public DateOnly PaymentDate { get; set; }
        public DateOnly SystemDate { get; set; }
        public double? PaymentValue { get; set; }
        public double? RunningBalance { get; set; }

        [ForeignKey("DivisaranaData")]

        public string? CustomerPolicyNo { get; set; }

        public DivisaranaData DivisaranaData { get; set; }
    }
}
