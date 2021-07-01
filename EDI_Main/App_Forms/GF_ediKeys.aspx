<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="False" CodeFile="GF_ediKeys.aspx.vb" Inherits="GF_ediKeys" title="Maintain List: EDI Keys" %>
<asp:Content ID="CPHediKeys" ContentPlaceHolderID="cph1" Runat="Server">
<div class="ui-widget-content page">
<div class="caption">
    <asp:Label ID="LabelediKeys" runat="server" Text="&nbsp;List: EDI Keys"></asp:Label>
</div>
<div class="pagedata">
<asp:UpdatePanel ID="UPNLediKeys" runat="server">
  <ContentTemplate>
    <table width="100%"><tr><td class="sis_formview"> 
    <LGM:ToolBar0 
      ID = "TBLediKeys"
      ToolType = "lgNMGrid"
      EditUrl = "~/EDI_Main/App_Edit/EF_ediKeys.aspx"
      AddUrl = "~/EDI_Main/App_Create/AF_ediKeys.aspx"
      ValidationGroup = "ediKeys"
      runat = "server" />
    <asp:UpdateProgress ID="UPGSediKeys" runat="server" AssociatedUpdatePanelID="UPNLediKeys" DisplayAfter="100">
      <ProgressTemplate>
        <span style="color: #ff0033">Loading...</span>
      </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:GridView ID="GVediKeys" SkinID="gv_silver" runat="server" DataSourceID="ODSediKeys" DataKeyNames="EdiKey">
      <Columns>
        <asp:TemplateField HeaderText="EDIT">
          <ItemTemplate>
            <asp:ImageButton ID="cmdEditPage" ValidationGroup="Edit" runat="server" Visible='<%# EVal("Visible") %>' Enabled='<%# EVal("Enable") %>' AlternateText="Edit" ToolTip="Edit the record." SkinID="Edit" CommandName="lgEdit" CommandArgument='<%# Container.DataItemIndex %>' />
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
          <HeaderStyle CssClass="alignCenter" Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Edi Key" SortExpression="[EDI_Keys].[EdiKey]">
          <ItemTemplate>
            <asp:Label ID="LabelEdiKey" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("EdiKey") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
        <HeaderStyle CssClass="alignCenter" Width="100px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Edi Parameters" SortExpression="[EDI_Keys].[EdiParameters]">
          <ItemTemplate>
            <asp:Label ID="LabelEdiParameters" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("EdiParameters") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
        <HeaderStyle CssClass="alignCenter" Width="200px" />
        </asp:TemplateField>
<%--        <asp:TemplateField HeaderText="Is Stored Procedure" SortExpression="[EDI_Keys].[IsSP]">
          <ItemTemplate>
            <asp:Label ID="LabelIsSP" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("IsSP") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
        <HeaderStyle CssClass="alignCenter" Width="50px" />
        </asp:TemplateField>--%>
        <asp:TemplateField HeaderText="Sql Statement" SortExpression="[EDI_Keys].[SqlStatement]">
          <ItemTemplate>
            <asp:Label ID="LabelSqlStatement" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("SqlStatement") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignleft" />
          <HeaderStyle CssClass="alignleft" Width="400px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Execute In ERP" SortExpression="[EDI_Keys].[ExecuteInERP]">
          <ItemTemplate>
            <asp:Label ID="LabelExecuteInERP" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("ExecuteInERP") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
        <HeaderStyle CssClass="alignCenter" Width="50px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="ERP Company" SortExpression="[EDI_Keys].[ERPCompany]">
          <ItemTemplate>
            <asp:Label ID="LabelERPCompany" runat="server" ForeColor='<%# EVal("ForeColor") %>' Text='<%# Bind("ERPCompany") %>'></asp:Label>
          </ItemTemplate>
          <ItemStyle CssClass="alignCenter" />
        <HeaderStyle CssClass="alignCenter" Width="100px" />
        </asp:TemplateField>
      </Columns>
      <EmptyDataTemplate>
        <asp:Label ID="LabelEmpty" runat="server" Font-Size="Small" ForeColor="Red" Text="No record found !!!"></asp:Label>
      </EmptyDataTemplate>
    </asp:GridView>
    <asp:ObjectDataSource 
      ID = "ODSediKeys"
      runat = "server"
      DataObjectTypeName = "SIS.EDI.ediKeys"
      OldValuesParameterFormatString = "original_{0}"
      SelectMethod = "ediKeysSelectList"
      TypeName = "SIS.EDI.ediKeys"
      SelectCountMethod = "ediKeysSelectCount"
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
    <asp:AsyncPostBackTrigger ControlID="GVediKeys" EventName="PageIndexChanged" />
  </Triggers>
</asp:UpdatePanel>
</div>
</div>
</asp:Content>
