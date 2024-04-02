using Bank_Insurance.Repository.Abiprerana;
using Bank_Insurance.ViewModel;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Bank_Insurance.Controllers
{
    [Authorize]
    public class AbipreranaController : Controller
    {
        private readonly IAbipreranaRepository _abipreranaRepository;
        public AbipreranaController(IAbipreranaRepository parithoshithaRepository)
        {
            _abipreranaRepository = parithoshithaRepository;
        }


        //Divi
        [HttpGet]
        public async Task<IActionResult> AddDivisaranaAbiprerana()
        {
            var branches = await _abipreranaRepository.GetAllDiviBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId", "Branch_name");
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> AddDivisaranaAbiprerana(AbipreranaViewModel req)
        {
            await _abipreranaRepository.AddDivisaranaAbiprerana(req);
            return RedirectToAction("AddDivisaranaAbiprerana", "Abiprerana");
        }

        public async Task<IActionResult>  DivisaranaAbipreranaView(string Id)
        {

            var branches = await _abipreranaRepository.GetAllDiviBranches();
            ViewBag.Branchs = new SelectList(branches, "BranchId", "Branch_name");

            var Branch = await _abipreranaRepository.GetDivisaranaAbipreranaPaymentList(Id);

            var viewModel = new CompositeOtherViewModel
            {
                CollectionModelAbiprerana = Branch
            };

            return View(viewModel);
            
        }

        [HttpPost]
        public async Task<IActionResult> DivisaranaAbipreranaView(CompositeOtherViewModel req)
        {
            AbipreranaViewModel data = req.Abiprerana;
            var Branchid = data.BranchId;


            return RedirectToAction("DivisaranaAbipreranaView", new { Id = Branchid });

            
        }

    }
}
