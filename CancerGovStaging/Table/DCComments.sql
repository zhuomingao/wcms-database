SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DCComments]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DCComments](
	[CommentID] [uniqueidentifier] NOT NULL,
	[Comment] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CommentDate] [datetime] NULL CONSTRAINT [DF_DCComments_CommentDate]  DEFAULT (getdate()),
	[CommentType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_DCComments_CommentType]  DEFAULT ('DC'),
 CONSTRAINT [PK_DCComments] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
GRANT INSERT ON [dbo].[DCComments] TO [websiteuser_role]
GO
