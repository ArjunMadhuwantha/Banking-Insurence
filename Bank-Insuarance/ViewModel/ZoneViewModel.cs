using System.ComponentModel.DataAnnotations;

namespace Bank_Insurance.ViewModel
{
    public class ZoneViewModel
    {
        [Required(ErrorMessage = "Zone ID is required.")]
        public string? ZoneId { get; set; }


        public string? Zone_name { get; set; }

        public string? Status { get; set; }
    }
}
