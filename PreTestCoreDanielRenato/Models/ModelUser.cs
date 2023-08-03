using System.ComponentModel.DataAnnotations;

namespace PreTestCoreDanielRenato.Models
{
    public class ModelUser
    {
        [Required]
        public int? IDCompany { get; set; }
        [Required]
        public int? IDPosition { get; set; }

        [Required]
        public string? Name { get; set; }

        public string? Address { get; set; }

        public string? Telephone { get; set; }

        [Required]
        public string? Email { get; set; }

        [Required]
        public string? Username { get; set; }

        [Required]
        public string? Password { get; set; }

        [Required]
        public string? Role { get; set; }



        public int? Flag { get; set; }

        [Required]
        public int? IDUser { get; set; }

        [Required]
        public DateTime Date { get; set; } = DateTime.Now;
    }
}
