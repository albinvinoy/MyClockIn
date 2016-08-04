<%@ Page Title="EmployeeManagement" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeManagement.aspx.cs"  Inherits="WebApplication2.EmployeeManagement" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <table style="width:100%;">
            <tr>
                <td style="width: 382px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 382px"><strong>Fill out the information below to add an employee:</strong></td>
            </tr>
        </table>
        <table style="width: 100%;">
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table style="width: 100%;">
            <tr>
                <td style="width: 126px"><strong>Employee ID:</strong></td>
                <td>
                    <asp:TextBox ID="TextBoxEmpId" runat="server" OnTextChanged="TextBoxEmpId_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 126px"><strong>First Name:</strong></td>
                <td>
                    <asp:TextBox ID="TextBoxFirst" runat="server" OnTextChanged="TextBoxFirst_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 126px"><strong>Last Name:</strong></td>
                <td>
                    <asp:TextBox ID="TextBoxLast" runat="server" OnTextChanged="TextBoxLast_TextChanged"></asp:TextBox>
                </td>
            </tr>
                        <tr>
                <td style="width: 126px"><strong>Username:</strong></td>
                <td>
                    <asp:TextBox ID="TextBoxUsername" runat="server" OnTextChanged="TextBoxUsername_TextChanged"></asp:TextBox>
                            </td>
            </tr>
            <tr>
                <td style="width: 126px; height: 24px"><strong>Password:</strong></td>
                <td style="height: 24px">
                    <asp:TextBox ID="TextBoxPassword" runat="server" OnTextChanged="TextBoxPassword_TextChanged" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 126px"><strong>Pay Rate:</strong></td>
                <td>
                    <asp:TextBox ID="TextBoxPay" runat="server" OnTextChanged="TextBoxPay_TextChanged"></asp:TextBox>
                </td>
            </tr>
                        <tr>
                <td style="width: 126px"><strong>Security Level:</strong></td>
                <td>
                    <asp:DropDownList ID="DropSecurity" runat="server" OnSelectedIndexChanged="DropSecurity_SelectedIndexChanged">
                        <asp:ListItem>(Select One)</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                    </asp:DropDownList>
                            </td>
            </tr>
            <tr>
                <td style="width: 126px; height: 23px;"><strong>Department ID:</strong></td>
                <td style="height: 23px">
                    <asp:TextBox ID="TextBoxDept" runat="server" OnTextChanged="TextBoxDept_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 126px"><strong>Phone Number:</strong></td>
                <td>
                    <asp:TextBox ID="TextBoxPhone" runat="server" OnTextChanged="TextBoxPhone_TextChanged"></asp:TextBox>
                </td>
            </tr>
                        <tr>
                <td style="width: 126px"><strong>Email:</strong></td>
                <td>
                    <asp:TextBox ID="TextBoxEmail" runat="server" OnTextChanged="TextBoxEmail_TextChanged"></asp:TextBox>
                            </td>
            </tr>
            <tr>
                <td style="width: 126px"><strong>Notes:</strong></td>
                <td>
                    <asp:TextBox ID="TextBoxNotes" runat="server" Height="140px" Width="367px" OnTextChanged="TextBoxNotes_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 126px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
                        <tr>
                <td style="width: 126px">
                    <asp:Button ID="ButtonAdd" runat="server" Text="Add Employee" OnClick="ButtonAdd_Click" />
                            </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>

</asp:Content>
