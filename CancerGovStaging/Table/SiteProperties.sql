SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SiteProperties]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SiteProperties](
	[PropertyName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PropertyValue] [varchar](2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL CONSTRAINT [DF_SiteProperties_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_SiteProperties_UpdateUserID]  DEFAULT (user_name())
) ON [PRIMARY]
END
GO
GRANT SELECT ON [dbo].[SiteProperties] TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[SiteProperties] ([PropertyName]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[SiteProperties] ([PropertyValue]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[SiteProperties] ([UpdateDate]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[SiteProperties] ([UpdateUserID]) TO [websiteuser_role]
GO
