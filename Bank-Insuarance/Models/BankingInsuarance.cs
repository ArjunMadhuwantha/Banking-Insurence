using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace Bank_Insurance.Models
{
    public class BankingInsuarance
    {
        [Key]
        public string? PolicyNo { get; set; }

        [ForeignKey("Insuarance")]

        public string? InsuranceId { get; set; }

        public Insuarance Insuarance { get; set; }
    }
}
