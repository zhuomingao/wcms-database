SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DocPart]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DocPart](
	[DocPartID] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[DocumentID] [uniqueidentifier] NOT NULL,
	[Priority] [int] NOT NULL,
	[Heading] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Content] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateUserID] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL DEFAULT (user_name()),
	[UpdateDate] [datetime] NULL DEFAULT (getdate()),
	[ShowTitleOrNot] [bit] NULL DEFAULT (1),
PRIMARY KEY CLUSTERED 
(
	[DocPartID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK__DocPart__Documen__6AFACD50]') AND type = 'F')
ALTER TABLE [dbo].[DocPart]  WITH CHECK ADD FOREIGN KEY([DocumentID])
REFERENCES [Document] ([DocumentID])
GO
