SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[NLKeyword]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[NLKeyword](
	[KeywordID] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[NewsletterID] [uniqueidentifier] NOT NULL,
	[Keyword] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__NLKeyword__Updat__446B1014]  DEFAULT (user_name()),
	[UpdateDate] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[KeywordID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_NLKeyword_Newsletter]') AND type = 'F')
ALTER TABLE [dbo].[NLKeyword]  WITH NOCHECK ADD  CONSTRAINT [FK_NLKeyword_Newsletter] FOREIGN KEY([NewsletterID])
REFERENCES [Newsletter] ([NewsletterID])
GO
ALTER TABLE [dbo].[NLKeyword] CHECK CONSTRAINT [FK_NLKeyword_Newsletter]
GO
