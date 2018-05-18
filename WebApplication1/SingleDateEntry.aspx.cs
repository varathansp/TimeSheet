using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.OleDb;

namespace WebApplication1
{
    public partial class SingleDateEntry : System.Web.UI.Page
    {
        string strconnection = ConfigurationManager.ConnectionStrings["AccessConnectionString"].ToString();
        
        protected void Page_Load(object sender, EventArgs e)
        {
          
            OleDbConnection connection = new OleDbConnection(strconnection);
            if (!IsPostBack)
            {

                 string id = (string)Session["ID"];
                
                // connection.ConnectionString = strconnection.ToString();
                connection.Open();
                OleDbCommand cmd = new OleDbCommand("SELECT  [QC No] FROM EMPQCDETAILS  where  [EMP NO] ='" + id + "'", connection);

                OleDbDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {

                    if (true == true)
                    {
                        ddlSingleQc.DataSource = reader;
                        ddlSingleQc.DataTextField = "QC No";
                        ddlSingleQc.DataValueField = "QC No";
                    }
                    ddlSingleQc.DataBind();
                    ddlSingleQc.SelectedIndex = 0;
                }
                else
                {
                    lblSingleError.Text = "No QC";


                }
                OleDbCommand cmd2 = new OleDbCommand("SELECT * FROM Process", connection);

                OleDbDataReader reader2 = cmd2.ExecuteReader();
                if (reader2.HasRows)
                {

                    if (true == true)
                    {
                        ddlSingleProcess.DataSource = reader2;
                        ddlSingleProcess.DataTextField = "ProcessName";
                        ddlSingleProcess.DataValueField = "Process_ID";
                    }
                    ddlSingleProcess.DataBind();
                    ddlSingleProcess.SelectedIndex = 0;
                }

                OleDbCommand cmd3 = new OleDbCommand("select UserName from Login where ID='" + id + "'", connection);

                string uname = (string)cmd3.ExecuteScalar();
                txtUserName.Text = uname;
                txtUserName.Visible = false;

                // ddlQCNo.Items.Insert(0, "");
                connection.Close();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            OleDbConnection connection = new OleDbConnection(strconnection);
            try
            {

                Page.Validate();
                if (Page.IsValid)
                {
                    if (connection.State == ConnectionState.Closed)
                    {
                        connection.Open();
                    }

                    OleDbCommand commandtest = new OleDbCommand();
                    commandtest.Connection = connection;
                    // if (ddlQCNo.SelectedIndex >= 0)
                    if (ddlSingleProcess.SelectedItem.Text.Contains("XXXXX"))
                        commandtest.CommandText = "select Name,Date,Process,QCno from Timesheet where Name='" + txtUserName.Text + "' and cdate(format(Date,'M/d/yyyy hh:mm:ss'))=#" + Convert.ToDateTime(txtSingleDate.Text) + "# and Process=" + Convert.ToInt32(ddlSingleProcess.Text) + " and QCno='" + ddlSingleQc.SelectedItem.Text + "'";
                    else
                        commandtest.CommandText = "select Name,Date,Process,QCno from Timesheet where Name='" + txtUserName.Text + "' and cdate(format(Date,'M/d/yyyy hh:mm:ss'))=#" + Convert.ToDateTime(txtSingleDate.Text) + "# and Process=" + Convert.ToInt32(ddlSingleProcess.Text) + "";
                    OleDbDataReader reader = commandtest.ExecuteReader();
                    //int count = 0;
                    //while (reader.Read())
                    //{
                    //    count++;
                    //}
                    //connection.Close();
                    //if (count >= 1)
                    //{

                    //    lblduplicate.Text = "Process already exists for the date";
                    //}
                    if (reader.HasRows)
                    {

                        lblSingleMessage.Text = "Process already exist for the date";
                        connection.Close();
                    }
                    else
                    {
                        lblSingleError.Text = "";
                        //string dt = txtcal.Text;
                        //DateTime date = DateTime.ParseExact(txtcal.Text, "M/d/yyyy", CultureInfo.InvariantCulture);
                        //lblerror.Text = DropDownList1.SelectedItem.Text;

                        string QcType = "";
                        OleDbCommand QcTypeCmd;
                        OleDbDataReader QcTypeReader;
                        if (ddlSingleQc.SelectedIndex > 0)
                        {

                            QcTypeCmd = new OleDbCommand("SELECT QC_TYPE from EmpQcDetails where [QC No]='" + ddlSingleQc.SelectedItem.Text + "'", connection);
                            QcTypeReader = QcTypeCmd.ExecuteReader();
                            while (QcTypeReader.Read())
                            {
                                QcType = QcTypeReader[0].ToString();
                            }
                        }


                        OleDbCommand cmd = new OleDbCommand("INSERT into Timesheet ([Name],[Date],[Process],[QCno],[QC_TYPE],[Hours],[Description])" + " values (@name,@date,@process,@qcno,@qctype,@hours,@desc)", connection);
                        cmd.Parameters.Add("@name", OleDbType.Char).Value = txtUserName.Text;
                        cmd.Parameters.Add("@date", OleDbType.Char).Value = txtSingleDate.Text;
                        cmd.Parameters.Add("@process", OleDbType.Integer).Value = ddlSingleProcess.SelectedValue;
                        //if (ddlQCNo.SelectedIndex >= 0)
                        if (ddlSingleProcess.SelectedItem.Text.Contains("XXXXX"))
                            cmd.Parameters.Add("@qcno", OleDbType.Char).Value = ddlSingleQc.SelectedItem.Text;
                        else
                            cmd.Parameters.Add("@qcno", OleDbType.Char).Value = "";
                        cmd.Parameters.Add("@qctype", OleDbType.Char).Value = QcType;
                        cmd.Parameters.Add("@hours", OleDbType.Char).Value = txtSingleHour.Text;
                        cmd.Parameters.Add("@desc", OleDbType.Char).Value = txtSingleDesc.Text;
                        //cmd.Connection = connection;
                        cmd.ExecuteNonQuery();
                        connection.Close();
                        lblSingleMessage.Text = "Process added to the list";
                    }
                }
            }
            catch (Exception ex)
            {
                //Response.Write("The error is :" + ex);
                Response.Write("<script>alert('You are not assigned with any QC')</script>");
            }
        }
    }
}