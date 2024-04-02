using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace Bank_Insurance.Models
{
    public class HealthInsuaranceData
    {
        [Key]
        public int DataId { get; set; }

        public DateOnly Date { get; set; }

        public double Amount { get; set; }

        [ForeignKey("HealthInsuarance")]
        public string? PolicyNo { get; set; }

        public HealthInsuarance HealthInsuarance { get; set; }
    }
}
