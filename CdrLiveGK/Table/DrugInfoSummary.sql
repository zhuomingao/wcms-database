SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DrugInfoSummary]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DrugInfoSummary](
	[DrugInfoSummaryID] [int] NOT NULL,
	[Title] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](1500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PrettyURL] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HTMLData] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateFirstPublished] [datetime] NULL,
	[DateLastModified] [datetime] NULL,
	[TerminologyLink] [int] NOT NULL,
	[NCIViewID] [uniqueidentifier] NULL DEFAULT (null),
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_DrugInfoSummary_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_DrugInfoSummary_UpdateUserID]  DEFAULT (user_name()),
 CONSTRAINT [PK_DrugInfoSummary] PRIMARY KEY CLUSTERED 
(
	[DrugInfoSummaryID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
GRANT SELECT ON [dbo].[DrugInfoSummary] TO [Gatekeeper_role]
GO
GRANT INSERT ON [dbo].[DrugInfoSummary] TO [Gatekeeper_role]
GO
GRANT DELETE ON [dbo].[DrugInfoSummary] TO [Gatekeeper_role]
GO
GRANT UPDATE ON [dbo].[DrugInfoSummary] TO [Gatekeeper_role]
GO
GRANT SELECT ON [dbo].[DrugInfoSummary] ([DrugInfoSummaryID]) TO [Gatekeeper_role]
GO
GRANT UPDATE ON [dbo].[DrugInfoSummary] ([DrugInfoSummaryID]) TO [Gatekeeper_role]
GO
GRANT SELECT ON [dbo].[DrugInfoSummary] ([Title]) TO [Gatekeeper_role]
GO
GRANT UPDATE ON [dbo].[DrugInfoSummary] ([Title]) TO [Gatekeeper_role]
GO
GRANT SELECT ON [dbo].[DrugInfoSummary] ([Description]) TO [Gatekeeper_role]
GO
GRANT UPDATE ON [dbo].[DrugInfoSummary] ([Description]) TO [Gatekeeper_role]
GO
GRANT SELECT ON [dbo].[DrugInfoSummary] ([PrettyURL]) TO [Gatekeeper_role]
GO
GRANT UPDATE ON [dbo].[DrugInfoSummary] ([PrettyURL]) TO [Gatekeeper_role]
GO
GRANT SELECT ON [dbo].[DrugInfoSummary] ([HTMLData]) TO [Gatekeeper_role]
GO
GRANT UPDATE ON [dbo].[DrugInfoSummary] ([HTMLData]) TO [Gatekeeper_role]
GO
GRANT SELECT ON [dbo].[DrugInfoSummary] ([DateFirstPublished]) TO [Gatekeeper_role]
GO
GRANT UPDATE ON [dbo].[DrugInfoSummary] ([DateFirstPublished]) TO [Gatekeeper_role]
GO
GRANT SELECT ON [dbo].[DrugInfoSummary] ([DateLastModified]) TO [Gatekeeper_role]
GO
GRANT UPDATE ON [dbo].[DrugInfoSummary] ([DateLastModified]) TO [Gatekeeper_role]
GO
GRANT SELECT ON [dbo].[DrugInfoSummary] ([TerminologyLink]) TO [Gatekeeper_role]
GO
GRANT UPDATE ON [dbo].[DrugInfoSummary] ([TerminologyLink]) TO [Gatekeeper_role]
GO
GRANT SELECT ON [dbo].[DrugInfoSummary] ([NCIViewID]) TO [Gatekeeper_role]
GO
GRANT UPDATE ON [dbo].[DrugInfoSummary] ([NCIViewID]) TO [Gatekeeper_role]
GO
GRANT SELECT ON [dbo].[DrugInfoSummary] ([UpdateDate]) TO [Gatekeeper_role]
GO
GRANT UPDATE ON [dbo].[DrugInfoSummary] ([UpdateDate]) TO [Gatekeeper_role]
GO
GRANT SELECT ON [dbo].[DrugInfoSummary] ([UpdateUserID]) TO [Gatekeeper_role]
GO
GRANT UPDATE ON [dbo].[DrugInfoSummary] ([UpdateUserID]) TO [Gatekeeper_role]
GO
