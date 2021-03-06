IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[usp_MoveObjectUp]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[usp_MoveObjectUp]
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** 	Object:  Stored Procedure dbo.usp_InsertViewObject    -- Jhe
	Purpose: This script can be used for  moving viewobjects/docparts up.	Script Date: 3/5/2003 11:43:49 pM ******/

CREATE PROCEDURE dbo.usp_MoveObjectUp
(
	@NCIViewID       	UniqueIdentifier,
	@ObjectID		UniqueIdentifier,
	@Type			Char(10),
	@UpdateUserID		VarChar(40)
)
AS
BEGIN
	SET NOCOUNT ON;

	/*
	** A. Check info and Get  viewobject's info 
	*/	
	if(	
	  (@NCIViewID  IS NULL) OR (NOT EXISTS (SELECT NCIViewID FROM NCIview WHERE NCIViewID = @NCIViewID)) 
	  )	
	BEGIN
		RAISERROR ( 70001, 16, 1)
		RETURN 70001
	END

	if (@Type = 'DOC')
	BEGIN
		if(	
		  (@ObjectID	  IS NULL) OR (NOT EXISTS (SELECT ObjectID	 FROM viewobjects WHERE NCIViewID = @NCIViewID and objectID=@ObjectID)) 
		  )	
		BEGIN
			RAISERROR ( 70001, 16, 1)
			RETURN 70001
		END
	END
	ELSE
	BEGIN
		if(	
		  (@ObjectID	  IS NULL) OR (NOT EXISTS (SELECT docpartID	 FROM Docpart WHERE  docpartID=@ObjectID)) 
		  )	
		BEGIN
			RAISERROR ( 70001, 16, 1)
			RETURN 70001
		END
	END

	Declare 	@Priority		int,
			@DocumentID		UniqueIdentifier,
		 	@AboveObjectID	UniqueIdentifier,
			@AboveObjectPriority	int,
			@Temp			int

	BEGIN  TRAN   Tran_CreateHotfixStudyContact
	
	if (@Type = 'DOC')
	BEGIN
		select @Priority=priority from viewobjects WHERE NCIViewID = @NCIViewID and objectID=@ObjectID
		
		select @Temp=min(@Priority - priority) from viewobjects where nciviewid= @NCIViewID  and Priority <@Priority	
		if (
			@Temp is null
			--Exists (select min(@Priority - priority) from viewobjects where nciviewid= @NCIViewID  and Priority <@Priority )
		) 		
		BEGIN
			Rollback tran Tran_CreateHotfixStudyContact
			SET NOCOUNT OFF
			RETURN 0 
		END
		ELSE
		BEGIN
			select @AboveObjectID= objectID, @AboveObjectPriority= priority from viewobjects where nciviewid= @NCIViewID  and Priority = @Priority -  @Temp
			
			-- Update priority
			
			update viewobjects
			set 	priority = @AboveObjectPriority,
				UpdateUserID=@UpdateUserID
			where objectID =@ObjectID 
				and NCIViewID = @NCIViewID
			IF (@@ERROR <> 0)
			BEGIN
				Rollback tran Tran_CreateHotfixStudyContact
				RAISERROR ( 70004, 16, 1)
				RETURN 70004
			END 
						
			update viewobjects
			set 	priority = @Priority,
				UpdateUserID=@UpdateUserID
			where objectID = @AboveObjectID
				and NCIViewID = @NCIViewID
			IF (@@ERROR <> 0)
			BEGIN
				Rollback tran Tran_CreateHotfixStudyContact
				RAISERROR ( 70004, 16, 1)
				RETURN 70004
			END 
		END

	END
	ELSE
	BEGIN
		select @Priority=priority, @DocumentID=documentID from docpart WHERE docpartID = @ObjectID 

		select @Temp=min(@Priority - priority) from docpart  where documentID=  @DocumentID  and Priority <@Priority
		
		PRINT 'Priority=' +  Convert(varchar(20), @Priority )
		
		if (
			@Temp is null
		) 		
		BEGIN
			Rollback tran Tran_CreateHotfixStudyContact
			SET NOCOUNT OFF
			RETURN 0 
		END
		ELSE
		BEGIN
			PRINT 'Temp=' + Convert(varchar(20), @Temp) + "<br>"
			
			select @AboveObjectID= docpartID, @AboveObjectPriority= priority from docpart  where documentID=  @DocumentID  and Priority = @Priority -  @Temp
			
			-- Update priority
			
			update docpart
			set 	priority = @AboveObjectPriority,
				UpdateUserID=@UpdateUserID
			where docpartID =@ObjectID 
			IF (@@ERROR <> 0)
			BEGIN
				Rollback tran Tran_CreateHotfixStudyContact
				RAISERROR ( 70004, 16, 1)
				RETURN 70004
			END 
						
			update docpart
			set 	priority = @Priority,
				UpdateUserID=@UpdateUserID
			where  docpartID = @AboveObjectID
			IF (@@ERROR <> 0)
			BEGIN
				Rollback tran Tran_CreateHotfixStudyContact
				RAISERROR ( 70004, 16, 1)
				RETURN 70004
			END 
		END

	END

	COMMIT tran Tran_CreateHotfixStudyContact

	SET NOCOUNT OFF
	RETURN 0 

END
GO
