using System.ComponentModel.DataAnnotations;

namespace PreTestCoreDanielRenato.Models
{
    public class ModelDocumentCategory
    {
        [Required]
        public string? Name { get; set; }

        [Required]
        public int? IDUser { get; set; }

        [Required]
        public DateTime Date { get; set; } = DateTime.Now;
    }
}
