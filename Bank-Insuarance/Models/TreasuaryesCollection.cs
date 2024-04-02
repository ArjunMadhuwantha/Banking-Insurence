using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Bank_Insurance.Models
{
    public class TreasuaryesCollection
    {
        [Key]
        public int TreasuaryeId { get; set; }

        public string? TreasuaryName { get; set; }

        public DateOnly Date { get; set; }

        [ForeignKey("Treasuary")]
        public string? PolicyNo { get; set; }

        public Treasuary Treasuary { get; set; }
    }
}
