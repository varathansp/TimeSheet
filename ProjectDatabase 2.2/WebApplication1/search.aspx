<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="WebApplication1.search" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Self Report</title>
    <link rel="icon" type="image/png" href="Content/icon.png">
    <style type="text/css">
        .style3
        {
            width: 490px;
            height: 36px;
        }
        .style8
        {
            width: 453px;
            height: 36px;
        }
        .labelcss
        {
            position: absolute;
            top: 120px;
            right: 10px;
        }
    </style>
    <link href="Content/Header/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/Header/css/style.css" rel="stylesheet" type="text/css" />
    <link href="Content/TimeSheetBootstrap/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="Content/TimeSheetBootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/TimeSheetBootstrap/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="site-header">
        <div class="top">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <p>
                            &nbsp;&nbsp;MM Time Entry</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <img src="Content/Header/Images/MM_logo.png" alt="Post" />
        </div>
    </div>
    <form id="form1" runat="server">
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Timesheet2.aspx">Back</asp:HyperLink>
    <div class="labelcss">
        <b>&nbsp;<asp:Label ID="lblname" runat="server"></asp:Label></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="ImageButton1" runat="server" Height="16px" Width="20px" ImageUrl="Content/logout.jpg"
            title="logout" OnClick="ImageButton1_Click" /></div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblerror" runat="server" ForeColor="Red"></asp:Label>
    <table class="table tab-content table-bordered table-active">
        <tr>
            <td class="table tab-content table-bordered table-active" style="font-family: Arial Black"
                align="center" colspan="4" style="font-size: 2rem">
                Self Time Entry Report
            </td>
        </tr>
        <tr>
            <td class="style3">
                From date
            </td>
            <td class="style8">
                To Date
            </td>
            <td class="style8">
                Search
            </td>
            <td class="style8">
                Total Hours
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;<asp:TextBox ID="txtcal1" runat="server" Style="text-align: center"></asp:TextBox>
                <asp:ImageButton ID="imgbtn1" runat="server" Height="22px" ImageUrl="~/n2NRo.png"
                    OnClick="imgbtn1_Click" Width="42px" />
            </td>
            <td class="style8">
                &nbsp;<asp:TextBox ID="txtcal2" runat="server" Style="margin-left: 0px; text-align: center"></asp:TextBox>
                <asp:ImageButton ID="imgbtn2" runat="server" OnClick="imgbtn2_Click" Height="22px"
                    ImageUrl="~/n2NRo.png" Width="42px" />
            </td>
            <td class="style8">
                <div class="container-login100-form-btn">
                    <asp:Button ID="btnsearch" runat="server" class="login100-form-btn1" Height="26px"
                        Text="Search" Width="83px" EnableTheming="True" OnClick="btnsearch_Click" /></div>
            </td>
            <td class="style8">
                <asp:Label ID="lblsum" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:GridView ID="grd1" runat="server" BackColor="White" BorderColor="White" CssClass="table tab-content table-bordered table-active table-hover"
        BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Style="margin-top: 50px;"
        OnRowDataBound="grd1_RowDataBound" OnSelectedIndexChanged="grd1_SelectedIndexChanged">
        <%-- <AlternatingRowStyle BackColor="#DCDCDC" />--%>
        <%-- <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />--%>
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <%--<RowStyle BackColor="#EEEEEE" ForeColor="Black" />--%>
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
    </asp:GridView>
    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtcal1"
        PopupButtonID="imgbtn1" />
    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtcal2"
        PopupButtonID="imgbtn2" />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <br />
    <br />
    <br />
    </form>
</body>
</html>
