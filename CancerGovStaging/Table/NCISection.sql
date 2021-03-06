SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[NCISection]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[NCISection](
	[NCISectionID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_NCISection_NCISectionID]  DEFAULT (newid()),
	[SectionHomeViewID] [uniqueidentifier] NULL,
	[Name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[URL] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_NCISection_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_NCISection_UpdateUserID]  DEFAULT (user_name()),
	[OrderLevel] [int] NULL,
	[TabImgName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[parentsectionID] [uniqueidentifier] NULL,
	[siteID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_NCISection] PRIMARY KEY CLUSTERED 
(
	[NCISectionID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
GRANT SELECT ON [dbo].[NCISection] TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCISection] TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCISection] TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([NCISectionID]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([NCISectionID]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([NCISectionID]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([SectionHomeViewID]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([SectionHomeViewID]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([SectionHomeViewID]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([Name]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([Name]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([Name]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([URL]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([URL]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([URL]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([Description]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([Description]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([Description]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([UpdateDate]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([UpdateDate]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([UpdateDate]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([UpdateUserID]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([UpdateUserID]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([UpdateUserID]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([OrderLevel]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([OrderLevel]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([OrderLevel]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([TabImgName]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([TabImgName]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([TabImgName]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([parentsectionID]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([parentsectionID]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([parentsectionID]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([siteID]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([siteID]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCISection] ([siteID]) TO [websiteuser_role]
GO
