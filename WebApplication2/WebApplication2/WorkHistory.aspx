<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WorkHistory.aspx.cs" Inherits="WebApplication2.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Work History</h2>
    <table style="width: 100%; height: 400px;">
        <tr>
            <td style="height: 168px; width: 311px;">Start Date:<br />
                <asp:TextBox ID="TextBoxStartDate" runat="server" Width="191px" OnTextChanged="TextBoxStartDate_TextChanged"></asp:TextBox>
                <asp:Calendar ID="CalendarStartDate" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px" OnSelectionChanged="CalendarStartDate_SelectionChanged">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
                <div>
                    <br />
                    <br />
                </div>
            </td>
            <td style="height: 168px; width: 294px;">
                <div>
                    <div>
                        End Date:<br />
                        <asp:TextBox ID="TextBoxEndDate" runat="server" Width="191px" OnTextChanged="TextBoxEndDate_TextChanged"></asp:TextBox>
                    </div>
                </div>
                <asp:Calendar ID="CalendarEndDate" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px" OnSelectionChanged="CalendarEndDate_SelectionChanged">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
                <br />
                <asp:Button ID="ButtonSearch" runat="server" Height="22px" Text="Search" Width="194px" OnClick="ButtonSearch_Click" />
            </td>
            <td style="height: 168px">
                
                <div>
                    <div>
                        <div>
                            <br />
                            Log History:
                        </div>
                    </div>
                    <div style="height: 306px">
                        <asp:TextBox ID="TextBoxLog" runat="server" BackColor="Silver" ForeColor="Black" Height="394px" ReadOnly="True" Width="668px" OnTextChanged="TextBoxLog_TextChanged" BorderColor="Gray" Font-Size="X-Small" Wrap="true"></asp:TextBox>
                    </div>
                </div>

            </td>


    </table>
</asp:Content>
