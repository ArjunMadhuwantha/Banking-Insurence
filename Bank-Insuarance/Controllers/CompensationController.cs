using Bank_Insurance.Repository.Compensation;
using Bank_Insurance.ViewModel;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Bank_Insurance.Controllers
{
    [Authorize]
    public class CompensationController : Controller
    {
        private readonly ICompensationRepository _compensationRepository;

        public CompensationController(ICompensationRepository compensationRepository)
        {
            _compensationRepository = compensationRepository;
        }

        //Saving
        [HttpGet]
        public async Task<IActionResult> AddSavingReilef()
        {
            var branches = await _compensationRepository.GetAllBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId", "Branch_name");
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> AddSavingReilef(SavingCompenstaionViewModel req)
        {
            //await _compensationRepository.AddSavingCompensation(req);
            bool CheckSavingpolicy = await _compensationRepository.CheckID(req);

            if (CheckSavingpolicy == true)
            {
                await _compensationRepository.AddSavingCompensation(req);
            }

            return RedirectToAction("AddSavingReilef", "Compensation");
        }

        public async Task<IActionResult> BranchSelect()
        {
            var branches = await _compensationRepository.GetAllBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId", "Branch_name");
            return View();
        }

        


        //Treasurary
        [HttpGet]
        public async Task<IActionResult> AddTreasuraryCompensation()
        {
            var branches = await _compensationRepository.GetAllTreasuraryBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId", "Branch_name");
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> AddTreasuraryCompensation(TreasuraryCompenstaionViewModel req)
        {
            
            bool CheckTreasurarypolicy = await _compensationRepository.CheckTreasuraryID(req);

            if (CheckTreasurarypolicy == true)
            {
                await _compensationRepository.AddTreasuraryCompensation(req);
            }

            return RedirectToAction("AddTreasuraryCompensation", "Compensation");
        }


        //Health
        [HttpGet]
        public async Task<IActionResult> AddHealthCompensation()
        {
            var branches = await _compensationRepository.GetAllHealthBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId", "Branch_name");
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> AddHealthCompensation(HealthInsuranceCompenstaionViewModel req)
        {
           
            bool CheckHealthpolicy = await _compensationRepository.CheckHealthID(req);

            if (CheckHealthpolicy == true)
            {
                await _compensationRepository.AddHealthCompensation(req);
            }

            return RedirectToAction("AddHealthCompensation", "Compensation");
        }

        //Building
        [HttpGet]
        public async Task<IActionResult> AddBuildingCompensation()
        {
            var branches = await _compensationRepository.GetAllBuildingBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId", "Branch_name");
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> AddBuildingCompensation(BuildiingInsuranceCompenstaionViewModel req)
        {
            
            bool CheckBuildingpolicy = await _compensationRepository.CheckBuildingID(req);

            if (CheckBuildingpolicy == true)
            {
                await _compensationRepository.AddBuildingCompensation(req);
            }

            return RedirectToAction("AddBuildingCompensation", "Compensation");
        }

        //Banking
        [HttpGet]
        public async Task<IActionResult> AddBankingCompensation()
        {
            var branches = await _compensationRepository.GetAllBankingBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId", "Branch_name");
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> AddBankingCompensation(BankingInsuranceCompenstaionViewModel req)
        {
            
            bool CheckBankingpolicy = await _compensationRepository.CheckBankingID(req);

            if (CheckBankingpolicy == true)
            {
                await _compensationRepository.AddBankingCompensation(req);
            }

            return RedirectToAction("AddBankingCompensation", "Compensation");
        }
    }
}
