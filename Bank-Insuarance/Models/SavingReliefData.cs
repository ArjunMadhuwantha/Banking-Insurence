using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Bank_Insurance.Models
{
    public class SavingReliefData
    {
        [Key]
        public int DataId { get; set; }

        public DateOnly Date {  get; set; }

        public double Amount { get; set; }

        [ForeignKey("SavingRelief")]
        public string? PolicyNo { get; set; }

        public SavingRelief SavingRelief { get; set; }
    }
}
