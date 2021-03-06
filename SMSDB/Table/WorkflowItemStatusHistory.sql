SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkflowItemStatusHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[WorkflowItemStatusHistory](
	[WorkflowItemID] [uniqueidentifier] NOT NULL,
	[Action] [int] NOT NULL,
	[PostActionStatus] [int] NOT NULL,
	[ActionBy] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Date] [datetime] NULL,
	[Comment] [varchar](2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
