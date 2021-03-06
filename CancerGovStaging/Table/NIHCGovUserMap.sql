SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[NIHCGovUserMap]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[NIHCGovUserMap](
	[NIHID] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CGovUserID] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
END
GO
