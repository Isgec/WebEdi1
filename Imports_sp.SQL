SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spediKeysSelectList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spediKeysSelectList]
GO
 
CREATE PROCEDURE [dbo].[spediKeysSelectList]
  @LoginID NVarChar(8),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  SELECT
    [EDI_Keys].*  
  FROM [EDI_Keys] 
  WHERE 1 = 1  
  ORDER BY
     CASE @OrderBy WHEN 'EdiKey' THEN [EDI_Keys].[EdiKey] END,
     CASE @OrderBy WHEN 'EdiKey DESC' THEN [EDI_Keys].[EdiKey] END DESC,
     CASE @OrderBy WHEN 'EdiParameters' THEN [EDI_Keys].[EdiParameters] END,
     CASE @OrderBy WHEN 'EdiParameters DESC' THEN [EDI_Keys].[EdiParameters] END DESC,
     CASE @OrderBy WHEN 'IsSP' THEN [EDI_Keys].[IsSP] END,
     CASE @OrderBy WHEN 'IsSP DESC' THEN [EDI_Keys].[IsSP] END DESC,
     CASE @OrderBy WHEN 'SqlStatement' THEN [EDI_Keys].[SqlStatement] END,
     CASE @OrderBy WHEN 'SqlStatement DESC' THEN [EDI_Keys].[SqlStatement] END DESC,
     CASE @OrderBy WHEN 'ExecuteInERP' THEN [EDI_Keys].[ExecuteInERP] END,
     CASE @OrderBy WHEN 'ExecuteInERP DESC' THEN [EDI_Keys].[ExecuteInERP] END DESC,
     CASE @OrderBy WHEN 'ERPCompany' THEN [EDI_Keys].[ERPCompany] END,
     CASE @OrderBy WHEN 'ERPCompany DESC' THEN [EDI_Keys].[ERPCompany] END DESC 
  SET @RecordCount = @@RowCount
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spediKeysAutoCompleteList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spediKeysAutoCompleteList]
GO
 
