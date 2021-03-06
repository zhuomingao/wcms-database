if object_id('t_BestBetCategoriesINSTEAD_OF_DELETE') is not NULL਍ഀ
Drop trigger dbo.t_BestBetCategoriesINSTEAD_OF_DELETE਍ഀ
GO਍ഀ
਍ഀ
/**********************************************************************************਍ഀ
਍ഀ
	Object's name:	t_BestBetCategoriesINSTEAD_OF_DELETE਍ഀ
	Object's type:	trigger਍ഀ
	Purpose:	Update value to AuditBestBetCategories਍ഀ
	Change History:	11/04/2004	Lijia add ChangeComments਍ഀ
਍ഀ
**********************************************************************************/਍ഀ
CREATE TRIGGER  [dbo].[t_BestBetCategoriesINSTEAD_OF_DELETE] ON [dbo].[BestBetCategories]਍ഀ
INSTEAD OF DELETE਍ഀ
AS਍ഀ
BEGIN਍ഀ
	DELETE 	Original਍ഀ
	FROM	BestBetCategories as Original, deleted as Old 	਍ഀ
	WHERE 	Original.CategoryID = Old.CategoryID਍ഀ
਍ഀ
	INSERT INTO AuditBestBetCategories (਍ഀ
		AuditActionType,਍ഀ
		CategoryID,਍ഀ
		CatName,਍ഀ
		CatProfile,਍ഀ
		ListID,਍ഀ
		Weight,਍ഀ
		UpdateDate,਍ഀ
		UpdateUserID,਍ഀ
		Status,਍ഀ
		IsSpanish,਍ഀ
		IsOnProduction,਍ഀ
		ChangeComments,਍ഀ
		isExactMatch )	਍ഀ
	SELECT ਍ഀ
		'DELETE' as AuditActionType,਍ഀ
		Del.CategoryID,਍ഀ
		Del.CatName,਍ഀ
		Del.CatProfile,਍ഀ
		Del.ListID,਍ഀ
		Del.Weight,਍ഀ
		Del.UpdateDate,਍ഀ
		Del.UpdateUserID,਍ഀ
		Del.Status,਍ഀ
		Del.IsSpanish,਍ഀ
		Del.IsOnProduction,਍ഀ
		Del.ChangeComments ,਍ഀ
		isExactMatch 		਍ഀ
	FROM 	deleted del਍ഀ
END਍ഀ
਍ഀ
