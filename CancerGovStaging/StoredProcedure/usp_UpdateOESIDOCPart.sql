IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[usp_UpdateOESIDOCPart]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[usp_UpdateOESIDOCPart]
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  Stored Procedure dbo.usp_UpdateNCIView   Owner:Jhe Purpose: For admin side Script Date: 1/15/2002 16:00:49 pm ******/		
					
					
CREATE PROCEDURE dbo.usp_UpdateOESIDOCPart
(
	@NCIViewID		UniqueIdentifier,
	@DocPartID		UniqueIdentifier,
	@Heading		varchar(200),
	@Content		text,
	@ShowTitleOrNot	bit,
	@UpdateUserID		VarChar(40)
)
AS
	SET NOCOUNT OFF;

	BEGIN TRAN Tran_InsertLinkView	

	Update docpart 
	set 	heading=@Heading, 
		content=@Content, 
		ShowTitleOrNot= @ShowTitleOrNot, 
		UpdateuserID=@UpdateUserID 
	where docpartID=@DocPartID								
	IF (@@ERROR <> 0)
	BEGIN
		ROLLBACK TRAN Tran_InsertLinkView
		RAISERROR ( 70004, 16, 1)
		RETURN 70004
	END 	

	Update NCIView
	set 	Status =		'EDIT',
		UpdateDate	= getdate(),  
		UpdateUserID  	=@UpdateUserID  
	where NCIViewID = @NCIViewID
	IF (@@ERROR <> 0)
	BEGIN
		ROLLBACK TRAN Tran_InsertLinkView
		RAISERROR ( 70004, 16, 1)
		RETURN 70004
	END 


	COMMIT TRAN  Tran_InsertLinkView
	SET NOCOUNT OFF

	RETURN 0
GO
