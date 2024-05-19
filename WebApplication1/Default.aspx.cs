using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-8H46H22;Initial Catalog=Person;User ID=sa;Password=***********"))
            {
                connection.Open();

                string query = "insert into [dbo].[Person_Data] values('" + Text_Name.Text + "','" + DateTime.Parse(Text_DateBirth.Text).ToString("yyyy-MM-dd") + "'," +
                "'" + Text_Mobile.Text + "','" + Text_Email.Text + "')";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.ExecuteNonQuery();
                    connection.Close();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('successfully Inserted');", true);
                }
            }
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
       
        }
    }
}