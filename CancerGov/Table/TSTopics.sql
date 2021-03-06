SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[TSTopics]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[TSTopics](
	[TopicId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[TopicName] [varchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TopicSearchTerm] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[EditableTopicSearchTerm] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[updateuserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT (user_name()),
	[updateDate] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[TopicId] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
