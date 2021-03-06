Imports System.Web.Script.Serialization
Partial Class EF_ediKeys
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
  Protected Sub ODSediKeys_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ODSediKeys.Selected
    Dim tmp As SIS.EDI.ediKeys = CType(e.ReturnValue, SIS.EDI.ediKeys)
    Editable = tmp.Editable
    Deleteable = tmp.Deleteable
    PrimaryKey = tmp.PrimaryKey
  End Sub
  Protected Sub FVediKeys_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVediKeys.Init
    DataClassName = "EediKeys"
    SetFormView = FVediKeys
  End Sub
  Protected Sub TBLediKeys_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLediKeys.Init
    SetToolBar = TBLediKeys
  End Sub
  Protected Sub FVediKeys_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVediKeys.PreRender
    TBLediKeys.EnableSave = Editable
    TBLediKeys.EnableDelete = Deleteable
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/EDI_Main/App_Edit") & "/EF_ediKeys.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptediKeys") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptediKeys", mStr)
    End If
  End Sub

End Class
