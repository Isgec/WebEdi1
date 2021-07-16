Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient
Imports System.ComponentModel
Namespace SIS.EDI
  <DataObject()> _
  Partial Public Class ediKeys
    Private Shared _RecordCount As Integer
    Public Property EdiKey As String = ""
    Public Property EdiParameters As String = ""
    Public Property IsSP As Boolean = False
    Public Property SqlStatement As String = ""
    Public Property ExecuteInERP As Boolean = False
    Public Property ERPCompany As String = ""
    Public ReadOnly Property ForeColor() As System.Drawing.Color
      Get
        Dim mRet As System.Drawing.Color = Drawing.Color.Blue
        Try
          mRet = GetColor()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public ReadOnly Property Visible() As Boolean
      Get
        Dim mRet As Boolean = True
        Try
          mRet = GetVisible()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public ReadOnly Property Enable() As Boolean
      Get
        Dim mRet As Boolean = True
        Try
          mRet = GetEnable()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public Readonly Property DisplayField() As String
      Get
        Return "" & _EdiParameters.ToString.PadRight(1000, " ")
      End Get
    End Property
    Public Readonly Property PrimaryKey() As String
      Get
        Return _EdiKey
      End Get
    End Property
    Public Shared Property RecordCount() As Integer
      Get
        Return _RecordCount
      End Get
      Set(ByVal value As Integer)
        _RecordCount = value
      End Set
    End Property
    Public Class PKediKeys
      Private _EdiKey As String = ""
      Public Property EdiKey() As String
        Get
          Return _EdiKey
        End Get
        Set(ByVal value As String)
          _EdiKey = value
        End Set
      End Property
    End Class
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function ediKeysSelectList(ByVal OrderBy As String) As List(Of SIS.EDI.ediKeys)
      Dim Results As List(Of SIS.EDI.ediKeys) = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spediKeysSelectList"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@OrderBy", SqlDbType.NVarChar, 50, OrderBy)
          Cmd.Parameters.Add("@RecordCount", SqlDbType.Int)
          Cmd.Parameters("@RecordCount").Direction = ParameterDirection.Output
          _RecordCount = -1
          Results = New List(Of SIS.EDI.ediKeys)()
          Con.Open()
          Dim Reader As SqlDataReader = Cmd.ExecuteReader()
          While (Reader.Read())
            Results.Add(New SIS.EDI.ediKeys(Reader))
          End While
          Reader.Close()
          _RecordCount = Cmd.Parameters("@RecordCount").Value
        End Using
      End Using
      Return Results
    End Function
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function ediKeysGetNewRecord() As SIS.EDI.ediKeys
      Return New SIS.EDI.ediKeys()
    End Function
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function ediKeysGetByID(ByVal EdiKey As String) As SIS.EDI.ediKeys
      Dim Results As SIS.EDI.ediKeys = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spediKeysSelectByID"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@EdiKey",SqlDbType.NVarChar,EdiKey.ToString.Length, EdiKey)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
          Con.Open()
          Dim Reader As SqlDataReader = Cmd.ExecuteReader()
          If Reader.Read() Then
            Results = New SIS.EDI.ediKeys(Reader)
          End If
          Reader.Close()
        End Using
      End Using
      Return Results
    End Function
    <DataObjectMethod(DataObjectMethodType.Select)> _
    Public Shared Function ediKeysSelectList(ByVal StartRowIndex As Integer, ByVal MaximumRows As Integer, ByVal OrderBy As String, ByVal SearchState As Boolean, ByVal SearchText As String) As List(Of SIS.EDI.ediKeys)
      Dim Results As List(Of SIS.EDI.ediKeys) = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          If SearchState Then
            Cmd.CommandText = "spediKeysSelectListSearch"
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@KeyWord", SqlDbType.NVarChar, 250, SearchText)
          Else
            Cmd.CommandText = "spediKeysSelectListFilteres"
          End If
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StartRowIndex", SqlDbType.Int, -1, StartRowIndex)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MaximumRows", SqlDbType.Int, -1, MaximumRows)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@OrderBy", SqlDbType.NVarChar, 50, OrderBy)
          Cmd.Parameters.Add("@RecordCount", SqlDbType.Int)
          Cmd.Parameters("@RecordCount").Direction = ParameterDirection.Output
          _RecordCount = -1
          Results = New List(Of SIS.EDI.ediKeys)()
          Con.Open()
          Dim Reader As SqlDataReader = Cmd.ExecuteReader()
          While (Reader.Read())
            Results.Add(New SIS.EDI.ediKeys(Reader))
          End While
          Reader.Close()
          _RecordCount = Cmd.Parameters("@RecordCount").Value
        End Using
      End Using
      Return Results
    End Function
    Public Shared Function ediKeysSelectCount(ByVal SearchState As Boolean, ByVal SearchText As String) As Integer
      Return _RecordCount
    End Function
      'Select By ID One Record Filtered Overloaded GetByID
    <DataObjectMethod(DataObjectMethodType.Insert, True)> _
    Public Shared Function ediKeysInsert(ByVal Record As SIS.EDI.ediKeys) As SIS.EDI.ediKeys
      Dim _Rec As SIS.EDI.ediKeys = SIS.EDI.ediKeys.ediKeysGetNewRecord()
      With _Rec
        .EdiKey = Record.EdiKey
        .EdiParameters = Record.EdiParameters
        .IsSP = Record.IsSP
        .SqlStatement = Record.SqlStatement
        .ExecuteInERP = Record.ExecuteInERP
        .ERPCompany = Record.ERPCompany
      End With
      Return SIS.EDI.ediKeys.InsertData(_Rec)
    End Function
    Public Shared Function InsertData(ByVal Record As SIS.EDI.ediKeys) As SIS.EDI.ediKeys
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spediKeysInsert"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@EdiKey",SqlDbType.NVarChar,51, Record.EdiKey)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@EdiParameters",SqlDbType.NVarChar,1001, Iif(Record.EdiParameters= "" ,Convert.DBNull, Record.EdiParameters))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@IsSP",SqlDbType.Bit,3, Record.IsSP)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SqlStatement",SqlDbType.NVarChar,2147484, Iif(Record.SqlStatement= "" ,Convert.DBNull, Record.SqlStatement))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ExecuteInERP",SqlDbType.Bit,3, Record.ExecuteInERP)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ERPCompany", SqlDbType.NVarChar, 4, Record.ERPCompany)
          Cmd.Parameters.Add("@Return_EdiKey", SqlDbType.NVarChar, 51)
          Cmd.Parameters("@Return_EdiKey").Direction = ParameterDirection.Output
          Con.Open()
          Cmd.ExecuteNonQuery()
          Record.EdiKey = Cmd.Parameters("@Return_EdiKey").Value
        End Using
      End Using
      Return Record
    End Function
    <DataObjectMethod(DataObjectMethodType.Update, True)>
    Public Shared Function ediKeysUpdate(ByVal Record As SIS.EDI.ediKeys) As SIS.EDI.ediKeys
      Dim _Rec As SIS.EDI.ediKeys = SIS.EDI.ediKeys.ediKeysGetByID(Record.EdiKey)
      With _Rec
        .EdiParameters = Record.EdiParameters
        .IsSP = Record.IsSP
        .SqlStatement = Record.SqlStatement
        .ExecuteInERP = Record.ExecuteInERP
        .ERPCompany = Record.ERPCompany
      End With
      Return SIS.EDI.ediKeys.UpdateData(_Rec)
    End Function
    Public Shared Function UpdateData(ByVal Record As SIS.EDI.ediKeys) As SIS.EDI.ediKeys
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spediKeysUpdate"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Original_EdiKey", SqlDbType.NVarChar, 51, Record.EdiKey)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@EdiKey", SqlDbType.NVarChar, 51, Record.EdiKey)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@EdiParameters", SqlDbType.NVarChar, 1001, IIf(Record.EdiParameters = "", Convert.DBNull, Record.EdiParameters))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@IsSP", SqlDbType.Bit, 3, Record.IsSP)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@SqlStatement", SqlDbType.NVarChar, 2147484, IIf(Record.SqlStatement = "", Convert.DBNull, Record.SqlStatement))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ExecuteInERP", SqlDbType.Bit, 3, Record.ExecuteInERP)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@ERPCompany", SqlDbType.NVarChar, 4, Record.ERPCompany)
          Cmd.Parameters.Add("@RowCount", SqlDbType.Int)
          Cmd.Parameters("@RowCount").Direction = ParameterDirection.Output
          _RecordCount = -1
          Con.Open()
          Cmd.ExecuteNonQuery()
          _RecordCount = Cmd.Parameters("@RowCount").Value
        End Using
      End Using
      Return Record
    End Function
    <DataObjectMethod(DataObjectMethodType.Delete, True)> _
    Public Shared Function ediKeysDelete(ByVal Record As SIS.EDI.ediKeys) As Int32
      Dim _Result as Integer = 0
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spediKeysDelete"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Original_EdiKey",SqlDbType.NVarChar,Record.EdiKey.ToString.Length, Record.EdiKey)
          Cmd.Parameters.Add("@RowCount", SqlDbType.Int)
          Cmd.Parameters("@RowCount").Direction = ParameterDirection.Output
          _RecordCount = -1
          Con.Open()
          Cmd.ExecuteNonQuery()
          _RecordCount = Cmd.Parameters("@RowCount").Value
        End Using
      End Using
      Return _RecordCount
    End Function
