using Bank_Insurance.Models;
using Bank_Insurance.Repository.Zone;
using Bank_Insurance.ViewModel;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Bank_Insurance.Controllers
{
    [Authorize]
    public class ZoneController : Controller
    {
        private readonly IzoneRepository _zoneRepository;

        public ZoneController(IzoneRepository zoneRepository)
        {
            _zoneRepository = zoneRepository;
        }

        public async Task<IActionResult> Zone()
        {
            //Fetch the data from database
            var zones = await _zoneRepository.GetAllAsync();
            return View(zones);
        }


        public IActionResult AddZone()
        {
            return View();
        }


        [HttpPost]
        public async Task<IActionResult> AddZone(ZoneViewModel model)
        {

            if (!ModelState.IsValid)
            {

                return View(model);
            }

                       
            await _zoneRepository.AddAsync(model);

            
            return RedirectToAction("AddZone");
        }


        public async Task<IActionResult> EditZone(string id)
        {
            var zone = await _zoneRepository.GetByIdAsync(id);
            return View(zone);

        }

        [HttpPost]
        public async Task<IActionResult> EditZone(ZoneViewModel zone)
        {

            if (ModelState.IsValid)
            {

                await _zoneRepository.UpdateAsync(zone);


                return RedirectToAction("Zone", "Zone");
            }


            return View(zone);
        }




        //Test

    }
}
