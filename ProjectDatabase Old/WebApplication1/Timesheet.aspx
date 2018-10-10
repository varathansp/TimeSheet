<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Timesheet.aspx.cs" Inherits="WebApplication1.Timesheet" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head  runat="server">
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
            width: 613px;
            height: 39px;
            text-align: center;
        }
        .style26
        {
            width: 613px;
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
            margin-left: 0px;2
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
            width: 158px;
            height: 19px;
        }
        .style44
        {
            width: 191px;
        }
        .style45
        {
            height: 23px;
            width: 158px;
        }
        </style>
    <script type="text/javascript" language="javascript">

        function validateqc(oSrc, args) {


            if (document.getElementById("ddlQCNo").disabled)
                true

            else
                args.IsValid = (args.Value != 'No QC Assigned');


        }
        function ddl_change() {

            var e = document.getElementById("DropDownList1");

            var selectedTime = e.options[e.selectedIndex].text;

            if (selectedTime.indexOf("XXXXX") > 1) {

                document.getElementById("ddlQCNo").disabled = false;
                document.getElementById("RequiredFieldValidator2").enabled = true;

            }
            else {

                document.getElementById("ddlQCNo").setAttribute('disabled', true);
                document.getElementById("RequiredFieldValidator2").enabled = false;

            }

        }
        function ConfirmOnDelete() {
            if (confirm("Are you sure to delete?") == true)
                return true;
            else
                return false;
        }
    </script>
