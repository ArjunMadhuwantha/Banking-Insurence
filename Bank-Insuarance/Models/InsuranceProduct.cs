using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Bank_Insurance.Models
{
    public class InsuranceProduct
    {
        [Key]
        public string? InsuranceProductID { get; set; }

        public string? InsuranceProductName { get; set; }

        

    }
}
