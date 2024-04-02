using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace Bank_Insurance.Models
{
    public class BankingInsuaranceData
    {
        [Key]
        public int DataId { get; set; }

        public DateOnly Date { get; set; }

        public double Amount { get; set; }

        [ForeignKey("BankingInsuarance")]
        public string? PolicyNo { get; set; }

        public BankingInsuarance BankingInsuarance { get; set; }
    }
}
