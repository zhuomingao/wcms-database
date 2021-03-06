SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[BestBetCategories_BKU_20040319102156]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[BestBetCategories_BKU_20040319102156](
	[CategoryID] [uniqueidentifier] NOT NULL,
	[CatName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CatProfile] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ListID] [uniqueidentifier] NULL,
	[Status] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL,
	[Weight] [int] NULL,
	[IsOnProduction] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
