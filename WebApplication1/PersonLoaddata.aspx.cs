using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class PersonLoaddata : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-8H46H22;Initial Catalog=Person;User ID=sa;Password=*********"))
            {
                connection.Open();

                string query = "SELECT * from [dbo].[Person_Data]";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        DataTable dataTable = new DataTable(); // Create a DataTable to hold the data
                        dataTable.Load(reader); // Load the data from the SqlDataReader into the DataTable

                        PersonDataGridView.DataSource = dataTable; // Set the DataTable as the data source
                        PersonDataGridView.DataBind();
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Create a DataTable and populate it with the GridView data
            DataTable dt = new DataTable();
            foreach (TableCell cell in PersonDataGridView.HeaderRow.Cells)
            {
                dt.Columns.Add(cell.Text);
            }
            foreach (GridViewRow row in PersonDataGridView.Rows)
            {
                DataRow dr = dt.NewRow();
                for (int i = 0; i < row.Cells.Count; i++)
                {
                    dr[i] = row.Cells[i].Text;
                }
                dt.Rows.Add(dr);
            }

            // Create a CSV file and write the DataTable content to it
            string csvPath = Server.MapPath("~/GridViewData.csv");
            using (StreamWriter sw = new StreamWriter(csvPath))
            {
                foreach (DataRow row in dt.Rows)
                {
                    sw.WriteLine(string.Join(",", row.ItemArray));
                }
            }

            // Prompt the user to download the CSV file
            Response.Clear();
            Response.ContentType = "text/csv";
            Response.AddHeader("Content-Disposition", "attachment; filename=GridViewData.csv");
            Response.WriteFile(csvPath);
            Response.Flush();
        }
    }
}