SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[usersubscriptionmapBAK]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[usersubscriptionmapBAK](
	[NewsletterID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[EmailFormat] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SubscriptionDate] [datetime] NOT NULL,
	[KeywordList] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsSubscribed] [bit] NULL,
	[UnSubscribeDate] [datetime] NULL,
	[Priority] [int] NOT NULL
) ON [PRIMARY]
END
GO
