

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Timesheet2.aspx.cs" Inherits="WebApplication1.Timesheet2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Time Sheet</title>
    <link rel="icon" type="image/png" href="Content/icon.png">
    <style type="text/css">
   
        .Background

        {

            background-color: Transparent;

            filter: alpha(opacity=90);

            opacity: 0.8;

        }

        .Popup

        {
        
           background-color : #002F6C; 
          
          

            padding-top: 10px;

            padding-left: 10px;

            width: 1080px;

            height: 290px;
   

 border: 1px solid #CCCCCC;
          -moz-box-shadow:3.5px 4px 5px #000000;
  -webkit-box-shadow:3.5px 4px 5px #000000;
  box-shadow:3.5px 4px 5px #000000;

  border-radius:5px;
  -moz-border-radiux:5px;
  -webkit-border-radiux:5px;
 


        }

        .lbl

        {

            font-size:16px;

            font-style:italic;

            font-weight:bold;

        }
.customlink
{ color: white;
  padding-right:10px;
    }
   
        .style3
        {
            width: 100px;
        }
        .style4
        {
            width: 119px;
        }
        
        
        .style6
        {
            width: 57px;
        }
                
        
         table {
   
}
        
        .style14
        {
            width: 137px;
        }
         table.center {
   
}
      
        
        .style15
        {
            width: 89px;
        }
        
        .labelcss {    
    position: absolute;  
    top: 100px;  
    right: 10px;
}
    </style>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="Scripts/jquery-3.3.1.js" type="text/javascript"></script>
        <script src="Scripts/jquery-1.12.4.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui-1.12.1.js" type="text/javascript"></script>
    <link href="Scripts/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="Content/Header/css/bootstrap.min.css" rel="stylesheet" type="text/css" /> 
        <link href="Content/Header/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="Content/Header/css/style.css" rel="stylesheet" type="text/css" />


        <link href="Content/TimeSheetBootstrap/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="Content/TimeSheetBootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/TimeSheetBootstrap/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/TimeSheetBootstrap/icon-font.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/TimeSheetBootstrap/animate.css" rel="stylesheet" type="text/css" />
    <link href="Content/TimeSheetBootstrap/hamburgers.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/TimeSheetBootstrap/animisition.css" rel="stylesheet" type="text/css" />
    <link href="Content/TimeSheetBootstrap/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/TimeSheetBootstrap/daterangepicker.css" rel="stylesheet" type="text/css" />
    <link href="Content/TimeSheetBootstrap/util.css" rel="stylesheet" type="text/css" />
    <link href="Content/TimeSheetBootstrap/main.css" rel="stylesheet" type="text/css" />
    <%--  <link href="Content/Login_v15/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/Login_v15/fonts/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/Login_v15/fonts/Linearicons-Free-v1.0.0/icon-font.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/Login_v15/vendor/animate/animate.css" rel="stylesheet" type="text/css" />
    <link href="Content/Login_v15/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/Login_v15/vendor/animsition/css/animsition.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/Login_v15/vendor/select2/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/Login_v15/vendor/daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css" />
    <link href="Content/Login_v15/css/util.css" rel="stylesheet" type="text/css" />
    <link href="Content/Login_v15/css/main.css" rel="stylesheet" type="text/css" />--%>
    <script type="text/javascript" language="javascript">

        $(document).ready(function () {
            document.getElementById("lblHour1").innerText = document.getElementById('<%=hour1HiddenField.ClientID%>').value;
            document.getElementById("lblHour2").innerText = document.getElementById('<%=hour2HiddenField.ClientID%>').value;
            document.getElementById("lblHour3").innerText = document.getElementById('<%=hour3HiddenField.ClientID%>').value;
            document.getElementById("lblHour4").innerText = document.getElementById('<%=hour4HiddenField.ClientID%>').value;
            document.getElementById("lblHour5").innerText = document.getElementById('<%=hour5HiddenField.ClientID%>').value;

    
        });

       
    
        $(function () {
            $('#txtcal').datepicker(
    {
        dateFormat: 'mm/dd/yy',
        changeMonth: true,
        changeYear: true,
        yearRange: '1950:2100'
    });
        })
