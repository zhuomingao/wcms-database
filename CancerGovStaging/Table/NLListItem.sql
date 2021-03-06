SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[NLListItem]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[NLListItem](
	[ListID] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[NCIViewID] [uniqueidentifier] NOT NULL,
	[Title] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ShortTitle] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsFeatured] [bit] NULL,
	[Priority] [int] NULL,
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__NLListIte__Updat__4D005615]  DEFAULT (user_name()),
	[UpdateDate] [datetime] NULL DEFAULT (getdate()),
 CONSTRAINT [PK_NLListItem] PRIMARY KEY CLUSTERED 
(
	[ListID] ASC,
	[NCIViewID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
GRANT SELECT ON [dbo].[NLListItem] TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NLListItem] ([ListID]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NLListItem] ([NCIViewID]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NLListItem] ([Title]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NLListItem] ([ShortTitle]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NLListItem] ([Description]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NLListItem] ([IsFeatured]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NLListItem] ([Priority]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NLListItem] ([UpdateUserID]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NLListItem] ([UpdateDate]) TO [webadminuser_role]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_NLListItem_List]') AND type = 'F')
ALTER TABLE [dbo].[NLListItem]  WITH NOCHECK ADD  CONSTRAINT [FK_NLListItem_List] FOREIGN KEY([ListID])
REFERENCES [List] ([ListID])
GO
ALTER TABLE [dbo].[NLListItem] CHECK CONSTRAINT [FK_NLListItem_List]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_NLListItem_NCIView]') AND type = 'F')
ALTER TABLE [dbo].[NLListItem]  WITH NOCHECK ADD  CONSTRAINT [FK_NLListItem_NCIView] FOREIGN KEY([NCIViewID])
REFERENCES [NCIView] ([NCIViewID])
GO
ALTER TABLE [dbo].[NLListItem] CHECK CONSTRAINT [FK_NLListItem_NCIView]
GO
