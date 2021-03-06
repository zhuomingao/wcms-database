SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[List]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[List](
	[ListID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_StagingList_ListID]  DEFAULT (newid()),
	[GroupID] [int] NULL,
	[ListName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ListDesc] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[URL] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ParentListID] [uniqueidentifier] NULL,
	[NCIViewID] [uniqueidentifier] NULL,
	[Priority] [int] NULL CONSTRAINT [DF_StagingList_Priority]  DEFAULT (1000),
	[UpdateDate] [datetime] NULL CONSTRAINT [DF_StagingList_UpdateDate1]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_List_UpdateUserID]  DEFAULT (user_name()),
	[DescDisplay] [bit] NULL CONSTRAINT [DF_List_DescDisplay_1]  DEFAULT (0),
	[ReleaseDateDisplay] [bit] NULL CONSTRAINT [DF_List_ReleaseDateDisplay_1]  DEFAULT (0),
	[ReleaseDateDisplayLoc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_List_ReleaseDateDisplayLoc_1]  DEFAULT (0),
 CONSTRAINT [PK_StagingList] PRIMARY KEY NONCLUSTERED 
(
	[ListID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[List]') AND name = N'IX_StagingList_ParentListID')
CREATE NONCLUSTERED INDEX [IX_StagingList_ParentListID] ON [dbo].[List] 
(
	[ParentListID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_List_NCIView]') AND type = 'F')
ALTER TABLE [dbo].[List]  WITH CHECK ADD  CONSTRAINT [FK_List_NCIView] FOREIGN KEY([NCIViewID])
REFERENCES [NCIView] ([NCIViewID])
GO
ALTER TABLE [dbo].[List] CHECK CONSTRAINT [FK_List_NCIView]
GO
