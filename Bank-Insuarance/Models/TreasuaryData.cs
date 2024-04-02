using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace Bank_Insurance.Models
{
    public class TreasuaryData
    {
        [Key]
        public int DataId { get; set; }

        public DateOnly Date { get; set; }

        public double Amount { get; set; }

        [ForeignKey("Treasuary")]
        public string? PolicyNo { get; set; }

        public Treasuary Treasuary { get; set; }
    }
}
