SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[CDRMenus]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CDRMenus](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
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
