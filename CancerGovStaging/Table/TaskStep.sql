SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[TaskStep]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[TaskStep](
	[StepID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_TaskStep_StepID]  DEFAULT (newid()),
	[TaskID] [uniqueidentifier] NOT NULL,
	[ResponsibleGroupID] [int] NULL,
	[Name] [varchar](75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_TaskStep_Status]  DEFAULT ('Ready'),
	[OrderLevel] [int] NOT NULL CONSTRAINT [DF_TaskStep_OrderLevel]  DEFAULT (1),
	[AprvStoredProcedure] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DisAprvStoredProcedure] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OnErrorStoredProcedure] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsAuto] [bit] NOT NULL CONSTRAINT [DF_TaskStep_IsAuto]  DEFAULT (0),
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_TaskStep_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_TaskStep_UpdateUserID]  DEFAULT (user_name()),
 CONSTRAINT [PK_TaskStep] PRIMARY KEY CLUSTERED 
(
	[StepID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[TaskStep]') AND name = N'IX_Step_GroupID')
CREATE NONCLUSTERED INDEX [IX_Step_GroupID] ON [dbo].[TaskStep] 
(
	[ResponsibleGroupID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[TaskStep]') AND name = N'IX_Step_TaskID')
CREATE NONCLUSTERED INDEX [IX_Step_TaskID] ON [dbo].[TaskStep] 
(
	[TaskID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_TaskStep_Groups]') AND type = 'F')
ALTER TABLE [dbo].[TaskStep]  WITH CHECK ADD  CONSTRAINT [FK_TaskStep_Groups] FOREIGN KEY([ResponsibleGroupID])
REFERENCES [Groups] ([GroupID])
GO
ALTER TABLE [dbo].[TaskStep] CHECK CONSTRAINT [FK_TaskStep_Groups]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_TaskStep_Task]') AND type = 'F')
ALTER TABLE [dbo].[TaskStep]  WITH CHECK ADD  CONSTRAINT [FK_TaskStep_Task] FOREIGN KEY([TaskID])
REFERENCES [Task] ([TaskID])
GO
ALTER TABLE [dbo].[TaskStep] CHECK CONSTRAINT [FK_TaskStep_Task]
GO
