<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="changePassword.aspx.cs" Inherits="WebApplication1.changePassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Password</title>
    <link rel="icon" type="image/png" href="Content/icon.png">
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
    <script type="text/javascript" language="javascript" >
        function MyFunction() {
            var pass1 = document.getElementById("txtNewPassword").value;
            var pass2 = document.getElementById("txtCnfNewPassword").value;
            if (pass1 === pass2) {
                
                return true;
            }
            else {
                alert("Password does not match");
                return false;
            }
        }

        function Clear()
         {
            document.getElementById('txtOldPassword').value = '';
            document.getElementById('txtNewPassword').value = '';
            document.getElementById('txtCnfNewPassword').value = '';
            document.getElementById('CompareValidator1').value = '';
//            document.getElementById('RequiredFieldValidator1').style.display = "none";
//            document.getElementById('RequiredFieldValidator2').style.display = "none";
//            document.getElementById('RequiredFieldValidator3').style.display = "none";
            document.getElementById('lblMsg').innerHTML = '';         
        }
    </script>
</head>
<body ><div class="site-header">
        <div class="top">
            <div class="container">
                <div class="row">
                    <div>
                      <p>  &nbsp;&nbsp; &nbsp;&nbsp;MM Time Entry 
                       
                       
                    </div>
              
                </div>
            </div>
        </div> 
        <div class="container">
           
            <img src="Content/Header/Images/MM_logo.png" alt="Post"/>

       </div>	         
</div>
<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Timesheet2.aspx">Back</asp:HyperLink>
    	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<%--<div class="login100-form-title" style="background-image: url(Content/Login_v15/images/bg-01.jpg);">
               
					<span class="login100-form-title-1">
						MassMutual Time Entry
					</span>
				</div>--%>

		    <form id="form1" class="login100-form validate-form" runat="server">
					<div class="wrap-input100 validate-input m-b-26" >
						<span class="label-input100">Old Password</span>
                        <asp:TextBox ID="txtOldPassword" runat="server" class="input100" type="text"  data-validate ="This field is required" ></asp:TextBox>
						<%--<input id="txtbxuname" class="input100" type="text" name="username" placeholder="Enter username">--%>
						<span id="span2" class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-26" >
						<span class="label-input100">New Password</span>
                        <asp:TextBox ID="txtNewPassword" runat="server" class="input100" type="password"  data-validate ="This field is required" ></asp:TextBox>
						<%--<input id="txtbxuname" class="input100" type="text" name="username" placeholder="Enter username">--%>
						<span id="span1" class="focus-input100"></span>
					</div>
                    <div class="wrap-input100 validate-input m-b-26" >
						<span class="label-input100">Confirm Password</span>
                        <asp:TextBox ID="txtCnfNewPassword" runat="server" class="input100" type="password"  data-validate ="This field is required" ></asp:TextBox>
						<%--<input id="txtbxuname" class="input100" type="text" name="username" placeholder="Enter username">--%>
						<span id="span3" class="focus-input100"></span>
					</div>
				<div class="container-login100-form-btn">    <asp:Button ID="btnUpdate" runat="server" class="login100-form-btn1" Text="Update"
                        onclick="btnUpdate_Click" /></div><asp:Label ID="lblMsg" runat="server" BackColor="White" ForeColor="#CC0000"></asp:Label>
                        <br />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtOldPassword" ErrorMessage="Old Password Cannot be Empty" 
                        ForeColor="Red"></asp:RequiredFieldValidator><br />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtNewPassword" ErrorMessage="New Password Cannot be Empty" 
                        ForeColor="Red"></asp:RequiredFieldValidator><br />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtCnfNewPassword" 
                        ErrorMessage="Confirm New Password Cannot be Empty" ForeColor="Red"></asp:RequiredFieldValidator><br />
  
    
   
    
                        <asp:CompareValidator ID="CompareValidator1" 
                        ControlToValidate="txtCnfNewPassword"  ControlToCompare="txtNewPassword" 
                        runat="server" ErrorMessage="New Password's does not match Each Other" 
                        ForeColor="Red"></asp:CompareValidator>
  
    
   
    
    </form>
			</div>
		</div>
	</div>
 
     
    <%--    <table >
        <tr>
            <td>
               Old Password</td>
            <td>
                    <asp:TextBox ID="txtOldPassword" runat="server" 
                        ForeColor="Black" Width="130px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td>
                New Passwordd</td>
            <td>
                    <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" 
                        Width="130px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td>
                Confirm Password</td>
            <td>
                    <asp:TextBox ID="txtCnfNewPassword" runat="server" TextMode="Password" 
                         Width="130px" ></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td><div class="container-login100-form-btn"> <asp:Button ID="btnClear" runat="server" class="login100-form-btn1" Text="Clear" 
                    OnClientClick="Clear(); return false; " /></div>
                 </td>
            <td> 
                <div class="container-login100-form-btn">    <asp:Button ID="btnUpdate" runat="server" class="login100-form-btn1" Text="Update"
                        onclick="btnUpdate_Click" /></div>
                  
                </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
        <asp:Label ID="lblMsg" runat="server" BackColor="White" ForeColor="#CC0000"></asp:Label>
                </td>
        </tr>
    </table>--%>
        <br />
          
     <script src="Content/TimeSheetBootstrap/Js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="Content/TimeSheetBootstrap/Js/animsition.min.js" type="text/javascript"></script>
    <script src="Content/TimeSheetBootstrap/Js/popper.js" type="text/javascript"></script>
    <script src="Content/TimeSheetBootstrap/Js/bootstrap.min.js" type="text/javascript"></script>
    <script src="Content/TimeSheetBootstrap/Js/select2.min.js" type="text/javascript"></script>
    <script src="Content/TimeSheetBootstrap/Js/moment.min.js" type="text/javascript"></script>
    <script src="Content/TimeSheetBootstrap/Js/daterangepicker.js" type="text/javascript"></script>
    <script src="Content/TimeSheetBootstrap/Js/countdowntime.js" type="text/javascript"></script>
    <script src="Content/TimeSheetBootstrap/Js/main.js" type="text/javascript"></script>
</body>
</html>
