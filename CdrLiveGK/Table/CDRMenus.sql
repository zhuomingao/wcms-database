SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[CDRMenus]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CDRMenus](
	[MenuID] [int] NOT NULL,
	[CDRID] [int] NOT NULL,
	[MenuTypeId] [smallint] NULL,
	[ParentID] [int] NULL,
	[DisplayName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SortName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NOT NULL,
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[CDRMenus]') AND name = N'CI_CDRMenus')
CREATE CLUSTERED INDEX [CI_CDRMenus] ON [dbo].[CDRMenus] 
(
	[CDRID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[CDRMenus]') AND name = N'NC_CDRMenus')
CREATE NONCLUSTERED INDEX [NC_CDRMenus] ON [dbo].[CDRMenus] 
(
	[ParentID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
