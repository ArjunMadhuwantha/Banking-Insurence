using Bank_Insurance.Repository.Loan;
using Bank_Insurance.ViewModel;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Diagnostics.CodeAnalysis;
using System.Security.Cryptography;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace Bank_Insurance.Controllers
{
    [Authorize]
    public class DivisaranaController : Controller
    {
        private readonly ILoanRepository _loanRepository;
        public DivisaranaController(ILoanRepository loanRepository) {

            _loanRepository = loanRepository;
        }
        public IActionResult DiviSaranaHome()
        {
            return View();
        }
        public async Task<IActionResult> AddDivisarana()
        {
            var branches = await _loanRepository.GetAllBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId", "Branch_name");
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> AddDivisarana(DivisaranaViewModel model)
        {
            bool IdcheckBranch = await _loanRepository.CheckBranchInsuaranceIDDivisarana(model);
            bool IdcheckCustomer = await _loanRepository.CheckCustomerIDDivisarana(model);

           
            

            if (IdcheckBranch == false)
            {
                await _loanRepository.AddDivisaranaToInsurance(model);
                await _loanRepository.AddDivisarana(model);
                
            }
            else
            {
                await _loanRepository.AddDivisarana(model);
            }

            return RedirectToAction("AddDivisarana", "Divisarana");
            //return RedirectToAction("AddSuccssor", new { Id = Nic });
        }



        public async Task<IActionResult> AddSuccssor(string Id)
        {
            

            var succssors = await _loanRepository.GetAllSuccssorList(Id);
            var viewModel = new CompositeDivisaranaViewModel
            {
                CollectionModel = succssors
            };
            return View(viewModel);


        }


        [HttpPost]
        public async Task<IActionResult> AddSuccssor(CompositeDivisaranaViewModel model)
        {
            DivisaranaViewModel divisarana = model.DivisaranaViewModel;
            var Nic = divisarana.ID;
            try
            {
                var MemberExitis = await _loanRepository.CheakDivisaranMemeberID(divisarana);
                if (MemberExitis == false)
                {
                    RedirectToAction("AddDivisarana", "Divisarana");
                }
                else
                {
                    await _loanRepository.AddSuccssor(divisarana);
                }
            }
            catch (Exception ex)
            {
                return RedirectToAction("Error", "Home");
            }

            return RedirectToAction("AddSuccssor", new { Id = Nic });
            
        }

        


        public async Task<IActionResult> DivisaranaCompensation()
        {
            var branches = await _loanRepository.GetAllBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId", "Branch_name");

            var Members = await _loanRepository.GetAllMembers();
            ViewBag.Member = new SelectList(Members, "CustomerPolicyNo", "Fullname");
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> DivisaranaCompensation(DivisaranaViewModel compensation)
        {
            await _loanRepository.AddDivisaranaCompensation(compensation);
            return RedirectToAction("DivisaranaCompensation", "Divisarana");
        }

        public IActionResult DivisaranaParithoshitha()
        {
            return View();
        }
        public IActionResult DivisaranaAbiprerana()
        {
            return View();
        }

        public async Task<IActionResult> payment(string Id)
        
        {
            var branches = await _loanRepository.GetAllBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId", "Branch_name");

            var paymentDetails = await _loanRepository.DivisaranaPaymentDetails(Id);
            var viewModel = new CompositeDivisaranaViewModel
            {
                CollectionModel = paymentDetails
            };
            return View(viewModel);
        }

        [HttpPost]
        public async Task<IActionResult> payment(CompositeDivisaranaViewModel pay)
        {
            DivisaranaViewModel data = pay.DivisaranaViewModel;

            var Branchid = data.BranchId;


            return RedirectToAction("payment", new { Id = Branchid });
        }

        [HttpPost]
        public async Task<IActionResult> Customerpayment(CompositeDivisaranaViewModel payment)
        {
            DivisaranaViewModel value = payment.DivisaranaViewModel;
            var Branchid = value.BranchId;

            var Value = value.Paymentvalue;

            if(Value > 0)
            {
                await _loanRepository.DivisaranaPaymentUpdate(value);
            }
            


            return RedirectToAction("payment", new { Id = Branchid });
            
        }
    }
}