function validation() {
    var ans;
    if (document.getElementById("txtcal").value == "")
     {
         document.getElementById("lblDateError").innerHTML = "Please select Week";

       ans=false;
   } 
     else {
       document.getElementById("lblDateError").innerHTML = "";
   
   
         }
    var e = document.getElementById("ddlProcess");
    var strUser1 = e.options[e.selectedIndex].text;
    if (strUser1 == "_____SELECT_____") //for text use if(strUser1=="Select")  
    {
       
        document.getElementById("lblProcessError").innerHTML = "Please select Process";
        ans=false;
    }

    else {
  
        document.getElementById("lblProcessError").innerHTML = "";

    }
    if (document.getElementById("txtcal").value != "" && strUser1 != "_____SELECT_____") {
        ans = true;
    }
    return ans;
        }
        
    
    </script>

</head>
<body>
   
<div class="site-header">
        <div class="top">
            <div class="container">
                <div class="row">
                    <div>
                      <p>  &nbsp;&nbsp; &nbsp;&nbsp;MM Time Entry &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           &nbsp;&nbsp;&nbsp;&nbsp;          &nbsp;&nbsp;
                          
                           
                          
                             <asp:HyperLink ID="HyperLinkQc" runat="server" CssClass="customlink"  NavigateUrl="~/ManageQC.aspx">ManageQc</asp:HyperLink>
                               <asp:HyperLink ID="HyperLinkReport" runat="server" CssClass="customlink"  NavigateUrl="~/reports.aspx">Report</asp:HyperLink>
                               <asp:HyperLink ID="HyperLinkEmail" runat="server" CssClass="customlink"  NavigateUrl="~/SendMail.aspx">Email</asp:HyperLink></p>
                       
                       
                    </div>
              
                </div>
            </div>
        </div> 
        <div class="container">
           
            <img src="Content/Header/Images/MM_logo.png" alt="Post"/>
            <ul>
  
</ul>

       </div>	         
</div>
    <form id="form1" runat="server">

       <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
   <asp:Button ID="Button2" runat="server" class="login100-form-btn1" Text="Sat & Sun" /><asp:HyperLink ID="HyperLink1" runat="server" 
    NavigateUrl="~/Timesheet.aspx" style="color:Green">Click here for old Time Entry Page</asp:HyperLink>


 

&nbsp;<cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panl1" TargetControlID="Button2"

    CancelControlID="Button3" BackgroundCssClass="Background">
     <Animations>
            <OnShown><Fadein Duration="0.50" /></OnShown>
            <OnHiding><Fadeout Duration="0.50" /></OnHiding>
        </Animations>
</cc1:ModalPopupExtender>

<asp:Panel ID="Panl1" runat="server" CssClass="Popup" align="center" style = "display:none">

    <iframe style=" width: 1050px; height: 260px;background-color:white" id="irm1" src="SingleDateEntry.aspx" runat="server"></iframe>

  
 <asp:Button ID="Button3" runat="server" class="login100-form-btn1" Text="Close" />
 

</asp:Panel>

                              
                
