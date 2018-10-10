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
    public partial class Timesheet2 : System.Web.UI.Page
    {

        string strconnection = ConfigurationManager.ConnectionStrings["AccessConnectionString"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {


            OleDbConnection connection = new OleDbConnection(strconnection);
            if (!IsPostBack)
            {
                hour1HiddenField.Value = "Mon";
                hour2HiddenField.Value = "Tue";
                hour3HiddenField.Value = "Wed";
                hour4HiddenField.Value = "Thu";
                hour5HiddenField.Value = "Fri";
                string id = (string)Session["ID"];
                // connection.ConnectionString = strconnection.ToString();
                connection.Open();
                OleDbCommand cmd = new OleDbCommand("SELECT  [QC No] FROM EMPQCDETAILS  where  [EMP NO] ='" + id + "'", connection);

                OleDbDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {

                    if (true == true)
                    {
                        ddlQcNo.DataSource = reader;
                        ddlQcNo.DataTextField = "QC No";
                        ddlQcNo.DataValueField = "QC No";
                    }
                    ddlQcNo.DataBind();
                    ddlQcNo.SelectedIndex = 0;
                }
                else
                {
                    lblQcNotification.Text = "No QC Assigned";

                }
                OleDbCommand cmd2 = new OleDbCommand("SELECT * FROM Process ORDER BY ProcessName ASC", connection);
               
                OleDbDataReader reader2 = cmd2.ExecuteReader();
                if (reader2.HasRows)
                {

                    if (true == true)
                    {
                        ddlProcess.DataSource = reader2;
                        ddlProcess.DataTextField = "ProcessName";
                        ddlProcess.DataValueField = "Process_ID";
                    }
                    ddlProcess.DataBind();
                    ddlProcess.SelectedIndex = 0;
                }

                OleDbCommand cmd3 = new OleDbCommand("select UserName from Login where ID='" + id + "'", connection);

                string uname = (string)cmd3.ExecuteScalar();
                txtUserName.Text = uname;


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
                //lblwelcome.Text = "WELCOME " + uname;
                //txtUname.Text = uname;
                if (adminaccess == true)
                {
                    HyperLinkEmail.Visible = true;
                    HyperLinkQc.Visible = true;
                    HyperLinkReport.Visible = true;                
                }
                else
                {
                    HyperLinkEmail.Visible = false;
                    HyperLinkQc.Visible = false;
                    HyperLinkReport.Visible = false;   
                }
            }
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        private void BindGridView()
        {
            OleDbConnection connection = new OleDbConnection(strconnection);
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
                string query = "select Timesheet.ID,Timesheet.Name,Timesheet.Date,Process.ProcessName,Process.Process_ID,Timesheet.QCno,Timesheet.Hours,Timesheet.Description from Process INNER JOIN Timesheet ON Process.Process_ID = Timesheet.Process where Name ='" + txtUserName.Text + "' and cdate(format(Date,'M/d/yyyy hh:mm:ss')) BETWEEN #" + startWeek + "# and #" + endWeek + "# order by cdate(format(Date,'M/d/yyyy hh:mm:ss')) DESC";
                OleDbDataAdapter adapter = new OleDbDataAdapter(query, connection);
                DataTable table1 = new DataTable();
                adapter.Fill(table1);
                if (table1.Rows.Count > 0)
                {
                    grd.DataSource = table1;
                    grd.DataBind();
                    grd.Visible = true;
                    // lblerror.Text = "";
                    adapter.Dispose();
                    lblWeeksum.Visible = true;
                }
                else
                {
                    grd.Visible = false;
                    lblWeeksum.Visible = false;
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            BindGridView();
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
            OleDbConnection connection = new OleDbConnection(strconnection);
            try
            {
                //DateTime date = DateTime.ParseExact(txtcal.Text, "dd/MM/yyyy", null);
                GridViewRow row = (GridViewRow)grd.Rows[e.RowIndex];
                Label lbl = (Label)row.FindControl("lblid");
                Label txtname = (Label)row.FindControl("lblname");
                TextBox txtdate = (TextBox)row.FindControl("textboxdate");
                DropDownList dd1 = (DropDownList)row.FindControl("dropdownlist1");
                DropDownList txtqc = (DropDownList)row.FindControl("DropDownList2");
                //TextBox txtqc = (TextBox)row.FindControl("textboxqcno");
                TextBox txthour = (TextBox)row.FindControl("textboxhours");
                TextBox txtdesc = (TextBox)row.FindControl("textboxdesc");
                grd.EditIndex = -1;
                OleDbCommand cmd = new OleDbCommand("Update Timesheet SET [Date]=@date,[Process]=@process,[QCno]=@qcno,[Hours]=@hours,[Description]=@desc where [ID]=@id", connection);
                //cmd.Parameters.Add("@name", OleDbType.Char).Value = txtname.Text;
                cmd.Parameters.Add("@date", OleDbType.Char).Value = txtdate.Text;
                cmd.Parameters.Add("@process", OleDbType.Integer).Value = dd1.SelectedValue;
               // cmd.Parameters.Add("@qcno", OleDbType.Char).Value = txtqc.Text;
                cmd.Parameters.Add("@qcno", OleDbType.Char).Value = txtqc.SelectedValue;
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
                //lblerror.Text = ex.Message;
                // lblerror.Visible = true;
            }
        }
        protected void grd_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            OleDbConnection connection = new OleDbConnection(strconnection);
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
                    lblWeeksum.Text = "Total hours for the week: " + tot.ToString();
                }
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

            }
        }


        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //ddlvalidate();
            //if (DropDownList1.SelectedItem.Text.Contains("XXXXX"))
            //{
            //    RequiredFieldValidator2.Enabled = true;
            //    // txtqc.Enabled = true;
            //}
            //else
            //{
            //    RequiredFieldValidator2.Enabled = false;
            //    // txtqc.Enabled = false;
            //}
        }
        protected void btncancel_Click(object sender, EventArgs e)
        {

        }
        private void ddlvalidate()
        {
            //try
            //{
            //    if (DropDownList1.Text != "1")
            //    {
            //        OleDbCommand command1 = new OleDbCommand();
            //        command1.Connection = connection;
            //        command1.CommandText = "select QCRequired from Process where ProcessName='" + DropDownList1.SelectedItem.Text + "'";
            //        connection.Open();
            //        string qcreqd = (string)command1.ExecuteScalar();
            //        connection.Close();
            //        if (qcreqd == "Yes")
            //        {
            //            RequiredFieldValidator2.Enabled = true;
            //            //  txtqc.Enabled = true;
            //        }
            //        else
            //        {
            //            RequiredFieldValidator2.Enabled = false;
            //            //  txtqc.Enabled = false;
            //        }
            //    }
            //}
            //catch (Exception ex)
            //{
            //    Response.Write(ex.Message);
            //}
        }

        private void Savedata()
        {
            OleDbConnection connection = new OleDbConnection(strconnection);
            try
            {

                Page.Validate();
                if (Page.IsValid)
                {
                    lblError1.Text = "";
                    lblError2.Text = "";
                    lblError3.Text = "";
                    lblError4.Text = "";
                    lblError5.Text = "";
                    Dummy.Text = "";
                    //if (connection.State == ConnectionState.Closed)
                    //{
                    //    connection.Open();
                    //}

                    //OleDbCommand commandtest = new OleDbCommand();
                    //commandtest.Connection = connection;
                    //// if (ddlQCNo.SelectedIndex >= 0)
                    //if (ddlProcess.SelectedItem.Text.Contains("XXXXX"))
                    //    commandtest.CommandText = "select Name,Date,Process,QCno from Timesheet where Name='" + txtUserName.Text + "' and cdate(format(Date,'M/d/yyyy hh:mm:ss'))=#" + Convert.ToDateTime(txtcal.Text) + "# and Process=" + Convert.ToInt32(ddlProcess.Text) + " and QCno='" + ddlQcNo.SelectedItem.Text + "'";
                    //else
                    //    commandtest.CommandText = "select Name,Date,Process,QCno from Timesheet where Name='" + txtUserName.Text + "' and cdate(format(Date,'M/d/yyyy hh:mm:ss'))=#" + Convert.ToDateTime(txtcal.Text) + "# and Process=" + Convert.ToInt32(ddlProcess.Text) + "";
                    //OleDbDataReader reader = commandtest.ExecuteReader();
                    ////int count = 0;
                    ////while (reader.Read())
                    ////{
                    ////    count++;
                    ////}
                    ////connection.Close();
                    ////if (count >= 1)
                    ////{

                    ////    lblduplicate.Text = "Process already exists for the date";
                    ////}

                    ////DateTime selectedDate = Convert.ToDateTime(txtcal.Text);
                    ////int day =(int)selectedDate.DayOfWeek;
                    ////int [] noOfDays=new int[1];
                    ////if(txtHour1)

                    ////for (int i = 0; i < 6 - day; i++)
                    ////{ 
                    ////int[i]=txtHour1.
                    ////}


                    //    if (reader.HasRows)
                    //    {

                    //        lblduplicate.Text = "Process already exists for the date";
                    //        connection.Close();
                    //    }


                    //    else
                    //    {
                    //        //    DateTime stdate = Convert.ToDateTime(txtcal.Text);
                    //        //    DateTime endate = Convert.ToDateTime(txtToDate.Text);
                    //        //    int totalDates = (endate - stdate).Days;
                    //        //    for (DateTime da=stdate; da <= endate;da=da.AddDays(1))
                    //        //    {
                    //        //        lblduplicate.Text = "";
                    //        //        //string dt = txtcal.Text;
                    //        //        //DateTime date = DateTime.ParseExact(txtcal.Text, "M/d/yyyy", CultureInfo.InvariantCulture);
                    //        //        //lblerror.Text = DropDownList1.SelectedItem.Text;
                    //        //        OleDbCommand cmd = new OleDbCommand("INSERT into Timesheet ([Name],[Date],[Process],[QCno],[Hours],[Description])" + " values (@name,@date,@process,@qcno,@hours,@desc)", connection);
                    //        //        cmd.Parameters.Add("@name", OleDbType.Char).Value = txtUserName.Text;
                    //        //        cmd.Parameters.Add("@date", OleDbType.Char).Value = da;
                    //        //        cmd.Parameters.Add("@process", OleDbType.Integer).Value = ddlProcess.SelectedValue;
                    //        //        //if (ddlQCNo.SelectedIndex >= 0)
                    //        //        if (ddlProcess.SelectedItem.Text.Contains("XXXXX"))
                    //        //            cmd.Parameters.Add("@qcno", OleDbType.Char).Value = ddlQcNo.SelectedItem.Text;
                    //        //        else
                    //        //            cmd.Parameters.Add("@qcno", OleDbType.Char).Value = "";
                    //        //        cmd.Parameters.Add("@hours", OleDbType.Char).Value = txtHours.Text;
                    //        //        cmd.Parameters.Add("@desc", OleDbType.Char).Value = txtDescription.Text;
                    //        //        //cmd.Connection = connection;
                    //        //        cmd.ExecuteNonQuery();
                    //        //    }
                    //        //    connection.Close();


                    if (txtHour1.Text != "" && txtHour1.Text!="0")
                    {
                        if (connection.State == ConnectionState.Closed)
                        {
                            connection.Open();
                        }

                        OleDbCommand commandtest = new OleDbCommand();
                        commandtest.Connection = connection;
                        // if (ddlQCNo.SelectedIndex >= 0)
                        if (Dummy.Text != "")
                            commandtest.CommandText = "select Name,Date,Process,QCno from Timesheet where Name='" + txtUserName.Text + "' and cdate(format(Date,'M/d/yyyy hh:mm:ss'))=#" + Convert.ToDateTime(hour1HiddenField.Value) + "# and Process=" + Convert.ToInt32(ddlProcess.Text) + " and QCno='" + Dummy.Text + "'";
                       
                        else if (ddlProcess.SelectedItem.Text.Contains("XXXXX"))
                            commandtest.CommandText = "select Name,Date,Process,QCno from Timesheet where Name='" + txtUserName.Text + "' and cdate(format(Date,'M/d/yyyy hh:mm:ss'))=#" + Convert.ToDateTime(hour1HiddenField.Value) + "# and Process=" + Convert.ToInt32(ddlProcess.Text) + " and QCno='" + ddlQcNo.SelectedItem.Text + "'";
                        else
                            commandtest.CommandText = "select Name,Date,Process,QCno from Timesheet where Name='" + txtUserName.Text + "' and cdate(format(Date,'M/d/yyyy hh:mm:ss'))=#" + Convert.ToDateTime(hour1HiddenField.Value) + "# and Process=" + Convert.ToInt32(ddlProcess.Text) + "";
                        OleDbDataReader reader = commandtest.ExecuteReader();

                        if (reader.HasRows)
                        {

                            lblError1.Text = "Process already exists for the date " + hour1HiddenField.Value;
                            connection.Close();
                        }
                        else
                        {
                            DateTime stdate = Convert.ToDateTime(hour1HiddenField.Value);

                            // DateTime endate = Convert.ToDateTime(txtToDate.Text);
                            //  int totalDates = (endate - stdate).Days;

                          
                            //string dt = txtcal.Text;
                            //DateTime date = DateTime.ParseExact(txtcal.Text, "M/d/yyyy", CultureInfo.InvariantCulture);
                            //lblerror.Text = DropDownList1.SelectedItem.Text;
                            OleDbCommand cmd = new OleDbCommand("INSERT into Timesheet ([Name],[Date],[Process],[QCno],[Hours],[Description])" + " values (@name,@date,@process,@qcno,@hours,@desc)", connection);
                            cmd.Parameters.Add("@name", OleDbType.Char).Value = txtUserName.Text;
                            cmd.Parameters.Add("@date", OleDbType.Char).Value = stdate;
                            cmd.Parameters.Add("@process", OleDbType.Integer).Value = ddlProcess.SelectedValue;
                            //if (ddlQCNo.SelectedIndex >= 0)
                            if (Dummy.Text != "")
                                cmd.Parameters.Add("@qcno", OleDbType.Char).Value = Dummy.Text;
                            else if (ddlProcess.SelectedItem.Text.Contains("XXXXX"))
                                cmd.Parameters.Add("@qcno", OleDbType.Char).Value = ddlQcNo.SelectedItem.Text;
                            else
                                cmd.Parameters.Add("@qcno", OleDbType.Char).Value = "";
                            cmd.Parameters.Add("@hours", OleDbType.Char).Value = txtHour1.Text;
                            cmd.Parameters.Add("@desc", OleDbType.Char).Value = txtDescription.Text;
                            //cmd.Connection = connection;
                            cmd.ExecuteNonQuery();
                            connection.Close();
                        }
                    }

                    if (txtHour2.Text != "" && txtHour2.Text != "0")
                    {
                        if (connection.State == ConnectionState.Closed)
                        {
                            connection.Open();
                        }

                        OleDbCommand commandtest = new OleDbCommand();
                        commandtest.Connection = connection;
                        // if (ddlQCNo.SelectedIndex >= 0)
                        if (Dummy.Text != "")
                            commandtest.CommandText = "select Name,Date,Process,QCno from Timesheet where Name='" + txtUserName.Text + "' and cdate(format(Date,'M/d/yyyy hh:mm:ss'))=#" + Convert.ToDateTime(hour2HiddenField.Value) + "# and Process=" + Convert.ToInt32(ddlProcess.Text) + " and QCno='" + Dummy.Text + "'";
                        
                        else if (ddlProcess.SelectedItem.Text.Contains("XXXXX"))
                            commandtest.CommandText = "select Name,Date,Process,QCno from Timesheet where Name='" + txtUserName.Text + "' and cdate(format(Date,'M/d/yyyy hh:mm:ss'))=#" + Convert.ToDateTime(hour2HiddenField.Value) + "# and Process=" + Convert.ToInt32(ddlProcess.Text) + " and QCno='" + ddlQcNo.SelectedItem.Text + "'";
                        else
                            commandtest.CommandText = "select Name,Date,Process,QCno from Timesheet where Name='" + txtUserName.Text + "' and cdate(format(Date,'M/d/yyyy hh:mm:ss'))=#" + Convert.ToDateTime(hour2HiddenField.Value) + "# and Process=" + Convert.ToInt32(ddlProcess.Text) + "";
                        OleDbDataReader reader = commandtest.ExecuteReader();

                        if (reader.HasRows)
                        {

                            lblError2.Text = "Process already exists for the date " + hour2HiddenField.Value;
                            connection.Close();
                        }
                        else
                        {
                            DateTime stdate = Convert.ToDateTime(hour2HiddenField.Value);

                            // DateTime endate = Convert.ToDateTime(txtToDate.Text);
                            //  int totalDates = (endate - stdate).Days;

                       
                            //string dt = txtcal.Text;
                            //DateTime date = DateTime.ParseExact(txtcal.Text, "M/d/yyyy", CultureInfo.InvariantCulture);
                            //lblerror.Text = DropDownList1.SelectedItem.Text;
                            OleDbCommand cmd = new OleDbCommand("INSERT into Timesheet ([Name],[Date],[Process],[QCno],[Hours],[Description])" + " values (@name,@date,@process,@qcno,@hours,@desc)", connection);
                            cmd.Parameters.Add("@name", OleDbType.Char).Value = txtUserName.Text;
                            cmd.Parameters.Add("@date", OleDbType.Char).Value = stdate;
                            cmd.Parameters.Add("@process", OleDbType.Integer).Value = ddlProcess.SelectedValue;
                            //if (ddlQCNo.SelectedIndex >= 0)
                            if (Dummy.Text != "")
                                cmd.Parameters.Add("@qcno", OleDbType.Char).Value = Dummy.Text;
                            else if (ddlProcess.SelectedItem.Text.Contains("XXXXX"))
                                cmd.Parameters.Add("@qcno", OleDbType.Char).Value = ddlQcNo.SelectedItem.Text;
                            else
                                cmd.Parameters.Add("@qcno", OleDbType.Char).Value = "";
                            cmd.Parameters.Add("@hours", OleDbType.Char).Value = txtHour2.Text;
                            cmd.Parameters.Add("@desc", OleDbType.Char).Value = txtDescription.Text;
                            //cmd.Connection = connection;
                            cmd.ExecuteNonQuery();
                            connection.Close();
                        }
                    }
                    if (txtHour3.Text != "" && txtHour3.Text != "0")
                    {
                        if (connection.State == ConnectionState.Closed)
                        {
                            connection.Open();
                        }

                        OleDbCommand commandtest = new OleDbCommand();
                        commandtest.Connection = connection;
                        // if (ddlQCNo.SelectedIndex >= 0)
                        if (Dummy.Text != "")
                            commandtest.CommandText = "select Name,Date,Process,QCno from Timesheet where Name='" + txtUserName.Text + "' and cdate(format(Date,'M/d/yyyy hh:mm:ss'))=#" + Convert.ToDateTime(hour3HiddenField.Value) + "# and Process=" + Convert.ToInt32(ddlProcess.Text) + " and QCno='" + Dummy.Text + "'";
                      
                        else if (ddlProcess.SelectedItem.Text.Contains("XXXXX"))
                            commandtest.CommandText = "select Name,Date,Process,QCno from Timesheet where Name='" + txtUserName.Text + "' and cdate(format(Date,'M/d/yyyy hh:mm:ss'))=#" + Convert.ToDateTime(hour3HiddenField.Value) + "# and Process=" + Convert.ToInt32(ddlProcess.Text) + " and QCno='" + ddlQcNo.SelectedItem.Text + "'";
                        else
                            commandtest.CommandText = "select Name,Date,Process,QCno from Timesheet where Name='" + txtUserName.Text + "' and cdate(format(Date,'M/d/yyyy hh:mm:ss'))=#" + Convert.ToDateTime(hour3HiddenField.Value) + "# and Process=" + Convert.ToInt32(ddlProcess.Text) + "";
                        OleDbDataReader reader = commandtest.ExecuteReader();

                        if (reader.HasRows)
                        {

                            lblError3.Text = "Process already exists for the date " + hour3HiddenField.Value;
                            connection.Close();
                        }
                        else
                        {
                            DateTime stdate = Convert.ToDateTime(hour3HiddenField.Value);

                            // DateTime endate = Convert.ToDateTime(txtToDate.Text);
                            //  int totalDates = (endate - stdate).Days;

                        
                            //string dt = txtcal.Text;
                            //DateTime date = DateTime.ParseExact(txtcal.Text, "M/d/yyyy", CultureInfo.InvariantCulture);
                            //lblerror.Text = DropDownList1.SelectedItem.Text;
                            OleDbCommand cmd = new OleDbCommand("INSERT into Timesheet ([Name],[Date],[Process],[QCno],[Hours],[Description])" + " values (@name,@date,@process,@qcno,@hours,@desc)", connection);
                            cmd.Parameters.Add("@name", OleDbType.Char).Value = txtUserName.Text;
                            cmd.Parameters.Add("@date", OleDbType.Char).Value = stdate;
                            cmd.Parameters.Add("@process", OleDbType.Integer).Value = ddlProcess.SelectedValue;
                            //if (ddlQCNo.SelectedIndex >= 0)
                            if (Dummy.Text != "")
                                cmd.Parameters.Add("@qcno", OleDbType.Char).Value = Dummy.Text;
                            else if (ddlProcess.SelectedItem.Text.Contains("XXXXX"))
                                cmd.Parameters.Add("@qcno", OleDbType.Char).Value = ddlQcNo.SelectedItem.Text;
                            else
                                cmd.Parameters.Add("@qcno", OleDbType.Char).Value = "";
                            cmd.Parameters.Add("@hours", OleDbType.Char).Value = txtHour3.Text;
                            cmd.Parameters.Add("@desc", OleDbType.Char).Value = txtDescription.Text;
                            //cmd.Connection = connection;
                            cmd.ExecuteNonQuery();
                            connection.Close();
                        }
                    }
                    if (txtHour4.Text != "" && txtHour4.Text != "0")
                    {
                        if (connection.State == ConnectionState.Closed)
                        {
                            connection.Open();
                        }

                        OleDbCommand commandtest = new OleDbCommand();
                        commandtest.Connection = connection;
                        // if (ddlQCNo.SelectedIndex >= 0)
                        if (Dummy.Text != "")
                            commandtest.CommandText = "select Name,Date,Process,QCno from Timesheet where Name='" + txtUserName.Text + "' and cdate(format(Date,'M/d/yyyy hh:mm:ss'))=#" + Convert.ToDateTime(hour4HiddenField.Value) + "# and Process=" + Convert.ToInt32(ddlProcess.Text) + " and QCno='" + Dummy.Text + "'";
                     
                        else if (ddlProcess.SelectedItem.Text.Contains("XXXXX"))
                            commandtest.CommandText = "select Name,Date,Process,QCno from Timesheet where Name='" + txtUserName.Text + "' and cdate(format(Date,'M/d/yyyy hh:mm:ss'))=#" + Convert.ToDateTime(hour4HiddenField.Value) + "# and Process=" + Convert.ToInt32(ddlProcess.Text) + " and QCno='" + ddlQcNo.SelectedItem.Text + "'";
                        else
                            commandtest.CommandText = "select Name,Date,Process,QCno from Timesheet where Name='" + txtUserName.Text + "' and cdate(format(Date,'M/d/yyyy hh:mm:ss'))=#" + Convert.ToDateTime(hour4HiddenField.Value) + "# and Process=" + Convert.ToInt32(ddlProcess.Text) + "";
                        OleDbDataReader reader = commandtest.ExecuteReader();

                        if (reader.HasRows)
                        {

                            lblError4.Text = "Process already exists for the date " + hour4HiddenField.Value;

                            connection.Close();
                        }
                        else
                        {
                            DateTime stdate = Convert.ToDateTime(hour4HiddenField.Value);

                            // DateTime endate = Convert.ToDateTime(txtToDate.Text);
                            //  int totalDates = (endate - stdate).Days;

                      
                            //string dt = txtcal.Text;
                            //DateTime date = DateTime.ParseExact(txtcal.Text, "M/d/yyyy", CultureInfo.InvariantCulture);
                            //lblerror.Text = DropDownList1.SelectedItem.Text;
                            OleDbCommand cmd = new OleDbCommand("INSERT into Timesheet ([Name],[Date],[Process],[QCno],[Hours],[Description])" + " values (@name,@date,@process,@qcno,@hours,@desc)", connection);
                            cmd.Parameters.Add("@name", OleDbType.Char).Value = txtUserName.Text;
                            cmd.Parameters.Add("@date", OleDbType.Char).Value = stdate;
                            cmd.Parameters.Add("@process", OleDbType.Integer).Value = ddlProcess.SelectedValue;
                            //if (ddlQCNo.SelectedIndex >= 0)
                            if (Dummy.Text != "")
                                cmd.Parameters.Add("@qcno", OleDbType.Char).Value = Dummy.Text;
                            else if (ddlProcess.SelectedItem.Text.Contains("XXXXX"))
                                cmd.Parameters.Add("@qcno", OleDbType.Char).Value = ddlQcNo.SelectedItem.Text;
                            else
                                cmd.Parameters.Add("@qcno", OleDbType.Char).Value = "";
                            cmd.Parameters.Add("@hours", OleDbType.Char).Value = txtHour4.Text;
                            cmd.Parameters.Add("@desc", OleDbType.Char).Value = txtDescription.Text;
                            //cmd.Connection = connection;
                            cmd.ExecuteNonQuery();
                            connection.Close();
                        }
                    }
                    if (txtHour5.Text != "" && txtHour5.Text != "0")
                    {
                        if (connection.State == ConnectionState.Closed)
                        {
                            connection.Open();
                        }

                        OleDbCommand commandtest = new OleDbCommand();
                        commandtest.Connection = connection;
                        // if (ddlQCNo.SelectedIndex >= 0)
                        if (Dummy.Text != "")
                            commandtest.CommandText = "select Name,Date,Process,QCno from Timesheet where Name='" + txtUserName.Text + "' and cdate(format(Date,'M/d/yyyy hh:mm:ss'))=#" + Convert.ToDateTime(hour5HiddenField.Value) + "# and Process=" + Convert.ToInt32(ddlProcess.Text) + " and QCno='" + Dummy.Text + "'";
                     
                        else if (ddlProcess.SelectedItem.Text.Contains("XXXXX"))
                            commandtest.CommandText = "select Name,Date,Process,QCno from Timesheet where Name='" + txtUserName.Text + "' and cdate(format(Date,'M/d/yyyy hh:mm:ss'))=#" + Convert.ToDateTime(hour5HiddenField.Value) + "# and Process=" + Convert.ToInt32(ddlProcess.Text) + " and QCno='" + ddlQcNo.SelectedItem.Text + "'";
                        else
                            commandtest.CommandText = "select Name,Date,Process,QCno from Timesheet where Name='" + txtUserName.Text + "' and cdate(format(Date,'M/d/yyyy hh:mm:ss'))=#" + Convert.ToDateTime(hour5HiddenField.Value) + "# and Process=" + Convert.ToInt32(ddlProcess.Text) + "";
                        OleDbDataReader reader = commandtest.ExecuteReader();

                        if (reader.HasRows)
                        {

                            lblError5.Text = "Process already exists for the date " + hour5HiddenField.Value;
                            connection.Close();
                        }
                        else
                        {
                            DateTime stdate = Convert.ToDateTime(hour5HiddenField.Value);

                            // DateTime endate = Convert.ToDateTime(txtToDate.Text);
                            //  int totalDates = (endate - stdate).Days;

                        
                            //string dt = txtcal.Text;
                            //DateTime date = DateTime.ParseExact(txtcal.Text, "M/d/yyyy", CultureInfo.InvariantCulture);
                            //lblerror.Text = DropDownList1.SelectedItem.Text;
                            OleDbCommand cmd = new OleDbCommand("INSERT into Timesheet ([Name],[Date],[Process],[QCno],[Hours],[Description])" + " values (@name,@date,@process,@qcno,@hours,@desc)", connection);
                            cmd.Parameters.Add("@name", OleDbType.Char).Value = txtUserName.Text;
                            cmd.Parameters.Add("@date", OleDbType.Char).Value = stdate;
                            cmd.Parameters.Add("@process", OleDbType.Integer).Value = ddlProcess.SelectedValue;
                            //if (ddlQCNo.SelectedIndex >= 0)
                            if (Dummy.Text != "")
                                cmd.Parameters.Add("@qcno", OleDbType.Char).Value = Dummy.Text;
                            else if (ddlProcess.SelectedItem.Text.Contains("XXXXX"))
                                cmd.Parameters.Add("@qcno", OleDbType.Char).Value = ddlQcNo.SelectedItem.Text;
                            else
                                cmd.Parameters.Add("@qcno", OleDbType.Char).Value = "";
                            cmd.Parameters.Add("@hours", OleDbType.Char).Value = txtHour5.Text;
                            cmd.Parameters.Add("@desc", OleDbType.Char).Value = txtDescription.Text;
                            //cmd.Connection = connection;
                            cmd.ExecuteNonQuery();
                            connection.Close();
                        }
                    }
                }
            }

            catch (Exception ex)
            {
               // Response.Write("The error is :" + ex);
                Response.Write("<script>alert('You are not assigned with any QC')</script>");

            }
            BindGridView();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Savedata();
            txtHour1.Text = "";
            txtHour2.Text = "";
            txtHour3.Text = "";
            txtHour4.Text = "";
            txtHour5.Text = "";
            Dummy.Text = "";
           // txtcal.Text = "";
           // BindGridView();
        }


        //protected void Old_Click1(object sender, EventArgs e)
        //{

        //    Response.Redirect("Timesheet.aspx");
        //}

        protected void AccessDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void BtnLogOut_Click(object sender, ImageClickEventArgs e)
        {
            Session["ID"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void ImageBtnSerach_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("search.aspx");
        }

        protected void btnPasswordChange_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("changePassword.aspx");
        }
      
    }
}