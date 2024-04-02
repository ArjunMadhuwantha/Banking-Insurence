using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Bank_Insurance.Models
{
    public class LoanTbl
    {
        [Key]
        public int Id { get; set; }
        public string? PolicyNo { get; set; }

        [ForeignKey("Insuarance")]

        public string? InsuranceId { get; set; }

        public Insuarance Insuarance { get; set; }


        [ForeignKey("LoanCustomer")]
        public string? CustomerPolicyNo { get; set; }

        public LoanCustomer LoanCustomer { get; set; }
    }
}
