SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ViewProperty]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ViewProperty](
	[ViewPropertyID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ViewProperty_ViewPropertyID_1]  DEFAULT (newid()),
	[NCIViewID] [uniqueidentifier] NOT NULL,
	[PropertyName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PropertyValue] [varchar](7800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_ViewProperty_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_ViewProperty_UpdateUserID]  DEFAULT (user_name()),
 CONSTRAINT [PK_ViewProperty] PRIMARY KEY CLUSTERED 
(
	[ViewPropertyID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY],
 CONSTRAINT [IX_ViewProperty_View_PropName] UNIQUE NONCLUSTERED 
(
	[NCIViewID] ASC,
	[PropertyName] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
GRANT SELECT ON [dbo].[ViewProperty] TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[ViewProperty] TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[ViewProperty] TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[ViewProperty] ([ViewPropertyID]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[ViewProperty] ([ViewPropertyID]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[ViewProperty] ([ViewPropertyID]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[ViewProperty] ([NCIViewID]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[ViewProperty] ([NCIViewID]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[ViewProperty] ([NCIViewID]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[ViewProperty] ([PropertyName]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[ViewProperty] ([PropertyName]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[ViewProperty] ([PropertyName]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[ViewProperty] ([PropertyValue]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[ViewProperty] ([PropertyValue]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[ViewProperty] ([PropertyValue]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[ViewProperty] ([UpdateDate]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[ViewProperty] ([UpdateDate]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[ViewProperty] ([UpdateDate]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[ViewProperty] ([UpdateUserID]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[ViewProperty] ([UpdateUserID]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[ViewProperty] ([UpdateUserID]) TO [websiteuser_role]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_ViewProperty_NCIView]') AND type = 'F')
ALTER TABLE [dbo].[ViewProperty]  WITH NOCHECK ADD  CONSTRAINT [FK_ViewProperty_NCIView] FOREIGN KEY([NCIViewID])
REFERENCES [NCIView] ([NCIViewID])
GO
ALTER TABLE [dbo].[ViewProperty] CHECK CONSTRAINT [FK_ViewProperty_NCIView]
GO
