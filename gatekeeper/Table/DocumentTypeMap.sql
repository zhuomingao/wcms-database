SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DocumentTypeMap]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DocumentTypeMap](
	[DocumentTypeMapID] [int] IDENTITY(1,1) NOT NULL,
	[DataSetID] [int] NOT NULL,
	[DocumentTypeID] [int] NOT NULL,
 CONSTRAINT [DocumentTypeMap_PK] PRIMARY KEY NONCLUSTERED 
(
	[DocumentTypeMapID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__DocumentT__DataS__10216507]') AND parent_object_id = OBJECT_ID(N'[dbo].[DocumentTypeMap]'))
ALTER TABLE [dbo].[DocumentTypeMap]  WITH CHECK ADD  CONSTRAINT [FK__DocumentT__DataS__10216507] FOREIGN KEY([DataSetID])
REFERENCES [DataSet] ([DataSetID])
GO
ALTER TABLE [dbo].[DocumentTypeMap] CHECK CONSTRAINT [FK__DocumentT__DataS__10216507]
GO
