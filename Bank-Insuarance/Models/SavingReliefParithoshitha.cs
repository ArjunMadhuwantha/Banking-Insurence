﻿using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace Bank_Insurance.Models
{
    public class SavingReliefParithoshitha
    {
        [Key]
        public int DataId { get; set; }

        public string? Name { get; set; }

        public string? MemberNo { get; set; }
        public double? Amount { get; set; }

        public string? Comment { get; set; }

        [ForeignKey("Branch")]

        public string? BranchId { get; set; }

        public Branch Branch { get; set; }
    }
}
