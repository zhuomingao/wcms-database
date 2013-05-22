SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PrettyURL_BKU_20040319101939]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PrettyURL_BKU_20040319101939](
	[PrettyURLID] [uniqueidentifier] NOT NULL,
	[NCIViewID] [uniqueidentifier] NOT NULL,
	[DirectoryID] [uniqueidentifier] NOT NULL,
	[ObjectID] [uniqueidentifier] NULL,
	[RealURL] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CurrentURL] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsNew] [bit] NULL,
	[UpdateRedirectOrNot] [bit] NULL,
	[IsPrimary] [bit] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL,
	[IsRoot] [bit] NULL
) ON [PRIMARY]
END
GO
