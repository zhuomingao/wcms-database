SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[TempNewsletter_9_15]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[TempNewsletter_9_15](
	[EmailID] [uniqueidentifier] NOT NULL,
	[EmailAddress] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsSubscribed] [bit] NULL,
	[TimesSent] [int] NULL,
	[SubscribeDate] [datetime] NULL,
	[UnSubscribeDate] [datetime] NULL,
	[IsNIH] [bit] NOT NULL
) ON [PRIMARY]
END
GO
