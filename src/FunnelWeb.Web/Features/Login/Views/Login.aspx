<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Safe.Master" Inherits="System.Web.Mvc.ViewPage<FunnelWeb.Web.Features.Login.Views.LoginModel>" %>

<asp:Content ContentPlaceHolderID="TitleContent" runat="server">
	Login
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

    <% if (Model.DatabaseIssue ?? false) { %>
    <h1>Database Issue</h1>
    <p class='bad'>
      The database used by your FunnelWeb installation is either offline, out of date or has not been 
      configured correctly. To resolve this issue, you will need to log in with the username and password 
      from your web.config file.
    </p>
    <%} else { %>
    <h1>Login</h1>
    <p class='good'>
        To administer this site, log in using the form below. The username and password are
        stored in your web.config file.
    </p>
    <%} %>

    <%: Html.ValidationSummary("Login unsuccessful") %>

    <% using (Html.BeginForm("Login", "Login")) { %>
        
    <div class="form-body">
        
      <div class="editor-label">
        <%: Html.LabelFor(m => m.Username)%>
      </div>
      <div class="editor-field">
        <%: Html.TextBoxFor(m => m.Username, Html.AttributesFor(m => m.Username))%>
        <%: Html.ValidationMessageFor(m => m.Username)%>
      </div>
      
      <div class="editor-label">
        <%: Html.LabelFor(m => m.Password)%>
      </div>
      <div class="editor-field">
        <%: Html.PasswordFor(m => m.Password, Html.AttributesFor(m => m.Password))%>
        <%: Html.ValidationMessageFor(m => m.Password)%>
      </div>

      <%: Html.HiddenFor(m => m.DatabaseIssue) %>
      <%: Html.HiddenFor(m => m.ReturnUrl) %>
      
      <div class="editor-label">
      <div>
      <div class="editor-field">
          <input type="submit" id="submit" class="submit" value="Submit" />
      </div>
    </div>
        
    <% } %>
</asp:Content>

