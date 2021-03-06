SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Summary]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Summary](
	[SummaryID] [int] NOT NULL,
	[Type] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Audience] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Language] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Title] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_Summary_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_Summary_UpdateUserID]  DEFAULT (user_name()),
	[Description] [varchar](1500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrettyURL] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[replacementDocumentID] [int] NULL,
	ShortTitle varchar(64),
 CONSTRAINT [PK_Summary] PRIMARY KEY CLUSTERED 
(
	[SummaryID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
