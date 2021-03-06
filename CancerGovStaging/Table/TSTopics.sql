SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[TSTopics]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[TSTopics](
	[TopicId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_TSTopics_TopicId]  DEFAULT (newid()),
	[TopicName] [varchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TopicSearchTerm] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[EditableTopicSearchTerm] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_TSTopics_UpdateUserID]  DEFAULT (user_name()),
	[UpdateDate] [datetime] NULL CONSTRAINT [DF_TSTopics_UpdateDate]  DEFAULT (getdate())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
