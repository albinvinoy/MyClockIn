<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WorkHistory.aspx.cs" Inherits="WebApplication2.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Work History</h2>
    <table style="width: 100%; height: 400px;">
        <caption>
        </caption>
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
                <asp:Button ID="btnEmail" runat="server" Text="E-Mail" />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BrandonString %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT [Time in] AS Time_in, [Time out] AS Time_out, [Total Hours] AS Total_Hours FROM [Time] WHERE (([Time in] &gt;= @Time_in) AND ([Time out] &lt;= @Time_out + '23:59:59') AND ([EmployeeIdFK] = @EmployeeIdFK))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBoxStartDate" Name="Time_in" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="TextBoxEndDate" Name="Time_out" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="EmpIDTxt" Name="EmployeeIdFK" PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td style="height: 168px">
                
                <div>
                    <div>
                        <div>
                            <br />
                            Employee ID: <asp:TextBox ID="EmpIDTxt" runat="server" ReadOnly="True" Width="33px"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Total Hours:
                            <asp:Label ID="lblTotalHours" runat="server"></asp:Label>
                            <br />
                            Log History:</div>
                    </div>
                    <div style="height: 306px" aria-readonly="True">
                        <asp:GridView ID="GVEmpHistory" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="89px" Width="542px" OnSelectedIndexChanged="GVEmpHistory_SelectedIndexChanged" showfooter="True" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="Time_in" HeaderText="Time_in" SortExpression="Time_in" />
                                <asp:BoundField DataField="Time_out" HeaderText="Time_out" SortExpression="Time_out" />
                                <asp:BoundField DataField="Total_Hours" HeaderText="Total_Hours" SortExpression="Total_Hours" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                    </div>
                </div>

            </td>


    </table>
</asp:Content>
