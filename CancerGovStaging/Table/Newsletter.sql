SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Newsletter]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Newsletter](
	[NewsletterID] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[OwnerGroupID] [int] NOT NULL,
	[Section] [uniqueidentifier] NULL,
	[Title] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[From] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ReplyTo] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Newslette__Creat__3CC9EE4C]  DEFAULT (user_name()),
	[CreateDate] [datetime] NULL DEFAULT (getdate()),
	[Status] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Newslette__Updat__3FA65AF7]  DEFAULT (user_name()),
	[GroupSentTo] [int] NULL CONSTRAINT [DF_Newsletter_GroupSentTo]  DEFAULT (5),
	[qcemail] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[NewsletterID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
