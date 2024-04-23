using Bank_Insurance.Models;
using Bank_Insurance.Repository.Loan;
using Bank_Insurance.Repository.Summary;
using Bank_Insurance.ViewModel;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.CodeAnalysis.Operations;
using Newtonsoft.Json;

namespace Bank_Insurance.Controllers
{
    [Authorize]
    public class SummaryController : Controller
    {
        private readonly ISummaryRepository _summaryRepository;

        //Controller
        public SummaryController(ISummaryRepository summaryRepository)
        {
            _summaryRepository = summaryRepository;
        }
    

        //Divisarana Compesation Summary
        public async Task<IActionResult> DivisaranaSummary(string Id) 
        {
            var branches = await _summaryRepository.GetAllBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId", "Branch_name");

            
            var Member = await _summaryRepository.GetAllDivisaranaCompensationList(Id); 

            var viewModel = new CompositeSummaryViewModel
            {
                CollectionSummaryModel = Member
            };

            return View(viewModel);
            
        }
        [HttpPost]
        public async Task<IActionResult> DivisaranaSummary(CompositeSummaryViewModel search)
        {

            SummaryViewModel inputs = search.SummaryViewModel;

            var Branchid = inputs.BranchId;


            return RedirectToAction("DivisaranaSummary", new { Id = Branchid });


        }

        //DivisaranaCustomerDetails
        public async Task<IActionResult> DivisaranaCustomerDetails(string policyno)
        {
            var Members = await _summaryRepository.GetAllMembers();
            ViewBag.Member = new SelectList(Members, "CustomerPolicyNo", "Fullname");

            var CustomerDetails = await _summaryRepository.GetCustomerDeatils(policyno);
            var viewModel = new CompositeDivisaranaViewModel
            {
                CollectionModel = CustomerDetails
            };

            return View(viewModel);

        }

        [HttpPost]
        public async Task<IActionResult> DivisaranaCustomerDetails(CompositeDivisaranaViewModel search)
        {
            DivisaranaViewModel cus = search.DivisaranaViewModel;

            var Policyno = cus.CusPolicyNo;


            return RedirectToAction("DivisaranaCustomerDetails", new { policyno = Policyno });

        }
        

        public async Task<IActionResult> DivisaranUserDetails(string CusPolicyNo)
        {
            var CustomerDetails = await _summaryRepository.GetCustomerDeatils(CusPolicyNo);

            var ViewModel = new CompositeDivisaranaViewModel
            {
                CollectionModel = CustomerDetails
            };
            return View(ViewModel);
            
        }

        public async Task<IActionResult> CustomerpaymentSummary(string CusPolicyNo)
        {
            var payment = await _summaryRepository.GetCustomerPaymentDeatils(CusPolicyNo);
            var ViewModel = new CompositeDivisaranaViewModel
            {
                CollectionModel = payment
            };
            return View(ViewModel);
        }

        public async Task<IActionResult> CustomerSuccsoursSummary(string CusPolicyNo)
        {
            var Succssors = await _summaryRepository.GetCustomerSuccssoursDeatils(CusPolicyNo);
            var ViewModel = new CompositeDivisaranaViewModel
            {
                CollectionModel = Succssors
            };
            return View(ViewModel);
        }

        //Treashury Summary

        public async Task<IActionResult> TreasharySummary(string Id)
        {
            var branches = await _summaryRepository.GetAllBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId", "Branch_name");


            var Branch = await _summaryRepository.GetAllTreasharyBranchPaymentList(Id);

            var viewModel = new CompositeSummaryViewModel
            {
                CollectionSummaryModel = Branch
            };

            return View(viewModel);

        }

        [HttpPost]
        public async Task<IActionResult> TreasharySummary(CompositeSummaryViewModel search)
        {

            SummaryViewModel inputs = search.SummaryViewModel;

            var Branchid = inputs.BranchId;


            return RedirectToAction("TreasharySummary", new { Id = Branchid });


        }

        public async Task<IActionResult> TreasharyCompensationSummary(string PolicyNo)
        {
            

            var Treasuary = await _summaryRepository.GetAllTreasharyCompensationList(PolicyNo);
            var viewModel = new CompositeSummaryViewModel
            {
                CollectionSummaryModel = Treasuary
            };
            return View(viewModel);
        }

        //bank summary

        public async Task<IActionResult> BankSummary(string Id)
        {
            var branches = await _summaryRepository.GetAllBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId", "Branch_name");

            var Bank = await _summaryRepository.GetAllBankingBranchPaymentList(Id);
            var viewModel = new CompositeSummaryViewModel
            {
                CollectionSummaryModel = Bank
            };
            return View(viewModel);
        }

        [HttpPost]
        public async Task<IActionResult> BankSummary(CompositeSummaryViewModel search)
        {

            SummaryViewModel inputs = search.SummaryViewModel;

            var Branchid = inputs.BranchId;


            return RedirectToAction("BankSummary", new { Id = Branchid });


        }

