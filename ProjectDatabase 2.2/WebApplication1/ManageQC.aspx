<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageQC.aspx.cs" Inherits="WebApplication1.ManageQC" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Qc</title>
    <link rel="icon" type="image/png" href="Content/icon.png">
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lblMsg" runat="server"  style="text-align: center; margin-left: 0px; font-size: large; font-family: Algerian;"  ></asp:Label>

        <br />

        <table>
            <tr> <td  style="text-align: center; margin-left: 0px; font-size: large; font-family: Algerian;" >
            
                    Select Employee  Name
                </td>
                <td  style="text-align: center; margin-left: 0px; font-size: large; font-family: Algerian;"  >
                    <asp:DropDownList ID="ddlEmployeeName" runat="server" 
                        onselectedindexchanged="ddlEmployeeName_SelectedIndexChanged" Width="150px"  style="text-align: center; margin-left: 0px; font-size: large; font-family: Algerian;"  >
                    </asp:DropDownList>
                </td>
                
                <td  style="text-align: center; margin-left: 0px; font-size: large; font-family: Algerian;" >
                    ENTER QC Number
                </td>
                <td  style="text-align: center; margin-left: 0px; font-size: large; font-family: Algerian;" >
                    <asp:TextBox ID="txtQcNo" runat="server"  style="text-align: center; margin-left: 0px; font-size: large; font-family: Algerian;"  ></asp:TextBox>
                </td>
               
                <td  style="text-align: center; margin-left: 0px; font-size: large; font-family: Algerian;" >
                    &nbsp;QC Type</td>
               
                <td  style="text-align: center; margin-left: 0px; font-size: large; font-family: Algerian;" >
              
                    <asp:DropDownList ID="ddlQcName" runat="server" 
                        onselectedindexchanged="ddlEmployeeName_SelectedIndexChanged" 
                        Width="110px"  
                        style="text-align: center; margin-left: 0px; font-size: large; font-family: Algerian;"  >
                    </asp:DropDownList>
           
                    </td>
               
                 <td>
                
                    <asp:Button ID="btnADD" runat="server" Text="ADD" Width="100px" 
                    style="text-align: center; margin-left: 0px; font-size: large; font-family: Algerian;" 
                        onclick="btnADD_Click" />
                        </td>
                        <td>
                
                    <asp:Button ID="btnClose" runat="server" Text="Close" 
                        onclick="btnClose_Click" CausesValidation="False" 
                        style="text-align: center; margin-left: 0px; font-size: large; font-family: Algerian;" 
            Height="29px" Width="90px" UseSubmitBehavior="False" />
            </td>
                        
                        <td>

        <asp:Button ID="btnlogout" runat="server" onclick="btnlogout_Click" 
            style="text-align: center; margin-left: 0px; font-size: large; font-family: Algerian;" 
                        Text="Log Out" CausesValidation="False" 
            Height="29px" Width="90px" UseSubmitBehavior="False" />

                </td>
            </tr>
            <tr>
             <td>
                      <%--  <asp:CompareValidator ID="CompareValidator1" ControlToValidate="txtQcNo" type="Double" Operator="DataTypeCheck" runat="server" ErrorMessage="Only Numbers Allowed" ForeColor="Red"></asp:CompareValidator>
                        <br />
                        <asp:RangeValidator ID="RangeValidator1" runat="server" MaximumValue="999999" MinimumValue="0" type="Double" ControlToValidate="txtQcNo" ErrorMessage="Value should be between 0 and 999999" ForeColor="Red"></asp:RangeValidator>--%>
                </td>
                </tr>
        </table>
        <br />
    <asp:GridView ID="grd" runat="server"
        BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
        CellPadding="3" CellSpacing="1" GridLines="None" onrowdeleting="grd_RowDeleting"
        style="margin-left: 0px; margin-top: 94px;" 
        Width="962px" AutoGenerateColumns="false" Font-Names="Arial Black" 
            ForeColor="Black">
        <Columns>

          <asp:TemplateField headertext="User ID">
        <itemtemplate>
        <asp:label id="lbluid" runat="server" Text='<%#Eval("id")%>'>></asp:label>
        </itemtemplate>
        </asp:TemplateField>

        <asp:TemplateField headertext="User Name">
        <itemtemplate>
        <asp:label id="lblname" runat="server" Text='<%#Eval("userName")%>'>></asp:label>
        </itemtemplate>
        </asp:TemplateField>

        
        <asp:TemplateField HeaderText="QC Number">
        <itemtemplate>
        <asp:label id="lblProcess" runat="server" Text='<%#Eval("QC No")%>'>></asp:label>
        </itemtemplate>
        </asp:TemplateField>

         
        <asp:TemplateField HeaderText="QC Type">
        <itemtemplate>
        <asp:label id="lblQcType" runat="server" Text='<%#Eval("QC_TYPE")%>'>></asp:label>
        </itemtemplate>
        </asp:TemplateField>


        
        <asp:TemplateField HeaderText="Remove">
        <ItemTemplate>
        <asp:LinkButton ID="Linkbutton2" OnClientClick="return confirm('Are you sure to Delete the entry?');" CausesValidation="false" runat="server" Text="Delete" CommandName="Delete"></asp:LinkButton>
        </ItemTemplate>
        </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
        
    </asp:GridView>
        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="C:\ProjectDatabase\MMTimeSheetDB.accdb"
            SelectCommand="SELECT [Emp NO], [QC No] FROM EmpQcDetails"></asp:AccessDataSource>
    </div>
    </form>
</body>
</html>
