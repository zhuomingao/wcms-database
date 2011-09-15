if object_id('percReport_emptyfield') is not null
	drop procedure dbo.percReport_emptyfield
go
create procedure [dbo].[percReport_emptyfield]
(@contentType varchar(200)--, @fieldname varchar(200) 
 ,@folderID int, @siteid int = 305)
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
		, case 	
			when  dbo.percReport_getpretty_url_name(c.contentid) = '***' 
			then NULL
			when dbo.percreport_getitemfolderpath(c.contentid)  like 'CancerGov/PrivateArchive%'
			then NULL
			ELSE dbo.percreport_getitemfolderpath(c.contentid) + 
			 case when dbo.percReport_getpretty_url_name(c.contentid) is null 
					then '' ELSE '/' +  dbo.percReport_getpretty_url_name(c.contentid)	END 
				END as prettyurl

		, contentcreateddate
		, contentlastmodifieddate
	from contentstatus c 
	inner join contenttypes t on t.contenttypeid = c.contenttypeid
		inner join PSX_ObjectRelationship r  ON r.dependent_id = c.contentid
		inner join #folder f on f.id = r.owner_id
	where  t.contenttypename in
						(
				select contenttypename from dbo.percReport_contenttype
						)
			and (@contenttype = 'ALL' or contenttypename = @contenttype)
			and 
				exists 
			(select * from dbo.CGVPUBLISHEDPAGEMETADATA_CGVPUBLISHEDPAGEMETADATA1 p
			where p.contentid = c.contentid and c.public_revision = p.revisionid
				and long_title is null)


	order by 3,1
END
go

exec percReport_emptyfield 'all', 305




select p.long_title, p.short_title,  t.contenttypename from
CGVPUBLISHEDPAGEMETADATA_CGVPUBLISHEDPAGEMETADATA1
p inner join contentstatus s on p.contentid = s.contentid and p.revisionid = s.public_revision
inner join contenttypes t on t.contenttypeid = s.contenttypeid
order by contenttypename, short_title



select s.contentid, p.long_description, p.short_description
,  t.contenttypename 
, date_display_mode
from
CGVPUBLISHEDPAGEMETADATA_CGVPUBLISHEDPAGEMETADATA1
p inner join contentstatus s on p.contentid = s.contentid and p.revisionid = s.public_revision
inner join contenttypes t on t.contenttypeid = s.contenttypeid
left outer join CGVDATEDISPLAYMODE_CGVDATEDISPLAYMODE1 d on d.contentid = s.contentid and 
s.public_revision = d.revisionid
where date_display_mode is  null
order by contenttypename, short_description



where long_title is null or long_title = ''


