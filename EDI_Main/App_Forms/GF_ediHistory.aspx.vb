Imports System.Web.Script.Serialization
Partial Class GF_ediHistory
  Inherits SIS.SYS.GridBase
  Private _InfoUrl As String = "~/EDI_Main/App_Display/DF_ediHistory.aspx"
  Protected Sub Info_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
    Dim oBut As ImageButton = CType(sender, ImageButton)
    Dim aVal() As String = oBut.CommandArgument.ToString.Split(",".ToCharArray)
    Dim RedirectUrl As String = _InfoUrl  & "?HistoryNo=" & aVal(0)
    Response.Redirect(RedirectUrl)
  End Sub
  Protected Sub GVediHistory_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVediHistory.RowCommand
    If e.CommandName.ToLower = "lgedit".ToLower Then
      Try
        Dim HistoryNo As Int32 = GVediHistory.DataKeys(e.CommandArgument).Values("HistoryNo")  
        Dim RedirectUrl As String = TBLediHistory.EditUrl & "?HistoryNo=" & HistoryNo
        Response.Redirect(RedirectUrl)
      Catch ex As Exception
        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "", "alert('" & New JavaScriptSerializer().Serialize(ex.Message) & "');", True)
      End Try
    End If
  End Sub
  Protected Sub GVediHistory_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVediHistory.Init
    DataClassName = "GediHistory"
    SetGridView = GVediHistory
  End Sub
  Protected Sub TBLediHistory_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLediHistory.Init
    SetToolBar = TBLediHistory
  End Sub
  Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
  End Sub
End Class
