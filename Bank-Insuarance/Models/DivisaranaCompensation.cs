using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Bank_Insurance.Models
{
    public class DivisaranaCompensation
    {
        [Key]
        public int CompensationId { get; set; }

        public string? MemberName { get; set; }

        public string? BranchId { get; set; }

        public string? DivisaranaNo {  get; set; }

        public string? DeathPersonName { get; set; }

        public string? HospitalizedPerson {  get; set; }

        public DateOnly DeathDate { get; set; }
        public DateOnly DischargeDate { get; set; }

        public string? Realtion { get; set; }

        public string? Hospital {  get; set; }

        public string? Diseases { get; set; }

        public string? Surgery { get; set; }
        public double? CompensationValue { get; set; }

        public string? Reason { get; set; }

        [ForeignKey("DivisaranaData")]

        public string? CustomerPolicyNo { get; set; }

        public DivisaranaData DivisaranaData { get; set; }

    }
}
