SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ProtocolSearchDetails]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ProtocolSearchDetails](
	[ProtocolSearchID] [int] NOT NULL,
	[ResultCount] [int] NULL,
	[Duration] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StartTime] [datetime] NULL,
	[FinishTime] [datetime] NULL,
	[Message] [varchar](8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
