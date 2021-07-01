<%@ Control Language="VB" AutoEventWireup="false" CodeFile="LC_ediKeys.ascx.vb" Inherits="LC_ediKeys" %>
<asp:DropDownList 
  ID = "DDLediKeys"
  DataSourceID = "OdsDdlediKeys"
  AppendDataBoundItems = "true"
  SkinID = "DropDownSkin"
  Width="200px"
  CssClass = "myddl"
  Runat="server" />
<asp:RequiredFieldValidator 
  ID = "RequiredFieldValidatorediKeys"
  Runat = "server" 
  ControlToValidate = "DDLediKeys"
  ErrorMessage = "<div class='errorLG'>Required!</div>"
  Display = "Dynamic"
  EnableClientScript = "true"
  ValidationGroup = "none"
  SetFocusOnError = "true" />
<asp:ObjectDataSource 
  ID = "OdsDdlediKeys"
  TypeName = "SIS.EDI.ediKeys"
  SortParameterName = "OrderBy"
  SelectMethod = "ediKeysSelectList"
  Runat="server" />
