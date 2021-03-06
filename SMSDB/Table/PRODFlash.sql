SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PRODFlash]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PRODFlash](
	[FlashObjectID] [uniqueidentifier] NOT NULL,
	[Title] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SrcUrl] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Width] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_PRODFlash_Width]  DEFAULT ((200)),
	[Height] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_PRODFlash_Height]  DEFAULT ((100)),
	[RequiredVersion] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BackgroundColor] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AlternateHtml] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateDate] [datetime] NULL,
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_PRODFlash] PRIMARY KEY CLUSTERED 
(
	[FlashObjectID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
