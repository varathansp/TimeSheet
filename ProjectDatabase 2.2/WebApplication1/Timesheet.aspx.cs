using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Globalization;
using System.Configuration;

namespace WebApplication1
{
    public partial class Timesheet : System.Web.UI.Page
    {
        string strconnection = ConfigurationManager.ConnectionStrings["AccessConnectionString"].ToString();

        OleDbConnection connection = new OleDbConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            ImageButton1.ImageUrl = "~/n2NRo.png";
            btnadd.Focus();

            // ImageButton1.Load();
            if (!IsPostBack)
            {
                string id = (string)Session["ID"];
                connection.ConnectionString = strconnection.ToString();
                connection.Open();
                OleDbCommand cmd = new OleDbCommand("SELECT  [QC No] FROM EMPQCDETAILS  where  [EMP NO] ='" + id + "'", connection);

                OleDbDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {

                    if (true == true)
                    {
                        ddlQCNo.DataSource = reader;
                        ddlQCNo.DataTextField = "QC No";
                        ddlQCNo.DataValueField = "QC No";
                    }
                    ddlQCNo.DataBind();
                    ddlQCNo.SelectedIndex = 0;
                }
                else
                {
                    lblQCError.Text = "No QC Assigned";

                }
                // ddlQCNo.Items.Insert(0, "");
                connection.Close();
            }

            connection.ConnectionString = strconnection.ToString();

