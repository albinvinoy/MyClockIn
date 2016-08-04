<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h2>Welcome to WinClockIn!</h2>
        <p>Use the navagation bar above to select your desired location</p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Human Resource Solution</h2>
            <p>
                Record and track employee hours safely and secruely.</p>
            <p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <img alt="" src="images/humanresource.png" style="width: 125px; height: 100x" /></p>
        </div>
        <div class="col-md-4">
            <h2>Free To Use - Forever!</h2>
            <p>
                Simply create an account, and get started immediately!</p>
            <p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <img alt="" src="images/free.png" style="width: 125px; height: 100px" /></p>
        </div>
        <div class="col-md-4">
            <h2>Cloud Hosted Database</h2>
            <p>
                Have all your employee work records in one place!</p>
            <p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                <img src="images/cloud.png" style="width: 125px; height: 99px" /></p>
        </div>
    </div>

</asp:Content>
