<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 1179px;
            margin-left: 0px;
            height: 34px;
            margin-bottom: 0px;
        }
        .style12
        {
            height: 50px;
            width: 124px;
            text-align: left;
        }
        .style14
        {
            height: 50px;
            width: 126px;
            text-align: center;
        }
        .style15
        {
            height: 43px;
            text-align: center;
        }
        .style17
        {
            text-align: center;
            font-size: xx-large;
            font-family: "Modern No. 20";
            height: 131px;
        }
        .style18
        {
            width: 1179px;
            margin-left: 0px;
            height: 34px;
            text-align: center;
            margin-bottom: 0px;
        }
        .style16
        {
            font-family: Garamond;
            font-size: x-large;
        }
    </style>
</head>
<body style="height: 676px; margin-left: 12px; margin-top: 16px;">
    <form id="form1" runat="server">
    <div style="text-align: left">
    
        <table style="width: 100%; height: 102px;">
            <tr>
                <td class="style17" 
                    
                    style="border-style: ridge; border-width: thin; background-color: #00FFFF; font-variant: normal; text-transform: capitalize; color: #000000;">
                    mass Mutual Timesheet</td>
            </tr>
        </table>
    <p class="style18">
    &nbsp;<span class="style16">LOGIN PAGE</span><br class="style1" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
    </p>
        <table align="left" frame="vsides" 
            style="border: medium outset #00FFFF; padding: inherit; width: 34%; height: 199px; margin-left: 375px; margin-top: 0px; margin-right: 0px;">
            <tr>
                <td class="style14">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblusername" runat="server" Text="UserName"></asp:Label>
                </td>
                <td class="style12">
    <asp:TextBox ID="txtbxuname" runat="server" 
        ontextchanged="txtbxuname_TextChanged" Height="22px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style14">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblpwd" runat="server" Text="Password"></asp:Label>
                </td>
                <td class="style12">
    <asp:TextBox ID="txtbxpwd" runat="server" TextMode="Password" Height="22px" 
                        ontextchanged="txtbxpwd_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style15" colspan="2">
    <asp:Button ID="btnok" runat="server" onclick="btnok_Click" Text="LOGIN" 
        Width="82px" Height="32px" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btncancel" runat="server" Height="32px" 
            onclick="btncancel_Click" Text="Cancel" Width="82px" />
    &nbsp;&nbsp;
                </td>
            </tr>
        </table>
    
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <table style="width: 36%; height: 32px; margin-left: 355px;">
            <tr>
                <td>
                    <asp:Label ID="lblerror" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
