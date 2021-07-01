Partial Class tblGrid
  Inherits ToolBarGrid


  Private _AddUrl As String = ""
  Private _EditUrl As String = ""
  Private _PrintUrl As String = ""
  Private _CancelUrl As String = ""
  Private _SearchUrl As String = ""
  Private _ValidationGroup As String = ""
  Private _SearchContext As String = ""
  Private _AfterInsertURL As String = ""
  Private _AfterUpdateURL As String = ""
  Private _InsertAndStay As Boolean = True
  Private _UpdateAndStay As Boolean = False
  Private _AddPostBack As Boolean = False
  Private _PrintKey As String = ""
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
  Public Property AddPostBack() As Boolean
    Get
      Return _AddPostBack
    End Get
    Set(ByVal value As Boolean)
      _AddPostBack = value
      If value Then
        CmdExit.Enabled = False
      End If
    End Set
  End Property
  Public Overrides Property UpdateAndStay() As Boolean
    Get
      Return _UpdateAndStay
    End Get
    Set(ByVal value As Boolean)
      _UpdateAndStay = value
    End Set
  End Property
  Public Overrides Property InsertAndStay() As Boolean
    Get
      Return _InsertAndStay
    End Get
    Set(ByVal value As Boolean)
      _InsertAndStay = value
    End Set
  End Property
  Public Overrides Property AfterUpdateURL() As String
    Get
      Return _AfterUpdateURL
    End Get
    Set(ByVal value As String)
      _AfterUpdateURL = value
    End Set
  End Property
  Public Overrides Property AfterInsertURL() As String
    Get
      Return _AfterInsertURL
    End Get
    Set(ByVal value As String)
      _AfterInsertURL = value
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
  Public Property EnableExit() As Boolean
    Get
      Return CmdExit.Enabled
    End Get
    Set(ByVal value As Boolean)
      CmdExit.Enabled = value
    End Set
  End Property
  Public Property EnablePrint() As Boolean
    Get
      Return CmdPrint.Enabled
    End Get
    Set(ByVal value As Boolean)
      CmdPrint.Enabled = value
    End Set
  End Property
  Public Property CancelClientScript() As String
    Get
      Return CmdExit.OnClientClick
    End Get
    Set(ByVal value As String)
      CmdExit.OnClientClick = value
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
  Public Property EnableAdd() As Boolean
    Get
      Return CmdAdd.Enabled
    End Get
    Set(ByVal value As Boolean)
      CmdAdd.Enabled = value
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
  Public Property AddUrl() As String
    Get
      Return _AddUrl
    End Get
    Set(ByVal value As String)
      _AddUrl = value
    End Set
  End Property
  Public Property EditUrl() As String
    Get
      Return _EditUrl
    End Get
    Set(ByVal value As String)
      _EditUrl = value
    End Set
  End Property
  Public Property PrintUrl() As String
    Get
      Return _PrintUrl
    End Get
    Set(ByVal value As String)
      _PrintUrl = value
      CmdPrint.AlternateText = _PrintUrl
    End Set
  End Property
  Public Property CancelUrl() As String
    Get
      Return _CancelUrl
    End Get
    Set(ByVal value As String)
      _CancelUrl = value
      Me.CmdExit.PostBackUrl = value
    End Set
  End Property

  Protected Sub CmdCancel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles CmdExit.Click
    RaiseCancelClicked(sender, e)
  End Sub
  Protected Sub CmdAdd_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles CmdAdd.Click
    RaiseAddClicked(sender, e)
    If _AddPostBack Then
      If _AddUrl <> String.Empty Then
        Response.Redirect(_AddUrl)
      End If
    End If
  End Sub
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
  Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
    If Not _AddPostBack Then
      If _AddUrl <> String.Empty Then
        CmdAdd.CommandArgument = _AddUrl
        CmdAdd.PostBackUrl = _AddUrl
      End If
    End If
  End Sub
End Class
