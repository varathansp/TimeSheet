using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.OleDb;
using System.Data;
using System.Drawing;
using outlook = Microsoft.Office.Interop.Outlook;

namespace NewWebMail
{
    public partial class Home : System.Web.UI.Page
    {
        String connection = ConfigurationManager.ConnectionStrings["AccessConnectionString"].ToString();
        OleDbConnection con = new OleDbConnection();
        OleDbCommand cmd = new OleDbCommand();
        OleDbDataReader reader = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] != null)
            {
                DateTime today = DateTime.Today;
                lblDate.Text = "DATE:" + " " + today.ToShortDateString();
                string uname = (string)Session["ID"];
                lblUser.Text = "Welcome" + " " + uname + ",";
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            lblError.Text = "";
            
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {


        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            try
            {
               DateTime FromDate = Convert.ToDateTime(FrmDateCal.Text);
               DateTime ToDate=Convert.ToDateTime(ToDateCal.Text);
                int result = DateTime.Compare(FromDate ,ToDate);

                if (result < 0 || result==0)
                {
                
                    con.ConnectionString = connection.ToString();
                    con.Open();
                    OleDbCommand cmd = new OleDbCommand();
                    cmd.Connection = con;
                    //String query = "SELECT NAME,SUM(HOURS) AS [TOTAL HOURS] FROM TIMESHEET WHERE cdate(format(DATE,'M/d/yyyy hh:mm:ss')) BETWEEN #" + FrmDateCal.Text + "# AND #" + ToDateCal.Text + "# GROUP BY NAME UNION ALL SELECT LOGIN.USERNAME as NAME,'0' as HOURS FROM LOGIN WHERE LOGIN.USERNAME NOT IN (SELECT TIMESHEET.NAME FROM TIMESHEET GROUP BY TIMESHEET.NAME)";
                    String query = "(select  l.username as NAME,sum(t.hours) as [HOURS] from login l left join (select ts.name as NAME,sum(ts.hours) as [HOURS] from timesheet ts where cdate(format(DATE,'M/d/yyyy hh:mm:ss')) BETWEEN #" + FrmDateCal.Text + "# AND #" + ToDateCal.Text + "# group by name) t on l.username=t.name group by username) ";

                    OleDbDataAdapter da = new OleDbDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    string hours = txtHours.Text;
                    if (dt.Rows.Count > 0)
                    {
                        GridView1.DataSource = dt;

                        GridView1.DataBind();
                        for (int i = 0; i < GridView1.Rows.Count; i++)
                        {
                            string value = GridView1.Rows[i].Cells[2].Text;
                            if (GridView1.Rows[i].Cells[2].Text == "&nbsp;")
                            {
                                GridView1.Rows[i].Cells[2].Text = "0";
                            }
                        }
                        GridView1.Visible = true;
                        GridView1.Dispose();
                        sendMail.Visible = true;

                        if (hours != "")
                        {
                            for (int i = 0; i < GridView1.Rows.Count; i++)
                            {
                                if (Convert.ToInt32(GridView1.Rows[i].Cells[2].Text) < Convert.ToInt32(hours))
                                {
                                    GridView1.Rows[i].Cells[2].BackColor = Color.Red;
                                }
                            }
                        }
                    }
                   

                    else
                    {

                        lblError.Text = "No result found";

                    }
                
              }
             
              else
              {
                  lblError.Text = "**FROM DATE should always be earlier than TO DATE**";
                  GridView1.Visible = false;
              }    
                  con.Close();
               
            }
               
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }
       

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                con.ConnectionString = connection.ToString();
                con.Open();
                cmd.Connection = con;
                if (Session["ID"] != null)
                {
                    string loginName = (string)Session["ID"];
                   // fromEmailId = LoginEmailId(loginName);
                }

                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    CheckBox ck = (CheckBox)GridView1.Rows[i].FindControl("CheckBoxChild");
                    if (ck.Checked == true)
                    {

                        string uname = GridView1.Rows[i].Cells[1].Text;
                        SendMailToSelectedEmp(uname);
                    }

                }
               
                lblMail.Text = "Mail sent successfully";
                con.Close();
                        
                
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }
        protected void SendMailToSelectedEmp(string username)
        {
            
            String query = "SELECT MAILID FROM LOGIN WHERE USERNAME = '" + username + "'";
            cmd.CommandText = query;
            reader = cmd.ExecuteReader();
            outlook._Application _app = new outlook.Application();
            outlook.MailItem mail = (outlook.MailItem)_app.CreateItem(outlook.OlItemType.olMailItem);
           
            if (reader.Read())
            {
                string Tomailid = reader.GetString(0);
              
                mail.To = Tomailid;
                //loginName=mail.SenderName;
               // mail.SenderEmailAddress= fromEmailId;

                if (TxtBoxCc.Text != "" )
                {
                mail.CC = TxtBoxCc.Text; 
                }

                mail.Subject = "NOTIFICATION MAIL REGARDING MASSMUTUAL TIMESHEET";
                mail.Body = "Hello, You have not completed minimum hours of "+ txtHours.Text+" in timesheet between " +FrmDateCal.Text+" and "+ToDateCal.Text+"."+
                            "Please fill the timesheet according to your working hours";
                mail.Importance = outlook.OlImportance.olImportanceHigh;

                ((outlook._MailItem)mail).Send();

            }
            reader.Close();
            
        }
        protected string LoginEmailId(string name)
        {
            String query = "SELECT USERNAME FROM LOGIN WHERE USERNAME = '" + name + "'";
            string fromId = null;
            cmd.CommandText = query;
            reader = cmd.ExecuteReader();
            if (reader.Read())
            {
              fromId = reader.GetString(0);
            }
            reader.Close();
            return fromId;
        }

        protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void TxtBoxCc_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged1(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onmouseover", "this.style.fontWeight='bold',this.style.color='blue'");
                e.Row.Attributes.Add("onmouseout", "this.style.fontWeight='normal',this.style.color='black'");
            
            }
        }

       

        protected void Button1_Click1(object sender, EventArgs e)
        {

        }

        protected void Button1_Click2(object sender, EventArgs e)
        {

        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("Timesheet2.aspx");
        }

        protected void CheckBoxParent_CheckedChanged(object sender, EventArgs e)
        {

        }

        }

       
    }
