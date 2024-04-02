using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations.Schema;

namespace Bank_Insurance.Models
{
    public class Branch
    {
        
        public string? BranchId { get; set; }

        public string? Branch_name { get; set; }

        public string? Address { get; set; }

        public string? TpNo { get; set; }

        public string? City { get; set; }


        //Relationship with Zone

        [ForeignKey("Zone")]
        public string? ZoneId { get; set; }

        public Zone Zone { get; set; }


    }
}
