SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[BestBetCategories]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[BestBetCategories](
	[CategoryID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_BestBetCategories_CategoryID]  DEFAULT (newid()),
	[CatName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CatProfile] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ListID] [uniqueidentifier] NULL,
	[Status] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_BestBetCategories_Status]  DEFAULT ('EDIT'),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_BestBetCategories_UpdateUserID]  DEFAULT (user_name()),
	[UpdateDate] [datetime] NULL CONSTRAINT [DF_BestBetCategories_UpdateDate]  DEFAULT (getdate()),
	[Weight] [int] NULL CONSTRAINT [DF_BestBetCategories_Weight]  DEFAULT (20),
	[IsOnProduction] [bit] NULL CONSTRAINT [DF_BestBetCategories_IsOnProduction]  DEFAULT (0),
	[ChangeComments] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsSpanish] [bit] NOT NULL DEFAULT (0),
	[IsExactMatch] [bit] NOT NULL CONSTRAINT [DF_BestBetCategories_IsExactMatch]  DEFAULT (0),
 CONSTRAINT [PK_BestBetCategories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY],
 CONSTRAINT [IX_BestBetCatName] UNIQUE NONCLUSTERED 
(
	[CatName] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[BestBetCategories]') AND name = N'IX_BestBetListID')
CREATE NONCLUSTERED INDEX [IX_BestBetListID] ON [dbo].[BestBetCategories] 
(
	[ListID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
GRANT SELECT ON [dbo].[BestBetCategories] TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[BestBetCategories] ([CategoryID]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[BestBetCategories] ([CatName]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[BestBetCategories] ([CatProfile]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[BestBetCategories] ([ListID]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[BestBetCategories] ([Status]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[BestBetCategories] ([UpdateUserID]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[BestBetCategories] ([UpdateDate]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[BestBetCategories] ([Weight]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[BestBetCategories] ([IsOnProduction]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[BestBetCategories] ([ChangeComments]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[BestBetCategories] ([IsSpanish]) TO [websiteuser_role]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_BestBetCategories_List]') AND type = 'F')
ALTER TABLE [dbo].[BestBetCategories]  WITH NOCHECK ADD  CONSTRAINT [FK_BestBetCategories_List] FOREIGN KEY([ListID])
REFERENCES [List] ([ListID])
GO
ALTER TABLE [dbo].[BestBetCategories] CHECK CONSTRAINT [FK_BestBetCategories_List]
GO
