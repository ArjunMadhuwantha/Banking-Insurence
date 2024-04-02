using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Bank_Insurance.Models
{
    public class Insuarance
    {
        [Key]
        public string? InsuranceId { get; set; }

        public string? StartDate { get; set; }

        [ForeignKey("SavingRelief")]
        public string? PolicyNo { get; set; }

        public SavingRelief savingRelief { get; set; }

        [ForeignKey("InsuranceProduct")]
        public string? InsuranceProductID { get; set; }

        public InsuranceProduct insuranceProduct { get; set; }

        [ForeignKey("Branch")]

        public string? BranchId { get; set; }

        public Branch branch { get; set; }

    }
}