</head>
<body style="height: 845px; margin-left: 0px; margin-top: 0px;">
    <form id="form1" runat="server" DefaultButton= "btnadd" >
    <div class="style11"     
        style="border: thin ridge #000000; height: 114px; width: 1193px; background-color: #00FFFF;">
        <table style="width: 100%; height: 35px;">
            <tr>
            <td class="style44">
                 <asp:Button ID="btnManageQC" runat="server" Text="Manage QC" 
                     style="text-align:center" Width="150px" font-size=Large 
                     CausesValidation="False" onclick="btnManageQC_Click" Height="28px" 
                     UseSubmitBehavior="False"/>
            </td>
                <td class="style40">
                        <asp:Label ID="lblwelcome" runat="server" 
                        style="font-size: large;text-align: right ;font-family: 'Modern No. 20'"></asp:Label>
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

                <asp:Button ID="btncheckhours" Text = "Email " runat="server" 
                        Height="28px" Width="150px" 
                    style="text-align: center; font-size: large;" CausesValidation="False" 
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
            <tr>
            <td class="style44">

        <span class="style17">
                <asp:Button ID="btn1" runat="server" Height="28px" Text="New Process" Width="150px" 
                    CausesValidation="False" onclick="btn1_Click" />
    


        </span>
        
            </td>
            
                 <td class="style50">
                    <center><a href="changePassword.aspx">change password</a></center>
                </td>

                <td>
        <span class="style17">
        <asp:Button ID="btnsearch" runat="server" onclick="btnsearch_Click" 
            Text="Search" Height="29px" Width="92px" CausesValidation="False" 
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
        
       
            
            <asp:GridView ID="grd" runat="server" AutoGenerateColumns="false" 
                BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
                CellPadding="3" CellSpacing="1" DataKeyNames="ID" GridLines="None" 
                Height="191px" onrowcancelingedit="grd_RowCancelingEdit" 
                onrowdatabound="grd_RowDataBound" onrowdeleting="grd_RowDeleting" 
                onrowediting="grd_RowEditing" onrowupdating="grd_RowUpdating" 
                onselectedindexchanged="grd_SelectedIndexChanged" 
                style="margin-left: 0px; margin-top: 94px;" Width="962px">
                <Columns>
                    <asp:TemplateField headertext="ID" Visible="false">
                        <itemtemplate>
                            <asp:Label ID="lblid" runat="server" text='<%#Eval("ID")%>'></asp:Label>
                        </itemtemplate>
                    </asp:TemplateField>
                    <asp:TemplateField headertext="Name">
                        <itemtemplate>
                            <asp:Label ID="lblname" runat="server" Text='<%#Eval("Name")%>'>&gt;</asp:Label>
                        </itemtemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date">
                        <ItemTemplate>
                            <asp:Label ID="lbldate" runat="server" Text='<%#Eval("Date")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="textboxdate" runat="server" Height="24px" 
                                Text='<%#Eval("Date")%>' Width="100px"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Process">
                        <ItemTemplate>
                            <asp:Label ID="lblprocess" runat="server" Text='<%#Eval("ProcessName")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" 
                                DataSourceID="AccessDataSource1" DataTextField="ProcessName" 
                                DataValueField="Process_ID" Height="24px" 
                                SelectedText='<%#Eval("ProcessName")%>' SelectedValue='<%#Eval("Process_ID")%>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="QCno">
                        <ItemTemplate>
                            <asp:Label ID="lblqc" runat="server" Text='<%#Eval("QCno")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="textboxqcno" runat="server" Height="24px" 
                                  Text='<%#Eval("QCno")%>' Width="100px"></asp:TextBox>
                                <%--<asp:DropDownList ID="DropDownList2" runat="server" 
                                DataSourceID="AccessDataSource2" DataTextField="QC_No" 
                                DataValueField="QC_No" Height="24px" >
                            </asp:DropDownList>--%>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Hours">
                        <ItemTemplate>
                            <asp:Label ID="lblhours" runat="server" Style="text-align:right" 
                                Text='<%#Eval("Hours")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="textboxhours" runat="server" Height="24px" 
                                Style="text-align:right" Text='<%#Eval("Hours")%>' Width="100px"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Description">
                        <ItemTemplate>
                            <asp:Label ID="lbldesc" runat="server" Text='<%#Eval("Description")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="textboxdesc" runat="server" Height="24px" 
                                Text='<%#Eval("Description")%>' Width="100px"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField CausesValidation="false" ShowEditButton="true" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="Linkbutton2" runat="server" CausesValidation="false" 
                                CommandName="Delete" 
                                OnClientClick="return confirm('Are you sure to Delete the entry?');" 
                                Text="Delete"></asp:LinkButton>
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
            <table>
          
            <tr>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblerrdate" runat="server" ForeColor="Red"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblerrprocess" runat="server" ForeColor="Red"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblerrQCno" runat="server" ForeColor="Red"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<asp:Label 
                            ID="lblsum" runat="server" Font-Bold="True" Font-Size="Larger" Wrap="False"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                    </td>
                </tr>
            
            </table>
           
        <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="C:\ProjectDatabase\MMTimeSheetDB.accdb"
        SelectCommand="SELECT ProcessName, Min(Process_ID) as Process_ID FROM Process Group
 BY  ProcessName" 
        onselecting="AccessDataSource1_Selecting"></asp:AccessDataSource>

        

        <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
            DataFile="C:\ProjectDatabase\MMTimeSheetDB.accdb" 
            
            SelectCommand="SELECT [QC NO] AS QC_No FROM [EmpQcDetails] WHERE ([Emp NO] = (SELECT ID FROM Login WHERE UserName = ?) )">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtUname" Name="Emp_NO" PropertyName="Text" 
                    Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>

        

        <br />
       
    
        <table style="width: 7%; height: 30px; margin-left: 1092px;">
            <tr>
                <td>
                    &nbsp;</td>
                
                <td>
                    &nbsp;</td>
                
            </tr>
        </table>
    
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
            <td   class="style36" style="border: thin ridge #000000" width="200px" >
                <asp:TextBox ID="txtcal" runat="server" Height="24px" 
                    style="text-align: center" Width="75px" TabIndex="1"></asp:TextBox>
                <cc1:CalendarExtender ID="txtcal_CalendarExtender" runat="server" TargetControlID="txtcal" PopupButtonID="ImageButton1"/>
                <asp:ImageButton ID="ImageButton1" runat="server"  onclick="ImageButton1_Click" 
                    Height="22px"     Width="37px" CausesValidation="False"  ImageAlign="Baseline"  
                    ImageUrl="~/n2NRo.png" TabIndex="2" />

                     
            </td>
            <td class="style26" style="border: thin ridge #000000">
                
                <asp:DropDownList ID="DropDownList1" runat="server" Height="37px" 
                    onchange="ddl_change()" Width="411px" 
                    DataSourceID="AccessDataSource1" DataTextField="ProcessName" 
                    
                    DataValueField="Process_ID" AutoPostBack="false"
                    AppendDataBoundItems="True" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged1" TabIndex="3">
                </asp:DropDownList>
                
           
            </td>
            <td class="style36" style="border: thin ridge #000000">
                <asp:DropDownList ID="ddlQCNo" runat="server" AppendDataBoundItems="True" 
                    onselectedindexchanged="ddlQCNo_SelectedIndexChanged" TabIndex="4" ></asp:DropDownList>
            
            
                        <asp:Label ID="lblQCError" runat="server" Height="22px"   
                    style="margin-left: 0px; margin-bottom: 0px;" Width="83px"     
                    ForeColor="Red"></asp:Label>
            
            
            </td>
            
            <td class="style42" style="border: thin ridge #000000">
                <asp:TextBox ID="txthours" runat="server" Height="29px" 
                    ontextchanged="TextBox2_TextChanged" style="text-align: center" 
                    TabIndex="5" ></asp:TextBox>
            </td>
            <td class="style30" style="border: thin ridge #000000">
                <asp:TextBox ID="txtdesc" runat="server" Height="27px" Width="127px" 
                    TabIndex="6"></asp:TextBox>
            </td>
        </tr>
        
        <br />
    </table>
    <table style="width: 100%; height: 0px; margin-left: 0px;">
    <tr>
    <td class="style45" align = "right"> </td>
     <td class="style15" align = "char"> 
                <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                    onclick="Button1_Click" Text="View the Entry" 
             UseSubmitBehavior="False"  />
        </td>
      <td class="style15" align = "right"> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2"   runat="server" EnableClientScript="true"  ControlToValidate="ddlQCNo"   ErrorMessage="QC Number Cannot be empty" ForeColor="Red" Enabled="False"></asp:RequiredFieldValidator>
        </td>
       <td class="style15" align = "right"> 
                   <asp:RangeValidator ID="RangeValidator1" runat="server" MaximumValue="20.0" MinimumValue="0.1" type="Double" ControlToValidate="txthours" ErrorMessage="Value should be between 0.1 and 20" ForeColor="Red"></asp:RangeValidator>
        </td>
            <td class="style15" align = "right">
                <asp:Button ID="btnadd" runat="server" onclick="btnadd_Click" Text="Add To List" 
                        Width="90px" Height="29px" CausesValidation="False" TabIndex="13"  UseSubmitBehavior="True" />
                        
                </td>
