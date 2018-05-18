using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Configuration;
using Excel = Microsoft.Office.Interop.Excel;
using ExcelAutoformat = Microsoft.Office.Interop.Excel.XlRangeAutoFormat;
using System.Data.OleDb;
using System.Web.Configuration;
namespace WebApplication1
{
    public partial class reports : System.Web.UI.Page
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
                lblname.Text = "Logged in as: " + uname;
            }
        }
        protected void btnexport_Click(object sender, EventArgs e)
        {
            ExportToExcelDownload();
        }
        private void ExportToExcelDownload()
        {
            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Timesheet.xls"));
            Response.ContentType = "application/ms-excel";
            string query = "select Timesheet.Name,Timesheet.Date,Process.ProcessName,Timesheet.QCno,Timesheet.QC_TYPE,Timesheet.Hours,Timesheet.Description,Process.AA_Text,Process.AA_Type FROM Process INNER JOIN Timesheet ON Process.Process_ID = Timesheet.Process where cdate(format(Date,'M/d/yyyy hh:mm:ss')) BETWEEN #" + Convert.ToDateTime(txtcal1.Text) + "# AND #" + Convert.ToDateTime(txtcal2.Text) + "# ORDER BY Name ASC,cdate(format(Date,'M/d/yyyy hh:mm:ss')) ASC";
            OleDbDataAdapter adapter = new OleDbDataAdapter(query, connection);
            DataTable table1 = new DataTable();
            adapter.Fill(table1);
            string str = string.Empty;
            foreach (DataColumn dtcol in table1.Columns)
            {
                Response.Write(str + dtcol.ColumnName);
                str = "\t";
            }
            Response.Write("\n");
            foreach (DataRow dr in table1.Rows)
            {
                str = "";
                for (int j = 0; j < table1.Columns.Count; j++)
                {
                    if (j == 2)
                    {
                        if (dr.ItemArray[2].ToString().Contains("XXXXX"))
                        {
                            str = dr.ItemArray[2].ToString().Replace("XXXXX", dr.ItemArray[3].ToString());
                        }
                        else if (dr.ItemArray[2].ToString().Contains("Training"))
                        {
                            str = dr.ItemArray[2].ToString().Replace("Description Here", dr.ItemArray[5].ToString());
                        }
                        else
                        {
                            str = dr.ItemArray[2].ToString();
                        }
                        Response.Write(str.ToString() + "\t");
                    }
                    else
                    {
                        str = dr.ItemArray[j].ToString();
                        Response.Write(str.ToString() + "\t");
                    }
                }

                    
                Response.Write("\n");
            }
            Response.End();
        }
        protected void btnlogoff_Click(object sender, EventArgs e)
        {
            Session["ID"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}