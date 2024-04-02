using Bank_Insurance.Data;
using Bank_Insurance.Migrations;
using Bank_Insurance.Models;
using Bank_Insurance.ViewModel;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using System.Security.Cryptography.X509Certificates;

namespace Bank_Insurance.Repository.Loan
{
    public class LoanRepository : ILoanRepository
    {
        private readonly ApplicationDbContext _dbContext;
        
        public string Loanproductid = "Product-006";
        public string Divisaranaproductid = "Product-007";
        public string LoaninId = "insuarance-006";
        public string HouseLoaninId = "insuarance-007";
        public string DivisaranainId = "insuarance-007";
        public string policy = "Poilicy";
        public DateOnly days;
        public double RecoveryAmount;
        public double? DueAmount;
        public DateOnly SDate;

        public LoanRepository(ApplicationDbContext dbContext) {  _dbContext = dbContext; }


        public async Task<List<Models.Branch>> GetAllBranches()
        {
            return await _dbContext.Branches.ToListAsync();
        }

        //House Loan
        public async Task AddBranchToInsuranceHouse(LoanViewModel house)
        {
            var NewInsuarance2 = new Models.Insuarance()
            {
                InsuranceId = HouseLoaninId + "_" + house.BranchId,
                StartDate = "2024-01-01",
                PolicyNo = policy + "-house-" + house.BranchId,
                InsuranceProductID = Loanproductid,
                BranchId = house.BranchId,
            };

            await _dbContext.Insuarances.AddAsync(NewInsuarance2);
            await _dbContext.SaveChangesAsync();
        }
        public async Task AddHosueLoanInsurance(LoanViewModel house)
        {
            //houseLoan
            

            var NewCustomer2 = new Models.LoanCustomer()
            {
                CustomerPolicyNo = "House-" + house.ID,
                CustomerName = house.Name,
                ID = house.ID,
                Address = house.Address,
                ProjectName = house.ProjectName,
                LoanEndDate = house.LoanEndDate,
                LoanIssueDate = house.LoanIssueDate,
                LoanValue = house.LoanValue,
                TeamNo = house.TeamNo,
            };

            await _dbContext.LoanCustomers.AddAsync(NewCustomer2);
            await _dbContext.SaveChangesAsync();

            var NewHouse = new Models.LoanTbl()
            {
                PolicyNo = policy + "-house-" + house.BranchId,
                InsuranceId = LoaninId + "_" + house.BranchId,
                CustomerPolicyNo = "House-" + house.ID
            };

            await _dbContext.LoanTbls.AddAsync(NewHouse);
            await _dbContext.SaveChangesAsync();

            
        }

        public async Task AddPaymentHouseLoan(LoanViewModel house)
        {
            var Newhousepayment = new Models.LoanPayment()
            {
                PaymentDate = house.Paymentdate,
                Paymentvalue = house.Payment,
                CustomerPolicyNo = "House-" + house.ID
            };

            await _dbContext.LoanPayments.AddAsync(Newhousepayment);
            await _dbContext.SaveChangesAsync();

        }

        public async Task<bool> CheckBranchInsuaranceIDHouse(LoanViewModel house)
        {
            var branchInid = HouseLoaninId + "_" + house.BranchId;
            bool idExists = await _dbContext.Insuarances.AnyAsync(i => i.InsuranceId == branchInid);
            return idExists;
        }

        public async Task<bool> CheckCustomerIDHouse(LoanViewModel house)
        {
            var customerpolicy = "House-" + house.ID;
            bool idExists = await _dbContext.LoanCustomers.AnyAsync(p => p.CustomerPolicyNo == customerpolicy);
            return idExists;
        }

