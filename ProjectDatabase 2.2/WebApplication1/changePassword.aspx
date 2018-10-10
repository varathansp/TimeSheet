<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="changePassword.aspx.cs"
    Inherits="WebApplication1.changePassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Password</title>
    <link rel="icon" type="image/png" href="Content/icon.png">
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
                    <div>
                        <p>
                        &nbsp;&nbsp; &nbsp;&nbsp;MM Time Entry
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <img src="Content/Header/Images/MM_logo.png" alt="Post" />
        </div>
    </div>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Timesheet2.aspx">Back</asp:HyperLink>
    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">
                <form id="form1" class="login100-form" runat="server">
                <div class="wrap-input100 " style="margin-bottom: 18px">
                    <span class="label-input100">Old Password</span>
                    <asp:TextBox ID="txtOldPassword" runat="server" class="input100" type="text" data-validate="This field is required"></asp:TextBox>
                </div>
                <div class="wrap-input100 " style="margin-bottom: 18px">
                    <span class="label-input100">New Password</span>
                    <asp:TextBox ID="txtNewPassword" runat="server" class="input100" type="password"
                        data-validate="This field is required"></asp:TextBox>
                </div>
                <div class="wrap-input100 " style="margin-bottom: 18px">
                    <span class="label-input100">Confirm Password</span>
                    <asp:TextBox ID="txtCnfNewPassword" runat="server" class="input100" type="password"
                        data-validate="This field is required"></asp:TextBox>
                </div>
                <div class="container-login100-form-btn">
                    <asp:Button ID="btnUpdate" runat="server" class="login100-form-btn1" Text="Update"
                        OnClick="btnUpdate_Click" /></div>
                <br />
                <br />
                <br />
                <asp:Label ID="lblMsg" runat="server" BackColor="White" ForeColor="#CC0000"></asp:Label>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOldPassword"
                    ErrorMessage="Old Password Cannot be Empty " ForeColor="Red"></asp:RequiredFieldValidator><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewPassword"
                    ErrorMessage="New Password Cannot be Empty" ForeColor="Red"></asp:RequiredFieldValidator><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCnfNewPassword"
                    ErrorMessage="Confirm New Password Cannot be Empty " ForeColor="Red"></asp:RequiredFieldValidator><br />
                <asp:CompareValidator ID="CompareValidator1" ControlToValidate="txtCnfNewPassword"
                    ControlToCompare="txtNewPassword" runat="server" ErrorMessage="New Password's does not match Each Other"
                    ForeColor="Red"></asp:CompareValidator>
                </form>
            </div>
        </div>
    </div>
    <br />
</body>
</html>
