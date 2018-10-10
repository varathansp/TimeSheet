using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.OleDb;
using System.Data;

namespace WebApplication1
{
    public partial class ManageQC : System.Web.UI.Page
    {
        string strconnection = ConfigurationManager.ConnectionStrings["AccessConnectionString"].ToString();
        
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                grd.Visible = true;
                using (OleDbConnection connection = new OleDbConnection(strconnection))
                {
                    string id=(string)Session["ID"];

                    OleDbCommand cmd = new OleDbCommand("SELECT distinct(ID) ,username FROM LOGIN order by username", connection);
                    OleDbCommand cmdForempName = new OleDbCommand("select UserName from Login where ID='" + id + "'", connection);
                    OleDbCommand cmdForQcName = new OleDbCommand("select * from QCType_Mas", connection);
                    connection.Open();
                    OleDbDataReader reader = cmd.ExecuteReader();
                    string userName = cmdForempName.ExecuteScalar().ToString();
                    ListItem lstemp =new ListItem();
                    if (reader.HasRows )
                    {
                        ddlEmployeeName.DataSource = reader ;
                        ddlEmployeeName.DataTextField = "username"  ;
                        ddlEmployeeName.DataValueField  = "ID";
                        ddlEmployeeName.DataBind();
                    }
                    {

                        DisplayGrid(connection);
                    }
                    reader.Close();

                    OleDbDataReader QcNamereader = cmdForQcName.ExecuteReader();
                    if (QcNamereader.HasRows)
                    {
                        ddlQcName.DataSource = QcNamereader;
                        ddlQcName.DataTextField = "QCType";
                        ddlQcName.DataValueField = "QCType";
                        ddlQcName.DataBind();
                    }
                    lblMsg.Text = "Welcome Mr. "+userName+" ["+id+"]";
                }
            }
        }
        public void DisplayGrid(OleDbConnection connection)
        {

            string selectQuery = "SELECT Username,id, [QC No],[QC_TYPE] FROM EMPQCDETAILS , Login  where Login.id = [emp no] order by Username";
            OleDbDataAdapter adapter = new OleDbDataAdapter(selectQuery, connection);
            DataTable table = new DataTable();
            adapter.Fill(table);
            if (table.Rows.Count > 0)
            {

                grd.DataSource = table;
                grd.DataBind();

                grd.Visible = true;
            }
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session["ID"] = null;
            Response.Redirect("Login.aspx");
        }
        protected void ddlEmployeeName_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect("Timesheet.aspx");
        }
        protected void btnADD_Click(object sender, EventArgs e)
        {
            string insertQuery = "INSERT INTO EMPQCDETAILS ([EMP NO],[QC NO],[QC_TYPE]) VALUES ('"+ddlEmployeeName.SelectedItem.Value+"','"+txtQcNo.Text+"','"+ ddlQcName.SelectedItem.Text+"')";
            //string selectQuery = "SELECT * FROM EMPQCDETAILS where [EMP NO] ='" + ddlEmployeeName.SelectedItem.Value + "'";
            string selectQuery = "SELECT Username,id, [QC No],[QC_TYPE] FROM EMPQCDETAILS , Login  where Login.id = [emp no] and [EMP NO] ='" + ddlEmployeeName.SelectedItem.Value + "'";
            using (OleDbConnection con = new OleDbConnection(strconnection))
            {
                OleDbCommand cmd =new OleDbCommand(insertQuery,con);

                con.Open();
                cmd.ExecuteNonQuery();
                OleDbDataAdapter adapter = new OleDbDataAdapter(selectQuery, con);
                DataTable table = new DataTable();
                 adapter.Fill(table);
                if (table.Rows.Count > 0)
                {
                   
                    grd.DataSource = table;
                    grd.DataBind();
                    grd.Visible = true;
                }

            }

        }
        protected void grd_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            OleDbConnection con = new OleDbConnection(strconnection) ;
            GridViewRow row = (GridViewRow)grd.Rows[e.RowIndex];
            Label lbl = (Label)row.FindControl("lbluid");
            Label lblQC = (Label)row.FindControl("lblProcess");
            string Param1;
            string Param2;
            Param1 = lbl.ToString() ;
            Param2 = lblQC.ToString();
            string strSQL = "Delete FROM EMPQCDETAILS where [EMP NO] = '" + lbl.Text + "' and  [QC NO] = '" + lblQC.Text   + "'";
            OleDbCommand cmd = new OleDbCommand(strSQL, con);
            
            con.Open();
            cmd.ExecuteNonQuery();
            
            con.Close();
            DisplayGrid(con);
          
         
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void grd_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}