Imports Microsoft.VisualBasic
Public MustInherit Class ToolBarGrid
  Inherits System.Web.UI.UserControl
  Public MustOverride Property CurrentPage() As Integer
  Public MustOverride Property TotalPages() As Integer
  Public MustOverride Property RecordsPerPage() As Integer
  Public MustOverride Property AfterInsertURL() As String
  Public MustOverride Property AfterUpdateURL() As String
  Public MustOverride Property InsertAndStay() As Boolean
  Public MustOverride Property UpdateAndStay() As Boolean


  Public Event PageChanged(ByVal NewPageNo As Integer, ByVal PageSize As Integer)
  Public Event SearchClicked(ByVal SearchText As String, ByVal SearchState As Boolean)
  Public Event AddClicked(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
  Public Event CancelClicked(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
  Public Sub RaisePageChanged(ByVal NewPageNo As Integer, ByVal PageSize As Integer)
    RaiseEvent PageChanged(NewPageNo, PageSize)
  End Sub
  Public Sub RaiseSearchClicked(ByVal SearchText As String, ByVal SearchState As Boolean)
    RaiseEvent SearchClicked(SearchText, SearchState)
  End Sub
  Public Sub RaiseAddClicked(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
    RaiseEvent AddClicked(sender, e)
  End Sub
  Public Sub RaiseCancelClicked(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
    RaiseEvent CancelClicked(sender, e)
  End Sub
End Class
