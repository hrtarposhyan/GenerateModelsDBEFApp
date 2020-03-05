using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenerateModelsDBEFApp.Data
{
    partial class Student
    {
        public string FullName => $"{FirstName} {LastName}";

        public override string ToString() => FullName;
    }
}
