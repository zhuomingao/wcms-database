SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[AuditTSMacros]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AuditTSMacros](
	[AuditActionType] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[MacroName] [varchar](512) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MacroValue] [varchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsOnProduction] [bit] NULL,
	[Status] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MacroID] [uniqueidentifier] NULL,
	[AuditActionUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL DEFAULT (user_name()),
	[AuditActionDate] [datetime] NOT NULL DEFAULT (getdate())
) ON [PRIMARY]
END
GO
