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
                    <asp:TextBox ID="TextBoxEmpName" runat="server" Width="329px" OnTextChanged="TextBoxEmpName_TextChanged"></asp:TextBox>
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
                    <asp:Calendar ID="CalendarStart" runat="server" BackColor="White" BorderColor="#3366CC" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px" OnSelectionChanged="CalendarStart_SelectionChanged" BorderWidth="1px">
                        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                        <TitleStyle BackColor="#003399" BorderColor="#3366CC" Font-Bold="True" BorderWidth="1px" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                        <WeekendDayStyle BackColor="#CCCCFF" />
                    </asp:Calendar>
                </td>
                <td style="width: 233px">
                    <asp:Calendar ID="CalendarEnd" runat="server" BackColor="White" BorderColor="#3366CC" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px" OnSelectionChanged="CalendarEnd_SelectionChanged" BorderWidth="1px">
                        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                        <TitleStyle BackColor="#003399" BorderColor="#3366CC" Font-Bold="True" BorderWidth="1px" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                        <WeekendDayStyle BackColor="#CCCCFF" />
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
                <td style="width: 312px"><strong>HOURS</strong></td>
                <td><strong>PAYROLL</strong></td>
            </tr>
            <tr>
                <td style="width: 312px">
                    <asp:Chart ID="ChartHours" runat="server" DataSourceID="SqlDataSource1" Width="629px" >
                        <Series>
                            <asp:Series Name="Series1" Color="Black" LabelBackColor="128, 255, 128" LabelBorderColor="192, 0, 192" MarkerBorderColor="Red" MarkerColor="0, 0, 192" MarkerImageTransparentColor="128, 128, 255" Palette="Bright" XValueMember="Worked On" YValueMembers="Total Hours">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1" BorderColor="64, 64, 64, 64" BorderDashStyle="Solid"
                                BackSecondaryColor="White" BackColor="64, 165, 191, 228" ShadowColor="Transparent"
                                BackGradientStyle="TopBottom">
                                <AxisY LineColor="64, 64, 64, 64">
                                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                    <MajorGrid LineColor="64, 64, 64, 64" />
                                </AxisY>
                                <AxisX LineColor="64, 64, 64, 64">
                                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                    <MajorGrid LineColor="64, 64, 64, 64" />
                                </AxisX>
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"></asp:ObjectDataSource>
                </td>
                <td>
                    <asp:Chart ID="ChartPayroll" runat="server" DataSourceID="SqlDataSource1" style="margin-right: 248px" Width="483px">
                        <Series>
                            <asp:Series Name="Series1" XValueMember="Worked On" YValueMembers="Total Hours">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dummyConnectionString %>" SelectCommand="usp_TotalPay" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="CalendarStart" Name="StartDate" PropertyName="SelectedDate" Type="DateTime" />
                            <asp:ControlParameter ControlID="CalendarEnd" Name="EndDate" PropertyName="SelectedDate" Type="DateTime" />
                        </SelectParameters>
                    </asp:SqlDataSource>
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
                    <asp:Chart ID="ChartOverallHours" runat="server" DataSourceID="SqlDataSource1" Height="376px" Width="453px">
                        <Series>
                            <asp:Series Name="Series1" XValueMember="Worked On" YValueMembers="Total Hours">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </td>
                <td>
                    <asp:Chart ID="ChartOverallPayroll" runat="server" DataSourceID="SqlDataSource1" Height="373px" Width="467px">
                        <Series>
                            <asp:Series ChartType="StackedColumn" Name="Series1" XValueMember="Worked On" YValueMembers="Total Hours">
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
    </div>

</asp:Content>