        public async Task<IActionResult> BankCompensationSummary(string PolicyNo)
        {
            

            var Bank = await _summaryRepository.GetAllBankCompensationList(PolicyNo);
            var viewModel = new CompositeSummaryViewModel
            {
                CollectionSummaryModel = Bank
            };
            return View(viewModel);
        }

        //health summary

        public async Task<IActionResult> HealthSummary(string Id)
        {
            var branches = await _summaryRepository.GetAllBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId", "Branch_name");

            var Health= await _summaryRepository.GetAllHealthBranchPaymentList(Id);
            var viewModel = new CompositeSummaryViewModel
            {
                CollectionSummaryModel = Health
            };
            return View(viewModel);
        }

        [HttpPost]
        public async Task<IActionResult> HealthSummary(CompositeSummaryViewModel search)
        {

            SummaryViewModel inputs = search.SummaryViewModel;

            var Branchid = inputs.BranchId;


            return RedirectToAction("HealthSummary", new { Id = Branchid });


        }
        public async Task<IActionResult> HealthCompensationSummary(string PolicyNo)
        {


            var Health = await _summaryRepository.GetAllHealthCompensationList(PolicyNo);
            var viewModel = new CompositeSummaryViewModel
            {
                CollectionSummaryModel = Health
            };
            return View(viewModel);
        }

        //building summary

        public async Task<IActionResult> BuildingSummary(string Id)
        {
            var branches = await _summaryRepository.GetAllBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId", "Branch_name");

            var Building = await _summaryRepository.GetAllBuildingBranchPaymentList(Id);
            var viewModel = new CompositeSummaryViewModel
            {
                CollectionSummaryModel = Building
            };
            return View(viewModel);
        }

        [HttpPost]
        public async Task<IActionResult> BuildingSummary(CompositeSummaryViewModel search)
        {

            SummaryViewModel inputs = search.SummaryViewModel;

            var Branchid = inputs.BranchId;


            return RedirectToAction("BuildingSummary", new { Id = Branchid });


        }

        public async Task<IActionResult> BuildingCompensationSummary(string PolicyNo)
        {


            var Building = await _summaryRepository.GetAllBuildingCompensationList(PolicyNo);
            var viewModel = new CompositeSummaryViewModel
            {
                CollectionSummaryModel = Building
            };
            return View(viewModel);
        }

        


        //Saving relief Summary
        public async Task<IActionResult> SavingRelifSummary(string Id)
        {
            var branches = await _summaryRepository.GetAllBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId", "Branch_name");

            var Member = await _summaryRepository.GetAllSavingReliefBranchPaymentList(Id);

            var viewModel = new CompositeSummaryViewModel
            {
                CollectionSummaryModel = Member
            };

            return View(viewModel);
        }

        [HttpPost]
        public async Task<IActionResult> SavingRelifSummary(CompositeSummaryViewModel req)
        {

            SummaryViewModel inputs = req.SummaryViewModel;

            var Branchid = inputs.BranchId;
            return RedirectToAction("SavingRelifSummary", new { Id = Branchid });
        }

        public async Task<IActionResult> SavingRelifCompensationSummary(string PolicyNo)
        {


            var Member = await _summaryRepository.GetAllSavingReliefCompensationList(PolicyNo);

            var viewModel = new CompositeSummaryViewModel
            {
                CollectionSummaryModel = Member
            };

            return View(viewModel);
        }


        //Loan

        public async Task<IActionResult> LoanBranchSummary(string id, string type)
        {
            var branches = await _summaryRepository.GetAllBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId", "Branch_name");

            var customer  = await _summaryRepository.GetAllLoanBranchPaymentList(id, type);

            var viewModel = new CompositeSummaryViewModel
            {
                CollectionSummaryModel = customer
            };

            return View(viewModel);
        }

        [HttpPost]
        public async Task<IActionResult> LoanBranchSummary(CompositeSummaryViewModel req)
        {
            SummaryViewModel inputs = req.SummaryViewModel;

            var Branchid = inputs.BranchId;
            var Type = inputs.Type;

            return RedirectToAction("LoanBranchSummary", new { id = Branchid, type = Type });
        }


        public async Task<IActionResult> LoanCustomerPayment(string CusPolicyNo)
        {
            var payments  = await _summaryRepository.GetAllLoanCustomerPaymentList(CusPolicyNo);

            var viewModel = new CompositeSummaryViewModel
            {
                CollectionSummaryModel = payments
            };

            return View(viewModel);
        }


        //Loan Compensation Summary

        public async Task<IActionResult> LoanCompensationSummary(string id, string type)
        {
            var branches = await _summaryRepository.GetAllBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId", "Branch_name");

            var customer = await _summaryRepository.GetAllLoanBranchCompensationList(id, type);

            var viewModel = new CompositeSummaryViewModel
            {
                CollectionSummaryModel = customer
            };

            return View(viewModel);
        }

        [HttpPost]
        public async Task<IActionResult> LoanCompensationSummary(CompositeSummaryViewModel req)
        {
            SummaryViewModel inputs = req.SummaryViewModel;

            var Branchid = inputs.BranchId;
            var Type = inputs.Type;

            return RedirectToAction("LoanCompensationSummary", new { id = Branchid, type = Type });
        }
    }
}