        //Loan insurance start
        public async Task AddBranchToInsuranceLoan(LoanViewModel branch)
        {
            var NewInsuarance1 = new Models.Insuarance()
            {
                InsuranceId = LoaninId + "_" + branch.BranchId,
                StartDate = "2024-01-01",
                PolicyNo = policy + "-loan-" + branch.BranchId,
                InsuranceProductID = Loanproductid, 
                BranchId = branch.BranchId,
            };

            await _dbContext.Insuarances.AddAsync(NewInsuarance1);
            await _dbContext.SaveChangesAsync();
        }
        public async Task AddLoanInsurance(LoanViewModel model)
        {
            //Loan
   
            var NewCustomer = new Models.LoanCustomer()
            {
                CustomerPolicyNo = "Loan-" + model.ID,
                CustomerName = model.Name,
                ID = model.ID,
                Address = model.Address,
                ProjectName = model.ProjectName,
                LoanEndDate = model.LoanEndDate,
                LoanIssueDate = model.LoanIssueDate,
                LoanValue = model.LoanValue,
                TeamNo = model.TeamNo,
            };

            await _dbContext.LoanCustomers.AddAsync(NewCustomer);
            await _dbContext.SaveChangesAsync();

            var NewLoan = new Models.LoanTbl()
            {
                PolicyNo = policy + "-loan-" + model.BranchId,
                InsuranceId = LoaninId + "_" + model.BranchId,
                CustomerPolicyNo = "Loan-"+model.ID
            };

            await _dbContext.LoanTbls.AddAsync(NewLoan);
            await _dbContext.SaveChangesAsync();

            
        }

        public async Task AddPaymentLoan(LoanViewModel model)
        {
            var Newloanpayment = new Models.LoanPayment()
            {
                PaymentDate = model.Paymentdate,
                Paymentvalue = model.Payment,
                CustomerPolicyNo = "Loan-" + model.ID
            };

            await _dbContext.LoanPayments.AddAsync(Newloanpayment);
            await _dbContext.SaveChangesAsync();
            
        }

        public async Task<bool> CheckID(LoanViewModel payment)
        {
            var customerpolicy = policy + "-Cus-" + payment.ID;
            bool idExists = await _dbContext.LoanTbls.AnyAsync(p => p.CustomerPolicyNo == customerpolicy);
            return idExists;
        }

                            //Loan Insurance check customer policy no
        public async Task<bool> CheckCustomerID(LoanViewModel payment)
        {
            var customerpolicy = "Loan-" + payment.ID;
            bool idExists = await _dbContext.LoanCustomers.AnyAsync(p => p.CustomerPolicyNo == customerpolicy);
            return idExists;
        }

                            //Loan Insurance check branch policy no
        public async Task<bool> CheckBranchInsuaranceID(LoanViewModel payment)
        {
            var branchInid = LoaninId + "_" + payment.BranchId;
            bool idExists = await _dbContext.Insuarances.AnyAsync(i => i.InsuranceId == branchInid);
            return idExists;
        }

