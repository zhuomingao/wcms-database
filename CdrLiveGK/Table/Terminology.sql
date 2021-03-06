SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Terminology]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Terminology](
	[TermID] [int] NOT NULL,
	[PreferredName] [nvarchar](1100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TermStatus] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Comment] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_terminology] PRIMARY KEY CLUSTERED 
(
	[TermID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
