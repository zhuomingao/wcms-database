SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[List_BKU_20040319101938]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[List_BKU_20040319101938](
	[ListID] [uniqueidentifier] NOT NULL,
	[GroupID] [int] NULL,
	[ListName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ListDesc] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[URL] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ParentListID] [uniqueidentifier] NULL,
	[NCIViewID] [uniqueidentifier] NULL,
	[Priority] [int] NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DescDisplay] [bit] NULL,
	[ReleaseDateDisplay] [bit] NULL,
	[ReleaseDateDisplayLoc] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
