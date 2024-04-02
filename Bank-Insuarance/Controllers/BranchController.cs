
using Bank_Insurance.Models;
using Bank_Insurance.Repository.Branch;
using Bank_Insurance.Repository.Zone;
using Bank_Insurance.ViewModel;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Bank_Insurance.Controllers
{
    [Authorize]
    public class BranchController : Controller
    {

        private readonly IbranchRepository _branchRepository;

        public BranchController(IbranchRepository branchRepository)
        {
            _branchRepository = branchRepository;
        }

        public async Task<IActionResult> Branch()
        {
            //Fetch the data from database
            var branchs = await _branchRepository.GetAllAsync();
            return View(branchs);
        }
        public async Task<IActionResult> AddBranch()
        {
            var zones = await _branchRepository.GetAllZones();
            ViewBag.Zones = new SelectList(zones, "ZoneId", "Zone_name");
            return View();
        }

        

        [HttpPost]
        public async Task<IActionResult> AddBranch(BranchViewModel model)
        {

            if (!ModelState.IsValid)
            {
                return View(model); // Return to the form with validation errors
            }

            //Insert data to the database           
            await _branchRepository.AddAsync(model);

            // Redirect to List all department page
            return RedirectToAction("Branch", "Branch");
        }

      

        public async Task<IActionResult> EditBranch(string id)
        {
            var zones = await _branchRepository.GetAllZones();
            ViewBag.Zones = new SelectList(zones, "ZoneId", "Zone_name");
            var zone = await _branchRepository.GetByIdAsync(id);
            return View(zone);
            
        }

        [HttpPost]
        public async Task<IActionResult> EditBranch(BranchViewModel branch)
        {

            if (ModelState.IsValid)
            {
                //Update the database with modified details
                await _branchRepository.UpdateAsync(branch);

                // Redirect to List all department page
                return RedirectToAction("Index", "Branch");
            }

            return View(branch);
        }

        


       
    }
}
