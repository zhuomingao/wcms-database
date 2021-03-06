SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DocumentType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DocumentType](
	[DocumentTypeID] [int] NOT NULL,
	[Name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Comments] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NOT NULL DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL DEFAULT (user_name()),
	[DocumentTypeMapID] [int] NULL,
 CONSTRAINT [PK_DocumentType] PRIMARY KEY CLUSTERED 
(
	[DocumentTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[DocumentTypeMap_DocumentType_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[DocumentType]'))
ALTER TABLE [dbo].[DocumentType]  WITH CHECK ADD  CONSTRAINT [DocumentTypeMap_DocumentType_FK1] FOREIGN KEY([DocumentTypeMapID])
REFERENCES [DocumentTypeMap] ([DocumentTypeMapID])
GO
ALTER TABLE [dbo].[DocumentType] CHECK CONSTRAINT [DocumentTypeMap_DocumentType_FK1]
GO
