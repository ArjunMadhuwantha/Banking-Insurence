using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace Bank_Insurance.Models
{
    public class BuildingInsuaranceData
    {
        [Key]
        public int DataId { get; set; }

        public DateOnly Date { get; set; }

        public double Amount { get; set; }

        [ForeignKey("BuildingInsuarance")]
        public string? PolicyNo { get; set; }

        public BuildingInsuarance BuildingInsuarance { get; set; }
    }
}
