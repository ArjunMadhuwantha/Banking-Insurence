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
        private readonly ILogger<ZoneController> _logger;

        public ZoneController(IzoneRepository zoneRepository, ILogger<ZoneController> logger)
        {
            _zoneRepository = zoneRepository;
            _logger = logger;
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
            try
            {
                var existId = await _zoneRepository.CheckZoneID(model.ZoneId);
                if (existId == true)
                {
                    ModelState.AddModelError(nameof(model.ZoneId), "Zone Id already exists");
                    return View(model);
                }
                else
                {
                    await _zoneRepository.AddAsync(model);
                    return RedirectToAction("AddZone");
                }

            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", "An error occurred while adding the branch. Please try again.");
                return View(model);
            }

            

                       
            
        }


        public async Task<IActionResult> EditZone(string id)
        {
            var zone = await _zoneRepository.GetByIdAsync(id);
            return View(zone);

        }

        [HttpPost]
        public async Task<IActionResult> EditZone(ZoneViewModel zone)
        {
            //try
            //{
            //    var existId = await _zoneRepository.CheckZoneID(zone.ZoneId);
            //    if (existId == true)
            //    {
            //        ModelState.AddModelError(nameof(zone.ZoneId), "Zone Id already exists");
            //        return View(zone);
            //    }
            //    else
            //    {
            //        await _zoneRepository.UpdateAsync(zone);
            //        return RedirectToAction("Zone", "Zone");
            //    }

            //}
            //catch (Exception ex)
            //{
            //    ModelState.AddModelError("", "An error occurred while adding the branch. Please try again.");
            //    return View(zone);
            //}

            try
            {
                await _zoneRepository.UpdateAsync(zone);
                return RedirectToAction("Zone", "Zone");
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", "An error occurred while adding the branch. Please try again.");
                return View(zone);
            }

        }




        //Test

    }
}
