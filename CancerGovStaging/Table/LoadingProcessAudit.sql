SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[LoadingProcessAudit]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LoadingProcessAudit](
	[EventDate] [datetime] NOT NULL CONSTRAINT [DF_LoadingProcessAudit_EventDate]  DEFAULT (getdate()),
	[EventName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Status] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_LoadingProcessAudit_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_LoadingProcessAudit_UpdateUserID]  DEFAULT (user_name())
) ON [PRIMARY]
END
GO
