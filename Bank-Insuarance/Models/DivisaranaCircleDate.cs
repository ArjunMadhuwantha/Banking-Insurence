using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Bank_Insurance.Models
{
    public class DivisaranaCircleDate
    {
        [Key]
        public int CircleId { get; set; }
        public string? BranchId { get; set; }

        public string? Fullname { get; set; }
        public int TimePeriod { get; set; }

        public double AddmissionFee { get; set; }

        public double TotalAmount { get; set; }

        public double? DueAmount {  get; set; }
        
        public DateOnly StartDate { get; set; }

        public DateOnly NextExecuteDate { get; set;}

        public double RecoveryAmount { get; set; }

        [ForeignKey("DivisaranaData")]

        public string? CustomerPolicyNo { get; set; }

        public DivisaranaData DivisaranaData { get; set; }

    }
}
