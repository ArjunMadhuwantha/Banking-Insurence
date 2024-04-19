namespace Bank_Insurance.ViewModel
{
    public class SummaryViewModel
    {
        public string? BranchId { get; set; }
        public string? BranchName { get; set; }

        public string? CusPolicyNo { get; set; }
        public string? Fullname { get; set; }
        public double? Compensationvalue { get; set; }

        public string? DivisaranaNo { get; set; }

        public string? DeathPersonName { get; set; }

        public string? HospitalizedPerson { get; set; }

        public DateOnly DischargeDate { get; set; }

        public DateOnly DeathDate { get; set; }

        public string? Disese { get; set; }
        public string? Reason { get; set; }
        public string? Surgery { get; set; }

        //Treashary
        public string? Branchpolicyno { get; set; }
        public string? Comment { get; set; }

        public double value { get; set; }
        public DateOnly Date { get; set; }


        //Saving Relief
        public string? Address { get; set; }

        public double Reammaingvalue { get; set; }

        public double Value { get; set; }


        //Loan

        public string Type { get; set; }

        public string? Nic { get; set; }
        public string? ProjectName { get; set; }

        public DateOnly? StartDate { get; set; }
        public DateOnly? EndDateDate { get; set; }

        public string? Requirement { get; set; }
    }
}
