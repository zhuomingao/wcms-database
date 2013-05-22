IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[t_NLListItemOnDELETE]') AND OBJECTPROPERTY(id, N'IsTrigger') = 1)
EXEC dbo.sp_executesql @statement = N'BEGIN
	INSERT INTO AuditNLListitem
		(AuditActionType,
		ListID,  
		NCIViewID,
		Title,
		ShortTitle,
		Description,
		IsFeatured ,
		Priority,    
		UpdateDate,
		UpdateUserID      
		)
	SELECT ''DELETE'' as AuditActionType,
		tbl.ListID,  
		tbl.NCIViewID,
		tbl.Title,
		tbl.ShortTitle,
		tbl.Description,
		tbl.IsFeatured ,
		tbl.Priority,   
		tbl.UpdateDate,
		tbl.UpdateUserID   
	FROM 	deleted tbl
END

' 
GO
