IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Core_ContentAreaTemplate_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Core_ContentAreaTemplate_Update]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE  PROCEDURE [dbo].Core_ContentAreaTemplate_Update
    @ContentAreaTemplateID uniqueidentifier
	,@TemplateName varchar(50)
    ,@UpdateUserID varchar(50)
AS
BEGIN
	BEGIN TRY
		if (dbo.Core_Function_ContentAreaTemplateExists(null,@TemplateName) =1)
			return 10500 -- Exists

		Update dbo.ContentAreaTemplate
		Set TemplateName= @TemplateName
		  ,[UpdateUserID]= @UpdateUserID
		  ,[UpdateDate] = getdate()
		Where   ContentAreaTemplateID = @ContentAreaTemplateID
		
	END TRY

	BEGIN CATCH
		RETURN 10504
	END CATCH 
END

GO
GRANT EXECUTE ON [dbo].[Core_ContentAreaTemplate_Update] TO [websiteuser_role]
GO
