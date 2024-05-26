using Bank_Insurance.Data;
using Bank_Insurance.Models;
using Bank_Insurance.ViewModel;
using Microsoft.EntityFrameworkCore;
using System.Security.Policy;

namespace Bank_Insurance.Repository.Zone
{
    public class zoneRepository : IzoneRepository
    {
        private readonly ApplicationDbContext _dbContext;

        public zoneRepository(ApplicationDbContext dbContext) {  _dbContext = dbContext; }
        public async Task AddAsync(ZoneViewModel zone)
        {

            var newZone = new Models.Zone()
            {
                ZoneId = zone.ZoneId,
                Zone_name = zone.Zone_name,
                Status= zone.Status
            };
            await _dbContext.Zones.AddAsync(newZone);
            await _dbContext.SaveChangesAsync();
        }

        

        public async Task<List<ZoneViewModel>> GetAllAsync()
        {
            var zones = await _dbContext.Zones.ToListAsync();
            List<ZoneViewModel> zoneViewModels = new List<ZoneViewModel>();
            foreach (var zone in zones)
            {
                var zoneViewModel = new ZoneViewModel
                {
                    ZoneId = zone.ZoneId,
                    Zone_name = zone.Zone_name,
                    Status = zone.Status
                };

                zoneViewModels.Add(zoneViewModel);
            }

            return zoneViewModels;
            
        }

        public async Task<ZoneViewModel> GetByIdAsync(string id)
        {
            var zone = await _dbContext.Zones.FindAsync(id);
            var zoneViewModel = new ZoneViewModel
            {
                ZoneId = zone.ZoneId,
                Zone_name = zone.Zone_name,
                Status = zone.Status
            };
            return zoneViewModel;

             
        }

        public async Task UpdateAsync(ZoneViewModel zoneupdate)
        {
            var zone = await _dbContext.Zones.FindAsync(zoneupdate.ZoneId);

            zone.ZoneId = zoneupdate.ZoneId;
            zone.Zone_name = zoneupdate.Zone_name;
            zone.Status = zoneupdate.Status;


            _dbContext.Zones.Update(zone);
            await _dbContext.SaveChangesAsync();

            
        }

        public async Task<bool> CheckZoneID(string id)
        {
            bool idexist = await _dbContext.Zones.AnyAsync(zid => zid.ZoneId == id);
            return idexist;
        }
    }
}
