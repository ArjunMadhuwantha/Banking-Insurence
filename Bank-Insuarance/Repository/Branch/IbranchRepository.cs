using Bank_Insurance.ViewModel;

namespace Bank_Insurance.Repository.Branch
{
    public interface IbranchRepository
    {
        Task AddAsync(BranchViewModel branch);

        Task<BranchViewModel> GetByIdAsync(string id);
        Task<List<BranchViewModel>> GetAllAsync();

        Task UpdateAsync(BranchViewModel branch);

        Task<List<Models.Zone>> GetAllZones();

        Task<BranchViewModel> SelectZone(string zId);
        //Task<List<BranchViewModel>> SelectZone(string zId);
    }
}
