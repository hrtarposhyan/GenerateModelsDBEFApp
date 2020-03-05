using GenerateModelsDBEFApp.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenerateModelsDBEFApp
{
    class Program
    {
        static void Main(string[] args)
        {
            SchoolEntities db = new SchoolEntities();
            //db.Students.Print("Mariam");


            Dictionary<string, List<Student>> res1 = db.Students
                .Where(p => p.FirstName.StartsWith("L"))
                .AsEnumerable()
                .GroupBy(p => p.FirstName)
                .ToDictionary(p => p.Key, p => p.ToList());

            Console.ReadLine();
        }
        
        //static void PrintStudents(IQueryable<Student> query)
        //{
        //    foreach (var item in query)
        //    {
        //        Console.WriteLine(item.Name);
        //    }
        //}

    }
    //static class Ex
    //{
    //    public static void Print(this IEnumerable<Student> query, string firstName)
    //    {
    //        foreach (var item in query.Where(p => p.FirstName == firstName))
    //        {
    //            Console.WriteLine(item.FullName);
    //        }
    //    }
    //}
}
