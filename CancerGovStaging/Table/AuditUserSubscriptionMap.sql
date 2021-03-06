SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[AuditUserSubscriptionMap]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AuditUserSubscriptionMap](
	[AuditActionType] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AuditUpdateDate] [datetime] NULL DEFAULT (getdate()),
	[AuditUpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT (user_name()),
	[NewsletterID] [uniqueidentifier] NULL,
	[UserID] [uniqueidentifier] NULL,
	[EmailFormat] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SubscriptionDate] [datetime] NULL,
	[KeywordList] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsSubscribed] [bit] NULL,
	[UnSubscribeDate] [datetime] NULL,
	[Priority] [int] NOT NULL
) ON [PRIMARY]
END
GO
