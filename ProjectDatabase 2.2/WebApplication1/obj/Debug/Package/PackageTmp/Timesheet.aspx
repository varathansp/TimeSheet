<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Timesheet.aspx.cs" Inherits="WebApplication1.Timesheet" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 210px;
        }
        #form1
        {
            height: 835px;
            width: 1194px;
            margin-left: 9px;
            margin-top: 16px;
        }
        .style4
        {
            width: 111px;
            height: 39px;
            text-align: center;
        }
        .style11
        {
            text-align: center;
        }
        .style15
        {
            height: 23px;
        }
        .style17
        {
            font-family: "Modern No. 20";
            font-size: xx-large;
        }
        .style18
        {
            height: 50px;
            width: 111px;
        }
        .style25
        {
            width: 665px;
            height: 39px;
            text-align: center;
        }
        .style26
        {
            width: 665px;
            height: 50px;
        }
        .style27
        {
            width: 337px;
            height: 39px;
            text-align: center;
        }
        .style28
        {
            width: 337px;
            height: 50px;
        }
        .style29
        {
            width: 130px;
            height: 39px;
            text-align: center;
        }
        .style30
        {
            height: 50px;
            width: 130px;
        }
        .style31
        {
            height: 138px;
        }
        .modalbackground
        {
          background-color:Black;
          filter: alpha(opacity=90);
          opacity: 0.8;
        }  
        .modalpopup
        {
            border: 3px solid Black;
            background-color:White;
            padding-top:10px;
            padding-left:10px;
            margin-left: 0px;
            margin-top: 0px;
        }
        .style33
        {
            width: 287px;
            height: 19px;
        }
        .style34
        {
            width: 194px;
            height: 19px;
        }
        .style35
        {
            width: 150px;
            height: 39px;
            text-align: center;
        }
        .style36
        {
            height: 50px;
            width: 150px;
        }
        .style37
        {
            height: 19px;
        }
        .style38
        {
            width: 231px;
            height: 19px;
        }
        .style39
        {
            width: 323px;
        }
        .style40
        {
            width: 883px;
            font-family: "Modern No. 20";
            font-size: xx-large;
        }
        .style41
        {
            width: 144px;
            height: 39px;
            text-align: center;
        }
        .style42
        {
            height: 50px;
            width: 144px;
        }
        .style43
        {
            width: 243px;
            height: 19px;
        }
        .style44
        {
            width: 191px;
        }
    </style>
    <script type="text/javascript" language="javascript">
        function ConfirmOnDelete() {
            if (confirm("Are you sure to delete?") == true)
                return true;
            else
                return false;
        }
    </script>
