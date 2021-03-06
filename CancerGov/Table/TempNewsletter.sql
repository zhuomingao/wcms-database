SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[TempNewsletter]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[TempNewsletter](
	[EmailID] [uniqueidentifier] NOT NULL,
	[EmailAddress] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsSubscribed] [bit] NULL CONSTRAINT [DF_TempNewsletter_IsSubscribed]  DEFAULT (1),
	[TimesSent] [int] NULL CONSTRAINT [DF_TempNewsletter_TimesSent]  DEFAULT (0),
	[SubscribeDate] [datetime] NULL CONSTRAINT [DF_TempNewsletter_SubscribeDate]  DEFAULT (getdate()),
	[UnSubscribeDate] [datetime] NULL,
	[IsNIH] [bit] NOT NULL CONSTRAINT [DF_TempNewsletter_IsNIH]  DEFAULT (0),
 CONSTRAINT [PK_TempNewsletter] PRIMARY KEY CLUSTERED 
(
	[EmailID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY],
 CONSTRAINT [IX_TempNewsletter_EmailAddress] UNIQUE NONCLUSTERED 
(
	[EmailAddress] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
