<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SingleDateEntry.aspx.cs" Inherits="WebApplication1.SingleDateEntry" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script src="Scripts/jquery-3.3.1.js" type="text/javascript"></script>
    <script src="Scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
 
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
    <script type="text/javascript" language="javascript">
        function validation() {
            var ans;
            if (document.getElementById("txtSingleDate").value == "") {
                document.getElementById("lblDateError").innerHTML = "Please select date";

                ans = false;
            }
            else {
                document.getElementById("lblDateError").innerHTML = "";


            }
            var e = document.getElementById("ddlSingleProcess");
            var strUser1 = e.options[e.selectedIndex].text;
            if (strUser1 == "_____SELECT_____") //for text use if(strUser1=="Select")  
            {

                document.getElementById("lblProcessError").innerHTML = "Please select process";
                ans = false;
            }

            else {

                document.getElementById("lblProcessError").innerHTML = "";

            }
            if (document.getElementById("txtSingleHour").value == "") {
                document.getElementById("lblHourError").innerHTML = "Please enter hour";

                ans = false;
            }
            else {
                document.getElementById("lblHourError").innerHTML = "";


            }

            if (document.getElementById("txtSingleDate").value != "" && strUser1 != "_____SELECT_____" && document.getElementById("txtSingleHour").value != "") {
                ans = true;
            }
            return ans;
        }
    </script>
    <style type="text/css">
    .sample
    {
           position: absolute;  
    
    right: 10px;
        }
    </style>
</head>
<body>
   <form id="form1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <asp:Label ID="txtUserName" runat="server"></asp:Label>
    <table frame="below" class="table tab-content table-bordered table-active">

    <tr class="table tab-content table-bordered table-active">

    <td>

    <asp:Label ID="Label1" runat="server" Text="Date"></asp:Label>

    </td>

    <td>

    <asp:Label ID="Label2" runat="server" Text="Process"></asp:Label>

    </td>

    <td>

    <asp:Label ID="Label3" runat="server"  Text="Qc No"></asp:Label>

    </td>

    <td>

       <asp:Label ID="Label4" runat="server"  Text="Hours"></asp:Label>

    </td>

    <td>

      

       <asp:Label ID="Label5" runat="server" Text="Description"></asp:Label>

      

    </tr>

    <tr>

    <td>

    <asp:TextBox ID="txtSingleDate" runat="server" Font-Size="14px" ></asp:TextBox>
     <cc1:CalendarExtender ID="txtcal_CalendarExtender" runat="server" TargetControlID="txtSingleDate" PopupButtonID="ImageButton1"/>
                <asp:ImageButton ID="ImageButton1" runat="server"  
                    Height="22px"     Width="37px" CausesValidation="False"  ImageAlign="Baseline"  
                    ImageUrl="~/n2NRo.png" TabIndex="2" />  </td>
    </td>

    <td>

    <asp:DropDownList ID="ddlSingleProcess" runat="server" ></asp:DropDownList>

    </td>

    <td>

    <asp:DropDownList ID="ddlSingleQc" runat="server"></asp:DropDownList>
  

    </td>

    <td>
       
    <asp:TextBox ID="txtSingleHour" runat="server" ></asp:TextBox> 

    </td>

    <td>
        <asp:TextBox ID="txtSingleDesc" runat="server"></asp:TextBox>
       </td>

    </tr>

    <tr>

    <td>

        <asp:Label ID="lblDateError" runat="server" ForeColor="Red"></asp:Label>
        </td>

    <td>

        <asp:Label ID="lblProcessError" runat="server" ForeColor="Red"></asp:Label>
        </td>

    <td>

        <asp:Label ID="lblSingleError" runat="server" ForeColor="Black"></asp:Label>
        </td>

    <td>
        <asp:Label ID="lblHourError" runat="server" ForeColor="Red"></asp:Label>
        </td>

    <td>
            <asp:Button ID="btnAdd" runat="server" class="login100-form-btn1"  
                        Text="Add to List" OnClientClick="return validation()" onclick="btnAdd_Click" />
        </td>

    </tr>

    </table>
    <div class="sample">     <asp:Label ID="lblSingleMessage" runat="server"  ForeColor="Red"></asp:Label></div>
    <script type="text/javascript" language="javascript">
        $("#ddlSingleProcess").change(function () {

            var e = document.getElementById("ddlSingleProcess");
            var qcdd = document.getElementById("ddlSingleQc");
            var selectedTime = e.options[e.selectedIndex].text;

            if (selectedTime.indexOf("XXXXX") > 1) {

                document.getElementById("ddlSingleQc").disabled = false;
                qcdd.style.display = "block";

            }
            else {

                //  document.getElementById("ddlQcNo").setAttribute('disabled', true);
                document.getElementById("ddlSingleQc").disabled = true;
                //document.getElementById("ddlQcNo").setAttribute('style','color:white'); 
                qcdd.style.display = "none";
            }


        });
    </script>

     <p>

         &nbsp;</p>
    </form>
</body>
</html>
