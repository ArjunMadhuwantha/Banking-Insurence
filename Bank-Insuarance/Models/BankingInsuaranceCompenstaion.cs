using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace Bank_Insurance.Models
{
    public class BankingInsuaranceCompenstaion
    {
        [Key]
        public int BankingInsuaranceCompenstaionID { get; set; }
        public double Value { get; set; }
        public DateOnly Data { get; set; }
        public string? Comment { get; set; }



        [ForeignKey("BankingInsuarance")]
        public string? PolicyNo { get; set; }

        public BankingInsuarance BankingInsuarance { get; set; }
    }
}
