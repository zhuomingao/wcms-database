IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[usp_UpdateNLKeyword]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[usp_UpdateNLKeyword]
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
/****** 	Object:  Stored Procedure dbo.usp_InsertNewsletter
	Owner:	Jay He
	Script Date: 3/19/2003 14:43:49 pM 
******/

CREATE PROCEDURE dbo.usp_UpdateNLKeyword
(
 	@KeywordID		UniqueIdentifier,
 	@Keyword		varchar(2000),
	@UpdateUserID		varchar(50)
 )
AS
BEGIN
	SET NOCOUNT ON;
	-- We only insert newsletter

	BEGIN TRAN Tran_InsertLinkView
	
	Update NLKeyword
	set 	Keyword =	@Keyword,
		UpdateDate	= getdate(),  
		UpdateUserID  	=@UpdateUserID  
	where KeywordID = @KeywordID
	IF (@@ERROR <> 0)
	BEGIN
		ROLLBACK TRAN Tran_InsertLinkView
		RAISERROR ( 70004, 16, 1)
		RETURN 70004
	END 

	Update Newsletter
	set 	Status =		'EDIT',
		UpdateDate	= getdate(),  
		UpdateUserID  	=@UpdateUserID  
	where NewsletterID = (select NewsletterID from NLKeyword where keywordID = @KeywordID)
	IF (@@ERROR <> 0)
	BEGIN
		ROLLBACK TRAN Tran_InsertLinkView
		RAISERROR ( 70004, 16, 1)
		RETURN 70004
	END 


	COMMIT TRAN  Tran_InsertLinkView
	SET NOCOUNT OFF

	RETURN 0 

END
GO
GRANT EXECUTE ON [dbo].[usp_UpdateNLKeyword] TO [webadminuser_role]
GO
