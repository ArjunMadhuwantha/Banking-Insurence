using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using System.Data;
using Bank_Insurance.Repository.AppRole;
using System.ComponentModel.DataAnnotations;

namespace Bank_Insurance.Controllers
{
    [Authorize(Roles = "Admin")]
    public class AppRoleController : Controller
    {

        private readonly RoleManager<IdentityRole> roleManager;
        private readonly IAppRoleRepository<IdentityRole> appRoleRepository;

        public AppRoleController(IAppRoleRepository<IdentityRole> appRoleRepository, RoleManager<IdentityRole> roleManager)
        {
            this.appRoleRepository = appRoleRepository;
            this.roleManager = roleManager;
        }


        [HttpGet]

        // GET: /Role
        public async Task<IActionResult> Index()
        {
            var roles = await appRoleRepository.GetAllAsync();
            return View(roles);
        }

        

        // GET: /Role/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: /Role/Create
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        
        public async Task<IActionResult> Create([Bind("Id,Name")] IdentityRole role)
        {
            if (ModelState.IsValid)
            {
                await appRoleRepository.AddAsync(role);
                return RedirectToAction(nameof(Index));
            }
            return View(role);
        }

        // GET: /Role/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var role = await appRoleRepository.GetByIdAsync(id);
            if (role == null)
            {
                return NotFound();
            }
            return View(role);
        }

        // POST: /Role/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("Id,Name")] IdentityRole role)
        {
            if (id != role.Id)
            {
                return NotFound();
            }
            if (ModelState.IsValid)
            {
                var existingRole = await appRoleRepository.GetByIdAsync(id);
                if (existingRole == null)
                {
                    return NotFound();
                }

                existingRole.Name = role.Name; // Update role properties

                try
                {
                    await appRoleRepository.UpdateAsync(existingRole);
                    return RedirectToAction(nameof(Index));
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError(string.Empty, "Error updating role: " + ex.Message);
                    return View(existingRole);
                }
            }
            return View(role);
        }



        // GET: /Role/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            var role = await appRoleRepository.GetByIdAsync(id);
            if (role == null)
            {
                return NotFound();
            }
            return View(role);
        }

        // POST: /Role/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            await appRoleRepository.DeleteAsync(id);
            return RedirectToAction(nameof(Index));
            
        }








    }


    
}

