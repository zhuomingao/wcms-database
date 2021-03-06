SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ViewObjects]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ViewObjects](
	[NCIViewObjectID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_StagingViewObjects_NCIViewObjectID]  DEFAULT (newid()),
	[NCIViewID] [uniqueidentifier] NOT NULL,
	[ObjectID] [uniqueidentifier] NOT NULL,
	[Type] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Priority] [int] NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_StagingViewObjects_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_ViewObjects_UpdateUserID]  DEFAULT (user_name()),
 CONSTRAINT [PK_StagingViewObjects] PRIMARY KEY NONCLUSTERED 
(
	[NCIViewObjectID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY],
 CONSTRAINT [IX_ViewObjects_Unique] UNIQUE NONCLUSTERED 
(
	[NCIViewID] ASC,
	[ObjectID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
GRANT SELECT ON [dbo].[ViewObjects] TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[ViewObjects] TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[ViewObjects] TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[ViewObjects] ([NCIViewObjectID]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[ViewObjects] ([NCIViewObjectID]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[ViewObjects] ([NCIViewObjectID]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[ViewObjects] ([NCIViewID]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[ViewObjects] ([NCIViewID]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[ViewObjects] ([NCIViewID]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[ViewObjects] ([ObjectID]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[ViewObjects] ([ObjectID]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[ViewObjects] ([ObjectID]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[ViewObjects] ([Type]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[ViewObjects] ([Type]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[ViewObjects] ([Type]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[ViewObjects] ([Priority]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[ViewObjects] ([Priority]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[ViewObjects] ([Priority]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[ViewObjects] ([UpdateDate]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[ViewObjects] ([UpdateDate]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[ViewObjects] ([UpdateDate]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[ViewObjects] ([UpdateUserID]) TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[ViewObjects] ([UpdateUserID]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[ViewObjects] ([UpdateUserID]) TO [websiteuser_role]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_StagingViewObjects_StagingNCIView]') AND type = 'F')
ALTER TABLE [dbo].[ViewObjects]  WITH NOCHECK ADD  CONSTRAINT [FK_StagingViewObjects_StagingNCIView] FOREIGN KEY([NCIViewID])
REFERENCES [NCIView] ([NCIViewID])
GO
ALTER TABLE [dbo].[ViewObjects] CHECK CONSTRAINT [FK_StagingViewObjects_StagingNCIView]
GO
