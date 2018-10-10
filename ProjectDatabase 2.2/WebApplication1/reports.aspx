<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reports.aspx.cs" Inherits="WebApplication1.reports" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reports</title>
    <link rel="icon" type="image/png" href="Content/icon.png">
    <style type="text/css">
        #form1
        {
            height: 857px;
            width: 1191px;
        }
        .style18
        {
            text-align: center;
            height: 114px;
            width: 1193px;
            font-family: "Modern No. 20";
            font-size: xx-large;
            border: thin ridge #000000;
            background-color: #00FFFF;
        }
        .style3
        {
            width: 548px;
            height: 36px;
        }
        .style8
        {
            width: 453px;
            height: 36px;
        }
        .style20
        {
            width: 474px;
            height: 36px;
        }
        .style21
        {
            width: 940px;
            height: 15px;
        }
        .style22
        {
            width: 151px;
            height: 15px;
        }
        .style23
        {
            height: 15px;
        }
    </style>
</head>
<body style="height: 866px; width: 1215px; margin-left: 9px; margin-top: 16px;">
    <form id="form1" runat="server">
    <div class="style18">
        <em style="text-align: center">
        <table style="width:100%;">
            <tr>
                <td class="style22">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Timesheet2.aspx" 
            style="font-size: large">Back</asp:HyperLink>
                </td>
                <td class="style21">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </em>
        <span style="text-align: center">
                    <asp:Label ID="lblname" runat="server" Font-Size="Large"></asp:Label>
                </td>
                </span>
        <em style="text-align: center">
                <td class="style23">
        <em style="text-align: center"> 
                    <asp:Button ID="btnlogoff" runat="server" onclick="btnlogoff_Click" 
            Text="Log Out" Height="29px" Width="91px" 
                        style="font-family: Algerian; font-size: large" />
                    </em>
                </td>
            </tr>
        </table>
        <em>Mass Mutual Timesheet</em></em></div>
    <br />
    <table style="width: 77%; margin-left: 141px;">
        <tr>
            <td class="style3">
                From:
    <asp:TextBox ID="txtcal1" runat="server"></asp:TextBox>
    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtcal1" PopupButtonID="imgbtn1" />
                <asp:ImageButton ID="imgbtn1" runat="server" Height="22px" 
                    ImageUrl="~/n2NRo.png" Width="42px" CausesValidation="False" />
            </td>
            <td class="style8">
                To: 
        <asp:TextBox ID="txtcal2" runat="server" style="margin-left: 0px"></asp:TextBox>
    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtcal2" PopupButtonID="imgbtn2" />
                <asp:ImageButton ID="imgbtn2" runat="server"  
                    Height="22px" ImageUrl="~/n2NRo.png" Width="42px" 
                    CausesValidation="False" />
            </td>
            <td class="style20">
                <asp:Button ID="btnexport" runat="server" Height="26px" Text="Export" 
                    Width="83px" EnableTheming="True" onclick="btnexport_Click" />
            </td>
            <td class="style8">
                <asp:Label ID="lblConfirm" runat="server"></asp:Label>
            </td>
        </tr>
        
        <tr>
            <td class="style3">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtcal1" ErrorMessage="From Date Cannot be Empty" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="style8">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtcal2" ErrorMessage="To date Cannot be Empty" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        
    </table>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <cc1:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtcal1" PopupButtonID="imgbtn1" />
    <cc1:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtcal2" PopupButtonID="imgbtn2" />
    </form>
</body>
</html>
