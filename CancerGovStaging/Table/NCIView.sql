SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[NCIView]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[NCIView](
	[NCIViewID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_StagingNCIPage_PageID]  DEFAULT (newid()),
	[NCITemplateID] [uniqueidentifier] NULL,
	[NCISectionID] [uniqueidentifier] NULL,
	[GroupID] [int] NULL,
	[Title] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ShortTitle] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](1500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[URL] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[URLArguments] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MetaTitle] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MetaDescription] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MetaKeyword] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_StagingNCIPage_CreateDate]  DEFAULT (getdate()),
	[ReleaseDate] [datetime] NULL CONSTRAINT [DF_NCIView_ReleaseDate]  DEFAULT ('1/1/1980'),
	[ExpirationDate] [datetime] NULL CONSTRAINT [DF_NCIView_ExpirationDate]  DEFAULT ('1/1/2100'),
	[Version] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_StagingNCIPage_IsApproved]  DEFAULT ('EDIT'),
	[IsOnProduction] [bit] NULL CONSTRAINT [DF_StagingNCIView_IsOnProduction]  DEFAULT (0),
	[IsMultiSourced] [int] NOT NULL CONSTRAINT [DF_StagingNCIPage_IsMultiSourced]  DEFAULT (0),
	[IsLinkExternal] [bit] NULL CONSTRAINT [DF_StagingNCIPage_IsLinkExternal]  DEFAULT (0),
	[SpiderDepth] [int] NULL CONSTRAINT [DF_StagingNCIView_SpiderDepth]  DEFAULT (3),
	[UpdateDate] [datetime] NULL CONSTRAINT [DF_StagingNCIPage_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_NCIView_UpdateUserID]  DEFAULT (user_name()),
	[PostedDate] [datetime] NOT NULL DEFAULT ('1980-01-01'),
	[DisplayDateMode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL DEFAULT ('none'),
	[ReviewedDate] [datetime] NULL CONSTRAINT [DF_NCIView_ReviewedDate]  DEFAULT (getdate()),
	[ChangeComments] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_StagingNCIPage] PRIMARY KEY NONCLUSTERED 
(
	[NCIViewID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
GRANT SELECT ON [dbo].[NCIView] TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCIView] TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[NCIView] TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([NCIViewID]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([NCIViewID]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([NCIViewID]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([NCIViewID]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([NCITemplateID]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([NCITemplateID]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([NCITemplateID]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([NCITemplateID]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([NCISectionID]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([NCISectionID]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([NCISectionID]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([NCISectionID]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([GroupID]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([GroupID]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([GroupID]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([GroupID]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([Title]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([Title]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([Title]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([Title]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([ShortTitle]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([ShortTitle]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([ShortTitle]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([ShortTitle]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([Description]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([Description]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([Description]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([Description]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([URL]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([URL]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([URL]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([URL]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([URLArguments]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([URLArguments]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([URLArguments]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([URLArguments]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([MetaTitle]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([MetaTitle]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([MetaTitle]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([MetaTitle]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([MetaDescription]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([MetaDescription]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([MetaDescription]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([MetaDescription]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([MetaKeyword]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([MetaKeyword]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([MetaKeyword]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([MetaKeyword]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([CreateDate]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([CreateDate]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([CreateDate]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([CreateDate]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([ReleaseDate]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([ReleaseDate]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([ReleaseDate]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([ReleaseDate]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([ExpirationDate]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([ExpirationDate]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([ExpirationDate]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([ExpirationDate]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([Version]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([Version]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([Version]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([Version]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([Status]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([Status]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([Status]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([Status]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([IsOnProduction]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([IsOnProduction]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([IsOnProduction]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([IsOnProduction]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([IsMultiSourced]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([IsMultiSourced]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([IsMultiSourced]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([IsMultiSourced]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([IsLinkExternal]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([IsLinkExternal]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([IsLinkExternal]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([IsLinkExternal]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([SpiderDepth]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([SpiderDepth]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([SpiderDepth]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([SpiderDepth]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([UpdateDate]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([UpdateDate]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([UpdateDate]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([UpdateDate]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([UpdateUserID]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([UpdateUserID]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([UpdateUserID]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([UpdateUserID]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([PostedDate]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([PostedDate]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([PostedDate]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([PostedDate]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([DisplayDateMode]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([DisplayDateMode]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([DisplayDateMode]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([DisplayDateMode]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([ReviewedDate]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([ReviewedDate]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([ReviewedDate]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([ReviewedDate]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([ChangeComments]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([ChangeComments]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([ChangeComments]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIView] ([ChangeComments]) TO [websiteuser_role]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_NCIView_Groups]') AND type = 'F')
ALTER TABLE [dbo].[NCIView]  WITH NOCHECK ADD  CONSTRAINT [FK_NCIView_Groups] FOREIGN KEY([GroupID])
REFERENCES [Groups] ([GroupID])
GO
ALTER TABLE [dbo].[NCIView] CHECK CONSTRAINT [FK_NCIView_Groups]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_NCIView_NCISection]') AND type = 'F')
ALTER TABLE [dbo].[NCIView]  WITH NOCHECK ADD  CONSTRAINT [FK_NCIView_NCISection] FOREIGN KEY([NCISectionID])
REFERENCES [NCISection] ([NCISectionID])
GO
ALTER TABLE [dbo].[NCIView] CHECK CONSTRAINT [FK_NCIView_NCISection]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_StagingNCIView_NCITemplate]') AND type = 'F')
ALTER TABLE [dbo].[NCIView]  WITH NOCHECK ADD  CONSTRAINT [FK_StagingNCIView_NCITemplate] FOREIGN KEY([NCITemplateID])
REFERENCES [NCITemplate] ([NCITemplateID])
GO
ALTER TABLE [dbo].[NCIView] CHECK CONSTRAINT [FK_StagingNCIView_NCITemplate]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[CK_NCIView_Status]') AND type = 'C')
ALTER TABLE [dbo].[NCIView]  WITH NOCHECK ADD  CONSTRAINT [CK_NCIView_Status] CHECK  (([Status] = 'EDIT' or [Status] = 'SUBMIT' or [Status] = 'APPROVED' or [Status] = 'PRODUCTION' or [Status] = 'DELSUBMIT' or [Status] = 'LOCKED'))
GO
ALTER TABLE [dbo].[NCIView] CHECK CONSTRAINT [CK_NCIView_Status]
GO
