if object_id('percReport_newContent') is not null
	drop procedure dbo.percReport_newContent
go
create procedure [dbo].[percReport_newContent](@contentType varchar(200), @startDate datetime, @endDate datetime, @folderID int, @siteid int = 305)
as
BEGIN


declare @s varchar(max), @pagecontenttype varchar(2000)
declare @sitename varchar(255), @folderPath varchar(500)
create table #folder (ID int, path varchar(900))

select @folderpath = dbo.percReport_getFolderpath(@folderid)
			
				;with folders as (
					  select null as ParentID, f.ContentID as ID, cs.title as FolderName, 
					convert(varchar(512),isnull(@folderpath,'')) as Path
					  from PSX_folder f join contentstatus cs on f.contentid = cs.contentid
					  where cs.contentid = @folderid
					  UNION ALL
					  select r.owner_ID as ParentID, f.contentid as ID, cs.title as FolderName, 
					convert(varchar(512),folders.Path + '/' + cs.title) as Path
					  from PSX_folder f inner JOIN PSX_ObjectRelationship r  ON r.dependent_id = f.contentid
					  inner JOIN folders ON folders.ID = r.owner_id
					  inner join contentstatus cs on f.contentid = cs.contentid
				)
				insert into #folder
			  select ID, path  from folders

	select distinct c.contentid, c.title, t.contenttypename
		, case when dbo.percReport_getpretty_url_name(c.contentid) = '***' then null 
			else f.path + isnull('/'+ dbo.percReport_getpretty_url_name(c.contentid) ,'') end as prettyurl
			, f.path as itempath
		, contentcreateddate
		, contentlastmodifieddate
	from contentstatus c 
	inner join contenttypes t on t.contenttypeid = c.contenttypeid
		inner join PSX_ObjectRelationship r  ON r.dependent_id = c.contentid
		inner join #folder f on f.id = r.owner_id
	where contentcreateddate > @startdate
	and contentcreateddate < = @enddate
	and t.contenttypename in
						(
				select contenttypename from dbo.percReport_contenttype
						)
			and (@contenttype = 'ALL' or contenttypename = @contenttype)
					order by 3,1
END

