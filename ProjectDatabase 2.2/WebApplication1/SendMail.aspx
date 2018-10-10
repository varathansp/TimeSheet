<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendMail.aspx.cs" Inherits="NewWebMail.Home" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <style type="text/css">
        #header
        {
            height: 75px;
            width:auto;
            background-color:#6DAB4C;   
            font-size:20px;
        }
        #body1
        {
            height:394px;
             width:auto;
            background-color:#89C35C;
            text-align:center;
        }
         .body2
        {
            height:auto;
             width:auto;
            background-color:#89C35C;
            text-align:center;
        }
        .style2
        {
            width: 128px;
            height: 67px;
        }
        .style7
        {
            width: 320px;
            height: 67px;
            text-align:center;
        }
        .style11
        {
            height: 67px;
            width: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="header">
     <asp:Label ID="lblUser" runat="server" style="float:left"></asp:Label><asp:Label ID="lblDate" runat="server" ForeColor="Blue" style="float:right"></asp:Label>
        <br />
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">

            <ContentTemplate>
                <asp:Button ID="btnSignOut" runat="server" Text="Back" Height="19px"  
                    Width="100px" BorderColor="#0000CC" BorderStyle="Solid" BorderWidth="1px" 
                    style="margin-left: 0px" onclick="btnSignOut_Click" BackColor="#333333" 
                    ForeColor="White"/>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                
            </ContentTemplate>
        </asp:UpdatePanel>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
    <hr style="height: 5px;background-color: #123455;border:none;"/>
    <div id="body1"><br />
    CHOOSE START DATE AND END DATE TO SEE THE TIMESHEET STATUS<br />
        <br />
        <br />
        <br />
        <center><table style="width:71%; height: 93px;">
            <tr>
                <td class="style7">
                    FROM DATE</td>
                <td class="style2">
                    <asp:TextBox ID="FrmDateCal" runat="server" Width="213px" 
                        ontextchanged="TextBox1_TextChanged" BackColor="#999999"></asp:TextBox>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" 
                        TargetControlID="FrmDateCal" PopupButtonID="ImageButton1"/>
                    
                </td>
                
                <td class="style11">
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="20px" 
                        ImageUrl="~/n2NRo.png" onclick="ImageButton1_Click" 
                        style="margin-bottom: 0px" Width="40px" />
                </td>
                <td class="style7">
                    TO DATE</td>
                
                     <td class="style2">
                         <asp:TextBox ID="ToDateCal" runat="server" Width="213px" 
                             ontextchanged="TextBox2_TextChanged" BackColor="#999999" ></asp:TextBox>
                         <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" 
                             TargetControlID="ToDateCal" PopupButtonID="ImageButton2"/>
                        
                </td>
                <td class="style11">
                    <asp:ImageButton ID="ImageButton2" runat="server" Height="20px" 
                        ImageUrl="~/n2NRo.png" Width="40px"/>
                </td>

            </tr>
  
        </table>
            <br />
            <asp:Label ID="lblDateError" runat="server" ForeColor="#990000" 
                Font-Bold="True" Font-Size="Medium"></asp:Label>
            <br />
            <br />
            ENTER MINIMUM HOURS TO COMPLETE&nbsp;
            <asp:TextBox ID="txtHours" runat="server" Height="24px" 
                ontextchanged="TextBox1_TextChanged1" style="margin-left: 12px" 
                Width="60px" BackColor="#999999"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <br />
        </center>
        <br />
        <br />
        &nbsp&nbsp&nbsp<asp:Button ID="btnGo" 
            runat="server" Text="GO" Height="29px" Width="67px" onclick="btnGo_Click"
            BackColor="#333333" BorderColor="#0000CC" BorderStyle="Solid" BorderWidth="1px" 
            ForeColor="White" />
        <br />
        <br />
        <asp:Label ID="lblError" runat="server" ForeColor="#990000" Font-Bold="True" 
            Font-Size="Medium"></asp:Label>
        <br />
        <br />
                <br />
        <br />
                        <br />
   </div>
   <div class="body2">
   
      <center>
      <asp:GridView ID="GridView1" runat="server" 
              onselectedindexchanged="GridView1_SelectedIndexChanged" 
              onrowdatabound="GridView1_RowDataBound" Width="401px">
          <Columns>
              <asp:TemplateField>
                  <HeaderTemplate>
                      <asp:CheckBox ID="CheckBoxParent" runat="server"  onclick="AllSelect(this)" 
                          oncheckedchanged="CheckBoxParent_CheckedChanged" />
                  </HeaderTemplate>
                  <ItemTemplate>
                      <asp:CheckBox ID="CheckBoxChild" runat="server" onclick="ChildCheckBoxSelect(this)" />
                  </ItemTemplate>
                   
              </asp:TemplateField>

          </Columns>
       </asp:GridView>
      </center> 
       
    </div>
   
   <div class="body2">
        
       <br />
       <br />
       Cc: 
       <asp:TextBox ID="TxtBoxCc" runat="server" Height="29px" 
           ontextchanged="TxtBoxCc_TextChanged" Width="196px" BackColor="#999999"></asp:TextBox>
       <br />
        
       <br />
       <asp:Button ID="sendMail" runat="server" onclick="Button1_Click"
           Text="Send Mail" Width="76px" BackColor="#333333" BorderColor="#0000CC" 
           BorderWidth="1px" ForeColor="White" />
       <br />
       <br />
       <asp:Label ID="lblMail" runat="server"></asp:Label>
       <br />
       <br />

       <script type="text/javascript" language="javascript">
           function AllSelect(check) {
               var gridview = document.getElementById("GridView1");
               for (var i = 1; i < gridview.rows.length; i++) {
                   gridview.rows[i].cells[0].getElementsByTagName("INPUT")[0].checked = check.checked;
                   if (check.checked) {
                       gridview.rows[i].cells[1].style.backgroundColor = "grey";
                   }
                   else {
                       gridview.rows[i].cells[1].style.backgroundColor = "#89C35C";
                   }
               }
           }

           function ChildCheckBoxSelect(check) {
               var gridview = document.getElementById("GridView1");
               var childCheckBoxUncheck = false;
               for (var i = 1; i < gridview.rows.length; i++) {
                   if (gridview.rows[i].cells[0].getElementsByTagName("INPUT")[0].checked == false) {

                       childCheckBoxUncheck = true;
                       gridview.rows[i].cells[1].style.backgroundColor = "#89C35C";
                   }
                   else {
                       gridview.rows[i].cells[1].style.backgroundColor = "grey";
                   }
               }
               gridview.rows[0].cells[0].getElementsByTagName("INPUT")[0].checked = !childCheckBoxUncheck;

           }

           /*function DateCheck(f2) {
               var fromdt = document.getElementById(f1).value;
               var todt = document.getElementById(f2).value;
               var errorMsg = document.getElementById("lblDateError");
               if (fromdt<todt) {
                   errorMsg.innerHTML = "FROM DATE should be earlier than TO DATE";
               }*/
           
    </script>
        
   </div>
    </form>
</body>
</html>
