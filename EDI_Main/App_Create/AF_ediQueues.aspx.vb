Partial Class AF_ediQueues
  Inherits SIS.SYS.InsertBase
  Protected Sub FVediQueues_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVediQueues.Init
    DataClassName = "AediQueues"
    SetFormView = FVediQueues
  End Sub
  Protected Sub TBLediQueues_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLediQueues.Init
    SetToolBar = TBLediQueues
  End Sub
  Protected Sub FVediQueues_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVediQueues.DataBound
    SIS.EDI.ediQueues.SetDefaultValues(sender, e) 
  End Sub
  Protected Sub FVediQueues_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVediQueues.PreRender
    Dim oF_EdiKey_Display As Label  = FVediQueues.FindControl("F_EdiKey_Display")
    oF_EdiKey_Display.Text = String.Empty
    If Not Session("F_EdiKey_Display") Is Nothing Then
      If Session("F_EdiKey_Display") <> String.Empty Then
        oF_EdiKey_Display.Text = Session("F_EdiKey_Display")
      End If
    End If
    Dim oF_EdiKey As TextBox  = FVediQueues.FindControl("F_EdiKey")
    oF_EdiKey.Enabled = True
    oF_EdiKey.Text = String.Empty
    If Not Session("F_EdiKey") Is Nothing Then
      If Session("F_EdiKey") <> String.Empty Then
        oF_EdiKey.Text = Session("F_EdiKey")
      End If
    End If
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/EDI_Main/App_Create") & "/AF_ediQueues.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptediQueues") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptediQueues", mStr)
    End If
    If Request.QueryString("SerialNo") IsNot Nothing Then
      CType(FVediQueues.FindControl("F_SerialNo"), TextBox).Text = Request.QueryString("SerialNo")
      CType(FVediQueues.FindControl("F_SerialNo"), TextBox).Enabled = False
    End If
  End Sub
  <System.Web.Services.WebMethod()> _
  <System.Web.Script.Services.ScriptMethod()> _
  Public Shared Function EdiKeyCompletionList(ByVal prefixText As String, ByVal count As Integer, ByVal contextKey As String) As String()
    Return SIS.EDI.ediKeys.SelectediKeysAutoCompleteList(prefixText, count, contextKey)
  End Function
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
