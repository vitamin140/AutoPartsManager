using System.Data;
using MySql.Data.MySqlClient;

namespace AutoPartsManager;

public partial class Form1 : Form
{
    private readonly string connString = "server=localhost;port=3306;database=AutoPartsStore;user=root;password=;";

    public Form1()
    {
        InitializeComponent();
        InitializeQueryList();
    }

    private void InitializeQueryList()
    {
        comboBoxQueries.Items.AddRange(new object[] {
            "1. Список всіх запчастин (Простий)",
            "2. Каталог товарів (JOIN 3 таблиць)",
            "3. Кількість товарів за категоріями (GROUP BY)",
            "4. Загальна вартість складу (SUM + JOIN)",
            "5. Топ-5 клієнтів за витратами (SUM + JOIN + GROUP BY)",
            "6. Найдорожча запчастина кожного бренду (MAX + GROUP BY)",
            "7. Замовлення за останній тиждень (WHERE + DATE)",
            "8. Бренди з асортиментом понад 5 товарів (HAVING)"
        });
        comboBoxQueries.SelectedIndex = 0;
    }

    private void btnExecute_Click(object sender, EventArgs e)
    {
        string sql = GetSelectedSql(comboBoxQueries.SelectedIndex);
        ExecuteQuery(sql);
    }

    private string GetSelectedSql(int index)
    {
        return index switch
        {
            0 => "SELECT * FROM Parts ORDER BY Price DESC;",
            
            1 => @"SELECT p.PartNumber, p.Name, c.Name as Category, m.BrandName, p.Price 
                   FROM Parts p 
                   JOIN Categories c ON p.CategoryID = c.ID 
                   JOIN Manufacturers m ON p.ManufacturerID = m.ID;",
            
            2 => @"SELECT c.Name as Category, COUNT(p.ID) as TotalParts 
                   FROM Categories c 
                   LEFT JOIN Parts p ON c.ID = p.CategoryID 
                   GROUP BY c.Name;",
            
            3 => @"SELECT SUM(p.Price * s.Quantity) as TotalStockValue 
                   FROM Parts p 
                   JOIN Stock s ON p.ID = s.PartID;",
            
            4 => @"SELECT cust.FullName, SUM(od.Quantity * od.PriceAtSale) as MoneySpent 
                   FROM Customers cust 
                   JOIN Orders o ON cust.ID = o.CustomerID 
                   JOIN Order_Details od ON o.ID = od.OrderID 
                   GROUP BY cust.ID 
                   ORDER BY MoneySpent DESC LIMIT 5;",
            
            5 => @"SELECT m.BrandName, MAX(p.Price) as MostExpensive 
                   FROM Manufacturers m 
                   JOIN Parts p ON m.ID = p.ManufacturerID 
                   GROUP BY m.BrandName;",
            
            6 => "SELECT * FROM Orders WHERE OrderDate >= DATE_SUB(NOW(), INTERVAL 7 DAY);",
            
            7 => @"SELECT m.BrandName, COUNT(p.ID) as PartCount 
                   FROM Manufacturers m 
                   JOIN Parts p ON m.ID = p.ManufacturerID 
                   GROUP BY m.BrandName 
                   HAVING PartCount > 5;",
            
            _ => "SELECT * FROM Parts;"
        };
    }

    private void ExecuteQuery(string sql)
    {
        using (MySqlConnection conn = new MySqlConnection(connString))
        {
            try
            {
                conn.Open();
                MySqlDataAdapter adapter = new MySqlDataAdapter(sql, conn);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                dataGridView1.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Помилка при виконанні запиту:\n{ex.Message}", 
                                "Помилка БД", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}