using System;
using System.Linq;
namespace lab_3_2
{
    class Flight
    {
        protected string startCity;
        protected string endCity;
        protected Date startDate;
        protected Date endDate;
        public Flight()
        {
            this.startCity = "None";
            this.endCity = "None";
            this.startDate = new Date();
            this.endDate = new Date();
        }
        public Flight(string startCity, string endCity, Date startDate, Date endDate)
        {
            this.startCity = startCity;
            this.endCity = endCity;
            this.startDate = startDate;
            this.endDate = endDate;
            if (findTotalTime() <= 0)
            {
                Console.WriteLine("");
            }
        }
        public int findTotalTime()
        {
            return (endDate.Year - startDate.Year) * 525600 + (endDate.Month - startDate.Month) * 43200 + (endDate.Day - startDate.Day) * 1440 + (endDate.Hour - startDate.Hour) * 60 + (endDate.Minute - startDate.Minute);
        }
        public bool isArrivingToday()
        {
            return (endDate.Day == startDate.Day);
        }
        public Date StartDate
        {
            get => this.startDate;
            set => this.startDate = value;
        }
        public Date EndDate
        {
            get => this.endDate;
            set => this.endDate = value;
        }
        public string StartCity
        {
            get => this.startCity;
            set => this.startCity = value;
        }
        public string EndCity
        {
            get => this.endCity;
            set => this.endCity = value;
        }
    }
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
        public long ConvertToInt()
        {
            return System.Convert.ToInt64(this.year.ToString("D4") + this.month.ToString("D2") + this.day.ToString("D2") + this.hour.ToString("D2") + this.minute.ToString("D2"));
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
        static Flight[] Keyboard(int qnt)
        {
            Flight[] flightData = new Flight[qnt];
            string firstcity, lastcity;
            int[] firstdate = new int[5], lastdate = new int[5];
            for (int i = 0; i < qnt; i++)
            {
                Console.WriteLine("\t# Information about flight: {0} #", i + 1);
                Console.WriteLine("City:");
                firstcity = Console.ReadLine();
                Console.WriteLine("\t\t## Departure time: ##");
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
                Console.WriteLine("\nDestination:");
                lastcity = Console.ReadLine();
                Console.WriteLine("\t\t# Destination time #");
                Console.WriteLine("Year:");
                lastdate[0] = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Mounth:");
                lastdate[1] = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Day:");
                lastdate[2] = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Hours:");
                lastdate[3] = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Minutes:");
                lastdate[4] = Convert.ToInt32(Console.ReadLine());
                Date date1 = new Date(firstdate);
                Date date2 = new Date(lastdate);
                flightData[i] = new Flight(firstcity, lastcity, date1, date2);
            }
            return flightData;
        }
        public static void Main(string[] args)
        {
            int quantity;
            Console.WriteLine("Enter flight numbers:");
            quantity = Convert.ToInt32(Console.ReadLine());
            Flight[] flightData = Keyboard(quantity);
            Options(ref flightData);
        }
        static void Options(ref Flight[] flightData)
        {
            bool run = true;
            int limitFlights, getFlight;
            char command;
            Console.WriteLine("Online information.");
            while (run == true)
            {
                Console.WriteLine("############################################");
                Console.WriteLine("Enter command:");
                Console.WriteLine("\t1 - Print all");
                Console.WriteLine("\t2 - max. and min. time");
                Console.WriteLine("\t3 - Specific flight information");
                Console.WriteLine("\t4 - Numbers of printed flights?");
                Console.WriteLine("\t5 - Sort by date");
                Console.WriteLine("\t6 - Sort by flight time");
                Console.WriteLine("\t7 - Exit");
                Console.WriteLine("############################################");
                Console.WriteLine("\n\n Command: ");
                command = Console.ReadKey().KeyChar;
                Console.WriteLine();
                switch (Char.ToUpper(command))
                {
                    case '1':
                        showFlights(flightData);
                        break;
                    case '2':
                        TotalTime(ref flightData);
                        break;
                    case '3':
                        Console.WriteLine("Numbers of flights:");
                        limitFlights = Convert.ToInt32(Console.ReadLine());
                        LastFlight(flightData, limitFlights);
                        break;
                    case '4':
                        Console.WriteLine("Choose flight:");
                        getFlight = Convert.ToInt32(Console.ReadLine());
                        if (getFlight > 0 && getFlight <= flightData.Length)
                        {
                            showFlight(flightData[--getFlight]); //1. record will be 0th element
                        }
                        else
                        {
                            Console.WriteLine("Error! No Data!");
                        }
                        break;
                    case '5':
                        sortingByDate(ref flightData);
                        Console.WriteLine("Sorted by date.");
                        break;
                    case '6':
                        sortingByFlightTime(ref flightData);
                        Console.WriteLine("Sorted be flight time.");
                        break;
                    case '7':
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
        static void showFlight(Flight f)
        {
            if (f.findTotalTime() <= 0)
            {
                Console.WriteLine("Error. No data about flight");
            }
            else
            {
                Console.WriteLine("Departure city: \t {0} \t {1} \nDestination: \t {2} \t {3} \nFlight time: {4} minutes", f.StartDate.Convert(), f.StartCity, f.EndDate.Convert(), f.EndCity, f.findTotalTime());
                if (f.isArrivingToday())
                {
                    Console.WriteLine("Your flight is today!");
                }
                else
                {
                    Console.WriteLine("You flight isn't today. Please, leave the program.");
                }
            }
        }
        static void showFlights(Flight[] flightData)
        {
            for (int i = 0; i < flightData.Length; i++)
            {
                Console.WriteLine("\n\t Information about flight #{0}", i + 1);
                showFlight(flightData[i]);
            }
        }
        static void sortingByDate(ref Flight[] flightData)
        {
            Array.Sort(flightData, (x, y) => y.StartDate.ConvertToInt().CompareTo(x.StartDate.ConvertToInt()));
        }
        static void sortingByFlightTime(ref Flight[] flightData)
        {
            Array.Sort(flightData, (x, y) => y.findTotalTime().CompareTo(x.findTotalTime()));
        }
        static void TotalTime(ref Flight[] flightData)
        {
            int maxFlightTime = flightData.Max(f => f.findTotalTime());
            int minFlightTime = flightData.Min(f => f.findTotalTime());
            Console.WriteLine("\n\nMax/Min. Flight time.");
            Console.WriteLine("Max flight time: {0} minutes. \nMinimum flight time: {1} minutes", maxFlightTime, minFlightTime);
        }
        static void LastFlight(Flight[] flightData, int limitFlights)
        {
            if (flightData.Length >= limitFlights)
            {
                Flight[] newFlightData = new Flight[limitFlights];
                for (int i = 0; i < limitFlights; i++)
                {
                    newFlightData[i] = flightData[i];
                }
                showFlights(newFlightData);
            }
            else
            {
                showFlights(flightData);
            }
        }
    }
}

/*using System;

class Product
{
    protected string Names;
    protected string Producer;
    protected double Price;
    protected Currency Cost;
    protected double Quantity;
    protected double Weight;
    public Product()
    {
        this.Names = "неопределенно";
        this.Producer = "неопределенно";
        this.Price = 0;
        this.Quantity = 0;
        this.Weight = 0;
        this.Cost = new Currency();

    }
    public Product(string Name, string Producer, double Price, double Quantity, double Weight, Currency exRate)
    {
        this.Name = Name;
        this.Producer = Producer;
        this.Cost = exRate;
        this.Quantity = Quantity;
        this.Weight = Weight;
    }
    public Currency Name
    {
        get => this.Name;
        set => this.Name = value;
    }
    public Currency exPrice
    {
        get => this.exPrice;
        set => this.exPrice = value;
    }
    public double GetPriceInUAH()
    {
        return (Price);
    }
    public double GetTotalPriceInUAH()
    {
        return (Price * Cost);
    }
    public double GetTotalWeight()
    {
        return (Weight * Quantity);
    }
}
class Currency
{
    protected string Name;
    protected double exRate;
    public Currency()
    {
        this.Name = "неопределенно";
        this.exRate = 0;
    }
    public Currency(string Name, double exRate)
    {
        this.Name = Name;
        this.exRate = exRate;
    }

    public static implicit operator Currency(string v)
    {
        throw new NotImplementedException();
    }
}
class Program
{
    static Product[] Keyboard(int qnt)
    {
        Product[] productData = new Product[qnt];
        string name, producer;
        double price, quantity, weight;
        for (int i = 0; i < qnt; i++)
        {
            Console.WriteLine("\t# Введите информацю о товаре: {0}", i + 1);
            Console.WriteLine("Название:");
            name = Console.ReadLine();
            Console.WriteLine("Производитель:");
            producer = Console.ReadLine();
            Console.WriteLine("Цена:");
            price = Console.ReadLine();
            Console.WriteLine("Количество");
            quantity = Console.ReadLine();
            Console.WriteLine("Вес:");
            weight = Console.ReadLine();
            productData[i] = new Product(name, producer, price, quantity, weight, Currency.exRate);
        }
        return productData;
    }
    public static void Main(string[] args)
    {
        int quantityF;
        Console.WriteLine("Сколько рейсов вы хотите создать?");
        quantityF = Convert.ToInt32(Console.ReadLine());
        Product[] productData = Keyboard(quantityF);
        Options(ref productData);
    }

    static void Options(ref Product[] productData)
    {
        bool run = true;
        int limitFlights, getFlight;
        char command;
        Console.WriteLine("Онлайн таблица данных.");
        while (run == true)
        {
            Console.WriteLine("-------------------------------------------");
            Console.WriteLine("Выберите команду;");
            Console.WriteLine("\t1 - Вывести всё");
            Console.WriteLine("\t2 - Самый дешёвый и дорогой продукт");
            Console.WriteLine("\t3 - Выберите продукт, информацию которого вы хотите получить");
            Console.WriteLine("\t4 - Отсортировать по цене");
            Console.WriteLine("\t5 - Отсортировать по количеству");
            Console.WriteLine("\t6 - Выход из программы");
            Console.WriteLine("\n\nКоманда: ");
            command = Console.ReadKey().KeyChar;
            Console.WriteLine();
            switch (Char.ToUpper(command))
            {
                case '1':
                    showProducts(productData);
                    break;
                case '2':
                    TotalProducts(ref productData);
                    break;
                case '3':
                    Console.WriteLine("Выберите продукт о котором хотите получить информацию?");
                    getFlight = Convert.ToInt32(Console.ReadLine());
                    if (getProduct > 0 && getProduct <= productData.Length)
                    {
                        showProduct(productData[--getProduct]); //1. record will be 0th element
                    }
                    else
                    {
                        Console.WriteLine("Ошибка. Данные не введены!");
                    }
                    break;
                case '4':
                    sortingByPrice(ref productData);
                    Console.WriteLine("Продукты отсортированы по цене.");
                    break;
                case '5':
                    sortingByQuantity(ref productData);
                    Console.WriteLine("Продукты отсортированы по количеству.");
                    break;
                case '6':
                    run = false;
                    Console.WriteLine("Удачи!");
                    break;
                default:
                    Console.WriteLine("Команда не существует.");
                    break;
            }
            Console.WriteLine(" -- Нажмите Enter, чтобы продолжить выполнение программы  --");
            Console.ReadLine();
        }
    }
    static void showProduct(Product f)
    {
        Console.WriteLine("Продукт: \t {0} \tПроизводитель:  {1} \nЦена: \t {2} \tКоличество на складе: {3} \nВес: {4} кг", f.Name, f.Price, f.GetPriceInUAH, f.Quantity, f.Weight);
    }
    static void showProducts(Product[] productData)
    {
        for (int i = 0; i < productData.Length; i++)
        {
            Console.WriteLine("\n\t Информация о полёте #{0}", i + 1);
            showProduct(productData[i]);
        }
    }
    static void sortingByPrice(ref Product[] productData)
    {
        Product = Pruduct.OrderBy(x => x - Math.Truncate(x)).ToList();
    }
    static void sortingByFlightTime(ref Flight[] flightData)
    {
        Array.Sort(flightData, (x, y) => y.findTotalTime().CompareTo(x.findTotalTime()));
    }
    static void TotalTime(ref Flight[] flightData)
    {
        int maxFlightTime = flightData.Max(f => f.findTotalTime());
        int minFlightTime = flightData.Min(f => f.findTotalTime());
        Console.WriteLine("\n\nМакс/Мин. время полёта");
        Console.WriteLine("Максимальное время полёта: {0} минут \nМинимальное время полёта: {1} минут", maxFlightTime, minFlightTime);
    }
    static void LastFlight(Flight[] flightData, int limitFlights)
    {
        if (flightData.Length >= limitFlights)
        {
            Flight[] newFlightData = new Flight[limitFlights];
            for (int i = 0; i < limitFlights; i++)
            {
                newFlightData[i] = flightData[i];
            }
            showFlights(newFlightData);
        }
        else
        {
            showFlights(flightData);
        }
    }
}

}*/