'    Autocomplete Method
    Public Shared Function SelectediKeysAutoCompleteList(ByVal Prefix As String, ByVal count As Integer, ByVal contextKey As String) As String()
      Dim Results As List(Of String) = Nothing
      Dim aVal() As String = contextKey.Split("|".ToCharArray)
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          Cmd.CommandText = "spediKeysAutoCompleteList"
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@prefix", SqlDbType.NVarChar, 50, Prefix)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@records", SqlDbType.Int, -1, count)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@bycode", SqlDbType.Int, 1, IIf(IsNumeric(Prefix),0,IIf(Prefix.ToLower=Prefix, 0, 1)))
          Results = New List(Of String)()
          Con.Open()
          Dim Reader As SqlDataReader = Cmd.ExecuteReader()
          If Not Reader.HasRows Then
            Results.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem("---Select Value---".PadRight(1000, " "),""))
          End If
          While (Reader.Read())
            Dim Tmp As SIS.EDI.ediKeys = New SIS.EDI.ediKeys(Reader)
            Results.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(Tmp.DisplayField, Tmp.PrimaryKey))
          End While
          Reader.Close()
        End Using
      End Using
      Return Results.ToArray
    End Function
    Public Sub New(ByVal Reader As SqlDataReader)
      SIS.SYS.SQLDatabase.DBCommon.NewObj(Me, Reader)
    End Sub
    Public Sub New()
    End Sub
  End Class
End Namespace
