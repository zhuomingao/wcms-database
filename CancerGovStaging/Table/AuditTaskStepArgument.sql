SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[AuditTaskStepArgument]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AuditTaskStepArgument](
	[AuditActionType] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[StepID] [uniqueidentifier] NOT NULL,
	[ArgumentOrdinal] [int] NOT NULL,
	[ForProcedureX] [int] NOT NULL,
	[ArgumentValue] [varchar](3000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AuditActionDate] [datetime] NOT NULL CONSTRAINT [DF_AuditTaskStepArgument_AuditActionDate]  DEFAULT (getdate()),
	[AuditActionUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_AuditTaskStepArgument_AuditActionUserID]  DEFAULT (user_name())
) ON [PRIMARY]
END
GO
