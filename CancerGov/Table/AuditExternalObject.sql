SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[AuditExternalObject]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AuditExternalObject](
	[AuditActionType] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AuditUpdateDate] [datetime] NULL DEFAULT (getdate()),
	[AuditUpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT (user_name()),
	[ExternalobjectID] [uniqueidentifier] NULL,
	[Title] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Format] [char](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Path] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Text] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
