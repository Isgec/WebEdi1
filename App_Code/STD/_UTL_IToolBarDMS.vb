Imports Microsoft.VisualBasic
Public MustInherit Class ToolBarDMS
  Inherits System.Web.UI.UserControl
  Public MustOverride Property CurrentPage() As Integer
  Public MustOverride Property TotalPages() As Integer
  Public MustOverride Property RecordsPerPage() As Integer


  Public Event PageChanged(ByVal NewPageNo As Integer, ByVal PageSize As Integer)
  Public Event SearchClicked(ByVal SearchText As String, ByVal SearchState As Boolean)
  Public Sub RaisePageChanged(ByVal NewPageNo As Integer, ByVal PageSize As Integer)
    RaiseEvent PageChanged(NewPageNo, PageSize)
  End Sub
  Public Sub RaiseSearchClicked(ByVal SearchText As String, ByVal SearchState As Boolean)
    RaiseEvent SearchClicked(SearchText, SearchState)
  End Sub
End Class
