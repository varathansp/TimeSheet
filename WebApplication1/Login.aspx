<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  
   <title>Login</title>
  <link rel="icon" type="image/png" href="Content/icon.png">
	
    <%--<link href="Content/Login_v15/vendor/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="Content/Login_v15/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/Login_v15/fonts/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/Login_v15/fonts/Linearicons-Free-v1.0.0/icon-font.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/Login_v15/vendor/animate/animate.css" rel="stylesheet" type="text/css" />
    <link href="Content/Login_v15/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/Login_v15/vendor/animsition/css/animsition.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/Login_v15/vendor/select2/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/Login_v15/vendor/daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css" />
    <link href="Content/Login_v15/css/util.css" rel="stylesheet" type="text/css" />
    <link href="Content/Login_v15/css/main.css" rel="stylesheet" type="text/css" />--%>

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

    <link href="Content/Header/css/bootstrap.min.css" rel="stylesheet" type="text/css" /> 
        <link href="Content/Header/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="Content/Header/css/style.css" rel="stylesheet" type="text/css" />

        
        
</head>
<%--<body style="height: 676px; margin-left: 12px; margin-top: 16px;">
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
</body>--%>
<body>
<div class="site-header">
        <div class="top">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <p>&nbsp;&nbsp;MM Time Entry</p>
                    </div>
                   
                </div>
            </div>
        </div> 
        <div class="container">
           
            <img src="Content/Header/Images/MM_logo.png" alt="Post"/>
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

				<form id="theform" class="login100-form validate-form" runat="server">
					<div class="wrap-input100 validate-input m-b-26" data-validate ="Username is required">
						<span class="label-input100">Username</span>
                        <asp:TextBox ID="txtbxuname" runat="server" class="input100" type="text" name="username" placeholder="Enter username" ></asp:TextBox>
						<%--<input id="txtbxuname" class="input100" type="text" name="username" placeholder="Enter username">--%>
						<span id="span2" class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
						<span class="label-input100">Password</span>
                        <asp:TextBox ID="txtbxpwd" runat="server" class="input100" type="password" name="pass" placeholder="Enter password" ></asp:TextBox>
						<%--<input id="txtbxpwd" class="input100" type="password" name="pass" placeholder="Enter password">--%>
						<span id="span1" class="focus-input100"></span>
					</div>
                
                        <asp:Label ID="lblerror" runat="server" ForeColor="Red" ></asp:Label>
						
						
					<div class="flex-sb-m w-full p-b-30">
						<div class="contact100-form-checkbox">
						<%--	<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me" />--%>
                            <asp:CheckBox ID="remeberChk" runat="server" name="remember-me" />
							<asp:Label ID="Label1" runat="server" Text="Remember me"></asp:Label>
						</div>

						
					</div>

					<div class="container-login100-form-btn">
						
                            <asp:Button ID="btnok" runat="server" class="login100-form-btn" Text="Login" 
                                onclick="btnok_Click1" />
						
					</div>
				</form>
			</div>
		</div>
	</div>
    <script src="Content/TimeSheetBootstrap/Js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="Content/TimeSheetBootstrap/Js/animsition.min.js" type="text/javascript"></script>
    <script src="Content/TimeSheetBootstrap/Js/popper.js" type="text/javascript"></script>
    <script src="Content/TimeSheetBootstrap/Js/bootstrap.min.js" type="text/javascript"></script>
    <script src="Content/TimeSheetBootstrap/Js/select2.min.js" type="text/javascript"></script>
    <script src="Content/TimeSheetBootstrap/Js/moment.min.js" type="text/javascript"></script>
    <script src="Content/TimeSheetBootstrap/Js/daterangepicker.js" type="text/javascript"></script>
    <script src="Content/TimeSheetBootstrap/Js/countdowntime.js" type="text/javascript"></script>
    <script src="Content/TimeSheetBootstrap/Js/main.js" type="text/javascript"></script>
   <%-- <script src="Content/Login_v15/vendor/jquery/jquery-3.2.1.min.js"
        type="text/javascript"></script>

    <script src="Content/Login_v15/vendor/animsition/js/animsition.min.js"
        type="text/javascript"></script>

    <script src="Content/Login_v15/vendor/bootstrap/js/popper.js"
        type="text/javascript"></script>

    <script src="Content/Login_v15/vendor/bootstrap/js/bootstrap.min.js"
        type="text/javascript"></script>

    <script src="Content/Login_v15/vendor/select2/select2.min.js"
        type="text/javascript"></script>

    <script src="Content/Login_v15/vendor/daterangepicker/moment.min.js"
        type="text/javascript"></script>

    <script src="Content/Login_v15/vendor/daterangepicker/daterangepicker.js"
        type="text/javascript"></script>

    <script src="Content/Login_v15/vendor/countdowntime/countdowntime.js"
        type="text/javascript"></script>

    <script src="Content/Login_v15/js/main.js" type="text/javascript"></script>--%>

</body>
</html>