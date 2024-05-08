using Bank_Insurance.Repository.Loan;
using Bank_Insurance.ViewModel;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace Bank_Insurance.Controllers
{
    //[Authorize]
    public class LoanController : Controller
    {
        private readonly ILoanRepository _loanRepository;

        public LoanController(ILoanRepository loanRepository)
        {
            _loanRepository = loanRepository;
        }

        // Loan
        public async Task<IActionResult> AddLoanInsurance()
        {
            var branches = await _loanRepository.GetAllBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId", "Branch_name");
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> AddLoanInsurance(LoanViewModel model)
        {

            bool IdcheckBranch = await _loanRepository.CheckBranchInsuaranceID(model);
            bool IdcheckCustomer = await _loanRepository.CheckCustomerID(model);

            if (IdcheckBranch == false)
            {
                await _loanRepository.AddBranchToInsuranceLoan(model);
                await _loanRepository.AddLoanInsurance(model);
                await _loanRepository.AddPaymentLoan(model);
            }
            else if (IdcheckCustomer == false)
            {
                await _loanRepository.AddLoanInsurance(model);
                await _loanRepository.AddPaymentLoan(model);
            }
            else
            {
                await _loanRepository.AddPaymentLoan(model);
            }

            return RedirectToAction("AddLoanInsurance", "Loan");
        }






        //House
        public async Task<IActionResult> AddHouseLoanInsurance()
        {
            var branches = await _loanRepository.GetAllBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId", "Branch_name");
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> AddHouseLoanInsurance(LoanViewModel house)
        {

            bool IdcheckBranch = await _loanRepository.CheckBranchInsuaranceIDHouse(house);
            bool IdcheckCustomer = await _loanRepository.CheckCustomerIDHouse(house);

            if (IdcheckBranch == false)
            {
                await _loanRepository.AddBranchToInsuranceHouse(house);
                await _loanRepository.AddHosueLoanInsurance(house);
                await _loanRepository.AddPaymentHouseLoan(house);
            }
            else if (IdcheckCustomer == false)
            {
                await _loanRepository.AddHosueLoanInsurance(house);
                await _loanRepository.AddPaymentHouseLoan(house);
            }
            else
            {
                await _loanRepository.AddPaymentHouseLoan(house); ;
            }

            return RedirectToAction("AddHouseLoanInsurance", "Loan");
        }

        public async Task<IActionResult> HouseLoanCompentionce()
        {
            var branches = await _loanRepository.GetAllBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId", "Branch_name");

            var Members = await _loanRepository.GetAllLoanMembers();
            ViewBag.Member = new SelectList(Members, "CustomerPolicyNo", "CustomerName");
            return View();
        }




        [HttpPost]
        public async Task<IActionResult> HouseLoanCompentionce(LoanViewModel compensation)
        {
            await _loanRepository.AddLoanCompensation(compensation);
            return RedirectToAction("HouseLoanCompentionce", "Loan");
        }
        public async Task<IActionResult> LoanCompentionce()
        {
            var branches = await _loanRepository.GetAllBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId", "Branch_name");

            var Members = await _loanRepository.GetAllLoanMembers();
            ViewBag.Member = new SelectList(Members, "CustomerPolicyNo", "CustomerName");
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> LoanCompentionce(LoanViewModel compensation)
        {
            await _loanRepository.AddLoanCompensation(compensation);
            return RedirectToAction("LoanCompentionce", "Loan");
        }

        public IActionResult LoanHome()
        {
            return View();
        }
    }
}
