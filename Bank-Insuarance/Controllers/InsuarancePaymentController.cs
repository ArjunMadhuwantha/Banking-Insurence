using Bank_Insurance.Models;
using Bank_Insurance.Repository.InsuarancePayment;
using Bank_Insurance.ViewModel;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Bank_Insurance.Controllers
{
    [Authorize]
    public class InsuarancePaymentController : Controller
    {
        private readonly IinsuarancePaymentRepository _paymentrepository;

        public InsuarancePaymentController(IinsuarancePaymentRepository paymentrepository)
        {
            _paymentrepository = paymentrepository;
        }

        public async Task<IActionResult> Add()
        {
            var branches = await _paymentrepository.GetAllBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId","Branch_name");
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Add(InsuarancePaymentViewModel model)
        {

            
            bool idExists = await _paymentrepository.CheckID(model);
            
            if(idExists == false)
            {
                await _paymentrepository.AddInsuarance(model);
                await _paymentrepository.AddAsync(model);
            }
            else
            {
                await _paymentrepository.AddAsync(model);
            }
            
            return RedirectToAction("Add", "InsuarancePayment");
        }


        public async Task<IActionResult> Treasurayes(string branchId)
        {
            var branches = await _paymentrepository.GetAllBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId", "Branch_name");

            var treasuries = await _paymentrepository.GetAllTreasharyList(branchId);
            var viewModel = new CompositeInsurancePaymentViewModel
            {
                CollectionModel = treasuries 
            };
            return View(viewModel);
        }


        [HttpPost]
        public async Task<IActionResult> Treasurayes(CompositeInsurancePaymentViewModel model)
        {
            

            InsuarancePaymentViewModel insurancePayment = model.InsuarancePaymentViewModel;
            var bid = insurancePayment.BranchId;
            try
            {
                bool treasuaryExists = await _paymentrepository.CheakTrasuary(insurancePayment);

                if (!treasuaryExists)
                {
                    await _paymentrepository.AddTreasuaryInsuarance(insurancePayment);
                    await _paymentrepository.AddTreasurayName(insurancePayment);
                }
                else
                {
                    await _paymentrepository.AddTreasurayName(insurancePayment);
                }


            }
            catch (Exception ex)
            {

                return RedirectToAction("Error", "Home");
            }

            return RedirectToAction("Treasurayes", new { branchId = bid });
        }


        
    }
}
