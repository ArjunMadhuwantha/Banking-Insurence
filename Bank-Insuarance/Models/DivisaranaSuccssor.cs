using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Bank_Insurance.Models
{
    public class DivisaranaSuccssor
    {
        [Key]
        public int Id { get; set; }

        public string? SuccsorName { get; set; }

        public DateOnly SuccssorDob {  get; set; }

        public int Age { get; set; }

        public string? Relationship { get; set; }

        [ForeignKey("DivisaranaData")]

        public string? CustomerPolicyNo { get; set; }

        public DivisaranaData DivisaranaData { get; set; }
    }
}
