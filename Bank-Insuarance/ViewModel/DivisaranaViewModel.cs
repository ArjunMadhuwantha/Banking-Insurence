namespace Bank_Insurance.ViewModel
{
    public class DivisaranaViewModel
    {
        public string? BranchId { get; set; }
        public string? BranchName { get; set; }

        public string? Fullname { get; set; }

        public string? Address { get; set; }

        public string? ID { get; set; }

        public string? BankMemberNo { get; set; }

        public DateOnly DOB { get; set; }

        public string? Job { get; set; }

        public string? Succssor { get; set; }

        public int TimePeriod { get; set; }
        public double AddmissionFee { get; set; }

        public DateOnly StartDate { get; set; }

        public double? DueAmount { get; set; }
        public double TotalAmount { get; set; }
        public double RecoveryAmount { get; set; }

        public DateOnly NextExecuteDate { get; set; }

        //Succssor

        public string? SuccssorName { get; set; }

        public int Age { get; set; }

        public DateOnly SuccssorDOB { get; set; }

        public string? Relation { get; set; }


        //Payment
        public double? Paymentvalue { get; set; }

        public DateOnly PaymentDate { get; set; }

        public DateOnly SystemDate { get; set; }

        public int CircleId { get; set; }

        public string? CusPolicyNo { get; set; }


        //Compensation

        public string? DeathPersonName { get; set; }

        public DateOnly DeathDate { get; set; }

        public string? HospitalizedPerson { get; set; }

        public string? Hospital { get; set; }

        public DateOnly DischargeDate { get; set; }

        public string? Disese { get; set; }

        public double Compensationvalue { get; set; }

        public string? DivisaranaNo { get; set; }

        public string? Surgery { get; set; }

        public string? Reason { get; set; }
    }
}
