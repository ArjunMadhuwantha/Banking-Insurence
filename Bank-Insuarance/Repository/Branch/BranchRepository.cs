using Bank_Insurance.Data;
using Bank_Insurance.Models;
using Bank_Insurance.ViewModel;
using Microsoft.CodeAnalysis.Operations;
using Microsoft.EntityFrameworkCore;
using System.Net;
using System.Security.Policy;

namespace Bank_Insurance.Repository.Branch
{
    public class BranchRepository : IbranchRepository
    {
        private readonly ApplicationDbContext _dbContext;

        public BranchRepository(ApplicationDbContext dbContext) { _dbContext = dbContext; }


        public async Task AddAsync(BranchViewModel branch)
        {
            var newBranch = new Models.Branch()
            {
                BranchId = branch.BranchId,
                Branch_name = branch.Branch_name,
                Address = branch.Address,
                TpNo = branch.TpNo,
                City = branch.City,
                ZoneId = branch.ZoneId,
            };

            await _dbContext.Branches.AddAsync(newBranch);
            await _dbContext.SaveChangesAsync();

            //throw new NotImplementedException();
        }

        public async Task<List<BranchViewModel>> GetAllAsync()
        {
            var branchs = await _dbContext.Branches.ToListAsync();
            List<BranchViewModel> branchViewModels = new List<BranchViewModel>();

            foreach (var branch in branchs)
            {
                var branchViewModel = new BranchViewModel
                {
                    BranchId = branch.BranchId,
                    Branch_name = branch.Branch_name,
                    Address = branch.Address,
                    TpNo = branch.TpNo,
                    City = branch.City,
                    ZoneId = branch.ZoneId,
                };

                branchViewModels.Add(branchViewModel);
            }

            return branchViewModels;
        }

        public async Task<List<Models.Zone>> GetAllZones()
        {
            return await _dbContext.Zones.ToListAsync();
        }

        public async Task<BranchViewModel> GetByIdAsync(string id)
        {
            var branch = await _dbContext.Branches.FindAsync(id);
            var branchViewModel = new BranchViewModel
            {
                BranchId = branch.BranchId,
                Branch_name = branch.Branch_name,
                Address = branch.Address,
                TpNo = branch.TpNo,
                City = branch.City,
                ZoneId = branch.ZoneId,
            };
            return branchViewModel;
        }

        public async Task<BranchViewModel> SelectZone(string zId)
        {
            var branch = await _dbContext.Branches.FindAsync(zId);
            var branchViewModel = new BranchViewModel();
            return branchViewModel;
        }

        public async Task UpdateAsync(BranchViewModel branchupdate)
        {
            var branch = await _dbContext.Branches.FindAsync(branchupdate.BranchId);

            branch.BranchId = branchupdate.BranchId;
            branch.Branch_name = branchupdate.Branch_name;
            branch.Address = branchupdate.Address;
            branch.TpNo = branchupdate.TpNo;
            branch.City = branchupdate.City;
            branch.ZoneId = branchupdate.ZoneId;


            _dbContext.Branches.Update(branch);
            await _dbContext.SaveChangesAsync();
        }
    }
}
