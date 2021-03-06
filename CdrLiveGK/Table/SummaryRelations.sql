SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SummaryRelations]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SummaryRelations](
	[SummaryID] [int] NOT NULL,
	[RelatedSummaryID] [int] NOT NULL,
	[RelationType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_SummaryRelations_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_SummaryRelations_UpdateUserID]  DEFAULT (user_name())
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[SummaryRelations]') AND name = N'CI_SummaryRelations')
CREATE CLUSTERED INDEX [CI_SummaryRelations] ON [dbo].[SummaryRelations] 
(
	[SummaryID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_SummaryRelations_Summary]') AND type = 'F')
ALTER TABLE [dbo].[SummaryRelations]  WITH CHECK ADD  CONSTRAINT [FK_SummaryRelations_Summary] FOREIGN KEY([SummaryID])
REFERENCES [Summary] ([SummaryID])
GO
ALTER TABLE [dbo].[SummaryRelations] CHECK CONSTRAINT [FK_SummaryRelations_Summary]
GO
