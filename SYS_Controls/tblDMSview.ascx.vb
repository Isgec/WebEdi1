Partial Class tblDMSview
  Inherits ToolBarDMS
  Private _SearchUrl As String = ""
  Private _SearchContext As String = ""
  Public Property HideSearch As Boolean
    Get
      Return tdSearch.Visible
    End Get
    Set(value As Boolean)
      tdSearch.Visible = value
    End Set
  End Property
  Public Property HidePaging As Boolean
    Get
      Return tdPage.Visible
    End Get
    Set(value As Boolean)
      tdPage.Visible = value
    End Set
  End Property
  Public Property SearchState() As Boolean
    Get
      Return DisableSearch.Checked
    End Get
    Set(ByVal value As Boolean)
      DisableSearch.Checked = value
    End Set
  End Property
  Public Property EnableSearch() As Boolean
    Get
      Return CmdSearch.Enabled
    End Get
    Set(ByVal value As Boolean)
      CmdSearch.Enabled = value
    End Set
  End Property
  Public Property TotalRecords() As Integer
    Get
      Return _PageSizeButton.Text
    End Get
    Set(ByVal value As Integer)
      _PageSizeButton.Text = value
    End Set
  End Property
  Public Overrides Property RecordsPerPage() As Integer
    Get
      Return _PageSize.Text
    End Get
    Set(ByVal value As Integer)
      _PageSize.Text = value
    End Set
  End Property
  Public Overrides Property TotalPages() As Integer
    Get
      Return _TotalPages.Text
    End Get
    Set(ByVal value As Integer)
      _TotalPages.Text = value
    End Set
  End Property
  Public Overrides Property CurrentPage() As Integer
    Get
      Return _CurrentPage.Text
    End Get
    Set(ByVal value As Integer)
      _CurrentPage.Text = value + 1
    End Set
  End Property
  Public Property SearchContext() As String
    Get
      Return _SearchContext
    End Get
    Set(ByVal value As String)
      _SearchContext = value
    End Set
  End Property
  Protected Sub SearchButton_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles CmdSearch.Click
    If Not SearchTextBox.Text = String.Empty Then
      DisableSearch.Enabled = True
      DisableSearch.Checked = True
      RaiseSearchClicked(SearchTextBox.Text, True)
    End If
  End Sub
  Protected Sub DisableSearch_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DisableSearch.CheckedChanged
    DisableSearch.Enabled = False
    DisableSearch.Checked = False
    RaiseSearchClicked(SearchTextBox.Text, False)
  End Sub
  Protected Sub _CurrentPage_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles _CurrentPage.TextChanged
    RaisePageChanged(Convert.ToInt32(_CurrentPage.Text) - 1, Convert.ToInt32(_PageSize.Text))
  End Sub
  Protected Sub navFirst_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles navFirst.Click
    RaisePageChanged(0, Convert.ToInt32(_PageSize.Text))
  End Sub
  Protected Sub navPrev_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles navPrev.Click
    Dim cp As Integer = Convert.ToInt32(_CurrentPage.Text)
    If cp - 1 >= 1 Then
      RaisePageChanged(cp - 2, Convert.ToInt32(_PageSize.Text))
    End If
  End Sub
  Protected Sub navNext_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles navNext.Click
    Dim cp As Integer = Convert.ToInt32(_CurrentPage.Text)
    Dim lp As Integer = Convert.ToInt32(_TotalPages.Text)
    If cp + 1 <= lp Then
      RaisePageChanged(cp, Convert.ToInt32(_PageSize.Text))
    End If
  End Sub
  Protected Sub navLast_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles navLast.Click
    Dim lp As Integer = Convert.ToInt32(_TotalPages.Text)
    RaisePageChanged(lp - 1, Convert.ToInt32(_PageSize.Text))
  End Sub
  Protected Sub _PageSizeButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles _PageSizeButton.Click
    RaisePageChanged(Convert.ToInt32(_CurrentPage.Text) - 1, Convert.ToInt32(_PageSize.Text))
  End Sub
  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    If Not Page.IsPostBack And Not Page.IsCallback Then
      Dim MayPush As Boolean = False
      Try
        If Request.UrlReferrer.AbsoluteUri IsNot Nothing Then
          MayPush = True
        End If
      Catch ex As Exception
      End Try
      Try
        If MayPush Then
          SIS.SYS.Utilities.SessionManager.PushNavBar(System.Web.HttpContext.Current.Request.Url.ToString, Request.UrlReferrer.AbsoluteUri)
        End If
      Catch ex As Exception
        SIS.SYS.Utilities.SessionManager.DestroySessionEnvironement()
        Response.Redirect("~/SISError.aspx")
      End Try
    End If
  End Sub
End Class
