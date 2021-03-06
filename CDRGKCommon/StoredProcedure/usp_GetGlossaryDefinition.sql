IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[usp_GetGlossaryDefinition]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[usp_GetGlossaryDefinition]
GO


/*	NCI - National Cancer Institute
*	
*	Purpose:	
*	Stored Procedure return Glossary Term information ( Name,  Pronunciation, Definition )
*
*	Objects Used:
*	Glossary - table
*
*	Change History:
*	2001		Greg Andres	Script Created
*	1/18/2002 	Alex Pidlisnyy	Add functionality to work with uniqueidentifier or integer IDs
*	1/18/2002 	Alex Pidlisnyy	Eliminate spaces between words in the term to be able get correct result 
*					if more spaces provided in @Term variable.
*	06/3/2011	Prasad Betnag - Changes to return AudioMedia html column
*	12/16/2011  John Doyle - Changes to add MeidaCaption and MediaID
*/

CREATE PROCEDURE [dbo].[usp_GetGlossaryDefinition]
	(
	@Term		varchar(2000) 	= null,
	@ID		varchar(50) 	= null,
	@Audience	varchar(50)	= 'Patient',
	@Language	varchar(50)	= 'ENGLISH'
	)
AS
BEGIN
	IF @Term IS NOT Null
	BEGIN
		-- Search by Glossary Name	
		IF (@Language = 'ENGLISH')
		BEGIN
			SELECT gt.GlossaryTermID, 
				TermName, 
				TermPronunciation, 
				DefinitionHTML,
				ISNULL(gtd.MediaHTML,'') MediaHTML,
				ISNULL(gtd.MediaCaption,'') MediaCaption,
				ISNULL(gtd.MediaID,'') MediaID,
				ISNULL(gtd.AudioMediaHTML,'') AudioMediaHTML,
				ISNULL(gtd.RelatedInformationHtml,'') RelatedInformationHtml
			FROM GlossaryTerm gt, GlossaryTermDefinition gtd, GlossaryTermDefinitionAudience gtda, GlossaryTermDefinitionDictionary gtdd
			WHERE REPLACE( [TermName], ' ', '')  = REPLACE( @Term, ' ', '') 
			AND gt.GlossaryTermID = gtd.GlossaryTermID
			AND gtd.Language = @Language
			AND gtd.GlossaryTermDefinitionID = gtda.GlossaryTermDefinitionID
			AND gtda.Audience = @Audience
			AND gtd.GlossaryTermDefinitionID = gtdd.GlossaryTermDefinitionID
			AND gtdd.Dictionary = 'Cancer.Gov'
		END
	ELSE
		BEGIN
			SELECT gt.GlossaryTermID, 
				SpanishTermName as TermName, 
				TermPronunciation, 
				DefinitionHTML,
				ISNULL(gtd.MediaHTML,'') MediaHTML,
				ISNULL(gtd.MediaCaption,'') MediaCaption,
				ISNULL(gtd.MediaID,'') MediaID,
				ISNULL(gtd.AudioMediaHTML,'') AudioMediaHTML,
				ISNULL(gtd.RelatedInformationHtml,'') RelatedInformationHtml
			FROM GlossaryTerm gt, GlossaryTermDefinition gtd, GlossaryTermDefinitionAudience gtda, GlossaryTermDefinitionDictionary gtdd
			WHERE REPLACE( [SpanishTermName], ' ', '')  = REPLACE( @Term, ' ', '') 
			AND gt.GlossaryTermID = gtd.GlossaryTermID
			AND gtd.Language = @Language
			AND gtd.GlossaryTermDefinitionID = gtda.GlossaryTermDefinitionID
			AND gtda.Audience = @Audience
			AND gtd.GlossaryTermDefinitionID = gtdd.GlossaryTermDefinitionID
			AND gtdd.Dictionary = 'Cancer.Gov'
		END

	END
	ELSE BEGIN
		-- Search by CDR GlossaryID (int), with Audience and Language 
		IF (@Language = 'ENGLISH')
		BEGIN
			SELECT gt.GlossaryTermID, 
				TermName, 
				TermPronunciation, 
				DefinitionHTML,
				ISNULL(gtd.MediaHTML,'') MediaHTML,
				ISNULL(gtd.MediaCaption,'') MediaCaption,
				ISNULL(gtd.MediaID,'') MediaID,
				ISNULL(gtd.AudioMediaHTML,'') AudioMediaHTML,
				ISNULL(gtd.RelatedInformationHtml,'') RelatedInformationHtml
			FROM GlossaryTerm gt, GlossaryTermDefinition gtd, GlossaryTermDefinitionAudience gtda
			WHERE gt.GlossaryTermID = convert( int, @ID)
			AND gt.GlossaryTermID = gtd.GlossaryTermID
			AND gtd.Language = @Language
			AND gtd.GlossaryTermDefinitionID = gtda.GlossaryTermDefinitionID
			AND gtda.Audience = @Audience
		END
		ELSE
		BEGIN
			SELECT gt.GlossaryTermID, 
				SpanishTermName as TermName, 
				TermPronunciation, 
				DefinitionHTML,
				ISNULL(gtd.MediaHTML,'') MediaHTML,
				ISNULL(gtd.MediaCaption,'') MediaCaption,
				ISNULL(gtd.MediaID,'') MediaID,
				ISNULL(gtd.AudioMediaHTML,'') AudioMediaHTML,
				ISNULL(gtd.RelatedInformationHtml,'') RelatedInformationHtml
			FROM GlossaryTerm gt, GlossaryTermDefinition gtd, GlossaryTermDefinitionAudience gtda
			WHERE gt.GlossaryTermID = convert( int, @ID)
			AND gt.GlossaryTermID = gtd.GlossaryTermID
			AND gtd.Language = @Language
			AND gtd.GlossaryTermDefinitionID = gtda.GlossaryTermDefinitionID
			AND gtda.Audience = @Audience
		END
	END
END


GO
grant execute on usp_GetGlossaryDefinition to websiteuser_role
