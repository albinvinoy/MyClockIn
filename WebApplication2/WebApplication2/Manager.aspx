<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manager.aspx.cs" Inherits="WebApplication2.Manager" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <asp:Label ID="LabelCurrentTime" runat="server"></asp:Label>
    </p>
    <p>
        <asp:Button ID="ButtonClockIn" runat="server" Height="101px" OnClick="ButtonClockIn_Click" Text="Clock In" Width="187px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="ButtonClockOut" runat="server" Height="101px" OnClick="ButtonClockOut_Click" Text="Clock Out" Width="187px" />
    </p>
    <p>
        <asp:Label ID="LabelClockIn" runat="server" Width="185px"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LabelClockOut" runat="server" Height="16px" Width="185px"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <p>
        NOTES</p>
    <p>
&nbsp;<asp:ListBox ID="ListBox1" runat="server" Height="65px" Width="454px"></asp:ListBox>
    </p>
    <p>
        <asp:Button ID="ButtonSubmit" runat="server" OnClick="ButtonSubmit_Click" Text="Submit" />
    </p>
</asp:Content>
