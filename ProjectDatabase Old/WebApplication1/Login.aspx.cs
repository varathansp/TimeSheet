using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Configuration;
using System.Web.Configuration;

namespace WebApplication1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void btnok_Click(object sender, EventArgs e)
        {
            string strconnection = ConfigurationManager.ConnectionStrings["AccessConnectionString"].ToString();
                OleDbConnection connection = new OleDbConnection();
                
                connection.ConnectionString = strconnection.ToString() ;
                connection.Open();
                OleDbCommand command = new OleDbCommand();
                command.Connection = connection;
                command.CommandText = "select * from Login where ID='"+txtbxuname.Text+"'and Password='"+txtbxpwd.Text+"'" ;
                OleDbDataReader reader = command.ExecuteReader();
                int count = 0;
                while (reader.Read())
                {
                    count++;
                }
                string name = txtbxuname.Text.Trim();
                Session["ID"] = name;
                if (count == 1)
                {
                    Response.Redirect("Timesheet.aspx");
                }
                else
                {
                    lblerror.Text="Wrong username and password";
                }
                connection.Close();
            }
        protected void txtbxuname_TextChanged(object sender, EventArgs e)
        {

        }
        protected void btncancel_Click(object sender, EventArgs e)
        {
            txtbxuname.Text = "";
            txtbxpwd.Text = "";
        }
        protected void txtbxpwd_TextChanged(object sender, EventArgs e)
        {

        }
    }
}