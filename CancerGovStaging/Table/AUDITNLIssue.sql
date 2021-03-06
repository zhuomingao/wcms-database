SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[AUDITNLIssue]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AUDITNLIssue](
	[AuditActionType] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AuditUpdateDate] [datetime] NULL DEFAULT (getdate()),
	[AuditUpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT (user_name()),
	[NewsletterID] [uniqueidentifier] NULL,
	[NCIViewID] [uniqueidentifier] NULL,
	[Priority] [int] NULL,
	[Status] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SendDate] [datetime] NULL,
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL,
	[IssueType] [int] NULL
) ON [PRIMARY]
END
GO
