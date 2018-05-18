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
            if (!IsPostBack)
            {

                if (Request.Cookies["userid"] != null)

                    txtbxuname.Text = Request.Cookies["userid"].Value;

                if (Request.Cookies["pwd"] != null)

                    txtbxpwd.Attributes.Add("value", Request.Cookies["pwd"].Value);
                if (Request.Cookies["userid"] != null && Request.Cookies["pwd"] != null)
                    remeberChk.Checked = true;
            } 
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
                string name =txtbxuname.Text.Trim();
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

        protected void btnok_Click1(object sender, EventArgs e)
        {


            if (remeberChk.Checked == true)
            {
                Response.Cookies["userid"].Value = txtbxuname.Text;
                Response.Cookies["pwd"].Value = txtbxpwd.Text;
                Response.Cookies["userid"].Expires = DateTime.Now.AddMonths(2); 
                Response.Cookies["pwd"].Expires = DateTime.Now.AddMonths(2);
            }

            else
            {

                Response.Cookies["userid"].Expires = DateTime.Now.AddDays(-1);

                Response.Cookies["pwd"].Expires = DateTime.Now.AddDays(-1);

            }

            string strconnection = ConfigurationManager.ConnectionStrings["AccessConnectionString"].ToString();
            OleDbConnection connection = new OleDbConnection();

            connection.ConnectionString = strconnection.ToString();
            connection.Open();
            OleDbCommand command = new OleDbCommand();
            command.Connection = connection;
            command.CommandText = "select * from Login where ID='" + txtbxuname.Text + "'and Password='" + txtbxpwd.Text + "'";
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
                Response.Redirect("Timesheet2.aspx");
            }
            else
            {
                lblerror.Text = "Wrong username or password";
            }
            connection.Close();
        }
    }
}