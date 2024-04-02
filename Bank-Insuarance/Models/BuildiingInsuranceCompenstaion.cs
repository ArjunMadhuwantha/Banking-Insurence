using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace Bank_Insurance.Models
{
    public class BuildiingInsuranceCompenstaion
    {
        [Key]
        public int BuildiingInsuranceCompenstaionID { get; set; }
        public Double Value { get; set; }
        public DateOnly Data { get; set; }
        public string? Comment { get; set; }



        [ForeignKey("BuildingInsuarance")]
        public string? PolicyNo { get; set; }

        public BuildingInsuarance BuildingInsuarance { get; set; }
    }
}