</head>
<body style="height: 845px; margin-left: 0px; margin-top: 0px;">
    <form id="form1" runat="server">
    <div class="style11"     
        style="border: thin ridge #000000; height: 114px; width: 1193px; background-color: #00FFFF;">
        <table style="width: 33%; height: 31px; margin-left: 792px;">
            <tr>
                <td class="style39">
        <asp:Label ID="lblwelcome" runat="server" 
                        style="font-size: large; font-family: 'Modern No. 20'"></asp:Label>
                </td>
                <td>
        <asp:Button ID="btnlogout" runat="server" onclick="btnlogout_Click" 
            style="text-align: center; margin-left: 0px; font-size: large; font-family: Algerian;" 
                        Text="Log Out" CausesValidation="False" 
            Height="29px" Width="90px" UseSubmitBehavior="False" />

                </td>
            </tr>
        </table>
        <table style="width: 100%; height: 35px;">
            <tr>
            <td class="style44">

                <asp:Button ID="btncheckhours" Text = "Email Notification" runat="server" 
                        Height="26px" Width="154px" style="text-align: center; font-size: large;" CausesValidation="False" 
                        UseSubmitBehavior="False" Font-Names="Constantia" 
                        onclick="btncheckhours_Click" />

            </td>
            
                <td class="style40">
                    Mass Mutual Timesheet
                </td>
                <td>
                    <asp:Button ID="btnreports" 
            runat="server" Text="Reports" Height="29px" Width="90px" onclick="btnreports_Click" 
                        style="text-align: center; font-size: large; margin-left: 0px;" CausesValidation="False" 
                        UseSubmitBehavior="False" />
                </td>
            </tr>
        </table>
        <table style="width: 7%; height: 30px; margin-left: 1092px;">
            <tr>
                <td>
        <span class="style17">
        <asp:Button ID="btnsearch" runat="server" onclick="btnsearch_Click" 
            Text="Search" Height="29px" Width="90px" CausesValidation="False" 
                        style="margin-left: 0px; text-align: center; font-size: large;" 
                        UseSubmitBehavior="False" />
        </span>
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
        <table style="width: 12%; height: 28px; margin-left: 1048px; margin-top: 8px; margin-bottom: 0px;">
            <tr>
                <td class="style15">
                <asp:Button ID="btnadd" runat="server" onclick="btnadd_Click" Text="Add To List" 
                        Width="90px" Height="29px" />
                </td>
            </tr>
        </table>
        <table style="width: 19%; height: 63px; margin-left: 963px;">
            <tr>
                <td>
                        <asp:CompareValidator ID="CompareValidator1" ControlToValidate="txthours" type="Double" Operator="DataTypeCheck" runat="server" ErrorMessage="Only Numbers Allowed" ForeColor="Red"></asp:CompareValidator>
                        <br />
                        <asp:RangeValidator ID="RangeValidator1" runat="server" MaximumValue="20.0" MinimumValue="0.1" type="Double" ControlToValidate="txthours" ErrorMessage="Value should be between 0.1 and 20" ForeColor="Red"></asp:RangeValidator>
                </td>
            </tr>
        </table>
        <asp:Panel ID="Panel1" runat="server" CssClass="modalpopup" Height="225px" 
            Width="390px">
            <asp:Label ID="Label4" runat="server" Text="Process Name"></asp:Label>
            &nbsp;<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;<br />
            <asp:Label ID="lblaatxt" runat="server" Text="AA:Text"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtaatxt" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="AA:Type"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtaatype" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" 
                Text="Is Qc Number Required for this process"></asp:Label>
            <br />
            <asp:RadioButton ID="rbyes" runat="server" GroupName="QCnumber" Text="Yes" />
            <asp:RadioButton ID="rbno" runat="server" GroupName="QCnumber" Text="No" />
            <br />
            <asp:Button ID="btnok" runat="server" Text="Ok" Height="26px" 
                onclick="btnok_Click" Width="41px" CausesValidation="false" 
                UseSubmitBehavior="False" />
            <asp:Button ID="btncancel" runat="server" CausesValidation="false" 
                Height="26px" onclick="btncancel_Click" Text="cancel" Width="53px" />
        </asp:Panel>
        <br />
        <br />
    
    </div>
    <table align="center" 
        style="border: thin ridge #000000; width: 1195px; height: 102px; font-size: medium; background-color: #FFFFFF; margin-top: 17px; margin-left: 0px;" 
        class="style1" frame="below">
        <tr>
            <td class="style4" style="border: thin ridge #000000">
                Username</td>
            <td class="style27" style="border: thin ridge #000000">
                Date</td>
            <td class="style25" style="border: thin ridge #000000">
                Process</td>
            <td class="style35" style="border: thin ridge #000000">
                QC Number</td>
            <td class="style41" style="border: thin ridge #000000">
                Hours</td>
            <td class="style29" style="border: thin ridge #000000">
                Description</td>
        </tr>
        <tr>
            <td class="style18" style="border: thin ridge #000000">
                <asp:TextBox ID="txtUname" runat="server" ontextchanged="TextBox1_TextChanged" 
                    style="text-align: center" Height="24px" Width="154px"></asp:TextBox>
            </td>
            <td class="style28" style="border: thin ridge #000000">
                <asp:TextBox ID="txtcal" runat="server" Height="27px" 
                    style="text-align: center" Width="144px"></asp:TextBox>
                <cc1:CalendarExtender ID="txtcal_CalendarExtender" runat="server" 
                    TargetControlID="txtcal" PopupButtonID="ImageButton1"/>
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    onclick="ImageButton1_Click" Height="22px" 
                    Width="37px" CausesValidation="False" 
                    ImageAlign="Baseline" ImageUrl="~/n2NRo.png" />
                <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                    onclick="Button1_Click" Text="View" UseSubmitBehavior="False" />
            </td>
            <td class="style26" style="border: thin ridge #000000">
                <asp:DropDownList ID="DropDownList1" runat="server" Height="43px" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged" Width="321px" 
                    DataSourceID="AccessDataSource1" DataTextField="ProcessName" 
                    ondatabound="DropDownList1_DataBound" 
                    DataValueField="Process_ID" AutoPostBack="True" 
                    AppendDataBoundItems="True">
                </asp:DropDownList>
                <asp:Button ID="btn1" runat="server" Height="22px" Text="New Process" Width="95px" 
                    CausesValidation="False" onclick="btn1_Click" />
            </td>
            <td class="style36" style="border: thin ridge #000000">
                <asp:TextBox ID="txtqc" runat="server" Height="27px" Width="107px"></asp:TextBox>
            </td>
            <td class="style42" style="border: thin ridge #000000">
                <asp:TextBox ID="txthours" runat="server" Height="29px" 
                    ontextchanged="TextBox2_TextChanged" style="text-align: center" 
                    Width="103px"></asp:TextBox>
            </td>
            <td class="style30" style="border: thin ridge #000000">
                <asp:TextBox ID="txtdesc" runat="server" Height="27px" Width="127px"></asp:TextBox>
            </td>
        </tr>
        </table>
