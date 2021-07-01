<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Informations.ascx.vb" Inherits="Informations" %>
<style>
  .z1{margin:2px;
      min-width:60px;
  }
</style>
<div style="display:flex;flex-direction:row;min-width:300px;padding:6px;border-radius:4px;opacity:0.5;" class="nt-but-gray">
  <div style="vertical-align:middle;padding:8px;border-radius:25px;background-color:gainsboro;">
    Img
  </div>
  <div style="display:flex;flex-direction:column;margin-left:10px;">
    <div style="display:flex;flex-direction:row;">
      <div class="z1">
      <asp:Label ID="Label1" runat="server" Font-Bold="true" Text="Login ID:"></asp:Label>
      </div>
      <div class="z1">
      <asp:Label ID="F_LoginID" runat="server"></asp:Label>
      </div>
    </div>
    <div style="display:flex;flex-direction:row;">
      <div class="z1">
        <asp:Label ID="Label2" runat="server" Font-Bold="true" Text="Name:"></asp:Label>
      </div>
      <div class="z1">
        <asp:Label ID="F_EmployeeName" runat="server"></asp:Label>
      </div>
    </div>
  </div>
</div>



