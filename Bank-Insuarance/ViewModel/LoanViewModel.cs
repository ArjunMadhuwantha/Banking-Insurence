namespace Bank_Insurance.ViewModel
{
    public class LoanViewModel
    {
        public string? BranchId { get; set; }
        public string? Name { get; set; }

        public string? ID { get; set; }

        public string? Address { get; set; }

        public string? ProjectName { get; set; }

        public DateOnly LoanIssueDate { get; set; }

        public DateOnly LoanEndDate { get; set; }

        public string? TeamNo { get; set; }
        public double Payment { get; set; }

        public DateOnly Paymentdate { get; set; }

        public Double LoanValue { get; set; }
        public Double CompenstaionValue { get; set; }
        public string? Requirement { get; set; }
        public string? Comment { get; set; }
        public DateOnly Date { get; set; }

        public string? CustomerPolicyNo { get; set; }
    }
}
