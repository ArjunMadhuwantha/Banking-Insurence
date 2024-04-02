using Bank_Insurance.Data;
using Bank_Insurance.ViewModel;
using Microsoft.EntityFrameworkCore;

namespace Bank_Insurance.Repository.Compensation
{
    public class CompensationRepository : ICompensationRepository
    {
        private readonly ApplicationDbContext _dbContext;
        public string policy = "Poilicy";
        public CompensationRepository(ApplicationDbContext dbContext) 
        {
            _dbContext = dbContext;
        }
        public async Task AddSavingCompensation(SavingCompenstaionViewModel req)
        {
            var NewSavingCompensation = new Models.SavingReliefCompensation()
            {
                
                PolicyNo = policy + "-saving-" + req.BranchId,
                MemberName = req.MemberName,
                MemberAddress = req.MemberAddress,
                DeathpersonName = req.DeathpersonName,
                Reason = req.Reason,
                Realtion = req.Relation,
                ReasonDate = req.ReasonDate,
                CompensationValue = req.CompensationValue,
                RemainingBalanece = req.RemainingBalanece,

                
            };

            await _dbContext.SavingReliefCompensations.AddAsync(NewSavingCompensation);
            await _dbContext.SaveChangesAsync();
        }

       
        
        public async Task<List<Models.Branch>> GetAllBranches()
        {
            return await _dbContext.Branches.ToListAsync();
        }

        public async Task<bool> CheckID(SavingCompenstaionViewModel req)
        {
            var SavingPolicy = policy + "-saving-" + req.BranchId;
            bool idExists = await _dbContext.SavingReliefs.AnyAsync(i => i.PolicyNo == SavingPolicy);

            return idExists;
        }


        //TreasuraryCompensation
        public async Task AddTreasuraryCompensation(TreasuraryCompenstaionViewModel req)
        {
            var NewTreasuraryCompensation = new Models.TreasuraryInsuranceCompenstaion()
            {

                PolicyNo = policy + "-Treasuary-" + req.BranchId,
                Value = req.Value,
                Data = req.Data,
                Comment = req.Comment,
            };
            await _dbContext.TreasuraryInsuranceCompenstaions.AddAsync(NewTreasuraryCompensation);
            await _dbContext.SaveChangesAsync();
        }

        public async Task<bool> CheckTreasuraryID(TreasuraryCompenstaionViewModel req)
        {
            var TreasuaryPolicy = policy + "-Treasuary-" + req.BranchId;
            bool idExists = await _dbContext.Treasuaries.AnyAsync(i => i.PolicyNo == TreasuaryPolicy);

            return idExists;
        }

        public async Task<List<Models.Branch>> GetAllTreasuraryBranches()
        {
            return await _dbContext.Branches.ToListAsync();
        }

        public async Task AddHealthCompensation(HealthInsuranceCompenstaionViewModel req)
        {
            var NewHealthCompensation = new Models.HealthInsuranceCompenstaion()
            {
                PolicyNo = policy + "-Health-" + req.BranchId,
                Value = req.Value,
                Data = req.Data,
                Comment = req.Comment,
            };
            await _dbContext.HealthInsuranceCompenstaions.AddAsync(NewHealthCompensation);
            await _dbContext.SaveChangesAsync();
           
        }

        public async Task<bool> CheckHealthID(HealthInsuranceCompenstaionViewModel req)
        {
            var healthPolicy = policy + "-Health-" + req.BranchId;
            bool idExists = _dbContext.HealthInsuarances.Any(i => i.PolicyNo == healthPolicy);

            return idExists;
        }

        public async Task<List<Models.Branch>> GetAllHealthBranches()
        {
            return await _dbContext.Branches.ToListAsync();
        }

        //Building
        public async Task AddBuildingCompensation(BuildiingInsuranceCompenstaionViewModel req)
        {
            var NewBuildingCompensation = new Models.BuildiingInsuranceCompenstaion()
            {
                PolicyNo = policy + "-Building-" + req.BranchId,
                Value = req.Value,
                Data = req.Data,
                Comment = req.Comment,
            };
            await _dbContext.BuildiingInsuranceCompenstaions.AddAsync(NewBuildingCompensation);
            await _dbContext.SaveChangesAsync();
           
        }

        public async Task<bool> CheckBuildingID(BuildiingInsuranceCompenstaionViewModel req)
        {
            var buildingPolicy = policy + "-Building-" + req.BranchId;
            bool idExists = _dbContext.BuildingInsuarances.Any(i => i.PolicyNo == buildingPolicy);

            return idExists;
        }

        public async Task<List<Models.Branch>> GetAllBuildingBranches()
        {
            return await _dbContext.Branches.ToListAsync();
        }


        //Banking
        public async Task AddBankingCompensation(BankingInsuranceCompenstaionViewModel req)
        {
           var NewBankingCompensation = new Models.BankingInsuaranceCompenstaion()
           {
                PolicyNo = policy + "-Banking-" + req.BranchId,
                Value = req.Value,
                Data = req.Data,
                Comment = req.Comment,
            };
            await _dbContext.BankingInsuaranceCompenstaions.AddAsync(NewBankingCompensation);
            await _dbContext.SaveChangesAsync();
            
        }

        public async  Task<bool> CheckBankingID(BankingInsuranceCompenstaionViewModel req)
        {
            var bankingPolicy = policy + "-Banking-" + req.BranchId;
            bool idExists = _dbContext.BankingInsuarances.Any(i => i.PolicyNo == bankingPolicy);

            return idExists;
        }

        public async Task<List<Models.Branch>> GetAllBankingBranches()
        {
            return await _dbContext.Branches.ToListAsync();
        }
    }
}
