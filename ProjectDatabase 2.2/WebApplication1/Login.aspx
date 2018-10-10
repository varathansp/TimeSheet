<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <script src="Scripts/jquery-3.3.1.js" type="text/javascript"></script>
    <link rel="icon" type="image/png" href="Content/icon.png">
    <link href="Content/TimeSheetBootstrap/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="Content/TimeSheetBootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
   
    <link href="Content/TimeSheetBootstrap/main.css" rel="stylesheet" type="text/css" />
    <link href="Content/Header/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
   
    <link href="Content/Header/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function validation() {
            var ans;
            if (document.getElementById("txtbxuname").value == "") {
                document.getElementById("LblUsernameError").innerHTML = "Please enter user name";

                ans = false;
            }
            else {
                document.getElementById("LblUsernameError").innerHTML = "";
            }
            if (document.getElementById("txtbxpwd").value == "") {
                document.getElementById("lblPasswordError").innerHTML = "Please enter password";

                ans = false;
            }
            else {
                document.getElementById("lblPasswordError").innerHTML = "";
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
    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">
                <%--<div class="login100-form-title" style="background-image: url(Content/Login_v15/images/bg-01.jpg);">
               
					<span class="login100-form-title-1">
						MassMutual Time Entry
					</span>
				</div>--%>
                <form id="theform" class="login100-form" runat="server">
                <div class="wrap-input100" style="margin-bottom: 18px">
                    <span class="label-input100">Username</span>
                    <asp:TextBox ID="txtbxuname" runat="server" class="input100" type="text" name="username"
                        placeholder="Enter username"></asp:TextBox>
                </div>

                <asp:Label ID="LblUsernameError" runat="server" ForeColor="Red"></asp:Label>

                <div class="wrap-input100 " style="margin-bottom: 18px">
                    <span class="label-input100">Password</span>
                    <asp:TextBox ID="txtbxpwd" runat="server" class="input100" type="password" name="pass"
                        placeholder="Enter password"></asp:TextBox>
                </div>

                <asp:Label ID="lblPasswordError" runat="server" ForeColor="Red"></asp:Label>
                <asp:Label ID="lblerror" runat="server" ForeColor="Red"></asp:Label>

                <div style="width: 100%;padding-bottom: 30px">
                    <div>
                        <%--	<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me" />--%>
                        <asp:CheckBox ID="remeberChk" runat="server" name="remember-me" />
                        <asp:Label ID="Label1" runat="server" Text="Remember me"></asp:Label>
                    </div>
                </div>
                <div>
                    <asp:Button ID="btnok" runat="server" class="login100-form-btn" Text="Login" OnClientClick="return validation()"
                        OnClick="btnok_Click1" />
                </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