        //Divisarana start
        public async Task AddDivisaranaToInsurance(DivisaranaViewModel divisarana)
        {
            var NewInsuarance3 = new Models.Insuarance()
            {
                InsuranceId = DivisaranainId + "_" + divisarana.BranchId,
                StartDate = "2024-01-01",
                PolicyNo = policy + "-divi-" + divisarana.BranchId,
                InsuranceProductID = Loanproductid,
                BranchId = divisarana.BranchId,
            };

            await _dbContext.Insuarances.AddAsync(NewInsuarance3);
            await _dbContext.SaveChangesAsync();
        }
        public async Task AddDivisarana(DivisaranaViewModel divisarana)
        {
            

            var NewDivisarana = new Models.DivisaranaData()
            {
                CustomerPolicyNo = "Divi-" + divisarana.ID,
                Fullname = divisarana.Fullname,
                Address = divisarana.Address,
                ID = divisarana.ID,
                BankMemberNo = divisarana.BankMemberNo,
                DOB = divisarana.DOB,
                Job = divisarana.Job,
                Succssor = divisarana.Succssor,
            };
            await _dbContext.DivisaranaDatas.AddAsync(NewDivisarana);
            await _dbContext.SaveChangesAsync();

            var NewDivi = new Models.DivisaranaTbl()
            {
                PolicyNo = policy + "-divi-" + divisarana.BranchId,
                InsuranceId = DivisaranainId + "_" + divisarana.BranchId,
                CustomerPolicyNo = "Divi-" + divisarana.ID
            };

            await _dbContext.DivisaranaTbls.AddAsync(NewDivi);
            await _dbContext.SaveChangesAsync();

            //Calculate Months
            if(divisarana.TimePeriod == 1)
            {
                days = divisarana.StartDate.AddMonths(1);
                RecoveryAmount = 50;
            }
            else if(divisarana.TimePeriod == 6) 
            { 
                days = divisarana.StartDate.AddMonths(6);
                RecoveryAmount = 300;
            }
            else if (divisarana.TimePeriod == 12)
            {
                days = divisarana.StartDate.AddMonths(12);
                RecoveryAmount = 600;
            }


            var NewCircle = new Models.DivisaranaCircleDate()
            {
                BranchId = divisarana.BranchId,
                TimePeriod = divisarana.TimePeriod,
                AddmissionFee = divisarana.AddmissionFee,
                TotalAmount = 600,
                DueAmount = 600,
                StartDate = divisarana.StartDate,
                NextExecuteDate = days,
                RecoveryAmount = RecoveryAmount,
                CustomerPolicyNo = "Divi-" + divisarana.ID,
                Fullname = divisarana.Fullname,
            };
            await _dbContext.DivisaranaCircleDates.AddAsync(NewCircle);
            await _dbContext.SaveChangesAsync();



        }
        public async Task<List<DivisaranaViewModel>> DivisaranaPaymentDetails(string Bid)
        {
            var PaymentCircle = await _dbContext.DivisaranaCircleDates
                .Where(b => b.BranchId == Bid)
                .ToListAsync();

            var branch = await _dbContext.Branches
                .FirstOrDefaultAsync(b => b.BranchId == Bid);

            List<DivisaranaViewModel> paymentDates = new List<DivisaranaViewModel>();

            foreach (var payment in PaymentCircle)
            {
                var divisaranaViewModel = new DivisaranaViewModel
                {
                    CusPolicyNo = payment.CustomerPolicyNo,
                    AddmissionFee = payment.AddmissionFee,
                    TimePeriod= payment.TimePeriod,
                    NextExecuteDate= payment.NextExecuteDate,
                    RecoveryAmount = payment.RecoveryAmount,
                    TotalAmount= payment.TotalAmount,
                    DueAmount= payment.DueAmount,
                    BranchName = branch?.Branch_name,
                    BranchId = branch?.BranchId,
                    Fullname = payment.Fullname,
                    CircleId= payment.CircleId,
                    

                };
                paymentDates.Add(divisaranaViewModel);
            }

            return paymentDates;
        }

        public async Task DivisaranaPaymentUpdate(DivisaranaViewModel payment)
        {
            SDate = DateOnly.FromDateTime(DateTime.Today);
            var NewPayment = new Models.DivisaranaPayment()
            {
                BranchId = payment.BranchId,
                Fullname= payment.Fullname,
                CustomerPolicyNo = payment.CusPolicyNo,
                PaymentDate = payment.NextExecuteDate,
                PaymentValue = payment.Paymentvalue,
                SystemDate = SDate,
            };

            await _dbContext.DivisaranaPayments.AddAsync(NewPayment);
            await _dbContext.SaveChangesAsync();

            //Calculate Months
            if (payment.TimePeriod == 1)
            {
                days = payment.NextExecuteDate.AddMonths(1);

            }
            else if (payment.TimePeriod == 6)
            {
                days = payment.NextExecuteDate.AddMonths(6);

            }
            else if (payment.TimePeriod == 12)
            {
                days = payment.NextExecuteDate.AddMonths(12);

            }

            if (payment.DueAmount - payment.Paymentvalue == 0)
            {
                DueAmount = 600;
            }
            else
            {
                DueAmount = payment.DueAmount - payment.Paymentvalue;
            }



            var Circle = await _dbContext.DivisaranaCircleDates.FindAsync(payment.CircleId);
            {

                Circle.NextExecuteDate = days;
              
                Circle.DueAmount = DueAmount;
            }

            _dbContext.DivisaranaCircleDates.Update(Circle);
            await _dbContext.SaveChangesAsync();
        }


        public async Task<bool> CheckBranchInsuaranceIDDivisarana(DivisaranaViewModel divisarana)
        {
            var branchInid = DivisaranainId + "_" + divisarana.BranchId;
            bool idExists = await _dbContext.Insuarances.AnyAsync(i => i.InsuranceId == branchInid);
            return idExists;
            throw new NotImplementedException();
        }

