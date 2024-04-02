using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Bank_Insurance.Models
{
    public class SavingRelief
    {
        [Key]
        public string? PolicyNo {  get; set; }

        [ForeignKey("Insuarance")]

        public string? InsuranceId { get; set; }

        public Insuarance? Insuarance { get; set; }



    }
}