            if (Session["ID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string id = (string)Session["ID"];
                OleDbCommand command = new OleDbCommand();
                OleDbCommand command1 = new OleDbCommand();
                command.Connection = connection;
                command1.Connection = connection;
                command.CommandText = "select UserName from Login where ID='" + id + "'";
                command1.CommandText = "select Admin from Login where ID='" + id + "'";
                connection.Open();
                string uname = (string)command.ExecuteScalar();
                Boolean adminaccess = (Boolean)command1.ExecuteScalar();
                connection.Close();
                lblwelcome.Text = "WELCOME " + uname;
                txtUname.Text = uname;
                if (adminaccess == true)
                {
                    btnreports.Visible = true;
                 //   btn1.Visible = true;
                    btncheckhours.Visible = true;
                    btnManageQC.Visible = true;
                }
                else
                {
                    btnreports.Visible = false;
                  //  btn1.Visible = false;
                    Panel1.Visible = false;
                    btncheckhours.Visible = false;
                    btnManageQC.Visible = false;
                }
            }
            //DropDownList1.SelectedIndex = -1;
            if (!IsPostBack)
            {
                BindGridView();
            }
        }
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
        }
        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }
        protected void btnadd_Click(object sender, EventArgs e)
        {
            Savedata();
           // txthours.Text = "";
            //txtqc.Text = "";
           // txtdesc.Text = "";
            //DropDownList1.SelectedIndex = -1;
        }
        private void Savedata()
        {
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
                    if (DropDownList1.SelectedItem.Text.Contains("XXXXX"))
                        commandtest.CommandText = "select Name,Date,Process,QCno from Timesheet where Name='" + txtUname.Text + "' and cdate(format(Date,'M/d/yyyy hh:mm:ss'))=#" + Convert.ToDateTime(txtcal.Text) + "# and Process=" + Convert.ToInt32(DropDownList1.Text) + " and QCno='" + ddlQCNo.SelectedItem.Text + "'";
                    else
                        commandtest.CommandText = "select Name,Date,Process,QCno from Timesheet where Name='" + txtUname.Text + "' and cdate(format(Date,'M/d/yyyy hh:mm:ss'))=#" + Convert.ToDateTime(txtcal.Text) + "# and Process=" + Convert.ToInt32(DropDownList1.Text) + "";
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

                        lblduplicate.Text = "Process already exists for the date";
                        connection.Close();
                    }
                    else
                    {
                        lblduplicate.Text = "";
                        //string dt = txtcal.Text;
                        //DateTime date = DateTime.ParseExact(txtcal.Text, "M/d/yyyy", CultureInfo.InvariantCulture);
                        //lblerror.Text = DropDownList1.SelectedItem.Text;

                        string QcType = "";
                        OleDbCommand QcTypeCmd;
                        OleDbDataReader QcTypeReader;
                        if (ddlQCNo.SelectedIndex > 0)
                        {

                            QcTypeCmd = new OleDbCommand("SELECT QC_TYPE from EmpQcDetails where [QC No]='" + ddlQCNo.SelectedItem.Text + "'", connection);
                            QcTypeReader = QcTypeCmd.ExecuteReader();
                            while (QcTypeReader.Read())
                            {
                                QcType = QcTypeReader[0].ToString();
                            }
                        }
                      
                       
                        OleDbCommand cmd = new OleDbCommand("INSERT into Timesheet ([Name],[Date],[Process],[QCno],[QC_TYPE],[Hours],[Description])" + " values (@name,@date,@process,@qcno,@qctype,@hours,@desc)", connection);
                        cmd.Parameters.Add("@name", OleDbType.Char).Value = txtUname.Text;
                        cmd.Parameters.Add("@date", OleDbType.Char).Value = txtcal.Text;
                        cmd.Parameters.Add("@process", OleDbType.Integer).Value = DropDownList1.SelectedValue;
                        //if (ddlQCNo.SelectedIndex >= 0)
                        if (DropDownList1.SelectedItem.Text.Contains("XXXXX"))
                            cmd.Parameters.Add("@qcno", OleDbType.Char).Value = ddlQCNo.SelectedItem.Text;
                        else
                            cmd.Parameters.Add("@qcno", OleDbType.Char).Value = "";
                        cmd.Parameters.Add("@qctype", OleDbType.Char).Value = QcType;
                        cmd.Parameters.Add("@hours", OleDbType.Char).Value = txthours.Text;
                        cmd.Parameters.Add("@desc", OleDbType.Char).Value = txtdesc.Text;
                        //cmd.Connection = connection;
                        cmd.ExecuteNonQuery();
                        connection.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("The error is :" + ex);
            }
            BindGridView();
        }
        private void BindGridView()
        {
            try
            {
                DateTime startWeek;
                string dayOfWeek;
                if (txtcal.Text == "")
                {
                    dayOfWeek = DateTime.Today.DayOfWeek.ToString().ToLower();
                }
                else
                {
                    dayOfWeek = Convert.ToDateTime(txtcal.Text).DayOfWeek.ToString().ToLower();
                }

                int offSet = 0;
                switch (dayOfWeek)
                {
                    case "sunday": offSet = 0;
                        break;
                    case "monday": offSet = 1;
                        break;
                    case "tuesday": offSet = 2;
                        break;
                    case "wednesday": offSet = 3;
                        break;
                    case "thursday": offSet = 4;
                        break;
                    case "friday": offSet = 5;
                        break;
                    case "saturday": offSet = 6;
                        break;

                }
                if (txtcal.Text == "")
                {
                    startWeek = DateTime.Now.AddDays(-offSet);
                }
                else
                {
                    startWeek = Convert.ToDateTime(txtcal.Text).AddDays(-offSet);
                }
                DateTime endWeek = startWeek.AddDays(6);
                //string Month = Convert.ToString(DateTime.Now.Month);
                //string year = Convert.ToString(DateTime.Now.Year);
                //string lastdate = Convert.ToString(DateTime.DaysInMonth(Convert.ToInt32(year),Convert.ToInt32(Month)));
                //DateTime Monthstarting = Convert.ToDateTime(Month + "/01/" + year);
                //DateTime Monthending = Convert.ToDateTime(Month + "/"+lastdate+"/" + year);
                string query = "select Timesheet.ID,Timesheet.Name,Timesheet.Date,Process.ProcessName,Process.Process_ID,Timesheet.QCno,Timesheet.Hours,Timesheet.Description from Process INNER JOIN Timesheet ON Process.Process_ID = Timesheet.Process where Name ='" + txtUname.Text + "' and cdate(format(Date,'M/d/yyyy hh:mm:ss')) BETWEEN #" + startWeek + "# and #" + endWeek + "# order by cdate(format(Date,'M/d/yyyy hh:mm:ss')) DESC";
                OleDbDataAdapter adapter = new OleDbDataAdapter(query, connection);
                DataTable table1 = new DataTable();
                adapter.Fill(table1);
                if (table1.Rows.Count > 0)
                {
                    grd.DataSource = table1;
                    grd.DataBind();
                    grd.Visible = true;
                    lblerror.Text = "";
                    adapter.Dispose();
                    lblsum.Visible = true;
                }
                else
                {
                    grd.Visible = false;
                    lblsum.Visible = false;
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
        protected void grd_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void btnsearch_Click(object sender, EventArgs e)
        {
            //txtUname.Text = "";
            //txtcal.Text = "";
            //DropDownList1.Text = "";
            //txthours.Text = "";
            //BindGridView();
            Response.Redirect("search.aspx");
        }
        protected void grd_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grd.EditIndex = e.NewEditIndex;
            BindGridView();
            //if (flag == true)
            //{
            //    BindGridView();
            //}
            //else {
            //    BindGridViewforweek();
            //}

        }
        protected void grd_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                //DateTime date = DateTime.ParseExact(txtcal.Text, "dd/MM/yyyy", null);
                GridViewRow row = (GridViewRow)grd.Rows[e.RowIndex];
                Label lbl = (Label)row.FindControl("lblid");
                Label txtname = (Label)row.FindControl("lblname");
                TextBox txtdate = (TextBox)row.FindControl("textboxdate");
                DropDownList dd1 = (DropDownList)row.FindControl("dropdownlist1");
                TextBox txtqc = (TextBox)row.FindControl("textboxqcno");
                TextBox txthour = (TextBox)row.FindControl("textboxhours");
                TextBox txtdesc = (TextBox)row.FindControl("textboxdesc");
                grd.EditIndex = -1;
                OleDbCommand cmd = new OleDbCommand("Update Timesheet SET [Date]=@date,[Process]=@process,[QCno]=@qcno,[Hours]=@hours,[Description]=@desc where [ID]=@id", connection);
                //cmd.Parameters.Add("@name", OleDbType.Char).Value = txtname.Text;
                cmd.Parameters.Add("@date", OleDbType.Char).Value = txtdate.Text;
                cmd.Parameters.Add("@process", OleDbType.Integer).Value = dd1.SelectedValue;
                cmd.Parameters.Add("@qcno", OleDbType.Char).Value = txtqc.Text;
                cmd.Parameters.Add("@hours", OleDbType.Char).Value = txthour.Text;
                cmd.Parameters.Add("@desc", OleDbType.Char).Value = txtdesc.Text;
                cmd.Parameters.Add("@id", OleDbType.Char).Value = lbl.Text;
                connection.Open();
                cmd.ExecuteNonQuery();
                connection.Close();
                grd.EditIndex = -1;
                //this.bind();
                BindGridView();
                //if (flag == true)
                //{
                //    BindGridView();
                //}
                //else
                //{
                //    BindGridViewforweek();
                //}
            }
            catch (Exception ex)
            {
                lblerror.Text = ex.Message;
                lblerror.Visible = true;
            }
        }
        protected void grd_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)grd.Rows[e.RowIndex];
            Label lbl = (Label)row.FindControl("lblid");
            OleDbCommand cmd = new OleDbCommand("Delete FROM Timesheet where ID=@id", connection);
            cmd.Parameters.Add("@id", OleDbType.Char).Value = lbl.Text;
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
            //bind();
            BindGridView();
            //if (flag == true)
            //{
            //    BindGridView();
            //}
            //else
            //{
            //    BindGridViewforweek();
            //}
        }
        protected void grd_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grd.EditIndex = -1;
            //bind();
            BindGridView();
            //if (flag == true)
            //{
            //    BindGridView();
            //}
            //else
            //{
            //    BindGridViewforweek();
            //}
        }
        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session["ID"]=null;
            Response.Redirect("Login.aspx");
        }
        protected void btnok_Click(object sender, EventArgs e)
        {
            if (TextBox3.Text == "")
            {
                lblerror.Text = "Value Cannot be empty";
            }
            else
            {
                lblerror.Text = "";
                OleDbCommand cmd = new OleDbCommand("INSERT into Process ([QCRequired],[ProcessName],[AA_Text],[AA_Type])" + " values (@qcno,@process,@aatext,@aatype)", connection);
                if (rbyes.Checked)
                {
                    cmd.Parameters.Add("qcno", OleDbType.Char).Value = rbyes.Text;
                }
                else if (rbno.Checked)
                {
                    cmd.Parameters.Add("qcno", OleDbType.Char).Value = rbno.Text;
                }
                cmd.Parameters.Add("@process", OleDbType.Char).Value = TextBox3.Text;
                cmd.Parameters.Add("@aatext", OleDbType.Char).Value = txtaatxt.Text;
                cmd.Parameters.Add("@aatype", OleDbType.Char).Value = txtaatype.Text;
                connection.Open();
                cmd.ExecuteNonQuery();
                connection.Close();
                DropDownList1.DataBind();
            }
        }
        Double tot = 0;


        protected void grd_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowState != DataControlRowState.Edit)
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    double rowtotal = Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "Hours"));
                    //Label lblhours = (Label)e.Row.FindControl("lblhours");
                    tot = tot + rowtotal;
                    lblsum.Text = "Total Hours: " + tot.ToString();
                }
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

            }
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //ddlvalidate();
            if (DropDownList1.SelectedItem.Text.Contains("XXXXX"))
            {
                RequiredFieldValidator2.Enabled = true;
                // txtqc.Enabled = true;
            }
            else
            {
                RequiredFieldValidator2.Enabled = false;
                // txtqc.Enabled = false;
            }
        }
        protected void btncancel_Click(object sender, EventArgs e)
        {

        }
        private void ddlvalidate()
        {
            try
            {
                if (DropDownList1.Text != "1")
                {
                    OleDbCommand command1 = new OleDbCommand();
                    command1.Connection = connection;
                    command1.CommandText = "select QCRequired from Process where ProcessName='" + DropDownList1.SelectedItem.Text + "'";
                    connection.Open();
                    string qcreqd = (string)command1.ExecuteScalar();
                    connection.Close();
                    if (qcreqd == "Yes")
                    {
                        RequiredFieldValidator2.Enabled = true;
                        //  txtqc.Enabled = true;
                    }
                    else
                    {
                        RequiredFieldValidator2.Enabled = false;
                        //  txtqc.Enabled = false;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }



        protected void btnreports_Click(object sender, EventArgs e)
        {
            Response.Redirect("reports.aspx");
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            BindGridView();
        }

        protected void btncheckhours_Click(object sender, EventArgs e)
        {
            Response.Redirect("SendMail.aspx");
        }

        protected void btnManageQC_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageQC.aspx");
        }

        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        //protected void btn1_Click(object sender, EventArgs e)
        //{

        //}

        protected void ddlQCNo_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void AccessDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }




    }
}