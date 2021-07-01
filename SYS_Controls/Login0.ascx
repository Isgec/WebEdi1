<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Login0.ascx.vb" Inherits="Login0" %>
<div>
  <asp:LoginView ID="LoginFormView1" runat="server">
    <AnonymousTemplate>
      <asp:Login ID="Login0" OnLoggedIn="LoggedIn" OnLoginError="LoginError" OnLoggingIn="LoggingIn" runat="server">
        <LayoutTemplate>
          <asp:Panel ID="panel1" runat="server" DefaultButton="LoginButton">
            <table>
              <tr>
                <td>
                  <asp:Label runat="server" Text="Login ID:"></asp:Label>
                </td>
                <td style="height: 22px">
                  <asp:TextBox ID="UserName" runat="server" CssClass="mytxt" MaxLength="20" Width="60px"></asp:TextBox>
                </td>
                <td>
                  <asp:Label ID="Label1" runat="server" Text="Password:"></asp:Label>
                </td>
                <td style="height: 22px">
                  <asp:TextBox ID="Password" runat="server" CssClass="mytxt" MaxLength="20" TextMode="Password" Width="60px"></asp:TextBox>
                </td>
                <td style="height: 22px">
                  <asp:Button ID="LoginButton" CssClass="nt-but-danger" runat="server" CommandName="Login" ValidationGroup="ctl00$ctl00$Login0" Text="Sign In" />
                </td>
              </tr>
              <tr>
                <td colspan="5" style="color:#66FF66; font-weight: bold; background-color: Black;text-align:center;">
                  <asp:Label ID="FailureText" runat="server" EnableViewState="False"></asp:Label>
                </td>
              </tr>
            </table>
          </asp:Panel>
        </LayoutTemplate>
      </asp:Login>
    </AnonymousTemplate>
    <LoggedInTemplate>
      <table>
        <td>
          <LGM:Informations ID="Informations1" Visible="false" runat="server" />
          <asp:Label ID="sysInfo" runat="server" Text=""></asp:Label>
        </td>
        <td>
          <asp:LinkButton ID="LinkButton1" runat="server" CssClass="nt-but-grey" Height="18px" Width="94px" Font-Bold="true" Style="padding: 7px 5px 3px 10px; text-align: center;" PostBackUrl="~/ChangePassword.aspx" Text="Change Password" /><br />
          <asp:LoginStatus ID="LoginStatus1" CssClass="nt-but-danger" runat="server" Height="18px" Width="94px" Font-Bold="true" Style="padding: 3px 5px 3px 10px; text-align: center;" LoginText="Sign In" LogoutAction="Redirect" LogoutPageUrl="~/Default.aspx" LogoutText="  Sign Out  " ToolTip="Sign Out" />
        </td>
      </table>
    </LoggedInTemplate>
  </asp:LoginView>
</div>
