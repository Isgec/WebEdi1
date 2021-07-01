<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AF_ediQueues.aspx.vb" Inherits="AF_ediQueues" title="Add: EDI Queues" %>
<asp:Content ID="CPHediQueues" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabelediQueues" runat="server" Text="&nbsp;Add: EDI Queues"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLediQueues" runat="server" >
  <ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLediQueues"
    ToolType = "lgNMAdd"
    InsertAndStay = "False"
    ValidationGroup = "ediQueues"
    runat = "server" />
<asp:FormView ID="FVediQueues"
  runat = "server"
  DataKeyNames = "SerialNo"
  DataSourceID = "ODSediQueues"
  DefaultMode = "Insert" CssClass="sis_formview">
  <InsertItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <asp:Label ID="L_ErrMsgediQueues" runat="server" ForeColor="Red" Font-Bold="true" Text=""></asp:Label>
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_SerialNo" ForeColor="#CC6633" runat="server" Text="Serial No :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_SerialNo" Enabled="False" CssClass="mypktxt" Width="88px" runat="server" Text="0" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_EdiKey" runat="server" Text="Edi Key :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox
            ID = "F_EdiKey"
            CssClass = "myfktxt"
            Width="408px"
            Text='<%# Bind("EdiKey") %>'
            AutoCompleteType = "None"
            onfocus = "return this.select();"
            ToolTip="Enter value for Edi Key."
            ValidationGroup = "ediQueues"
            onblur= "script_ediQueues.validate_EdiKey(this);"
            Runat="Server" />
          <asp:RequiredFieldValidator 
            ID = "RFVEdiKey"
            runat = "server"
            ControlToValidate = "F_EdiKey"
            ErrorMessage = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "ediQueues"
            SetFocusOnError="true" />
          <asp:Label
            ID = "F_EdiKey_Display"
            Text='<%# Eval("EDI_Keys1_EdiParameters") %>'
            CssClass="myLbl"
            Runat="Server" />
          <AJX:AutoCompleteExtender
            ID="ACEEdiKey"
            BehaviorID="B_ACEEdiKey"
            ContextKey=""
            UseContextKey="true"
            ServiceMethod="EdiKeyCompletionList"
            TargetControlID="F_EdiKey"
            EnableCaching="false"
            CompletionInterval="100"
            FirstRowSelected="true"
            MinimumPrefixLength="1"
            OnClientItemSelected="script_ediQueues.ACEEdiKey_Selected"
            OnClientPopulating="script_ediQueues.ACEEdiKey_Populating"
            OnClientPopulated="script_ediQueues.ACEEdiKey_Populated"
            CompletionSetCount="10"
            CompletionListCssClass = "autocomplete_completionListElement"
            CompletionListItemCssClass = "autocomplete_listItem"
            CompletionListHighlightedItemCssClass = "autocomplete_highlightedListItem"
            Runat="Server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_EdiValues" runat="server" Text="Edi Values [Use Pipe `|` as separator] :" />&nbsp;
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_EdiValues"
            Text='<%# Bind("EdiValues") %>'
            CssClass = "mytxt"
            onfocus = "return this.select();"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Edi Values [Use Pipe `|` as separator]."
            MaxLength="2147483"
            Width="500px"
            TextMode="MultiLine"
            Height="80px"
            runat="server" />
        </td>
      </tr>
    </table>
    </div>
  </InsertItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODSediQueues"
  DataObjectTypeName = "SIS.EDI.ediQueues"
  InsertMethod="ediQueuesInsert"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.EDI.ediQueues"
  SelectMethod = "GetNewRecord"
  runat = "server" >
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>