CREATE PROCEDURE [dbo].[spediKeysAutoCompleteList]
  @LoginID NVarChar(8),
  @Prefix NVarChar(250),
  @Records Int,
  @ByCode Int 
  AS 
  BEGIN 
  DECLARE @Prefix1 VarChar(260)
  SET @Prefix1 = LOWER(@Prefix) + '%'
  DECLARE @LGSQL VarChar(8000)
  SET @LGSQL = 'SELECT TOP (' + STR(@Records) + ') ' 
  SET @LGSQL +=  ' [EDI_Keys].[EdiParameters]' 
  SET @LGSQL +=  ',[EDI_Keys].[EdiKey]' 
  SET @LGSQL +=  ' FROM [EDI_Keys] ' 
  SET @LGSQL +=  ' WHERE 1 = 1 ' 
  SET @LGSQL +=  ' AND (LOWER(ISNULL([EDI_Keys].[EdiKey],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL +=  ' OR LOWER(ISNULL([EDI_Keys].[EdiParameters],'''')) LIKE ''' + @Prefix1 + ''''
  SET @LGSQL +=  ')' 
  
  EXEC (@LGSQL)
  END 
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spediKeysSelectByID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spediKeysSelectByID]
GO
 
CREATE PROCEDURE [dbo].[spediKeysSelectByID]
  @LoginID NVarChar(8),
  @EdiKey NVarChar(50) 
  AS
  SELECT
    [EDI_Keys].*  
  FROM [EDI_Keys] 
  WHERE
  [EDI_Keys].[EdiKey] = @EdiKey
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spediKeysSelectListSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spediKeysSelectListSearch]
GO
 
CREATE PROCEDURE [dbo].[spediKeysSelectListSearch]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @KeyWord VarChar(250),
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
    DECLARE @KeyWord1 VarChar(260)
    SET @KeyWord1 = '%' + LOWER(@KeyWord) + '%'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,EdiKey NVarChar(50) NOT NULL
  )
  INSERT INTO #PageIndex (EdiKey)
  SELECT [EDI_Keys].[EdiKey] FROM [EDI_Keys]
 WHERE  
   ( 
         LOWER(ISNULL([EDI_Keys].[EdiKey],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EDI_Keys].[EdiParameters],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EDI_Keys].[SqlStatement],'')) LIKE @KeyWord1
     OR LOWER(ISNULL([EDI_Keys].[ERPCompany],'')) LIKE @KeyWord1
   ) 
  ORDER BY (Select @OrderBy)

    SET @RecordCount = @@RowCount

  SELECT
    [EDI_Keys].*  
  FROM [EDI_Keys] 
      INNER JOIN #PageIndex
          ON [EDI_Keys].[EdiKey] = #PageIndex.EdiKey
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spediKeysSelectListFilteres]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spediKeysSelectListFilteres]
GO
 
CREATE PROCEDURE [dbo].[spediKeysSelectListFilteres]
  @LoginID NVarChar(8),
  @StartRowIndex int,
  @MaximumRows int,
  @OrderBy NVarChar(50),
  @RecordCount Int = 0 OUTPUT
  AS
  BEGIN
  DECLARE @LGSQL VarChar(8000)
  IF (@OrderBy = '')
    SET @OrderBy = 'EdiKey'
  CREATE TABLE #PageIndex (
  IndexID INT IDENTITY (1, 1) NOT NULL
 ,EdiKey NVarChar(50) NOT NULL
  )
  SET @LGSQL = 'INSERT INTO #PageIndex (' 
  SET @LGSQL +=  'EdiKey'
  SET @LGSQL +=  ')'
  SET @LGSQL +=  ' SELECT '
  SET @LGSQL +=  '[EDI_Keys].[EdiKey]'
  SET @LGSQL +=  ' FROM [EDI_Keys] '
  SET @LGSQL +=  '  WHERE 1 = 1 '
  SET @LGSQL +=  '  ORDER BY ' + @OrderBy
 
 
  EXEC (@LGSQL)

  SET @RecordCount = @@RowCount

  SELECT
    [EDI_Keys].*  
  FROM [EDI_Keys] 
      INNER JOIN #PageIndex
          ON [EDI_Keys].[EdiKey] = #PageIndex.EdiKey
  WHERE
        #PageIndex.IndexID > @StartRowIndex
        AND #PageIndex.IndexID < (@StartRowIndex + @MaximumRows + 1)
  ORDER BY
    #PageIndex.IndexID
  END
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spediKeysInsert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spediKeysInsert]
GO
 
CREATE PROCEDURE [dbo].[spediKeysInsert]
  @EdiKey NVarChar(50),
  @EdiParameters NVarChar(1000),
  @IsSP Bit,
  @SqlStatement NVarChar(2147483),
  @ExecuteInERP Bit,
  @ERPCompany NVarChar(3),
  @Return_EdiKey NVarChar(50) = null OUTPUT 
  AS
  INSERT [EDI_Keys]
  (
   [EdiKey]
  ,[EdiParameters]
  ,[IsSP]
  ,[SqlStatement]
  ,[ExecuteInERP]
  ,[ERPCompany]
  )
  VALUES
  (
   UPPER(@EdiKey)
  ,@EdiParameters
  ,@IsSP
  ,@SqlStatement
  ,@ExecuteInERP
  ,@ERPCompany
  )
  SET @Return_EdiKey = @EdiKey
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spediKeysUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spediKeysUpdate]
GO
 
CREATE PROCEDURE [dbo].[spediKeysUpdate]
  @Original_EdiKey NVarChar(50), 
  @EdiKey NVarChar(50),
  @EdiParameters NVarChar(1000),
  @IsSP Bit,
  @SqlStatement NVarChar(2147483),
  @ExecuteInERP Bit,
  @ERPCompany NVarChar(3),
  @RowCount int = null OUTPUT
  AS
  UPDATE [EDI_Keys] SET 
   [EdiKey] = @EdiKey
  ,[EdiParameters] = @EdiParameters
  ,[IsSP] = @IsSP
  ,[SqlStatement] = @SqlStatement
  ,[ExecuteInERP] = @ExecuteInERP
  ,[ERPCompany] = @ERPCompany
  WHERE
  [EdiKey] = @Original_EdiKey
  SET @RowCount = @@RowCount
  GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spediKeysDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spediKeysDelete]
GO
 
CREATE PROCEDURE [dbo].[spediKeysDelete]
  @Original_EdiKey NVarChar(50),
  @RowCount int = null OUTPUT
  AS
  DELETE [EDI_Keys]
  WHERE
  [EDI_Keys].[EdiKey] = @Original_EdiKey
  SET @RowCount = @@RowCount
  GO

SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
