<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="False" CodeFile="GF_ediHistory.aspx.vb" Inherits="GF_ediHistory" title="Maintain List: EDI History" %>
<asp:Content ID="CPHediHistory" ContentPlaceHolderID="cph1" Runat="Server">
<div class="ui-widget-content page">
<div class="caption">
    <asp:Label ID="LabelediHistory" runat="server" Text="&nbsp;List: EDI History"></asp:Label>
</div>
<div class="pagedata">
<asp:UpdatePanel ID="UPNLediHistory" runat="server">
  <ContentTemplate>
    <table width="100%"><tr><td class="sis_formview"> 
    <LGM:ToolBar0 
      ID = "TBLediHistory"
      ToolType = "lgNMGrid"
      EditUrl = "~/EDI_Main/App_Edit/EF_ediHistory.aspx"
      EnableAdd = "False"
      ValidationGroup = "ediHistory"
      runat = "server" />
    <asp:UpdateProgress ID="UPGSediHistory" runat="server" AssociatedUpdatePanelID="UPNLediHistory" DisplayAfter="100">
      <ProgressTemplate>
        <span style="color: #ff0033">Loading...</span>
      </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:GridView ID="GVediHistory" SkinID="gv_silver" runat="server" DataSourceID="ODSediHistory" DataKeyNames="HistoryNo">
      <Columns>
        <asp:TemplateField HeaderText="EDIT">
          <ItemTemplate>
            <asp:ImageButton ID="cmdEditPage" ValidationGroup="Edit" runat="server" Visible='<%# EVal("Visible") %>' Enabled='<%# EVal("Enable") %>' AlternateText="Edit" ToolTip="Edit the record." SkinID="Edit" CommandName="lgEdit" CommandArgument='<%# Container.DataItemIndex %>' />
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="History No" SortExpression="[EDI_History].[HistoryNo]">
          <ItemTemplate>
            <asp:Label ID="LabelHistoryNo" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("HistoryNo") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="50px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Serial No" SortExpression="[EDI_History].[SerialNo]">
          <ItemTemplate>
            <asp:Label ID="LabelSerialNo" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("SerialNo") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="50px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Edi Key" SortExpression="[EDI_History].[EdiKey]">
          <ItemTemplate>
            <asp:Label ID="LabelEdiKey" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("EdiKey") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignleft" />
        <HeaderStyle CssClass="alignleft" Width="200px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Edi Values" SortExpression="[EDI_History].[EdiValues]">
          <ItemTemplate>
            <asp:Label ID="LabelEdiValues" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("EdiValues") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignleft" />
        <HeaderStyle CssClass="alignleft" Width="200px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Executed Statement" SortExpression="[EDI_History].[ExecutedStatement]">
          <ItemTemplate>
            <asp:Label ID="LabelExecutedStatement" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("ExecutedStatement") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignleft" />
        <HeaderStyle CssClass="alignleft" Width="400px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Executed On" SortExpression="[EDI_History].[ExecutedOn]">
          <ItemTemplate>
            <asp:Label ID="LabelExecutedOn" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("ExecutedOn") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
        <HeaderStyle CssClass="alignCenter" Width="90px" />
        </asp:TemplateField>
      </Columns>
      <EmptyDataTemplate>
        <asp:Label ID="LabelEmpty" runat="server" Font-Size="Small" ForeColor="Red" Text="No record found !!!"></asp:Label>
      </EmptyDataTemplate>
    </asp:GridView>
    <asp:ObjectDataSource 
      ID = "ODSediHistory"
      runat = "server"
      DataObjectTypeName = "SIS.EDI.ediHistory"
      OldValuesParameterFormatString = "original_{0}"
      SelectMethod = "ediHistorySelectList"
      TypeName = "SIS.EDI.ediHistory"
      SelectCountMethod = "ediHistorySelectCount"
      SortParameterName="OrderBy" EnablePaging="True">
      <SelectParameters >
        <asp:Parameter Name="SearchState" Type="Boolean" Direction="Input" DefaultValue="false" />
        <asp:Parameter Name="SearchText" Type="String" Direction="Input" DefaultValue="" />
      </SelectParameters>
    </asp:ObjectDataSource>
    <br />
  </td></tr></table>
  </ContentTemplate>
  <Triggers>
    <asp:AsyncPostBackTrigger ControlID="GVediHistory" EventName="PageIndexChanged" />
  </Triggers>
</asp:UpdatePanel>
</div>
</div>
</asp:Content>
