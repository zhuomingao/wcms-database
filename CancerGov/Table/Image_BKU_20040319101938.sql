SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Image_BKU_20040319101938]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Image_BKU_20040319101938](
	[ImageID] [uniqueidentifier] NOT NULL,
	[ImageName] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ImageSource] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ImageAltText] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TextSource] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Url] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[Border] [int] NULL,
	[UpdateDate] [datetime] NOT NULL,
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
END
GO
