using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace lab3_4
{
    class Date
    {
        protected int year;
        protected int month;
        protected int day;
        protected int hour;
        protected int minute;
        public Date()
        {
            this.year = 1970;
            this.month = 01;
            this.day = 01;
            this.hour = 00;
            this.minute = 00;
        }
        public Date(int year, int month, int day, int hour, int minute)
        {
            this.year = year;
            this.month = month;
            this.day = day;
            this.hour = hour;
            this.minute = minute;
        }
        public Date(int[] dateArray)
        {
            this.year = dateArray[0];
            this.month = dateArray[1];
            this.day = dateArray[2];
            this.hour = dateArray[3];
            this.minute = dateArray[4];
        }
        public string Convert()
        {
            return this.year + "-" + this.month.ToString("D2") + "-" + this.day.ToString("D2") + " " + this.hour.ToString("D2") + ":" + this.minute.ToString("D2");
        }
        public int Year
        {
            get => this.year;
            set => this.year = value;
        }
        public int Month
        {
            get => this.month;
            set => this.month = value;
        }
        public int Day
        {
            get => this.day;
            set => this.day = value;
        }
        public int Hour
        {
            get => this.hour;
            set => this.hour = value;
        }
        public int Minute
        {
            get => this.minute;
            set => this.minute = value;
        }
        
    }

    class Program
    {
        int password = 1111;
        static Date Keyboard()
        {
            int[] firstdate = new int[5];
            Console.WriteLine("\t## Time: ##");
            Console.WriteLine("Year:");
            firstdate[0] = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Mounth:");
            firstdate[1] = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Day:");
            firstdate[2] = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Hours:");
            firstdate[3] = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Minutes:");
            firstdate[4] = Convert.ToInt32(Console.ReadLine());
            Date date1 = new Date(firstdate);
            return date1;
        }
        public static void Main(string[] args)
        {
            Date DateInfo = Keyboard();
            Options(ref DateInfo);
        }
        public static void HidenDate()
        {
            string hidenfile = File.ReadAllText(@"D:\source\repos\lab3_4\hidendate.txt");
            int[] nums = hidenfile
                .Split(new char[] { ' ', ',' }, StringSplitOptions.RemoveEmptyEntries)
                .Select(n => int.Parse(n))
                .ToArray();

            Date kek = new Date(nums);
            string passfile = File.ReadAllText(@"D:\source\repos\lab3_4\pass.txt");
            int[] pass = passfile
                .Split(new char[] { ' ', ',' }, StringSplitOptions.RemoveEmptyEntries)
                .Select(n => int.Parse(n))
                .ToArray();
            int temp_pass;
            bool access = true;
            while (access)
            {
                Console.WriteLine("Enter password:");
                temp_pass = Convert.ToInt32(Console.ReadLine());
                if (pass[0] == temp_pass)
                {
                    access = false;
                } else
                {
                    Console.WriteLine("Incorrect password! Try again!");
                }
            }
            Console.WriteLine(kek.Convert());
            /*int[] hidenDate = new int[5];
            bool pass = true;
            int temp_pass;
            if (password == 1111)
            {
                Console.WriteLine("\t## Time: ##");
                Console.WriteLine("Year:");
                hidenDate[0] = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Mounth:");
                hidenDate[1] = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Day:");
                hidenDate[2] = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Hours:");
                hidenDate[3] = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Minutes:");
                hidenDate[4] = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Enter password:");
                password = Convert.ToInt32(Console.ReadLine());
            }
            Date hiden = new Date(hidenDate);
            while (pass)
            {
                Console.WriteLine("Enter password:");
                temp_pass = Convert.ToInt32(Console.ReadLine());
                if (password == temp_pass)
                {
                    pass = false;
                }
            }
            Console.WriteLine(hiden.Convert());*/
        }
        static void Options(ref Date date1)
        {
            DateTime thisDay = DateTime.Now;
            bool run = true;
            char command;
            Console.WriteLine("Online information.");
            while (run == true)
            {
                Console.WriteLine("############################################");
                Console.WriteLine("Enter command:");
                Console.WriteLine("\t1 - Print date from file");
                Console.WriteLine("\t2 - Print hiden date");
                Console.WriteLine("\t3 - current time");
                Console.WriteLine("\t4 - Your date");
                Console.WriteLine("\t5 - Exit");
                Console.WriteLine("############################################");
                Console.WriteLine("\n\n Command: ");
                command = Console.ReadKey().KeyChar;
                Console.WriteLine();
                switch (Char.ToUpper(command))
                {
                    case '1':
                        ReadDate();
                        break;
                    case '2':
                        Program.HidenDate();
                        break;
                    case '3':
                        Console.WriteLine("\n\n" + thisDay.ToString() + "\n\n");
                        break;
                    case '4':
                        Console.WriteLine(date1.Convert());
                        break;
                    case '5':
                        run = false;
                        Console.WriteLine("Good luck!");
                        break;
                    default:
                        Console.WriteLine("Command is incorrect.");
                        break;
                }
                Console.WriteLine(" ###   Press Enter to continue programm   ###");
                Console.ReadLine();
            }
        }
        public static void ReadDate()
        {
            string file = File.ReadAllText(@"D:\source\repos\lab3_4\date.txt");
            int[] nums = file
                .Split(new char[] { ' ', ',' }, StringSplitOptions.RemoveEmptyEntries)
                .Select(n => int.Parse(n))
                .ToArray();

            Date mem = new Date(nums);
            Console.WriteLine(mem.Convert());
        }
        
    }
}