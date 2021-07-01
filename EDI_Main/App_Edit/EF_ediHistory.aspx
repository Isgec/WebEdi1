<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="EF_ediHistory.aspx.vb" Inherits="EF_ediHistory" title="Edit: EDI History" %>
<asp:Content ID="CPHediHistory" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabelediHistory" runat="server" Text="&nbsp;Edit: EDI History"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLediHistory" runat="server" >
<ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLediHistory"
    ToolType = "lgNMEdit"
    UpdateAndStay = "False"
    EnableDelete = "False"
    EnableSave ="false"
    ValidationGroup = "ediHistory"
    runat = "server" />
<asp:FormView ID="FVediHistory"
  runat = "server"
  DataKeyNames = "HistoryNo"
  DataSourceID = "ODSediHistory"
  DefaultMode = "Edit" CssClass="sis_formview">
  <EditItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_HistoryNo" runat="server" ForeColor="#CC6633" Text="History No :" /><span style="color:red">*</span></b>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_HistoryNo"
            Text='<%# Bind("HistoryNo") %>'
            ToolTip="Value of History No."
            Enabled = "False"
            CssClass = "mypktxt"
            Width="88px"
            style="text-align: right"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_SerialNo" runat="server" Text="Serial No :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_SerialNo"
            Text='<%# Bind("SerialNo") %>'
            style="text-align: right"
            Width="88px"
            CssClass = "mytxt"
            ValidationGroup= "ediHistory"
            MaxLength="10"
            onfocus = "return this.select();"
            runat="server" />
          <AJX:MaskedEditExtender 
            ID = "MEESerialNo"
            runat = "server"
            mask = "9999999999"
            AcceptNegative = "Left"
            MaskType="Number"
            MessageValidatorTip="true"
            InputDirection="RightToLeft"
            ErrorTooltipEnabled="true"
            TargetControlID="F_SerialNo" />
          <AJX:MaskedEditValidator 
            ID = "MEVSerialNo"
            runat = "server"
            ControlToValidate = "F_SerialNo"
            ControlExtender = "MEESerialNo"
            EmptyValueBlurredText = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "ediHistory"
            IsValidEmpty = "false"
            MinimumValue = "1"
            SetFocusOnError="true" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_EdiKey" runat="server" Text="Edi Key :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_EdiKey"
            Text='<%# Bind("EdiKey") %>'
            Width="408px"
            CssClass = "dmytxt"
            Enabled="false"
            MaxLength="500"
            TextMode="MultiLine"
            Height="50px"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_EdiValues" runat="server" Text="Edi Values :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_EdiValues"
            Text='<%# Bind("EdiValues") %>'
            Width="500px"
            CssClass = "dmytxt"
            MaxLength="2147483"
            TextMode="MultiLine"
            Height="50px"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ExecutedStatement" runat="server" Text="Executed Statement :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_ExecutedStatement"
            Text='<%# Bind("ExecutedStatement") %>'
            Width="500px"
            CssClass = "dmytxt"
            Enabled="false"
            MaxLength="2147483"
            TextMode="MultiLine"
            Height="80px"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ExecutedOn" runat="server" Text="Executed On :" /><span style="color:red">*</span>
        </td>
        <td colspan="3">
          <asp:TextBox ID="F_ExecutedOn"
            Text='<%# Bind("ExecutedOn") %>'
            Width="140px"
            CssClass = "dmytxt"
            Enabled="false"
            runat="server" />
        </td>
      </tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
    </table>
  </div>
  </EditItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODSediHistory"
  DataObjectTypeName = "SIS.EDI.ediHistory"
  SelectMethod = "ediHistoryGetByID"
  UpdateMethod="ediHistoryUpdate"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.EDI.ediHistory"
  runat = "server" >
<SelectParameters>
  <asp:QueryStringParameter DefaultValue="0" QueryStringField="HistoryNo" Name="HistoryNo" Type="Int32" />
</SelectParameters>
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>
