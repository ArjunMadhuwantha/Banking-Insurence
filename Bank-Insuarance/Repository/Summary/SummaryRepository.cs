using Bank_Insurance.Data;
using Bank_Insurance.Models;
using Bank_Insurance.ViewModel;
using Microsoft.EntityFrameworkCore;
using System.Security.Cryptography;

namespace Bank_Insurance.Repository.Summary
{
    public class SummaryRepository : ISummaryRepository
    {
        private readonly ApplicationDbContext _dbContext;
        public string policy = "Poilicy";

        public SummaryRepository(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        

        public async Task<List<Models.Branch>> GetAllBranches()
        {
            return await _dbContext.Branches.ToListAsync();
        }
        public async Task<List<DivisaranaData>> GetAllMembers()
        {


            return await _dbContext.DivisaranaDatas
            .Select(d => new DivisaranaData { Fullname = d.Fullname, BankMemberNo = d.BankMemberNo, CustomerPolicyNo = d.CustomerPolicyNo })
            .ToListAsync();

        }

        //Divisarana Summary
        public async Task<List<SummaryViewModel>> GetAllDivisaranaCompensationList(string Bid)
        {

            var Compensations = await _dbContext.DivisaranaCompensations
                .Where(b => b.BranchId == Bid)
                .ToListAsync();

            var branch = await _dbContext.Branches
                .FirstOrDefaultAsync(b => b.BranchId == Bid);

            List<SummaryViewModel> SummaryViewModels = new List<SummaryViewModel>();

            foreach (var compensation in Compensations) 
            {
                var summaryViewModel = new SummaryViewModel
                {
                    Fullname = compensation.MemberName,
                    DivisaranaNo = compensation.DivisaranaNo,
                    DeathPersonName =compensation.DeathPersonName,
                    Compensationvalue = compensation.CompensationValue,
                    BranchName = branch?.Branch_name,
                    CusPolicyNo = compensation.CustomerPolicyNo,
                    HospitalizedPerson = compensation.HospitalizedPerson,
                    Surgery = compensation.Surgery,
                    Disese = compensation.Diseases,
    };
                SummaryViewModels.Add(summaryViewModel);
            }

            
            return SummaryViewModels;
        }

        public async Task<List<DivisaranaViewModel>> GetCustomerDeatils(string PolicyNo)
        {
            var Details = await _dbContext.DivisaranaDatas
                .Where(p => p.CustomerPolicyNo == PolicyNo)
                .ToListAsync();

            var Circle = await _dbContext.DivisaranaCircleDates
                .FirstOrDefaultAsync(p => p.CustomerPolicyNo == PolicyNo);

            List<DivisaranaViewModel> ab = new List<DivisaranaViewModel>();


            foreach (var details in Details)
            {
                var divisaranaViewModel = new DivisaranaViewModel
                {
                    Fullname = details.Fullname,
                    Address = details.Address,
                    ID = details.ID,
                    BankMemberNo = details.BankMemberNo,
                    DOB = details.DOB,
                    Job = details.Job,
                    Succssor = details.Succssor,
                    CusPolicyNo = details.CustomerPolicyNo,
                    StartDate = Circle.StartDate,
                    AddmissionFee = Circle.AddmissionFee,
                    TimePeriod= Circle.TimePeriod,
                };
                ab.Add(divisaranaViewModel);
            }

            return ab;
            
        }

        public async Task<List<DivisaranaViewModel>> GetCustomerPaymentDeatils(string PolicyNo)
        {
            var payments = await _dbContext.DivisaranaPayments
                .Where(p => p.CustomerPolicyNo == PolicyNo)
                .ToListAsync();

            List<DivisaranaViewModel> divisaranaViewModels = new List<DivisaranaViewModel>();

            foreach (var payment in payments)
            {
                var divisaranaViewModel = new DivisaranaViewModel
                {
                    Fullname = payment.Fullname,
                    Paymentvalue = payment.PaymentValue,
                    PaymentDate = payment.PaymentDate,
                    SystemDate = payment.SystemDate,
                };
                divisaranaViewModels.Add(divisaranaViewModel);
            }

            return divisaranaViewModels;
        }

        public async Task<List<DivisaranaViewModel>> GetCustomerSuccssoursDeatils(string PolicyNo)
        {
            var succssors = await _dbContext.DivisaranaSuccssors
                .Where(p => p.CustomerPolicyNo == PolicyNo)
                .ToListAsync();

            List<DivisaranaViewModel> divisaranaViewModels = new List<DivisaranaViewModel>();

            foreach (var succssor in succssors)
            {
                var divisaranaViewModel = new DivisaranaViewModel
                {
                    SuccssorName = succssor.SuccsorName,
                    Age = succssor.Age,
                    SuccssorDOB = succssor.SuccssorDob,
                    Relation = succssor.Relationship
                };
                divisaranaViewModels.Add(divisaranaViewModel);
            }

            return divisaranaViewModels;
        }

        //Treashary Summary
        public async Task<List<SummaryViewModel>> GetAllTreasharyBranchPaymentList(string Bid)
        {
            var PolicyNo = policy + "-Treasuary-" + Bid;

            var Payments = await _dbContext.TreasuaryDatas
                .Where(b => b.PolicyNo == PolicyNo)
                .ToListAsync();

            var branch = await _dbContext.Branches
                .FirstOrDefaultAsync(b => b.BranchId == Bid);

            List<SummaryViewModel> SummaryViewModels = new List<SummaryViewModel>();

            foreach (var payment in Payments)
            {
                var summaryViewModel = new SummaryViewModel
                {

                    BranchName = branch?.Branch_name,
                    Branchpolicyno = payment.PolicyNo,
                    Date = payment.Date,
                    Value = payment.Amount
                };

                SummaryViewModels.Add(summaryViewModel);
            }

            return SummaryViewModels;
        }
        public async Task<List<SummaryViewModel>> GetAllTreasharyCompensationList(string PolicyNo)
        {
            

            var Compensations = await _dbContext.TreasuraryInsuranceCompenstaions
                .Where(p => p.PolicyNo == PolicyNo)
                .ToListAsync();

            

            List<SummaryViewModel> SummaryViewModels = new List<SummaryViewModel>();

            foreach (var compensation in Compensations)
            {
                var summaryViewModel = new SummaryViewModel
                {
                    Date= compensation.Data,
                    value = compensation.Value,
                    Comment = compensation.Comment,
                   
                };
                SummaryViewModels.Add(summaryViewModel);
            }
            return SummaryViewModels;
        }

        //Banking Summary
        public async Task<List<SummaryViewModel>> GetAllBankingBranchPaymentList(string Bid)
        {
            var PolicyNo = policy + "-banking-" + Bid;

            var Payments = await _dbContext.BankingInsuaranceDatas
                .Where(b => b.PolicyNo == PolicyNo)
                .ToListAsync();

            var branch = await _dbContext.Branches
                .FirstOrDefaultAsync(b => b.BranchId == Bid);

            List<SummaryViewModel> SummaryViewModels = new List<SummaryViewModel>();

            foreach (var payment in Payments)
            {
                var summaryViewModel = new SummaryViewModel
                {
                    BranchName = branch?.Branch_name,
                    Branchpolicyno = payment.PolicyNo,
                    Date = payment.Date,
                    Value = payment.Amount
                };

                SummaryViewModels.Add(summaryViewModel);
            }

            return SummaryViewModels;
        }
        public async Task<List<SummaryViewModel>> GetAllBankCompensationList(string PolicyNo)
        {
            

            var Compensations = await _dbContext.BankingInsuaranceCompenstaions
                .Where(p => p.PolicyNo == PolicyNo)
                .ToListAsync();

            

            List<SummaryViewModel> SummaryViewModels = new List<SummaryViewModel>();

            foreach (var compensation in Compensations)
            {
                var summaryViewModel = new SummaryViewModel
                {
                    Date = compensation.Data,
                    value = compensation.Value,
                    Comment = compensation.Comment,
                    
                };
                SummaryViewModels.Add(summaryViewModel);
            }
            return SummaryViewModels;
        }

        //Health Summary
        public async Task<List<SummaryViewModel>> GetAllHealthBranchPaymentList(string Bid)
        {
            var PolicyNo = policy + "-health-" + Bid;

            var Payments = await _dbContext.HealthInsuaranceDatas
                .Where(b => b.PolicyNo == PolicyNo)
                .ToListAsync();

            var branch = await _dbContext.Branches
                .FirstOrDefaultAsync(b => b.BranchId == Bid);

            List<SummaryViewModel> SummaryViewModels = new List<SummaryViewModel>();

            foreach (var payment in Payments)
            {
                var summaryViewModel = new SummaryViewModel
                {
                    BranchName = branch?.Branch_name,
                    Branchpolicyno = payment.PolicyNo,
                    Date = payment.Date,
                    Value = payment.Amount
                };

                SummaryViewModels.Add(summaryViewModel);
            }

            return SummaryViewModels;
        }
        public async Task<List<SummaryViewModel>> GetAllHealthCompensationList(string PolicyNo)
        {

            var Compensations = await _dbContext.HealthInsuranceCompenstaions
               .Where(p => p.PolicyNo == PolicyNo)
               .ToListAsync();

            List<SummaryViewModel> SummaryViewModels = new List<SummaryViewModel>();

            foreach (var compensation in Compensations)
            {
                var summaryViewModel = new SummaryViewModel
                {

                    
                    Date = compensation.Data,
                    value = compensation.Value,
                    Comment = compensation.Comment,
                    
                };
                SummaryViewModels.Add(summaryViewModel);
            }
            return SummaryViewModels;
        }


        //Building Summary

        public async Task<List<SummaryViewModel>> GetAllBuildingBranchPaymentList(string Bid)
        {
            var PolicyNo = policy + "-building-" + Bid;

            var Payments = await _dbContext.BuildingInsuaranceDatas
                .Where(b => b.PolicyNo == PolicyNo)
                .ToListAsync();

            var branch = await _dbContext.Branches
                .FirstOrDefaultAsync(b => b.BranchId == Bid);

            List<SummaryViewModel> SummaryViewModels = new List<SummaryViewModel>();

            foreach (var payment in Payments)
            {
                var summaryViewModel = new SummaryViewModel
                {
                    BranchName = branch?.Branch_name,
                    Branchpolicyno = payment.PolicyNo,
                    Date = payment.Date,
                    Value = payment.Amount
                };

                SummaryViewModels.Add(summaryViewModel);
            }

            return SummaryViewModels;
        }
        public async Task<List<SummaryViewModel>> GetAllBuildingCompensationList(string PolicyNo)
        {

            var Compensations = await _dbContext.BuildiingInsuranceCompenstaions
               .Where(p => p.PolicyNo == PolicyNo)
               .ToListAsync();


            List<SummaryViewModel> SummaryViewModels = new List<SummaryViewModel>();

            foreach (var compensation in Compensations)
            {
                var summaryViewModel = new SummaryViewModel
                {

                    Date = compensation.Data,
                    value = compensation.Value,
                    Comment = compensation.Comment,
                    
                };
                SummaryViewModels.Add(summaryViewModel);
            }
            return SummaryViewModels;
        }


        //SavingRelief Summary
        public async Task<List<SummaryViewModel>> GetAllSavingReliefCompensationList(string PolicyNo)
        {
            
            var Compensations = await _dbContext.SavingReliefCompensations
                .Where(b => b.PolicyNo == PolicyNo)
                .ToListAsync();

            

            List<SummaryViewModel> SummaryViewModels = new List<SummaryViewModel>();

            foreach (var compensation in Compensations)
            {
                var summaryViewModel = new SummaryViewModel
                {
                    Fullname = compensation.MemberName,
                    Address = compensation.MemberAddress,
                    Reason = compensation.Reason,
                    Reammaingvalue = compensation.RemainingBalanece,
                    Compensationvalue = compensation.CompensationValue,
                    Branchpolicyno = compensation.PolicyNo,
                    
                    
                };
                SummaryViewModels.Add(summaryViewModel);
            }


            return SummaryViewModels;
        }

        public async Task<List<SummaryViewModel>> GetAllSavingReliefBranchPaymentList(string Bid)
        {
            var PolicyNo = policy + "-saving-" + Bid;

            var Payments = await _dbContext.SavingReliefDatas
                .Where(b => b.PolicyNo == PolicyNo)
                .ToListAsync();

            var branch = await _dbContext.Branches
                .FirstOrDefaultAsync(b => b.BranchId == Bid);

            List<SummaryViewModel> SummaryViewModels = new List<SummaryViewModel>();

            foreach (var payment in Payments)
            {
                var summaryViewModel = new SummaryViewModel
                {
                    BranchName = branch?.Branch_name,
                    Branchpolicyno = payment.PolicyNo,
                    Date = payment.Date,
                    Value = payment.Amount
                };

                SummaryViewModels.Add(summaryViewModel);
            }

            return SummaryViewModels;
        }


        //Loan
        public async Task<List<SummaryViewModel>> GetAllLoanBranchPaymentList(string Bid, string Type)
        {
            var branch = await _dbContext.Branches
                .FirstOrDefaultAsync(b => b.BranchId == Bid);

            var PolicyNo = "";

            if (Type == "Loan")
            {
                PolicyNo = policy + "-loan-" + Bid;
            }
            else if(Type == "House")
            {
                PolicyNo = policy + "-house-" + Bid;
            }

            var customerPolicyNos = await _dbContext.LoanTbls
                .Where(b => b.PolicyNo == PolicyNo)
                .Select(b => b.CustomerPolicyNo)
                .ToListAsync();

            var loanCustomers = await _dbContext.LoanCustomers
                .Where(c => customerPolicyNos.Contains(c.CustomerPolicyNo))
                .ToListAsync();

            List<SummaryViewModel> SummaryViewModels = new List<SummaryViewModel>();

            foreach (var customer in loanCustomers)
            {
                var summaryViewModel = new SummaryViewModel
                {
                    BranchName = branch?.Branch_name,
                    Fullname = customer.CustomerName,
                    CusPolicyNo =customer.CustomerPolicyNo,
                    Address = customer.Address,
                    Nic = customer.ID,
                    ProjectName = customer.ProjectName,
                    value = customer.LoanValue
                };

                SummaryViewModels.Add(summaryViewModel);
            }

            return SummaryViewModels;
        }

        public async Task<List<SummaryViewModel>> GetAllLoanCustomerPaymentList(string PolicyNo)
        {
            

            var Details = await _dbContext.LoanCustomers
                .FirstOrDefaultAsync(p => p.CustomerPolicyNo == PolicyNo);

            var Payments = await _dbContext.LoanPayments
                .Where(p => p.CustomerPolicyNo == PolicyNo)
                .ToListAsync();

            List<SummaryViewModel> SummaryViewModels = new List<SummaryViewModel>();

            foreach (var payment in Payments)
            {
                var summaryViewModel = new SummaryViewModel
                {
                    Date = payment.PaymentDate,
                    Value = payment.Paymentvalue,
                    Fullname = Details?.CustomerName,
                    StartDate = Details?.LoanIssueDate,
                    EndDateDate = Details?.LoanEndDate,
                };

                SummaryViewModels.Add(summaryViewModel);
            }

            return SummaryViewModels;
        }

        //Loan Compensation Summary
        public async Task<List<SummaryViewModel>> GetAllLoanBranchCompensationList(string Bid, string Type)
        {
            var branch = await _dbContext.Branches
                .FirstOrDefaultAsync(b => b.BranchId == Bid);

            var PolicyNo = "";

            if (Type == "Loan")
            {
                PolicyNo = policy + "-loan-" + Bid;
            }
            else if (Type == "House")
            {
                PolicyNo = policy + "-house-" + Bid;
            }

            var customerPolicyNos = await _dbContext.LoanTbls
                .Where(b => b.PolicyNo == PolicyNo)
                .Select(b => b.CustomerPolicyNo)
                .ToListAsync();

            var loanCustomers = await _dbContext.LoanCompenstaions
                .Where(c => customerPolicyNos.Contains(c.CustomerPolicyNo))
                .ToListAsync();

            List<SummaryViewModel> SummaryViewModels = new List<SummaryViewModel>();

            foreach (var customer in loanCustomers)
            {
                var summaryViewModel = new SummaryViewModel
                {
                    BranchName = branch?.Branch_name,
                    Fullname = customer.FullName,
                    CusPolicyNo = customer.CustomerPolicyNo,
                    Compensationvalue = customer.CompenstaionValue,
                    value = customer.Value,
                    Comment = customer.Comment,
                    Date = customer.Date,
                    Requirement = customer.Requirement,
                };

                SummaryViewModels.Add(summaryViewModel);
            }

            return SummaryViewModels;
        }

    }
}
