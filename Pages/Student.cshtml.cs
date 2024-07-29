using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Test3.model;

namespace Test3.Pages
{
    public class StudentModel : PageModel
    {
        static List<Std> s = new List<Std>();
        public List<Std> List
        {
            get { return s; }
        }
        public void OnGet()
        {
        }
        [BindProperty]
        public Std student { get; set; }
        public IActionResult OnPost()
        {
            s.Add(student);
            return RedirectToPage("Student");
        }
    }
}
