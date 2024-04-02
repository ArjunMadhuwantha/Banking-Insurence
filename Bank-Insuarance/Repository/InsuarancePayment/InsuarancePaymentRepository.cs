using Bank_Insurance.Data;
using Bank_Insurance.Models;
using Bank_Insurance.ViewModel;
using Microsoft.CodeAnalysis.Operations;
using Microsoft.EntityFrameworkCore;
using System.Xml.Linq;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace Bank_Insurance.Repository.InsuarancePayment
{
    public class InsuarancePaymentRepository : IinsuarancePaymentRepository
    {
        private readonly ApplicationDbContext _dbContext;

        public string Savingproductid = "Product-001";
        public string Bankingproductid = "Product-002";
        public string Buildingproductid = "Product-003";
        public string Healthproductid = "Product-004";
        public string Tresuaryproductid = "Product-005";

        public string SavinginId = "insuarance-001";
        public string BankinginId = "insuarance-002";
        public string BuildinginId = "insuarance-003";
        public string HealthinId = "insuarance-004";
        public string TresuaryinId = "insuarance-005";

        public string policy = "Poilicy";
        

        public InsuarancePaymentRepository(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
            
        }

        public async Task AddAsync(InsuarancePaymentViewModel payment)
        {
            //Saving
            var NewSavingData = new Models.SavingReliefData()
            {
                Date = payment.Date,
                Amount = payment.SavingAmount,
                PolicyNo = policy+"-saving-"+ payment.BranchId,
            };

            await _dbContext.SavingReliefDatas.AddAsync(NewSavingData);
            await _dbContext.SaveChangesAsync();

            //Health
            var NewHealthData = new Models.HealthInsuaranceData()
            {
                Date = payment.Date,
                Amount = payment.HealthAmount,
                PolicyNo = policy + "-health-" + payment.BranchId,
            };

            await _dbContext.HealthInsuaranceDatas.AddAsync(NewHealthData);
            await _dbContext.SaveChangesAsync();

            //building
            var NewBuildingData = new Models.BuildingInsuaranceData()
            {
                Date = payment.Date,
                Amount = payment.BuildingAmount,
                PolicyNo = policy + "-building-" + payment.BranchId,
            };

            await _dbContext.BuildingInsuaranceDatas.AddAsync(NewBuildingData);
            await _dbContext.SaveChangesAsync();

            //banking
            var NewBankingData = new Models.BankingInsuaranceData()
            {
                Date = payment.Date,
                Amount = payment.BankingAmount,
                PolicyNo = policy + "-banking-" + payment.BranchId,
            };

            await _dbContext.BankingInsuaranceDatas.AddAsync(NewBankingData);
            await _dbContext.SaveChangesAsync();

            //treasuary

            var NewTreasuaryData = new Models.TreasuaryData()
            {
                Date = payment.Date,
                Amount = payment.BankingAmount,
                PolicyNo = policy + "-Treasuary-" + payment.BranchId,
            };

            await _dbContext.TreasuaryDatas.AddAsync(NewTreasuaryData);
            await _dbContext.SaveChangesAsync();

        }

        public async Task AddInsuarance(InsuarancePaymentViewModel payment)
        {
            

            //Saving Relief
            var NewInsuarance1 = new Models.Insuarance()
            {
                InsuranceId = SavinginId + "_" + payment.BranchId,
                StartDate = "2024-01-01",
                PolicyNo = policy + "-saving-" + payment.BranchId,
                InsuranceProductID = Savingproductid,
                BranchId = payment.BranchId,
            };

            await _dbContext.Insuarances.AddAsync(NewInsuarance1);
            await _dbContext.SaveChangesAsync();



            var NewSaving = new Models.SavingRelief()
            {
                PolicyNo = policy + "-saving-" + payment.BranchId,
                InsuranceId = SavinginId + "_" + payment.BranchId,
            };

            await _dbContext.SavingReliefs.AddAsync(NewSaving);
            await _dbContext.SaveChangesAsync();



            //Health

            var NewInsuarance2 = new Models.Insuarance()
            {
                InsuranceId = HealthinId + "_" + payment.BranchId,
                StartDate = "2024-01-01",
                PolicyNo = policy + "-health-" + payment.BranchId,
                InsuranceProductID = Healthproductid,
                BranchId = payment.BranchId,
            };

            await _dbContext.Insuarances.AddAsync(NewInsuarance2);
            await _dbContext.SaveChangesAsync();



            var NewHealth = new Models.HealthInsuarance()
            {
                PolicyNo = policy + "-health-" + payment.BranchId,
                InsuranceId = HealthinId + "_" + payment.BranchId,
            };

            await _dbContext.HealthInsuarances.AddAsync(NewHealth);
            await _dbContext.SaveChangesAsync();

            //Building
            var NewInsuarance3 = new Models.Insuarance()
            {
                InsuranceId = BuildinginId + "_" + payment.BranchId,
                StartDate = "2024-01-01",
                PolicyNo = policy + "-building-" + payment.BranchId,
                InsuranceProductID = Buildingproductid,
                BranchId = payment.BranchId,
            };

            await _dbContext.Insuarances.AddAsync(NewInsuarance3);
            await _dbContext.SaveChangesAsync();

            var NewBuilding = new Models.BuildingInsuarance()
            {
                PolicyNo = policy + "-building-" + payment.BranchId,
                InsuranceId = BuildinginId + "_" + payment.BranchId,
            };

            await _dbContext.BuildingInsuarances.AddAsync(NewBuilding);
            await _dbContext.SaveChangesAsync();

            //banking

            var NewInsuarance4 = new Models.Insuarance()
            {
                InsuranceId = BankinginId + "_" + payment.BranchId,
                StartDate = "2024-01-01",
                PolicyNo = policy + "-banking-" + payment.BranchId,
                InsuranceProductID = Bankingproductid,
                BranchId = payment.BranchId,
            };

            await _dbContext.Insuarances.AddAsync(NewInsuarance4);
            await _dbContext.SaveChangesAsync();


            var NewBanking = new Models.BankingInsuarance()
            {
                PolicyNo = policy + "-banking-" + payment.BranchId,
                InsuranceId = BankinginId + "_" + payment.BranchId,
            };

            await _dbContext.BankingInsuarances.AddAsync(NewBanking);
            await _dbContext.SaveChangesAsync();

            //Treasary

            var NewInsuarance5 = new Models.Insuarance()
            {
                InsuranceId = TresuaryinId + "_" + payment.BranchId,
                StartDate = "2024-01-01",
                PolicyNo = policy + "-Treasuary-" + payment.BranchId,
                InsuranceProductID = Tresuaryproductid,
                BranchId = payment.BranchId,
            };

            await _dbContext.Insuarances.AddAsync(NewInsuarance5);
            await _dbContext.SaveChangesAsync();

            var NewTreasuary = new Models.Treasuary()
            {
                PolicyNo = policy + "-Treasuary-" + payment.BranchId,
                InsuranceId = TresuaryinId + "_" + payment.BranchId,
            };

            await _dbContext.Treasuaries.AddAsync(NewTreasuary);
            await _dbContext.SaveChangesAsync();


        }

       

        public async Task<bool> CheckID(InsuarancePaymentViewModel payment)
        {
 
            var insuranceId_1 = SavinginId + "_" + payment.BranchId;
            var insuranceId_2 = HealthinId + "_" + payment.BranchId;
            var insuranceId_3 = BuildinginId + "_" + payment.BranchId;
            var insuranceId_4 = BankinginId + "_" + payment.BranchId;
            var insuranceId_5 = TresuaryinId + "_" + payment.BranchId;

            bool idExists = await _dbContext.Insuarances.AnyAsync(i => i.InsuranceId == insuranceId_1 || i.InsuranceId == insuranceId_2 || i.InsuranceId == insuranceId_3 || i.InsuranceId == insuranceId_4 || i.InsuranceId == insuranceId_5);

            return idExists;
        }

        public async Task<List<Models.Branch>> GetAllBranches()
        {
            return await _dbContext.Branches.ToListAsync();
        }

        public async Task AddTreasurayName(InsuarancePaymentViewModel name)
        {
            var NewTreasuaryName = new Models.TreasuaryesCollection()
            {
                PolicyNo = policy + "-Treasuary-" + name.BranchId,
                TreasuaryName = name.TreasuaryName,
                Date = name.Date
            };

            await _dbContext.TreasuaryesCollections.AddAsync(NewTreasuaryName);
            await _dbContext.SaveChangesAsync();
        }

        public async Task<bool> CheakTrasuary(InsuarancePaymentViewModel name)
        {
            var insuranceId_5 = TresuaryinId + "_" + name.BranchId;
            bool idExists = await _dbContext.Insuarances.AnyAsync(i => i.InsuranceId == insuranceId_5);
            return idExists;
        }

        public async Task AddTreasuaryInsuarance(InsuarancePaymentViewModel name)
        {
            var NewInsuarance5 = new Models.Insuarance()
            {
                InsuranceId = TresuaryinId + "_" + name.BranchId,
                StartDate = "2024-01-01",
                PolicyNo = policy + "-Treasuary-" + name.BranchId,
                InsuranceProductID = Tresuaryproductid,
                BranchId = name.BranchId,
            };

            await _dbContext.Insuarances.AddAsync(NewInsuarance5);
            await _dbContext.SaveChangesAsync();

            var NewTreasuary = new Models.Treasuary()
            {
                PolicyNo = policy + "-Treasuary-" + name.BranchId,
                InsuranceId = TresuaryinId + "_" + name.BranchId,
            };

            await _dbContext.Treasuaries.AddAsync(NewTreasuary);
            await _dbContext.SaveChangesAsync();
        }



        public async Task<List<InsuarancePaymentViewModel>> GetAllTreasharyList(string branchId)
        {
            var PolicyNo = policy + "-Treasuary-" + branchId; 

            var treasheris = await _dbContext.TreasuaryesCollections
                .Where(t => t.PolicyNo == PolicyNo)
                .ToListAsync();

            List<InsuarancePaymentViewModel> InsuarancePaymentViewModels = new List<InsuarancePaymentViewModel>();

            foreach (var treashary in treasheris)
            {
                var insuarancePaymentViewModel = new InsuarancePaymentViewModel
                {
                    TreasuaryName = treashary.TreasuaryName,
                    Date = treashary.Date
                };

                InsuarancePaymentViewModels.Add(insuarancePaymentViewModel);
            }

            return InsuarancePaymentViewModels;
        }


    }
}
