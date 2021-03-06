if object_id('autosuggest_stringSplit') is not null
	drop function dbo.autosuggest_stringSplit
go
CREATE FUNCTION [dbo].[autosuggest_stringSplit]
 (  
 @S varchar(8000)  
 )  
RETURNS @ResultTable TABLE  
 (  
 ObjectID     varchar(4000)  
 )  
AS  
BEGIN  


 DECLARE @delimeterPosition  int,  
  @tmpStr varchar(8000) ,  
  @tmpStrLen int  
   
 SELECT @tmpStrLen = LEN(@S)

 select @tmpStr = @S  
  
 SELECT @tmpStrLen = ISNULL(@tmpStrLen, 0)  
	
  
 WHILE  (@tmpStrLen > 0 )  
 BEGIN  
  SELECT @delimeterPosition = CHARINDEX ( ' ', @tmpStr)   
  
  IF (@delimeterPosition = 0)    
  BEGIN  
	  INSERT INTO @ResultTable  
	  SELECT @tmpStr   
   BREAK  
  END  
  	
	  INSERT INTO @ResultTable  
	  SELECT LTRIM(LEFT( @tmpStr , @delimeterPosition - 1) )  
  
	  SELECT @tmpStr = RIGHT ( @tmpStr , (LEN( @tmpStr ) - @delimeterPosition) )  
	  SELECT @tmpStrLen = ISNULL( LEN(@tmpStr) , 0)  
 END  



	update @resulttable set objectid = 
		replace(replace(replace(replace(replace(objectid, ',', ''), '?',''), ')', ''), '(', ''), ':', '')


		delete from @resulttable
			where objectid in  
		( 'the',  'and',  'for', 'with',
		'del',
		'con',
		'por'
		)
		or len(objectid) < 3

  
 RETURN   
END  
  
GO

  
  
  
  
  
  
  
  
  
  
  
  