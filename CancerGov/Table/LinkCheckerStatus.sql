SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LinkCheckerStatus](
	[NCIViewID] [uniqueidentifier] NOT NULL,
	[UrlType] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RunID] [uniqueidentifier] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[LinkCheckerStatus]  WITH CHECK ADD  CONSTRAINT [FK_LinkCheckerStatus_LinkCheckerRuns] FOREIGN KEY([RunID])
REFERENCES [dbo].[LinkCheckerRuns] ([RunID])