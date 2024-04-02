using Bank_Insurance.ViewModel;

namespace Bank_Insurance.Repository.Zone
{
    public interface IzoneRepository
    {
        Task AddAsync(ZoneViewModel zone);

        Task<ZoneViewModel> GetByIdAsync(string id);
        Task<List<ZoneViewModel>> GetAllAsync();

        Task UpdateAsync(ZoneViewModel zone);
    }
}
