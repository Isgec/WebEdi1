Imports System.Web.Script.Serialization
Partial Class GF_ediKeys
  Inherits SIS.SYS.GridBase
  Private _InfoUrl As String = "~/EDI_Main/App_Display/DF_ediKeys.aspx"
  Protected Sub Info_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
    Dim oBut As ImageButton = CType(sender, ImageButton)
    Dim aVal() As String = oBut.CommandArgument.ToString.Split(",".ToCharArray)
    Dim RedirectUrl As String = _InfoUrl  & "?EdiKey=" & aVal(0)
    Response.Redirect(RedirectUrl)
  End Sub
  Protected Sub GVediKeys_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVediKeys.RowCommand
    If e.CommandName.ToLower = "lgedit".ToLower Then
      Try
        Dim EdiKey As String = GVediKeys.DataKeys(e.CommandArgument).Values("EdiKey")  
        Dim RedirectUrl As String = TBLediKeys.EditUrl & "?EdiKey=" & EdiKey
        Response.Redirect(RedirectUrl)
      Catch ex As Exception
        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", "alert('" & New JavaScriptSerializer().Serialize(ex.Message) & "');", True)
      End Try
    End If
  End Sub
  Protected Sub GVediKeys_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVediKeys.Init
    DataClassName = "GediKeys"
    SetGridView = GVediKeys
  End Sub
  Protected Sub TBLediKeys_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLediKeys.Init
    SetToolBar = TBLediKeys
  End Sub
  Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
  End Sub
End Class
