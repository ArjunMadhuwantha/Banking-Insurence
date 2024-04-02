using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Bank_Insurance.Models
{
    public class SavingReliefCompensation
    {
        [Key]
        public int MemberId {  get; set; }

        public string? MemberName { get; set; }

        public string? MemberAddress { get; set; }

        public string? DeathpersonName { get; set; }

        public string? Reason { get; set; }
        public string? Realtion { get; set; }
        public DateOnly ReasonDate { get; set; }

        public double CompensationValue { get; set; }

        public double RemainingBalanece { get; set; }

        public string? Schoolname { get; set; }
        public string? Studentname { get; set; }

        public string? Universityname { get; set; }

        [ForeignKey("SavingRelief")]
        public string? PolicyNo { get; set; }

        public SavingRelief SavingRelief { get; set; }




    }
}
