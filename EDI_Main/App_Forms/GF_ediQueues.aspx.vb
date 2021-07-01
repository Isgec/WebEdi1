Imports System.Web.Script.Serialization
Partial Class GF_ediQueues
  Inherits SIS.SYS.GridBase
  Private _InfoUrl As String = "~/EDI_Main/App_Display/DF_ediQueues.aspx"
  Protected Sub Info_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
    Dim oBut As ImageButton = CType(sender, ImageButton)
    Dim aVal() As String = oBut.CommandArgument.ToString.Split(",".ToCharArray)
    Dim RedirectUrl As String = _InfoUrl  & "?SerialNo=" & aVal(0)
    Response.Redirect(RedirectUrl)
  End Sub
  Protected Sub GVediQueues_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVediQueues.RowCommand
    If e.CommandName.ToLower = "lgedit".ToLower Then
      Try
        Dim SerialNo As Int32 = GVediQueues.DataKeys(e.CommandArgument).Values("SerialNo")  
        Dim RedirectUrl As String = TBLediQueues.EditUrl & "?SerialNo=" & SerialNo
        Response.Redirect(RedirectUrl)
      Catch ex As Exception
        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", "alert('" & New JavaScriptSerializer().Serialize(ex.Message) & "');", True)
      End Try
    End If
    If e.CommandName.ToLower = "Deletewf".ToLower Then
      Try
        Dim SerialNo As Int32 = GVediQueues.DataKeys(e.CommandArgument).Values("SerialNo")  
        SIS.EDI.ediQueues.DeleteWF(SerialNo)
        GVediQueues.DataBind()
      Catch ex As Exception
        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", "alert('" & New JavaScriptSerializer().Serialize(ex.Message) & "');", True)
      End Try
    End If
    If e.CommandName.ToLower = "initiatewf".ToLower Then
      Try
        Dim SerialNo As Int32 = GVediQueues.DataKeys(e.CommandArgument).Values("SerialNo")  
        SIS.EDI.ediQueues.InitiateWF(SerialNo)
        GVediQueues.DataBind()
      Catch ex As Exception
        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", "alert('" & New JavaScriptSerializer().Serialize(ex.Message) & "');", True)
      End Try
    End If
  End Sub
  Protected Sub GVediQueues_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVediQueues.Init
    DataClassName = "GediQueues"
    SetGridView = GVediQueues
  End Sub
  Protected Sub TBLediQueues_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLediQueues.Init
    SetToolBar = TBLediQueues
  End Sub
  Protected Sub F_EdiKey_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles F_EdiKey.TextChanged
    Session("F_EdiKey") = F_EdiKey.Text
    Session("F_EdiKey_Display") = F_EdiKey_Display.Text
    InitGridPage()
  End Sub
  <System.Web.Services.WebMethod()> _
  <System.Web.Script.Services.ScriptMethod()> _
  Public Shared Function EdiKeyCompletionList(ByVal prefixText As String, ByVal count As Integer, ByVal contextKey As String) As String()
    Return SIS.EDI.ediKeys.SelectediKeysAutoCompleteList(prefixText, count, contextKey)
  End Function
  Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
    F_EdiKey_Display.Text = String.Empty
    If Not Session("F_EdiKey_Display") Is Nothing Then
      If Session("F_EdiKey_Display") <> String.Empty Then
        F_EdiKey_Display.Text = Session("F_EdiKey_Display")
      End If
    End If
    F_EdiKey.Text = String.Empty
    If Not Session("F_EdiKey") Is Nothing Then
      If Session("F_EdiKey") <> String.Empty Then
        F_EdiKey.Text = Session("F_EdiKey")
      End If
    End If
    Dim strScriptEdiKey As String = "<script type=""text/javascript""> " & _
      "function ACEEdiKey_Selected(sender, e) {" & _
      "  var F_EdiKey = $get('" & F_EdiKey.ClientID & "');" & _
      "  var F_EdiKey_Display = $get('" & F_EdiKey_Display.ClientID & "');" & _
      "  var retval = e.get_value();" & _
      "  var p = retval.split('|');" & _
      "  F_EdiKey.value = p[0];" & _
      "  F_EdiKey_Display.innerHTML = e.get_text();" & _
      "}" & _
      "</script>"
      If Not Page.ClientScript.IsClientScriptBlockRegistered("F_EdiKey") Then
        Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "F_EdiKey", strScriptEdiKey)
      End If
    Dim strScriptPopulatingEdiKey As String = "<script type=""text/javascript""> " & _
      "function ACEEdiKey_Populating(o,e) {" & _
      "  var p = $get('" & F_EdiKey.ClientID & "');" & _
      "  p.style.backgroundImage  = 'url(../../images/loader.gif)';" & _
      "  p.style.backgroundRepeat= 'no-repeat';" & _
      "  p.style.backgroundPosition = 'right';" & _
      "  o._contextKey = '';" & _
      "}" & _
      "function ACEEdiKey_Populated(o,e) {" & _
      "  var p = $get('" & F_EdiKey.ClientID & "');" & _
      "  p.style.backgroundImage  = 'none';" & _
      "}" & _
      "</script>"
      If Not Page.ClientScript.IsClientScriptBlockRegistered("F_EdiKeyPopulating") Then
        Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "F_EdiKeyPopulating", strScriptPopulatingEdiKey)
      End If
    Dim validateScriptEdiKey As String = "<script type=""text/javascript"">" & _
      "  function validate_EdiKey(o) {" & _
      "    validated_FK_EDI_Queues_EDIKey_main = true;" & _
      "    validate_FK_EDI_Queues_EDIKey(o);" & _
      "  }" & _
      "</script>"
    If Not Page.ClientScript.IsClientScriptBlockRegistered("validateEdiKey") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "validateEdiKey", validateScriptEdiKey)
    End If
    Dim validateScriptFK_EDI_Queues_EDIKey As String = "<script type=""text/javascript"">" & _
      "  function validate_FK_EDI_Queues_EDIKey(o) {" & _
      "    var value = o.id;" & _
      "    var EdiKey = $get('" & F_EdiKey.ClientID & "');" & _
      "    try{" & _
      "    if(EdiKey.value==''){" & _
      "      if(validated_FK_EDI_Queues_EDIKey.main){" & _
      "        var o_d = $get(o.id +'_Display');" & _
      "        try{o_d.innerHTML = '';}catch(ex){}" & _
      "      }" & _
      "    }" & _
      "    value = value + ',' + EdiKey.value ;" & _
      "    }catch(ex){}" & _
      "    o.style.backgroundImage  = 'url(../../images/pkloader.gif)';" & _
      "    o.style.backgroundRepeat= 'no-repeat';" & _
      "    o.style.backgroundPosition = 'right';" & _
      "    PageMethods.validate_FK_EDI_Queues_EDIKey(value, validated_FK_EDI_Queues_EDIKey);" & _
      "  }" & _
      "  validated_FK_EDI_Queues_EDIKey_main = false;" & _
      "  function validated_FK_EDI_Queues_EDIKey(result) {" & _
      "    var p = result.split('|');" & _
      "    var o = $get(p[1]);" & _
      "    var o_d = $get(p[1]+'_Display');" & _
      "    try{o_d.innerHTML = p[2];}catch(ex){}" & _
      "    o.style.backgroundImage  = 'none';" & _
      "    if(p[0]=='1'){" & _
      "      o.value='';" & _
      "      try{o_d.innerHTML = '';}catch(ex){}" & _
      "      __doPostBack(o.id, o.value);" & _
      "    }" & _
      "    else" & _
      "      __doPostBack(o.id, o.value);" & _
      "  }" & _
      "</script>"
    If Not Page.ClientScript.IsClientScriptBlockRegistered("validateFK_EDI_Queues_EDIKey") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "validateFK_EDI_Queues_EDIKey", validateScriptFK_EDI_Queues_EDIKey)
    End If
  End Sub
  <System.Web.Services.WebMethod()> _
  Public Shared Function validate_FK_EDI_Queues_EDIKey(ByVal value As String) As String
    Dim aVal() As String = value.Split(",".ToCharArray)
    Dim mRet As String="0|" & aVal(0)
    Dim EdiKey As String = CType(aVal(1),String)
    Dim oVar As SIS.EDI.ediKeys = SIS.EDI.ediKeys.ediKeysGetByID(EdiKey)
    If oVar Is Nothing Then
      mRet = "1|" & aVal(0) & "|Record not found." 
    Else
      mRet = "0|" & aVal(0) & "|" & oVar.DisplayField 
    End If
    Return mRet
  End Function
End Class
