SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[AuditTask]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AuditTask](
	[AuditActionType] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TaskID] [uniqueidentifier] NULL,
	[ResponsibleGroupID] [int] NULL,
	[Name] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Notes] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Importance] [char](7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ObjectID] [uniqueidentifier] NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AuditActionDate] [datetime] NOT NULL CONSTRAINT [DF_AuditTask_AuditActionDate]  DEFAULT (getdate()),
	[AuditActionUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_AuditTask_AuditActionUserID]  DEFAULT (user_name())
) ON [PRIMARY]
END
GO
