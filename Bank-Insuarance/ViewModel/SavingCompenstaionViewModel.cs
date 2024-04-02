namespace Bank_Insurance.ViewModel
{
    public class SavingCompenstaionViewModel
    {
        public string? MemberName { get; set; }

        public string? MemberAddress { get; set; }

        public string? DeathpersonName { get; set; }

        public string? Reason { get; set; }
        public string? Relation { get; set; }
        public DateOnly ReasonDate { get; set; }

        public double CompensationValue { get; set; }

        public double RemainingBalanece { get; set; }

        public string? Schoolname { get; set; }

        public string? Universityname { get; set; }

        public string? BranchId { get; set; }
    }
}
