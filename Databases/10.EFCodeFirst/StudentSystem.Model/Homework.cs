namespace StudentSystem.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    public class Homework
    {
        public int HomeworkId { get; set; }
        
        [MaxLength(150)]
        public string Content { get; set; }

        public DateTime TimeSent { get; set; }

        public virtual Course Course { get; set; }
    }
}