<div class="labelcss">
    <b>  Welcome&nbsp;&nbsp;<asp:Label ID="txtUserName"  runat="server"></asp:Label></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;<asp:ImageButton
        ID="btnPasswordChange" runat="server"   Height="20px"     Width="20px" 
        ImageUrl="Content/password.png" title="change password" onclick="btnPasswordChange_Click" />&nbsp;&nbsp;
    <asp:ImageButton ID="ImageBtnSerach" runat="server"  Height="17px"     Width="17px" 
        ImageUrl="Content/sear.png" title="self report" onclick="ImageBtnSerach_Click"/>&nbsp;&nbsp;<asp:ImageButton
        ID="BtnLogOut" runat="server"   Height="20px"     Width="20px" 
        ImageUrl="Content/logout.jpg" title="logout" onclick="BtnLogOut_Click"/></div>
  
 
        <table  frame="below" class="table tab-content table-bordered table-active" >
            <tr class="table tab-content table-bordered table-active">
                <td class="style15">
                    Week</td>
                <td class="style3" >
                    Process</td>
                <td class="style4" >
                    Qc No</td>
                <td  class="style6">
                    <asp:Label ID="lblHour1" runat="server" ClientIDMode="Static" Width="87px" 
                        Text="Mon"></asp:Label>
                </td>
                <td class="style6">
                    <asp:Label ID="lblHour2" runat="server" Text="Tue"  Width="87px"></asp:Label>
                </td>
                <td  class="style6">
                    <asp:Label ID="lblHour3" runat="server" Text="Wed"  Width="87px"></asp:Label>
                </td>
                <td  class="style6">
                    <asp:Label ID="lblHour4" runat="server" Text="Thu"  Width="87px"></asp:Label>
                </td>
                <td  class="style6">
                    <asp:Label ID="lblHour5" runat="server" Text="Fri"  Width="87px"></asp:Label>
                </td>
                <td class="style14" >
                    Description</td>
            </tr>
            <tr>
                <td class="style15">
              
                    <asp:TextBox ID="txtcal" runat="server" style="text-align: center" Width="87px"></asp:TextBox>
                   </td>
                <td class="style3">
                    <asp:DropDownList ID="ddlProcess" runat="server" >
                    </asp:DropDownList>

                </td>
                <td class="style4">
                    <asp:DropDownList ID="ddlQcNo" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="style6">
                    <asp:TextBox ID="txtHour1" runat="server" style="text-align: center" Width="50px"></asp:TextBox>
                </td>
                <td class="style6">
                    <asp:TextBox ID="txtHour2" runat="server" style="text-align: center" Width="50px"></asp:TextBox>
                </td>
                <td class="style6">
                    <asp:TextBox ID="txtHour3" runat="server" style="text-align: center" Width="50px"></asp:TextBox>
                </td>
                <td class="style6">
                    <asp:TextBox ID="txtHour4" runat="server" style="text-align: center" Width="50px"></asp:TextBox>
                </td>
                <td class="style6">
                    <asp:TextBox ID="txtHour5" runat="server" style="text-align: center" Width="50px"></asp:TextBox>
                </td>
                <td class="style14">
                    <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style15">
                    <asp:Label ID="lblDateError" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td class="style3">
                    <asp:Label ID="lblProcessError" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td class="style4">
                    <asp:Label ID="lblQcNotification" runat="server"></asp:Label>
                </td>
                <td class="style6">
                    <asp:Label ID="lblError1" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td class="style6">
                    <asp:Label ID="lblError2" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td class="style6">
                    <asp:Label ID="lblError3" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td class="style6">
                    <asp:Label ID="lblError4" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td class="style6">
                    <asp:Label ID="lblError5" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td class="style14">
                <div class="container-login100-form-btn">   <asp:Button ID="btnAdd" runat="server" class="login100-form-btn1" OnClientClick="return validation()" onclick="btnAdd_Click" 
                        Text="Add to List" /></div>
                    &nbsp;</td>
            </tr>
            </table>
            <div class="container-login100-form-btn">   
             <asp:Button ID="Button1" runat="server" class="login100-form-btn1" onclick="Button1_Click" Text="View Entry" />
                <asp:Label ID="lblWeeksum" runat="server"></asp:Label>
    </div>
    
   <asp:GridView ID="grd" runat="server" AutoGenerateColumns="false" CssClass="table tab-content table-bordered table-active table-hover"
                BackColor="White" BorderColor="White" onrowcancelingedit="grd_RowCancelingEdit" 
                onrowdatabound="grd_RowDataBound" onrowdeleting="grd_RowDeleting" 
                onrowediting="grd_RowEditing" onrowupdating="grd_RowUpdating" 
          
                style="margin-top: 94px;"
              >
                <Columns>
                    <asp:TemplateField headertext="ID" Visible="false">
                        <itemtemplate>
                            <asp:Label ID="lblid" runat="server" text='<%#Eval("ID")%>'></asp:Label>
                        </itemtemplate>
                    </asp:TemplateField>
                    <asp:TemplateField headertext="Name">
                        <itemtemplate>
                            <asp:Label ID="lblname" runat="server" Text='<%#Eval("Name")%>'>&gt;</asp:Label>
                        </itemtemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date">
                        <ItemTemplate>
                            <asp:Label ID="lbldate" runat="server" Text='<%#Convert.ToDateTime(Eval("Date")).ToString("dd-MMM-yyyy")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="textboxdate" runat="server" Height="24px" 
                                Text='<%#Eval("Date")%>' Width="100px"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Process">
                        <ItemTemplate>
                            <asp:Label ID="lblprocess" runat="server" Text='<%#Eval("ProcessName")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" 
                                DataSourceID="AccessDataSource1" DataTextField="ProcessName" 
                                DataValueField="Process_ID" Height="24px" 
                                SelectedText='<%#Eval("ProcessName")%>' SelectedValue='<%#Eval("Process_ID")%>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="QCno">
                        <ItemTemplate>
                            <asp:Label ID="lblqc" runat="server" Text='<%#Eval("QCno")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                           <%-- <asp:TextBox ID="textboxqcno" runat="server" Height="24px" 
                                  Text='<%#Eval("QCno")%>' Width="100px"></asp:TextBox>--%>
                                <asp:DropDownList ID="DropDownList2" runat="server" 
                                DataSourceID="AccessDataSource2" DataTextField="QC_No" 
                                DataValueField="QC_No" Height="24px" >
                            </asp:DropDownList>
                            
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Hours">
                        <ItemTemplate>
                            <asp:Label ID="lblhours" runat="server" Style="text-align:right" 
                                Text='<%#Eval("Hours")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="textboxhours" runat="server" Height="24px" 
                                Style="text-align:right" Text='<%#Eval("Hours")%>' Width="100px"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Description">
                        <ItemTemplate>
                            <asp:Label ID="lbldesc" runat="server" Text='<%#Eval("Description")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="textboxdesc" runat="server" Height="24px" 
                                Text='<%#Eval("Description")%>' Width="100px"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField CausesValidation="false" ShowEditButton="true" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="Linkbutton2" runat="server"  CausesValidation="false" 
                                CommandName="Delete" 
                                OnClientClick="return confirm('Are you sure to Delete the entry?');" 
                                Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
               <%-- <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />--%>
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
<%--                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />--%>
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
            </asp:GridView>
   
       <div> <asp:HiddenField ID="hour1HiddenField" runat="server" />
        <asp:HiddenField ID="hour2HiddenField" runat="server" />
        <asp:HiddenField ID="hour3HiddenField" runat="server" />
        <asp:HiddenField ID="hour4HiddenField" runat="server" />
        <asp:HiddenField ID="hour5HiddenField" runat="server" />

       </div>
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="C:\ProjectDatabase\MMTimeSheetDB.accdb"
        SelectCommand="SELECT ProcessName, Min(Process_ID) as Process_ID FROM Process Group
 BY  ProcessName" 
     ></asp:AccessDataSource>
      <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
            DataFile="C:\ProjectDatabase\MMTimeSheetDB.accdb"
            
            SelectCommand="SELECT [QC NO] AS QC_No FROM [EmpQcDetails] WHERE ([Emp NO] = (SELECT ID FROM Login WHERE UserName = ?) )">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtUserName" Name="Emp_NO" PropertyName="Text" 
                    Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>
  <script type="text/javascript" language="javascript">
      function addDays(date, days) {
          var result = new Date(date);
          result.setDate(result.getDate() + days);
          return result;
      }
      $("#txtcal").on('change keyup paste input', function () {

          document.getElementById("lblHour1").value = "";
          var day2 = document.getElementById("txtcal").value;
          var day3 = new Date(day2);
          switch (day3.getDay()) {
              case 0:
                  //day = "Sunday";
                  var d1 = addDays(day2, 1);
                  document.getElementById("lblHour1").innerText = (d1.getMonth() + 1) + "/" + d1.getDate() + "/" + d1.getFullYear();
                  var d2 = addDays(day2, 2);
                  document.getElementById("lblHour2").innerText = (d2.getMonth() + 1) + "/" + d2.getDate() + "/" + d2.getFullYear();
                  var d3 = addDays(day2, 3);
                  document.getElementById("lblHour3").innerText = (d3.getMonth() + 1) + "/" + d3.getDate() + "/" + d3.getFullYear();
                  var d4 = addDays(day2, 4);
                  document.getElementById("lblHour4").innerText = (d4.getMonth() + 1) + "/" + d4.getDate() + "/" + d4.getFullYear();
                  var d5 = addDays(day2, 5);
                  document.getElementById("lblHour5").innerText = (d5.getMonth() + 1) + "/" + d5.getDate() + "/" + d5.getFullYear();
                  document.getElementById('<%=hour1HiddenField.ClientID%>').value = document.getElementById("lblHour1").innerText;
                  document.getElementById('<%=hour2HiddenField.ClientID%>').value = document.getElementById("lblHour2").innerText;
                  document.getElementById('<%=hour3HiddenField.ClientID%>').value = document.getElementById("lblHour3").innerText;
                  document.getElementById('<%=hour4HiddenField.ClientID%>').value = document.getElementById("lblHour4").innerText;
                  document.getElementById('<%=hour5HiddenField.ClientID%>').value = document.getElementById("lblHour5").innerText;
                  break;
              case 1:

                  var d1 = addDays(day2, 0);
                  document.getElementById("lblHour1").innerText = (d1.getMonth() + 1) + "/" + d1.getDate() + "/" + d1.getFullYear();
                  var d2 = addDays(day2, 1);
                  document.getElementById("lblHour2").innerText = (d2.getMonth() + 1) + "/" + d2.getDate() + "/" + d2.getFullYear();
                  var d3 = addDays(day2, 2);
                  document.getElementById("lblHour3").innerText = (d3.getMonth() + 1) + "/" + d3.getDate() + "/" + d3.getFullYear();
                  var d4 = addDays(day2, 3);
                  document.getElementById("lblHour4").innerText = (d4.getMonth() + 1) + "/" + d4.getDate() + "/" + d4.getFullYear();
                  var d5 = addDays(day2, 4);
                  document.getElementById("lblHour5").innerText = (d5.getMonth() + 1) + "/" + d5.getDate() + "/" + d5.getFullYear();
                  document.getElementById('<%=hour1HiddenField.ClientID%>').value = document.getElementById("lblHour1").innerText;
                  document.getElementById('<%=hour2HiddenField.ClientID%>').value = document.getElementById("lblHour2").innerText;
                  document.getElementById('<%=hour3HiddenField.ClientID%>').value = document.getElementById("lblHour3").innerText;
                  document.getElementById('<%=hour4HiddenField.ClientID%>').value = document.getElementById("lblHour4").innerText;
                  document.getElementById('<%=hour5HiddenField.ClientID%>').value = document.getElementById("lblHour5").innerText;
                  break;
              case 2:
                  //day = "Tuesday";
                  var d1 = addDays(day2, -1);
                  document.getElementById("lblHour1").innerText = (d1.getMonth() + 1) + "/" + d1.getDate() + "/" + d1.getFullYear();
                  var d2 = addDays(day2, 0);
                  document.getElementById("lblHour2").innerText = (d2.getMonth() + 1) + "/" + d2.getDate() + "/" + d2.getFullYear();
                  var d3 = addDays(day2, 1);
                  document.getElementById("lblHour3").innerText = (d3.getMonth() + 1) + "/" + d3.getDate() + "/" + d3.getFullYear();
                  var d4 = addDays(day2, 2);
                  document.getElementById("lblHour4").innerText = (d4.getMonth() + 1) + "/" + d4.getDate() + "/" + d4.getFullYear();
                  var d5 = addDays(day2, 3);
                  document.getElementById("lblHour5").innerText = (d5.getMonth() + 1) + "/" + d5.getDate() + "/" + d5.getFullYear();
                  document.getElementById('<%=hour1HiddenField.ClientID%>').value = document.getElementById("lblHour1").innerText;
                  document.getElementById('<%=hour2HiddenField.ClientID%>').value = document.getElementById("lblHour2").innerText;
                  document.getElementById('<%=hour3HiddenField.ClientID%>').value = document.getElementById("lblHour3").innerText;
                  document.getElementById('<%=hour4HiddenField.ClientID%>').value = document.getElementById("lblHour4").innerText;
                  document.getElementById('<%=hour5HiddenField.ClientID%>').value = document.getElementById("lblHour5").innerText;
                  break;
              case 3:
                  //  day = "Wednesday";
                  var d1 = addDays(day2, -2);
                  document.getElementById("lblHour1").innerText = (d1.getMonth() + 1) + "/" + d1.getDate() + "/" + d1.getFullYear();
                  var d2 = addDays(day2, -1);
                  document.getElementById("lblHour2").innerText = (d2.getMonth() + 1) + "/" + d2.getDate() + "/" + d2.getFullYear();
                  var d3 = addDays(day2, 0);
                  document.getElementById("lblHour3").innerText = (d3.getMonth() + 1) + "/" + d3.getDate() + "/" + d3.getFullYear();
                  var d4 = addDays(day2, 1);
                  document.getElementById("lblHour4").innerText = (d4.getMonth() + 1) + "/" + d4.getDate() + "/" + d4.getFullYear();
                  var d5 = addDays(day2, 2);
                  document.getElementById("lblHour5").innerText = (d5.getMonth() + 1) + "/" + d5.getDate() + "/" + d5.getFullYear();
                  document.getElementById('<%=hour1HiddenField.ClientID%>').value = document.getElementById("lblHour1").innerText;
                  document.getElementById('<%=hour2HiddenField.ClientID%>').value = document.getElementById("lblHour2").innerText;
                  document.getElementById('<%=hour3HiddenField.ClientID%>').value = document.getElementById("lblHour3").innerText;
                  document.getElementById('<%=hour4HiddenField.ClientID%>').value = document.getElementById("lblHour4").innerText;
                  document.getElementById('<%=hour5HiddenField.ClientID%>').value = document.getElementById("lblHour5").innerText;
                  break;
              case 4:
                  //day = "Thursday";
                  var d1 = addDays(day2, -3);
                  document.getElementById("lblHour1").innerText = (d1.getMonth() + 1) + "/" + d1.getDate() + "/" + d1.getFullYear();
                  var d2 = addDays(day2, -2);
                  document.getElementById("lblHour2").innerText = (d2.getMonth() + 1) + "/" + d2.getDate() + "/" + d2.getFullYear();
                  var d3 = addDays(day2, -1);
                  document.getElementById("lblHour3").innerText = (d3.getMonth() + 1) + "/" + d3.getDate() + "/" + d3.getFullYear();
                  var d4 = addDays(day2, 0);
                  document.getElementById("lblHour4").innerText = (d4.getMonth() + 1) + "/" + d4.getDate() + "/" + d4.getFullYear();
                  var d5 = addDays(day2, 1);
                  document.getElementById("lblHour5").innerText = (d5.getMonth() + 1) + "/" + d5.getDate() + "/" + d5.getFullYear();
                  document.getElementById('<%=hour1HiddenField.ClientID%>').value = document.getElementById("lblHour1").innerText;
                  document.getElementById('<%=hour2HiddenField.ClientID%>').value = document.getElementById("lblHour2").innerText;
                  document.getElementById('<%=hour3HiddenField.ClientID%>').value = document.getElementById("lblHour3").innerText;
                  document.getElementById('<%=hour4HiddenField.ClientID%>').value = document.getElementById("lblHour4").innerText;
                  document.getElementById('<%=hour5HiddenField.ClientID%>').value = document.getElementById("lblHour5").innerText;
                  break;
              case 5:
                  // day = "Friday";
                  var d1 = addDays(day2, -4);
                  document.getElementById("lblHour1").innerText = (d1.getMonth() + 1) + "/" + d1.getDate() + "/" + d1.getFullYear();
                  var d2 = addDays(day2, -3);
                  document.getElementById("lblHour2").innerText = (d2.getMonth() + 1) + "/" + d2.getDate() + "/" + d2.getFullYear();
                  var d3 = addDays(day2, -2);
                  document.getElementById("lblHour3").innerText = (d3.getMonth() + 1) + "/" + d3.getDate() + "/" + d3.getFullYear();
                  var d4 = addDays(day2, -1);
                  document.getElementById("lblHour4").innerText = (d4.getMonth() + 1) + "/" + d4.getDate() + "/" + d4.getFullYear();
                  var d5 = addDays(day2, 0);
                  document.getElementById("lblHour5").innerText = (d5.getMonth() + 1) + "/" + d5.getDate() + "/" + d5.getFullYear();
                  document.getElementById('<%=hour1HiddenField.ClientID%>').value = document.getElementById("lblHour1").innerText;
                  document.getElementById('<%=hour2HiddenField.ClientID%>').value = document.getElementById("lblHour2").innerText;
                  document.getElementById('<%=hour3HiddenField.ClientID%>').value = document.getElementById("lblHour3").innerText;
                  document.getElementById('<%=hour4HiddenField.ClientID%>').value = document.getElementById("lblHour4").innerText;
                  document.getElementById('<%=hour5HiddenField.ClientID%>').value = document.getElementById("lblHour5").innerText;
                  break;
              case 6:
                  // day = "Saturday";
                  var d1 = addDays(day2, -5);
                  document.getElementById("lblHour1").innerText = (d1.getMonth() + 1) + "/" + d1.getDate() + "/" + d1.getFullYear();
                  var d2 = addDays(day2, -4);
                  document.getElementById("lblHour2").innerText = (d2.getMonth() + 1) + "/" + d2.getDate() + "/" + d2.getFullYear();
                  var d3 = addDays(day2, -3);
                  document.getElementById("lblHour3").innerText = (d3.getMonth() + 1) + "/" + d3.getDate() + "/" + d3.getFullYear();
                  var d4 = addDays(day2, -2);
                  document.getElementById("lblHour4").innerText = (d4.getMonth() + 1) + "/" + d4.getDate() + "/" + d4.getFullYear();
                  var d5 = addDays(day2, -1);
                  document.getElementById("lblHour5").innerText = (d5.getMonth() + 1) + "/" + d5.getDate() + "/" + d5.getFullYear();
                  document.getElementById('<%=hour1HiddenField.ClientID%>').value = document.getElementById("lblHour1").innerText;
                  document.getElementById('<%=hour2HiddenField.ClientID%>').value = document.getElementById("lblHour2").innerText;
                  document.getElementById('<%=hour3HiddenField.ClientID%>').value = document.getElementById("lblHour3").innerText;
                  document.getElementById('<%=hour4HiddenField.ClientID%>').value = document.getElementById("lblHour4").innerText;
                  document.getElementById('<%=hour5HiddenField.ClientID%>').value = document.getElementById("lblHour5").innerText;
                  break;
          }
      });

      $("#ddlProcess").change(function () {
          
          var e = document.getElementById("ddlProcess");
          var qcdd = document.getElementById("ddlQcNo");
          var selectedTime = e.options[e.selectedIndex].text;

          if (selectedTime.indexOf("XXXXX") > 1) {

              document.getElementById("ddlQcNo").disabled = false;
              qcdd.style.display = "block"; 

          }
          else {
              document.getElementById("ddlQcNo").disabled = true;
              // document.getElementById("ddlQcNo").setAttribute('disabled', true);
              qcdd.style.display = "none"; 
          }


      });
      </script>
      

      
    </form>
  
</body>
</html>

