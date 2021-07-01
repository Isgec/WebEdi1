Partial Class AF_ediKeys
  Inherits SIS.SYS.InsertBase
  Protected Sub FVediKeys_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVediKeys.Init
    DataClassName = "AediKeys"
    SetFormView = FVediKeys
  End Sub
  Protected Sub TBLediKeys_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLediKeys.Init
    SetToolBar = TBLediKeys
  End Sub
  Protected Sub FVediKeys_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVediKeys.DataBound
    SIS.EDI.ediKeys.SetDefaultValues(sender, e) 
  End Sub
  Protected Sub FVediKeys_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVediKeys.PreRender
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/EDI_Main/App_Create") & "/AF_ediKeys.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptediKeys") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptediKeys", mStr)
    End If
    If Request.QueryString("EdiKey") IsNot Nothing Then
      CType(FVediKeys.FindControl("F_EdiKey"), TextBox).Text = Request.QueryString("EdiKey")
      CType(FVediKeys.FindControl("F_EdiKey"), TextBox).Enabled = False
    End If
  End Sub
  <System.Web.Services.WebMethod()> _
  Public Shared Function validatePK_ediKeys(ByVal value As String) As String
    Dim aVal() As String = value.Split(",".ToCharArray)
    Dim mRet As String="0|" & aVal(0)
    Dim EdiKey As String = CType(aVal(1),String)
    Dim oVar As SIS.EDI.ediKeys = SIS.EDI.ediKeys.ediKeysGetByID(EdiKey)
    If Not oVar Is Nothing Then
      mRet = "1|" & aVal(0) & "|Record allready exists." 
    End If
    Return mRet
  End Function

End Class
