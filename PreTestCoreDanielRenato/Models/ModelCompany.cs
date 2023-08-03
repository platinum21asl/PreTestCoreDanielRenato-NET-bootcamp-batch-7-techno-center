using System.ComponentModel.DataAnnotations;

namespace PreTestCoreDanielRenato.Models
{
    public class ModelCompany
    {
        [Required]
        public string? Name { get; set; }


        [Required]
        public string? Address { get; set; }


        [Required]
        public string? Email { get; set; }

        public string? Telephone { get; set; }

        public int? Flag { get; set; }

        [Required]
        public int? IDUser { get; set; }

        [Required]

        public DateTime Date { get; set; } = DateTime.Now;
    }
}
