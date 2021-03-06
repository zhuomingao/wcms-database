SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SummarySection]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SummarySection](
	[SummarySectionID] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [DF_SummarySection_SummarySectionID]  DEFAULT (newid()),
	[SummaryGUID] [uniqueidentifier] NOT NULL,
	[SummaryID] [int] NOT NULL,
	[SectionID] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SectionType] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_SummarySection_SectionType]  DEFAULT ('SummarySection'),
	[SectionTitle] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Priority] [int] NOT NULL,
	[SectionLevel] [int] NOT NULL,
	[ParentSummarySectionID] [uniqueidentifier] NULL,
	[TOC] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HTML] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_SummarySection] PRIMARY KEY NONCLUSTERED 
(
	[SummarySectionID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[SummarySection]') AND name = N'CI_summarysection_summaryid')
CREATE CLUSTERED INDEX [CI_summarysection_summaryid] ON [dbo].[SummarySection] 
(
	[SummaryID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[SummarySection]') AND name = N'IDX_SummaryGUID_SectionID')
CREATE UNIQUE NONCLUSTERED INDEX [IDX_SummaryGUID_SectionID] ON [dbo].[SummarySection] 
(
	[SummaryGUID] ASC,
	[SectionID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
GRANT SELECT ON [dbo].[SummarySection] TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[SummarySection] ([SummarySectionID]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[SummarySection] ([SummaryGUID]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[SummarySection] ([SummaryID]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[SummarySection] ([SectionID]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[SummarySection] ([SectionType]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[SummarySection] ([SectionTitle]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[SummarySection] ([Priority]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[SummarySection] ([SectionLevel]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[SummarySection] ([ParentSummarySectionID]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[SummarySection] ([TOC]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[SummarySection] ([HTML]) TO [prettyurluser_role]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_summarySection_Summary]') AND type = 'F')
ALTER TABLE [dbo].[SummarySection]  WITH CHECK ADD  CONSTRAINT [FK_summarySection_Summary] FOREIGN KEY([SummaryID])
REFERENCES [Summary] ([SummaryID])
GO
ALTER TABLE [dbo].[SummarySection] CHECK CONSTRAINT [FK_summarySection_Summary]
GO
