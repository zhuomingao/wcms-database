SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GeneralComments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GeneralComments](
	[CommentID] [uniqueidentifier] NOT NULL,
	[Comment] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CommentDate] [datetime] NULL CONSTRAINT [DF_DCComments_CommentDate]  DEFAULT (getdate()),
	[CommentType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_DCComments_CommentType]  DEFAULT ('DC'),
 CONSTRAINT [PK_DCComments] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 30) ON [PRIMARY]
) ON [PRIMARY]
END
GO
