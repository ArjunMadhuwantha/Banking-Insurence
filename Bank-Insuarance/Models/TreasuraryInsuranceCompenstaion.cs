using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Bank_Insurance.Models
{
    public class TreasuraryInsuranceCompenstaion
    {
        [Key]
        public int TreasuraryInsuranceCompenstaionID { get; set; }
        public double Value { get; set; }
        public DateOnly Data { get; set; }
        public string? Comment { get; set; }
        


        [ForeignKey("Treasuary")]
        public string? PolicyNo { get; set; }

        public Treasuary? Treasuary { get; set; }
    }
}
