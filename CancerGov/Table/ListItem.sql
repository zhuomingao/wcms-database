SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ListItem]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ListItem](
	[ListID] [uniqueidentifier] NOT NULL,
	[NCIViewID] [uniqueidentifier] NOT NULL,
	[Priority] [int] NOT NULL CONSTRAINT [DF_StagingListItem_Priority]  DEFAULT (1000),
	[IsFeatured] [bit] NOT NULL CONSTRAINT [DF_StagingListItem_IsFeatured]  DEFAULT (0),
	[UpdateDate] [datetime] NULL CONSTRAINT [DF_ListItem_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_ListItem_UpdateUserID]  DEFAULT (user_name())
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[ListItem]') AND name = N'IX_listItem_NCIViewIDListID')
CREATE UNIQUE CLUSTERED INDEX [IX_listItem_NCIViewIDListID] ON [dbo].[ListItem] 
(
	[NCIViewID] ASC,
	[ListID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_StagingListItem_StagingList1]') AND type = 'F')
ALTER TABLE [dbo].[ListItem]  WITH NOCHECK ADD  CONSTRAINT [FK_StagingListItem_StagingList1] FOREIGN KEY([ListID])
REFERENCES [List] ([ListID])
GO
ALTER TABLE [dbo].[ListItem] CHECK CONSTRAINT [FK_StagingListItem_StagingList1]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_StagingListItem_StagingNCIView1]') AND type = 'F')
ALTER TABLE [dbo].[ListItem]  WITH CHECK ADD  CONSTRAINT [FK_StagingListItem_StagingNCIView1] FOREIGN KEY([NCIViewID])
REFERENCES [NCIView] ([NCIViewID])
GO
ALTER TABLE [dbo].[ListItem] CHECK CONSTRAINT [FK_StagingListItem_StagingNCIView1]
GO
