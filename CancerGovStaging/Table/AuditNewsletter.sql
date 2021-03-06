SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[AuditNewsletter]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AuditNewsletter](
	[AuditActionType] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AuditUpdateDate] [datetime] NULL DEFAULT (getdate()),
	[AuditUpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT (user_name()),
	[NewsletterID] [uniqueidentifier] NULL,
	[OwnerGroupID] [int] NULL,
	[Section] [uniqueidentifier] NULL,
	[Title] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[From] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ReplyTo] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateDate] [datetime] NULL,
	[Status] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[qcemail] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
