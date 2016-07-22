<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Landing.aspx.cs" Inherits="WebApplication2.Landing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        &nbsp;
        <asp:Label ID="Label3" runat="server" Height="20px" Width="444px"></asp:Label>
    </p>
    <p>
        <asp:Button ID="In" runat="server" Height="101px" Text="Clock In" Width="187px" OnClick="In_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Out" runat="server" Height="101px" OnClick="Out_Click" Text="Clock Out" Width="187px" />
&nbsp;</p>
    <p>
        <asp:Label ID="Label1" runat="server" Height="20px" Width="185px"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Height="20px" style="margin-top: 0px" Width="187px"></asp:Label>
</p>
    <p style="font-size: large">
        Notes</p>
    <p>
        <asp:TextBox ID="TextBox1" runat="server" Height="65px" Width="426px" OnTextChanged="TextBox1_TextChanged" MaxLength="200" TextMode="MultiLine"></asp:TextBox>
    </p>
    <p>
        <br />
    </p>
</asp:Content>
