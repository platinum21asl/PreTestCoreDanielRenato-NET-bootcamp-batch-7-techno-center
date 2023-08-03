using System.ComponentModel.DataAnnotations;

namespace PreTestCoreDanielRenato.Models
{
    public class ModelDocument
    {

        [Required]
        public int? IDCompany { get; set; }
        [Required]
        public int? IDCategory { get; set; }
        [Required]
        public string? Name { get; set; }


        [Required]
        public string? Description { get; set; }


        [Required]
 

        public int? Flag { get; set; }

        [Required]
        public int? IDUser { get; set; }

        [Required]

        public DateTime Date { get; set; } = DateTime.Now;
    }
}
