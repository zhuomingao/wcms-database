SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[AuditBestBetSynonyms]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AuditBestBetSynonyms](
	[AuditActionType] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SynonymID] [uniqueidentifier] NULL,
	[CategoryID] [uniqueidentifier] NULL,
	[SynName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	--[Weight] [int] NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AuditActionDate] [datetime] NULL CONSTRAINT [DF_AuditBestBetSynonyms_AuditActionDate]  DEFAULT (getdate()),
	[AuditActionUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_AuditBestBetSynonyms_AuditActionUserID]  DEFAULT (user_name()),
	[IsNegated] [bit] NULL,
	[Notes] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsExactMatch] [bit]  NULL 
) ON [PRIMARY]
END
GO
