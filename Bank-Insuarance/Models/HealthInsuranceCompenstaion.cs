using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace Bank_Insurance.Models
{
    public class HealthInsuranceCompenstaion
    {
        [Key]
        public int HealthInsuranceCompenstaionID { get; set; }
        public double Value { get; set; }
        public DateOnly Data { get; set; }
        public string? Comment { get; set; }



        [ForeignKey("HealthInsuarance")]
        public string? PolicyNo { get; set; }

        public HealthInsuarance HealthInsuarance { get; set; }
    }
}
