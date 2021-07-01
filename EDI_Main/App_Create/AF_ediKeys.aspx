<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AF_ediKeys.aspx.vb" Inherits="AF_ediKeys" title="Add: EDI Keys" %>
<asp:Content ID="CPHediKeys" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabelediKeys" runat="server" Text="&nbsp;Add: EDI Keys"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLediKeys" runat="server" >
  <ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLediKeys"
    ToolType = "lgNMAdd"
    InsertAndStay = "False"
    ValidationGroup = "ediKeys"
    runat = "server" />
<asp:FormView ID="FVediKeys"
  runat = "server"
  DataKeyNames = "EdiKey"
  DataSourceID = "ODSediKeys"
  DefaultMode = "Insert" CssClass="sis_formview">
  <InsertItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <asp:Label ID="L_ErrMsgediKeys" runat="server" ForeColor="Red" Font-Bold="true" Text=""></asp:Label>
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_EdiKey" ForeColor="#CC6633" runat="server" Text="Edi Key :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_EdiKey"
            Text='<%# Bind("EdiKey") %>'
            CssClass = "mypktxt"
            onfocus = "return this.select();"
            ValidationGroup="ediKeys"
            onblur= "script_ediKeys.validate_EdiKey(this);"
            ToolTip="Enter value for Edi Key."
            MaxLength="50"
            Width="408px"
            runat="server" />
          <asp:RequiredFieldValidator 
            ID = "RFVEdiKey"
            runat = "server"
            ControlToValidate = "F_EdiKey"
            ErrorMessage = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "ediKeys"
            SetFocusOnError="true" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_EdiParameters" runat="server" Text="Edi Parameters [Use Pipe `|` separater] :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_EdiParameters"
            Text='<%# Bind("EdiParameters") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Edi Parameters [Use Pipe `|` separater]."
            MaxLength="1000"
            Width="500px"
            TextMode="MultiLine"
            Height="50px"
            runat="server" />
        </td>
      </tr>
<%--      <tr>
        <td class="alignright">
          <asp:Label ID="L_IsSP" runat="server" Text="Is Stored Procedure :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:CheckBox ID="F_IsSP"
           Checked='<%# Bind("IsSP") %>'
           CssClass = "mychk"
           runat="server" />
        </td>
      </tr>--%>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_SqlStatement" runat="server" Text="Sql Statement :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_SqlStatement"
            Text='<%# Bind("SqlStatement") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            ValidationGroup="ediKeys"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Sql Statement."
            MaxLength="2147483"
            Width="500px"
            TextMode="MultiLine"
            Height="80px"
            runat="server" />
          <asp:RequiredFieldValidator 
            ID = "RFVSqlStatement"
            runat = "server"
            ControlToValidate = "F_SqlStatement"
            ErrorMessage = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "ediKeys"
            SetFocusOnError="true" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ExecuteInERP" runat="server" Text="Execute In ERP :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:CheckBox ID="F_ExecuteInERP"
           Checked='<%# Bind("ExecuteInERP") %>'
           CssClass = "mychk"
           runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ERPCompany" runat="server" Text="ERP Company :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:DropDownList ID="F_ERPCompany"
           SelectedValue='<%# Bind("ERPCompany") %>'
           CssClass = "mytxt"
           runat="server">
            <asp:ListItem Value="200" Text="ISGEC - 200"></asp:ListItem>
            <asp:ListItem Value="700" Text="REDECAM - 700"></asp:ListItem>
            <asp:ListItem Value="651" Text="ICL - 651"></asp:ListItem>
          </asp:DropDownList>
        </td>
      </tr>
    </table>
    </div>
  </InsertItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODSediKeys"
  DataObjectTypeName = "SIS.EDI.ediKeys"
  InsertMethod="ediKeysInsert"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.EDI.ediKeys"
  SelectMethod = "GetNewRecord"
  runat = "server" >
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>
