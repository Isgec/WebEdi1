Imports System.Web.Script.Serialization
Partial Class EF_ediHistory
  Inherits SIS.SYS.UpdateBase
  Public Property Editable() As Boolean
    Get
      If ViewState("Editable") IsNot Nothing Then
        Return CType(ViewState("Editable"), Boolean)
      End If
      Return True
    End Get
    Set(ByVal value As Boolean)
      ViewState.Add("Editable", value)
    End Set
  End Property
  Public Property Deleteable() As Boolean
    Get
      If ViewState("Deleteable") IsNot Nothing Then
        Return CType(ViewState("Deleteable"), Boolean)
      End If
      Return True
    End Get
    Set(ByVal value As Boolean)
      ViewState.Add("Deleteable", value)
    End Set
  End Property
  Public Property PrimaryKey() As String
    Get
      If ViewState("PrimaryKey") IsNot Nothing Then
        Return CType(ViewState("PrimaryKey"), String)
      End If
      Return True
    End Get
    Set(ByVal value As String)
      ViewState.Add("PrimaryKey", value)
    End Set
  End Property
  Protected Sub ODSediHistory_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ODSediHistory.Selected
    Dim tmp As SIS.EDI.ediHistory = CType(e.ReturnValue, SIS.EDI.ediHistory)
    Editable = tmp.Editable
    Deleteable = tmp.Deleteable
    PrimaryKey = tmp.PrimaryKey
  End Sub
  Protected Sub FVediHistory_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVediHistory.Init
    DataClassName = "EediHistory"
    SetFormView = FVediHistory
  End Sub
  Protected Sub TBLediHistory_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLediHistory.Init
    SetToolBar = TBLediHistory
  End Sub
  Protected Sub FVediHistory_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVediHistory.PreRender
    TBLediHistory.EnableSave = Editable
    TBLediHistory.EnableDelete = Deleteable
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/EDI_Main/App_Edit") & "/EF_ediHistory.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptediHistory") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptediHistory", mStr)
    End If
  End Sub

End Class
