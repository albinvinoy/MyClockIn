<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manager.aspx.cs" Inherits="WebApplication2.Manager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" Height="101px" OnClick="Button1_Click" Text="Clock In" Width="187px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Height="101px" OnClick="Button2_Click" Text="Clock Out" Width="187px" />
    </p>
    <p>
        <asp:Label ID="Label2" runat="server" Width="185px"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" Height="16px" Width="185px"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <p>
        NOTES</p>
    <p>
&nbsp;<asp:ListBox ID="ListBox1" runat="server" Height="65px" Width="454px"></asp:ListBox>
    </p>
    <p>
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Submit" />
    </p>
</asp:Content>