        //Add successors 
        public async Task AddSuccssor(DivisaranaViewModel succssor)
        {
            var NewSuccssor = new Models.DivisaranaSuccssor()
            {
                CustomerPolicyNo = "Divi-" + succssor.ID,
                SuccsorName = succssor.SuccssorName,
                SuccssorDob = succssor.SuccssorDOB,
                Age = succssor.Age,
                Relationship = succssor.Relation
            };

            await _dbContext.DivisaranaSuccssors.AddAsync(NewSuccssor);
            await _dbContext.SaveChangesAsync();
        }

        public async Task<List<DivisaranaViewModel>> GetAllSuccssorList(string id)
        {
            var CustomerPolicyNo = "Divi-" + id;

            var successors = await _dbContext.DivisaranaSuccssors
                .Where(p => p.CustomerPolicyNo == CustomerPolicyNo)
                .ToListAsync();
            

            List<DivisaranaViewModel> DivisaranaViewModels = new List<DivisaranaViewModel>();

            foreach (var succor in successors)
            {
                var divisaranaViewModel = new DivisaranaViewModel
                {

                    SuccssorName = succor.SuccsorName,
                    SuccssorDOB = succor.SuccssorDob,
                    Age = succor.Age,
                    Relation = succor.Relationship
                };

                DivisaranaViewModels.Add(divisaranaViewModel);

            }
            return DivisaranaViewModels;



        }
        public async Task<bool> CheckCustomerIDDivisarana(DivisaranaViewModel divisarana)
        {
            var customerpolicy = "Divi-" + divisarana.ID;
            bool idExists = await _dbContext.LoanCustomers.AnyAsync(p => p.CustomerPolicyNo == customerpolicy);
            return idExists;
            throw new NotImplementedException();
        }


        public async Task<bool> CheakDivisaranMemeberID(DivisaranaViewModel divisarana)
        {
            var CustomerPolicyNo = "Divi-" + divisarana.ID;
            bool idExists = await _dbContext.DivisaranaDatas.AnyAsync(p => p.CustomerPolicyNo == CustomerPolicyNo);
            return idExists;
        }

        public async Task<List<DivisaranaData>> GetAllMembers()
        {
            //return await _dbContext.DivisaranaDatas.ToListAsync();
            
            return await _dbContext.DivisaranaDatas
            .Select(d => new DivisaranaData { Fullname = d.Fullname, BankMemberNo = d.BankMemberNo, CustomerPolicyNo = d.CustomerPolicyNo })
            .ToListAsync();

        }

        

        public async Task AddDivisaranaCompensation(DivisaranaViewModel compensation)
        {
            var NewCompensation = new Models.DivisaranaCompensation()
            {
                BranchId = compensation.BranchId,
                MemberName = compensation.Fullname,
                DivisaranaNo = compensation.DivisaranaNo,
                DeathPersonName = compensation.DeathPersonName,
                DeathDate = compensation.DeathDate,
                HospitalizedPerson = compensation.HospitalizedPerson,
                Hospital = compensation.Hospital,
                DischargeDate = compensation.DischargeDate,
                Realtion = compensation.Relation,
                Diseases = compensation.Disese,
                CompensationValue = compensation.Compensationvalue,
                CustomerPolicyNo = compensation.CusPolicyNo,
                Surgery = compensation.Surgery,
                Reason = compensation.Reason,
            };

            await _dbContext.DivisaranaCompensations.AddAsync(NewCompensation);
            await _dbContext.SaveChangesAsync();
        }



        public async Task<List<LoanCustomer>> GetAllLoanMembers()
        {
            //return await _dbContext.DivisaranaDatas.ToListAsync();

            return await _dbContext.LoanCustomers
            .Select(d => new LoanCustomer { CustomerName = d.CustomerName, CustomerPolicyNo = d.CustomerPolicyNo })
            .ToListAsync();

        }

        public async Task AddLoanCompensation(LoanViewModel compensation)
        {
            var Newcompensation = new Models.LoanCompenstaion()
            {
                FullName = compensation.Name,
                BranchId = compensation.BranchId,
                Value = compensation.LoanValue,
                CompenstaionValue = compensation.LoanValue,
                Requirement = compensation.Requirement,
                Comment = compensation.Comment,
                Date = compensation.Date,
                CustomerPolicyNo = compensation.CustomerPolicyNo
            };

            await _dbContext.LoanCompenstaions.AddAsync(Newcompensation);
            await _dbContext.SaveChangesAsync();
        }

        
    }
}
