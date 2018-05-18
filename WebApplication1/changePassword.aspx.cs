using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;

namespace WebApplication1
{
    public partial class changePassword : System.Web.UI.Page
    {
        static string strconnection = ConfigurationManager.ConnectionStrings["AccessConnectionString"].ToString();
        OleDbConnection connection = new OleDbConnection(strconnection);
        string id = "";
        string password = "";
        int i = 0;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            //if (Session["ID"] != null)
            //{
            //    id = (string)Session["ID"];
            //}
  
            //OleDbCommand cmd = new OleDbCommand("SELECT PASSWORD FROM LOGIN WHERE ID ='"+id+"'",connection);
            //connection.Open();
            //OleDbDataReader reader= cmd.ExecuteReader();
            //if (reader.Read())
            //{
            //     password = reader[0].ToString();
            //}
            //txtOldPassword.Text = password;
            //connection.Close();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            lblMsg.Text = "";

            if (Session["ID"] != null)
            {
                id = (string)Session["ID"];
            }

            OleDbCommand cmd = new OleDbCommand("SELECT PASSWORD FROM LOGIN WHERE ID ='" + id + "'", connection);
            connection.Open();
            OleDbDataReader reader = cmd.ExecuteReader();
            
            if (reader.Read())
            {
                password = reader[0].ToString();
            }
            connection.Close();
            if (txtOldPassword.Text == password)
            {
                OleDbCommand cmdUpdate = new OleDbCommand("UPDATE LOGIN SET [PASSWORD] = '" + txtNewPassword.Text + "' WHERE [ID] = '" + id + "'", connection);

                if (i == 0)
                {
                    connection.Open();
                    cmdUpdate.ExecuteNonQuery();
                    i++;
                }
                if (i > 0)
                {
                    lblMsg.Text = "Password has been changed successfully";
                }
                connection.Close();

            }
            else
            {
                lblMsg.Text = "Old Password is not Correct";
            }

            
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {

        }

        

        //protected void btnLogOut_Click(object sender, EventArgs e)
        //{
        //    Session["ID"]=null;
        //    Response.Redirect("Login.aspx");
        //}
    }
}