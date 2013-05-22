IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[t_TemplatePropertyOnDELETE]') AND OBJECTPROPERTY(id, N'IsTrigger') = 1)
EXEC dbo.sp_executesql @statement = N'BEGIN
	INSERT INTO AuditTemplateProperty(AuditActionType,
		AuditActionDate,
		AuditActionUserID,
		NCITemplateID,
		PropertyName,
		PropertyValue,
		IsDefaultValue,
		UpdateDate,
		UpdateUserID)
	SELECT ''DELETE'' as AuditActionType,
		GETDATE() AS AuditActionDate,
		user_name() AS AuditActionUserID,
		tbl.NCITemplateID,
		tbl.PropertyName,
		tbl.PropertyValue,
		tbl.IsDefaultValue,
		tbl.UpdateDate,
		tbl.UpdateUserID
	FROM 	deleted tbl
END
' 
GO
