Imports System.Web.Script.Serialization
Partial Class EF_ediQueues
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
  Protected Sub ODSediQueues_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ODSediQueues.Selected
    Dim tmp As SIS.EDI.ediQueues = CType(e.ReturnValue, SIS.EDI.ediQueues)
    Editable = tmp.Editable
    Deleteable = tmp.Deleteable
    PrimaryKey = tmp.PrimaryKey
  End Sub
  Protected Sub FVediQueues_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVediQueues.Init
    DataClassName = "EediQueues"
    SetFormView = FVediQueues
  End Sub
  Protected Sub TBLediQueues_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles TBLediQueues.Init
    SetToolBar = TBLediQueues
  End Sub
  Protected Sub FVediQueues_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles FVediQueues.PreRender
    TBLediQueues.EnableSave = Editable
    TBLediQueues.EnableDelete = Deleteable
    Dim mStr As String = ""
    Dim oTR As IO.StreamReader = New IO.StreamReader(HttpContext.Current.Server.MapPath("~/EDI_Main/App_Edit") & "/EF_ediQueues.js")
    mStr = oTR.ReadToEnd
    oTR.Close()
    oTR.Dispose()
    If Not Page.ClientScript.IsClientScriptBlockRegistered("scriptediQueues") Then
      Page.ClientScript.RegisterClientScriptBlock(GetType(System.String), "scriptediQueues", mStr)
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