</tr>
        <tr>
            <td class="style43">
                   <asp:Label ID="lblduplicate" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td class="style34">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtcal" ErrorMessage="Date Cannot be empty"  ForeColor="Red"></asp:RequiredFieldValidator>
             </td>
            <td class="style33">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList1"  ErrorMessage="Select a Process" InitialValue="1" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblerror" runat="server" Height="22px"   style="margin-left: 0px; margin-bottom: 0px;" Width="166px"     ForeColor="Red"></asp:Label>
                </td>              

                <td class="style37">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txthours" ErrorMessage="Hours Cannot be empty" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="style37">
                        <asp:CompareValidator ID="CompareValidator1" ControlToValidate="txthours" type="Double" Operator="DataTypeCheck" runat="server" ErrorMessage="Only Numbers Allowed" ForeColor="Red"></asp:CompareValidator>
                </td>
        </tr>
            <tr>
                  <td class="style43"></td>
                 <td class="style38">
                     &nbsp;</td>
                  <asp:CustomValidator id="CustomValidator2" runat="server"   ControlToValidate = "ddlQCNo"     ErrorMessage = "You must Select a Valid QC!" ForeColor="Red" Enabled="False"    ClientValidationFunction="validateqc" >  </asp:CustomValidator>
                 <td>
                 </td>
                 <td class="style37">
                    <asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server"  ControlToValidate="ddlQCNo"  ErrorMessage="QC Number is a required field."   Enabled="False" ForeColor="Red">     </asp:RequiredFieldValidator>    
                 </td>
                <td class="style37">
                    &nbsp;</td>
                
        </tr>
        <tr><td></td></tr>
    </table>
    
    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" 
        CancelControlID="btncancel" PopupControlID="Panel1" TargetControlID="btn1" BackgroundCssClass="modalbackground">
         
    </cc1:ModalPopupExtender>
     <asp:Panel ID="Panel1" runat="server"  CssClass="modalpopup" Height="225px" 
            Width="390px">
            <table style="margin: 0px; width: 82%; height: 338px; ">
                <tr>
                    <td class="style31">
                    <asp:Label ID="Label4" runat="server" Text="Process Name"></asp:Label>
            &nbsp;<asp:TextBox ID="TextBox3" runat="server" TabIndex="7"></asp:TextBox>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;<br />
            <asp:Label ID="lblaatxt" runat="server" Text="AA:Text"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtaatxt" runat="server" TabIndex="8"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="AA:Type"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtaatype" runat="server" TabIndex="9"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" 
                Text="Is Qc Number Required for this process"></asp:Label>
            <br />
            <asp:RadioButton ID="rbyes" runat="server" GroupName="QCnumber" Text="Yes" TabIndex="10" />
            <asp:RadioButton ID="rbno" runat="server" GroupName="QCnumber" Text="No" />
            <br />
            <asp:Button ID="btnok" runat="server" Text="Ok" Height="26px" 
                onclick="btnok_Click" Width="41px" CausesValidation="false" 
                UseSubmitBehavior="False" TabIndex="11" />
            <asp:Button ID="btncancel" runat="server" CausesValidation="false" 
                Height="26px" onclick="btncancel_Click" Text="cancel" Width="53px" TabIndex="12" />
                        &nbsp;</td>
                </tr>
                <tr><td> &nbsp;</td></tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>
