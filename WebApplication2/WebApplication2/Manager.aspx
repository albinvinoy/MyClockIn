<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manager.aspx.cs" Inherits="WebApplication2.Manager" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div style="height: 100%">
        <table style="width: 100%;">
            <tr>
                <td style="width: 131px">&nbsp;</td>
        </table>
        <table style="width: 100%;">
            <tr>
                <td style="width: 131px">&nbsp;</td>
        </table>
        <table style="width: 100%;">
            <tr>
                <td style="width: 131px"><strong>Employee Name:</strong></td>
                <td>
                    <asp:TextBox ID="TextBoxEmpName" runat="server" Width="329px" OnTextChanged="TextBoxEmpName_TextChanged" autocomplete ="off"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" OnClick="ButtonSubmit_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 131px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table style="width: 100%;">
            <tr>
                <td>---------------------------------------------------------------------------------------------------------------------------------------------------------------------</td>
        </table>
        <table style="width: 100%;">
            <tr>
                <td style="width: 253px"><strong>NAME: </strong>&nbsp;
                    <asp:Label ID="LabelEmpName" runat="server"></asp:Label>
                </td>
                <td><strong>ID:  </strong>&nbsp;
                    <asp:Label ID="LabelEmpId" runat="server"></asp:Label>
                </td>
                <td><strong>DEPARTMENT:  </strong>&nbsp;
                    <asp:Label ID="LabelEmpDept" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <table style="width: 100%;">
            <tr>
                <td>---------------------------------------------------------------------------------------------------------------------------------------------------------------------</td>
        </table>
        <table style="width: 100%;">
            <tr>
                <td style="width: 239px">
                    <asp:Calendar ID="CalendarStart" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px" OnSelectionChanged="CalendarStart_SelectionChanged">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#808080" />
                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                </td>
                <td style="width: 233px">
                    <asp:Calendar ID="CalendarEnd" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px" OnSelectionChanged="CalendarEnd_SelectionChanged">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#808080" />
                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                </td>
                <td style="width: 141px; vertical-align: top">
                    <asp:DropDownList ID="DropRange" runat="server" OnSelectedIndexChanged="DropRange_SelectedIndexChanged1">
                        <asp:ListItem>(Search Range)</asp:ListItem>
                        <asp:ListItem>Daily</asp:ListItem>
                        <asp:ListItem>Weekly</asp:ListItem>
                        <asp:ListItem>Monthly</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="vertical-align: top">
                    <asp:Button ID="ButtonSearch" runat="server" Text="Search" OnClick="ButtonSearch_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBoxStart" runat="server" Width="190px" OnTextChanged="TextBoxStart_TextChanged"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxEnd" runat="server" Width="190px" OnTextChanged="TextBoxEnd_TextChanged"></asp:TextBox>
                </td>
            </tr>
        </table>
        <table style="width: 100%;">
        </table>
        <table style="width: 100%;">
            <tr>
                <td>---------------------------------------------------------------------------------------------------------------------------------------------------------------------</td>
        </table>
        <table style="width: 100%;">
            <tr>
                <td style="width: 312px"><strong>Individual Report:</strong></td>
            </tr>
            <tr>
                <td style="width: 312px; height: 22px;"><strong>HOURS</strong></td>
                <td style="height: 22px"><strong>PAYROLL</strong></td>
            </tr>
            <tr>
                <td style="width: 312px">
                    <asp:Chart ID="ChartHours" runat="server">
                        <Series>
                            <asp:Series ChartType="Bubble" Name="Series1" YValuesPerPoint="2">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dummyConnectionString %>" SelectCommand="SELECT [Time in] AS Time_in, [Time out] AS Time_out, [Total Hours] AS Total_Hours FROM [Time] WHERE ([EmployeeIdFK] = @EmployeeIdFK)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="100" Name="EmployeeIdFK" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                  <span style="vertical-align: middle">ww</span><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dummyConnectionString %>" SelectCommand="SELECT Employee.[First Name] + ' ' + Employee.[Last Name] AS Name, Time.[Total Hours] * Employee.[Pay Rate] AS PayTotal, Time.[Total Hours], FORMAT(Time.[Time in], 'd', 'en-gb') AS Worked_On FROM Employee INNER JOIN Time ON Employee.ID = Time.EmployeeIdFK ORDER BY Name"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <table style="width: 100%;">
            <tr>
                <td style="width: 312px"><span style="font-weight: bold">Overall Report:</span></td>

            </tr>
            <tr>
                <td style="height: 22px; width: 313px"><strong>HOURS</strong></td>
                <td style="height: 22px"><strong>PAYROLL</strong></td>
            </tr>
            <tr>
                <td style="width: 312px">
                    <asp:Chart ID="ChartOverallHours" runat="server">
                        <Series>
                            <asp:Series ChartType="Doughnut" Name="Series1">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </td>
                <td>
                    <asp:Chart ID="ChartOverallPayroll" runat="server">
                        <Series>
                            <asp:Series ChartType="Doughnut" Name="Series1">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </td>
            </tr>
        </table>
        <table style="width: 100%;">
            <tr>
                <td>
                    <asp:Button ID="ButtonEmail" runat="server" Text="Email Report" />
                </td>
            </tr>
        </table>
    </div>

</asp:Content>
