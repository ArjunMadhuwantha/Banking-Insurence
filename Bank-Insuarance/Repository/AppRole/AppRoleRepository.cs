using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System.Data;
using System.Threading.Tasks;

namespace Bank_Insurance.Repository.AppRole
{
    public class AppRoleRepository : IAppRoleRepository<IdentityRole>
    {
        private readonly RoleManager<IdentityRole> roleManager;

        public AppRoleRepository(RoleManager<IdentityRole> roleManager)
        {
            this.roleManager = roleManager;
        }

        public async Task<IEnumerable<IdentityRole>> GetAllAsync()
        {
            return await roleManager.Roles.ToListAsync();
        }

        public async Task<IdentityRole> GetByIdAsync(string id)
        {
            return await roleManager.FindByIdAsync(id);
        }

        public async Task AddAsync(IdentityRole entity)
        {
            await roleManager.CreateAsync(entity);
        }

        public async Task UpdateAsync(IdentityRole entity)
        {
            await roleManager.UpdateAsync(entity);
        }

        
        public async Task DeleteAsync(string id)
        {

            var role = await roleManager.FindByIdAsync(id);
            if (role == null)
            {
                throw new ArgumentException($"Role with id {id} not found.");
            }
            var result=await roleManager.DeleteAsync(role);
            if (!result.Succeeded)
            {
                throw new DataException($"Error deleting role: {result.Errors.First().Description}");
            }



            
        }
    }
}
