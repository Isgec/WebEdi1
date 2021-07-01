<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="False" CodeFile="GF_ediQueues.aspx.vb" Inherits="GF_ediQueues" title="Maintain List: EDI Queues" %>
<asp:Content ID="CPHediQueues" ContentPlaceHolderID="cph1" Runat="Server">
<div class="ui-widget-content page">
<div class="caption">
    <asp:Label ID="LabelediQueues" runat="server" Text="&nbsp;List: EDI Queues"></asp:Label>
</div>
<div class="pagedata">
<asp:UpdatePanel ID="UPNLediQueues" runat="server">
  <ContentTemplate>
    <table width="100%"><tr><td class="sis_formview"> 
    <LGM:ToolBar0 
      ID = "TBLediQueues"
      ToolType = "lgNMGrid"
      EditUrl = "~/EDI_Main/App_Edit/EF_ediQueues.aspx"
      AddUrl = "~/EDI_Main/App_Create/AF_ediQueues.aspx"
      ValidationGroup = "ediQueues"
      runat = "server" />
    <asp:UpdateProgress ID="UPGSediQueues" runat="server" AssociatedUpdatePanelID="UPNLediQueues" DisplayAfter="100">
      <ProgressTemplate>
        <span style="color: #ff0033">Loading...</span>
      </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:Panel ID="pnlH" runat="server" CssClass="cph_filter">
      <div style="padding: 5px; cursor: pointer; vertical-align: middle;">
        <div style="float: left;">Filter Records </div>
        <div style="float: left; margin-left: 20px;">
          <asp:Label ID="lblH" runat="server">(Show Filters...)</asp:Label>
        </div>
        <div style="float: right; vertical-align: middle;">
          <asp:ImageButton ID="imgH" runat="server" ImageUrl="~/images/ua.png" AlternateText="(Show Filters...)" />
        </div>
      </div>
    </asp:Panel>
    <asp:Panel ID="pnlD" runat="server" CssClass="cp_filter" Height="0">
    <table>
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_EdiKey" runat="server" Text="Edi Key :" /></b>
        </td>
        <td>
          <asp:TextBox
            ID = "F_EdiKey"
            CssClass = "myfktxt"
            Width="408px"
            Text=""
            onfocus = "return this.select();"
            AutoCompleteType = "None"
            onblur= "validate_EdiKey(this);"
            Runat="Server" />
          <asp:Label
            ID = "F_EdiKey_Display"
            Text=""
            Runat="Server" />
          <AJX:AutoCompleteExtender
            ID="ACEEdiKey"
            BehaviorID="B_ACEEdiKey"
            ContextKey=""
            UseContextKey="true"
            ServiceMethod="EdiKeyCompletionList"
            TargetControlID="F_EdiKey"
            CompletionInterval="100"
            FirstRowSelected="true"
            MinimumPrefixLength="1"
            OnClientItemSelected="ACEEdiKey_Selected"
            OnClientPopulating="ACEEdiKey_Populating"
            OnClientPopulated="ACEEdiKey_Populated"
            CompletionSetCount="10"
            CompletionListCssClass = "autocomplete_completionListElement"
            CompletionListItemCssClass = "autocomplete_listItem"
            CompletionListHighlightedItemCssClass = "autocomplete_highlightedListItem"
            Runat="Server" />
        </td>
      </tr>
    </table>
    </asp:Panel>
    <AJX:CollapsiblePanelExtender ID="cpe1" runat="Server" TargetControlID="pnlD" ExpandControlID="pnlH" CollapseControlID="pnlH" Collapsed="True" TextLabelID="lblH" ImageControlID="imgH" ExpandedText="(Hide Filters...)" CollapsedText="(Show Filters...)" ExpandedImage="~/images/ua.png" CollapsedImage="~/images/da.png" SuppressPostBack="true" />
    <asp:GridView ID="GVediQueues" SkinID="gv_silver" runat="server" DataSourceID="ODSediQueues" DataKeyNames="SerialNo">
      <Columns>
        <asp:TemplateField HeaderText="EDIT">
          <ItemTemplate>
            <asp:ImageButton ID="cmdEditPage" ValidationGroup="Edit" runat="server" Visible='<%# EVal("Visible") %>' Enabled='<%# EVal("Enable") %>' AlternateText="Edit" ToolTip="Edit the record." SkinID="Edit" CommandName="lgEdit" CommandArgument='<%# Container.DataItemIndex %>' />
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Serial No" SortExpression="[EDI_Queues].[SerialNo]">
          <ItemTemplate>
            <asp:Label ID="LabelSerialNo" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("SerialNo") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="40px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Edi Key" SortExpression="[EDI_Queues].[EdiKey]">
          <ItemTemplate>
             <asp:Label ID="L_EdiKey" runat="server" ForeColor='<%# EVal("ForeColor") %>' Title='<%# EVal("EDI_Keys1_EdiParameters") %>' Text='<%# Eval("EdiKey") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignleft" />
          <HeaderStyle CssClass="alignleft" Width="100px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Edi Parameters" SortExpression="[EDI_Keys1].[EdiParameters]">
          <ItemTemplate>
             <asp:Label ID="L_xEdiKey" runat="server" ForeColor='<%# EVal("ForeColor") %>' Title='<%# EVal("EdiKey") %>' Text='<%# Eval("EDI_Keys1_EdiParameters") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignleft" />
          <HeaderStyle CssClass="alignleft" Width="350px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Edi Values" SortExpression="[EDI_Queues].[EdiValues]">
          <ItemTemplate>
            <asp:Label ID="LabelEdiValues" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("EdiValues") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignleft" />
          <HeaderStyle CssClass="alignleft" Width="350px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Delete">
          <ItemTemplate>
            <asp:ImageButton ID="cmdDelete" ValidationGroup='<%# "Delete" & Container.DataItemIndex %>' CausesValidation="true" runat="server" Visible='<%# EVal("DeleteWFVisible") %>' Enabled='<%# EVal("DeleteWFEnable") %>' AlternateText='<%# EVal("PrimaryKey") %>' ToolTip="Delete" SkinID="Delete" OnClientClick='<%# "return Page_ClientValidate(""Delete" & Container.DataItemIndex & """) && confirm(""Delete record ?"");" %>' CommandName="DeleteWF" CommandArgument='<%# Container.DataItemIndex %>' />
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Execute">
          <ItemTemplate>
            <asp:ImageButton ID="cmdInitiateWF" ValidationGroup='<%# "Initiate" & Container.DataItemIndex %>' CausesValidation="true" runat="server" Visible='<%# EVal("InitiateWFVisible") %>' Enabled='<%# EVal("InitiateWFEnable") %>' AlternateText='<%# EVal("PrimaryKey") %>' ToolTip="Forward" SkinID="forward" OnClientClick='<%# "return Page_ClientValidate(""Initiate" & Container.DataItemIndex & """) && confirm(""Execute record ?"");" %>' CommandName="InitiateWF" CommandArgument='<%# Container.DataItemIndex %>' />
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="30px" />
        </asp:TemplateField>
      </Columns>
      <EmptyDataTemplate>
        <asp:Label ID="LabelEmpty" runat="server" Font-Size="Small" ForeColor="Red" Text="No record found !!!"></asp:Label>
      </EmptyDataTemplate>
    </asp:GridView>
    <asp:ObjectDataSource 
      ID = "ODSediQueues"
      runat = "server"
      DataObjectTypeName = "SIS.EDI.ediQueues"
      OldValuesParameterFormatString = "original_{0}"
      SelectMethod = "ediQueuesSelectList"
      TypeName = "SIS.EDI.ediQueues"
      SelectCountMethod = "ediQueuesSelectCount"
      SortParameterName="OrderBy" EnablePaging="True">
      <SelectParameters >
        <asp:ControlParameter ControlID="F_EdiKey" PropertyName="Text" Name="EdiKey" Type="String" Size="50" />
        <asp:Parameter Name="SearchState" Type="Boolean" Direction="Input" DefaultValue="false" />
        <asp:Parameter Name="SearchText" Type="String" Direction="Input" DefaultValue="" />
      </SelectParameters>
    </asp:ObjectDataSource>
    <br />
  </td></tr></table>
  </ContentTemplate>
  <Triggers>
    <asp:AsyncPostBackTrigger ControlID="GVediQueues" EventName="PageIndexChanged" />
    <asp:AsyncPostBackTrigger ControlID="F_EdiKey" />
  </Triggers>
</asp:UpdatePanel>
</div>
</div>
</asp:Content>
