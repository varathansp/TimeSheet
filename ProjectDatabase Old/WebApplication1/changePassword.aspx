<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="changePassword.aspx.cs" Inherits="WebApplication1.changePassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
<body bgcolor="#00ffff">
    <form id="form1" runat="server">
    <div>
    <center>
        <p>
        <div>
                    <asp:Button ID="btnLogOut" runat="server" Text="Log Out"  CausesValidation="false"
                        onclick="btnLogOut_Click" />
        </div>
         <h3><u> Please change your password</u></h3>
        </p>
     
        <table border="1 px" style="background-color: #CC3300">
            <tr>
                <td>
                    Old Password
                </td>
                <td>
                    <asp:TextBox ID="txtOldPassword" runat="server" 
                        ForeColor="Black" Width="130px"></asp:TextBox>
                </td>
                
            </tr>
            <tr>
                <td>
                    New Password
                </td>
                <td>
                    <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" 
                        Width="130px"></asp:TextBox>
                </td>
                
            </tr>
            <tr>
                <td>
                    Confirm Password
                </td>
                <td>
                    <asp:TextBox ID="txtCnfNewPassword" runat="server" TextMode="Password" 
                         Width="130px" ></asp:TextBox>
                </td>
                
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnUpdate" runat="server" Text="Update"
                        onclick="btnUpdate_Click" />
                </td>
                <td>
                    <asp:Button ID="btnClear" runat="server" Text="Clear" OnClientClick="Clear(); return false; " />
                </td>
                
            </tr>
        </table>
        <asp:Label ID="lblMsg" runat="server" BackColor="White" ForeColor="#CC0000"></asp:Label><br />
          <asp:CompareValidator ID="CompareValidator1" ControlToValidate="txtCnfNewPassword"  ControlToCompare="txtNewPassword" runat="server" ErrorMessage="New Password's does not match Each Other"></asp:CompareValidator><br />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOldPassword" ErrorMessage="Old Password Cannot be Empty"></asp:RequiredFieldValidator><br />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewPassword" ErrorMessage="New Password Cannot be Empty"></asp:RequiredFieldValidator><br />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCnfNewPassword" ErrorMessage="Confirm New Password Cannot be Empty"></asp:RequiredFieldValidator><br />
    </center>
    </div>
    </form>
</body>
</html>
