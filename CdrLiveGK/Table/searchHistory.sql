SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[searchHistory]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[searchHistory](
	[SearchDate] [datetime] NULL,
	[searchType] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[searchSubType] [varchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[searchSumTime] [numeric](10, 0) NULL,
	[TotalNumber] [numeric](10, 0) NULL
) ON [PRIMARY]
END
GO
