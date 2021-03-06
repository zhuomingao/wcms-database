SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[AuditNCIObjects]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AuditNCIObjects](
	[AuditActionType] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AuditUpdateDate] [datetime] NULL CONSTRAINT [DF__AuditNCIO__Audit__0638D371]  DEFAULT (getdate()),
	[AuditUpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__AuditNCIO__Audit__072CF7AA]  DEFAULT (user_name()),
	[ObjectInstanceID] [uniqueidentifier] NULL,
	[NCIObjectID] [uniqueidentifier] NULL,
	[ParentNCIObjectID] [uniqueidentifier] NULL,
	[ObjectType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Priority] [int] NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
