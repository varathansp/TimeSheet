using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.Globalization;
using System.Text;
using System.Configuration;

namespace WebApplication1
{
    public partial class search : System.Web.UI.Page
    {
        string strconnection = ConfigurationManager.ConnectionStrings["AccessConnectionString"].ToString();
        OleDbConnection connection = new OleDbConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            connection.ConnectionString = strconnection.ToString();
            //connection.ConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\rsanje\Documents\MMTimeSheetDB.accdb;Persist Security Info=False;";
            if (Session["ID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string id = (string)Session["ID"];
                OleDbCommand command = new OleDbCommand();
                command.Connection = connection;
                command.CommandText = "select UserName from Login where ID='" + id + "'";
                connection.Open();
                string uname = (string)command.ExecuteScalar();
                connection.Close();
                lblname.Text ="Welcome "+ uname;
            }
            if (!IsPostBack)
            {
                
            }
        }
        protected void btnsearch_Click(object sender, EventArgs e)
        {
            string id = (string)Session["ID"];
            OleDbCommand command = new OleDbCommand();
            command.Connection = connection;
            command.CommandText = "select UserName from Login where ID='" + id + "'";
            connection.Open();
            string uname = (string)command.ExecuteScalar();
            connection.Close();
            if (txtcal1.Text == "" | txtcal2.Text == "")
            {
                lblerror.Text = "No Values Entered.!!";
                if (grd1.Visible == true)
                {
                    grd1.Visible = false;
                }
            }
            else
            {
                try
                {
                   // string query = "select Timesheet.Name,Timesheet.Date,Process.ProcessName,Timesheet.QCno,Timesheet.Hours,Timesheet.Description from Process INNER JOIN Timesheet ON Process.Process_ID = Timesheet.Process where Name='" + uname + "' and cdate(format(Date,'M/d/yyyy hh:mm:ss')) BETWEEN #" + Convert.ToDateTime(txtcal1.Text) + "# AND #" + Convert.ToDateTime(txtcal2.Text) + "# ORDER BY cdate(format(Date,'M/d/yyyy hh:mm:ss')) DESC";
                    string query = "select Timesheet.Name,Format([Timesheet.Date],'dd-mmm-yyyy') as Process_Date,Process.ProcessName,Timesheet.QCno,Timesheet.Hours,Timesheet.Description from Process INNER JOIN Timesheet ON Process.Process_ID = Timesheet.Process where Name='" + uname + "' and cdate(format(Date,'M/d/yyyy hh:mm:ss')) BETWEEN #" + Convert.ToDateTime(txtcal1.Text) + "# AND #" + Convert.ToDateTime(txtcal2.Text) + "# ORDER BY cdate(format(Date,'M/d/yyyy hh:mm:ss')) DESC";
                    OleDbDataAdapter adapter = new OleDbDataAdapter(query, connection);
                    //tablecreation();
                    DataTable table1 = new DataTable();
                    adapter.Fill(table1);

                    if (table1.Rows.Count > 0)
                    {
                        grd1.DataSource = table1;
                        grd1.DataBind();
                        grd1.Visible = true;
                        lblerror.Text = "";
                    }
                    else
                    {
                        lblerror.Text = "No Values Entered.!!";
                        if (grd1.Visible == true)
                        {
                            grd1.Visible = false;
                        }
                    }
                }

                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }

            }
        }
        protected void imgbtn1_Click(object sender, ImageClickEventArgs e)
        {
            
        }
        protected void imgbtn2_Click(object sender, ImageClickEventArgs e)
        {
           
        }
       
        protected void grd1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        double tot = 0;
        protected void grd1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                double rowtotal = Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "Hours"));
                tot = tot + rowtotal;
            }
            lblsum.Text =  tot.ToString() + " Hours";
        }
        protected void tablecreation()
        {
            string id = (string)Session["ID"];
            OleDbCommand command = new OleDbCommand();
            command.Connection = connection;
            command.CommandText = "select UserName from Login where ID='" + id + "'";
            connection.Open();
            string uname = (string)command.ExecuteScalar();
            connection.Close();
            StringBuilder htmlTable = new StringBuilder();
            string query = "select Name,Date,Process,QCno,Hours from Timesheet where Name='" + uname + "' and cdate(format(Date,'M/d/yyyy hh:mm:ss')) BETWEEN #" + Convert.ToDateTime(txtcal1.Text) + "# AND #" + Convert.ToDateTime(txtcal2.Text) + "# ORDER BY cdate(format(Date,'M/d/yyyy hh:mm:ss')) DESC";
            OleDbDataAdapter adapter = new OleDbDataAdapter(query, connection);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            htmlTable.Append("<table border='1'>");
            htmlTable.Append("<tr style='background-color:blue; color: Black;'><th>Name.</th><th>Date</th><th>Process</th><th>QCno</th><th>Hours</th></tr>");
            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    htmlTable.Append("<tr style='color: Black;'>");
                    htmlTable.Append("<td>" + ds.Tables[0].Rows[i]["Name"] + "</td>");
                    htmlTable.Append("<td>" + ds.Tables[0].Rows[i]["Date"] + "</td>");
                    htmlTable.Append("<td>" + ds.Tables[0].Rows[i]["Process"] + "</td>");
                    htmlTable.Append("<td>" + ds.Tables[0].Rows[i]["Qcno"] + "</td>");
                    htmlTable.Append("<td>" + ds.Tables[0].Rows[i]["Hours"] + "</td>");
                    htmlTable.Append("</tr>");
                }
                htmlTable.Append("</table>"); 
                
            }

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Session["ID"] = null;
            Response.Redirect("Login.aspx");
        }

     

        
    }
}