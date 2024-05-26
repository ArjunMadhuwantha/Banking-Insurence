
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
        private readonly ILogger<BranchController> _logger;

        public BranchController(IbranchRepository branchRepository,ILogger<BranchController> logger)
        {
            _branchRepository = branchRepository;
            _logger = logger;
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

            try
            {
                var existId = await _branchRepository.CheckBranchID(model.BranchId);
                if(existId == true)
                {
                    ModelState.AddModelError(nameof(model.BranchId), "Branch Id already exists");
                    return View(model);
                }
                else
                {
                    await _branchRepository.AddAsync(model);
                    return RedirectToAction("Branch", "Branch");
                }

            }
            catch(Exception ex)
            {
                ModelState.AddModelError("", "An error occurred while adding the branch. Please try again.");
                return View(model);
            }

            //Insert data to the database           
            //await _branchRepository.AddAsync(model);

            //// Redirect to List all department page
            //return RedirectToAction("Branch", "Branch");
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
            try
            {
                var existId = await _branchRepository.CheckBranchID(branch.BranchId);
                if (existId == true)
                {
                    ModelState.AddModelError(nameof(branch.BranchId), "Branch Id already exists");
                    return View(branch);
                }
                else
                {
                    await _branchRepository.UpdateAsync(branch);

                    
                    return RedirectToAction("Branch", "Branch");
                }

            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", "An error occurred while adding the branch. Please try again.");
                return View(branch);
            }

            
        }

        


       
    }
}