&nbsp;&nbsp;&nbsp;&nbsp;<br />
    <table style="width: 94%; height: 0px; margin-left: 0px;">
        <tr>
            <td class="style43">
                   <asp:Label ID="lblduplicate" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td class="style34">
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtcal" ErrorMessage="Date Cannot be empty" ForeColor="Red"></asp:RequiredFieldValidator></td>
            <td class="style33">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList1"  ErrorMessage="Select a process" InitialValue="1" ForeColor="Red"></asp:RequiredFieldValidator>
                &nbsp;
                <asp:Label ID="lblerror" runat="server" Height="22px" 
                    style="margin-left: 0px; margin-bottom: 0px;" Width="166px" 
                    ForeColor="Red"></asp:Label></td>
                <td class="style38"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtqc" ErrorMessage="QC Number Cannot be empty" ForeColor="Red"></asp:RequiredFieldValidator></td>
                <td class="style37">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txthours" ErrorMessage="Hours Cannot be empty" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
        </tr>
    </table>
    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" 
        CancelControlID="btncancel" PopupControlID="Panel1" TargetControlID="btn1" BackgroundCssClass="modalbackground">
    </cc1:ModalPopupExtender>
        <table style="margin: 0px; width: 82%; height: 338px; ">
            <tr>
                <td class="style31">
    <asp:GridView ID="grd" runat="server"
        BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
        CellPadding="3" CellSpacing="1" GridLines="None" 
        onselectedindexchanged="grd_SelectedIndexChanged" style="margin-left: 0px; margin-top: 94px;" 
        Width="962px" AutoGenerateColumns="false" onrowediting="grd_RowEditing" 
                    onrowupdating="grd_RowUpdating" onrowdeleting="grd_RowDeleting" 
                    onrowcancelingedit="grd_RowCancelingEdit" Height="191px" DataKeyNames="ID" 
                        onrowdatabound="grd_RowDataBound">
        <Columns>
        <asp:TemplateField headertext="ID" Visible="false">
        <itemtemplate>
        <asp:label id="lblid" runat="server" text='<%#Eval("ID")%>'></asp:label>
        </itemtemplate>
        </asp:TemplateField>

        <asp:TemplateField headertext="Name">
        <itemtemplate>
        <asp:label id="lblname" runat="server" Text='<%#Eval("Name")%>'>></asp:label>
        </itemtemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Date">
        <ItemTemplate>
        <asp:label id="lbldate" runat="server" Text='<%#Eval("Date")%>'></asp:label>
        </ItemTemplate>
        <EditItemTemplate>
        <asp:TextBox id="textboxdate" Height="24px" Width="100px" runat="server" Text='<%#Eval("Date")%>'></asp:TextBox>
        </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Process">
        <ItemTemplate>
        <asp:label id="lblprocess" runat="server" Text='<%#Eval("ProcessName")%>'></asp:label>
        </ItemTemplate>
        <EditItemTemplate>
        <asp:DropDownList ID="DropDownList1" DataSourceID="AccessDataSource1" DataTextField="ProcessName" DataValueField="Process_ID" Height="24px" runat="server" SelectedValue = '<%#Eval("Process_ID")%>' SelectedText = '<%#Eval("ProcessName")%>'> </asp:DropDownList>
        </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="QCno">
        <ItemTemplate>
        <asp:label id="lblqc" runat="server" Text='<%#Eval("QCno")%>'></asp:label>
        </ItemTemplate>
        <EditItemTemplate>
        <asp:TextBox id="textboxqcno" Height="24px" Width="100px" runat="server" Text='<%#Eval("QCno")%>'></asp:TextBox>
        </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Hours">
        <ItemTemplate>
        <asp:label id="lblhours" runat="server" Style = "text-align:right" Text='<%#Eval("Hours")%>'></asp:label>
        </ItemTemplate>
        <EditItemTemplate>
        <asp:TextBox id="textboxhours" Height="24px" Width="100px" runat="server" Style = "text-align:right" Text='<%#Eval("Hours")%>'></asp:TextBox>
        </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Description">
        <ItemTemplate>
        <asp:label id="lbldesc" runat="server" Text='<%#Eval("Description")%>'></asp:label>
        </ItemTemplate>
        <EditItemTemplate>
        <asp:TextBox id="textboxdesc" Height="24px" Width="100px" runat="server" Text='<%#Eval("Description")%>'></asp:TextBox>
        </EditItemTemplate>
        </asp:TemplateField>

        <asp:CommandField ShowEditButton="true" CausesValidation="false"  />

        <asp:TemplateField>
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
                </td>
            </tr>
            <tr>
                <td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblerrdate" runat="server" ForeColor="Red"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblerrprocess" runat="server" ForeColor="Red"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblerrQCno" runat="server" ForeColor="Red"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<asp:Label 
                        ID="lblsum" runat="server" Wrap="False" Font-Bold="True" Font-Size="Larger"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                </td>
            </tr>
        </table>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="C:\Users\chattpra\Documents\Visual Studio 2010\Projects\Timesheet\MMTimeSheetDB.accdb" 
        SelectCommand="SELECT [ProcessName], [Process_ID] FROM [Process] ORDER BY [ProcessName]" 
        onselecting="AccessDataSource1_Selecting"></asp:AccessDataSource>
    </form>
</body>
</html>
