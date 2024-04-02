using Bank_Insurance.Repository.Compensation;
using Bank_Insurance.Repository.Parithoshitha;
using Bank_Insurance.ViewModel;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Bank_Insurance.Controllers
{
    [Authorize]
    public class ParithoshithaController : Controller
    {
        private readonly IParithoshithaRepository _ParithoshithaRepository;
        public ParithoshithaController(IParithoshithaRepository parithoshithaRepository)
        {
            _ParithoshithaRepository = parithoshithaRepository;
        }


        //Divi
        [HttpGet]
        public async Task<IActionResult> AddDivisaranaParithoshitha()
        {
            var branches = await _ParithoshithaRepository.GetAllDiviBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId", "Branch_name");
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> AddDivisaranaParithoshitha(ParithoshithaViewModel req)
        {
            await _ParithoshithaRepository.AddDivisaranaParithoshitha(req);
            return RedirectToAction("AddDivisaranaParithoshitha", "Parithoshitha");
        }

        //Seving
        [HttpGet]
        public async Task<IActionResult> AddSavingReliefParithoshitha()
        {
            var branches = await _ParithoshithaRepository.GetAllSavingBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId", "Branch_name");
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> AddSavingReliefParithoshitha(ParithoshithaViewModel req)
        {
            await _ParithoshithaRepository.AddSavingReliefParithoshitha(req);
            return RedirectToAction("AddSavingReliefParithoshitha", "Parithoshitha");
        }


        public async Task<IActionResult> DivisaranaParithoshithaView(string Id)
        {
            var branches = await _ParithoshithaRepository.GetAllSavingBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId", "Branch_name");

            var Branch = await _ParithoshithaRepository.GetDivisaranaParithoshithaPaymentList(Id);

            var viewModel = new CompositeOtherViewModel
            {
                CollectionModelParithoshitha = Branch
            };

            return View(viewModel);
        }

        [HttpPost]
        public async Task<IActionResult> DivisaranaParithoshithaView(CompositeOtherViewModel req)
        {
            

            ParithoshithaViewModel data = req.Parithoshitha;

            var Branchid = data.BranchId;


            return RedirectToAction("DivisaranaParithoshithaView", new { Id = Branchid });
        }
        public async Task<IActionResult> SavingReliefParithoshithaView(string Id)
        {
            var branches = await _ParithoshithaRepository.GetAllSavingBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId", "Branch_name");

            var Branch = await _ParithoshithaRepository.GetSavingReliefParithoshithaPaymentList(Id);

            var viewModel = new CompositeOtherViewModel
            {
                CollectionModelParithoshitha = Branch
            };

            return View(viewModel);
        }

        [HttpPost]
        public async Task<IActionResult> SavingReliefParithoshithaView(CompositeOtherViewModel req)
        {
            ParithoshithaViewModel data = req.Parithoshitha;

            var Branchid = data.BranchId;


            return RedirectToAction("SavingReliefParithoshithaView", new { Id = Branchid });
        }
    }
}
