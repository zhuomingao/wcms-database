SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Citation]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Citation](
	[CitationID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Citation_CitationID]  DEFAULT (newid()),
	[Type] [uniqueidentifier] NOT NULL,
	[StatusID] [uniqueidentifier] NOT NULL,
	[CitedEntityID] [uniqueidentifier] NULL,
	[UpdateDate] [datetime] NULL CONSTRAINT [DF_Citation_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_Citation_UpdateUserID]  DEFAULT (user_name()),
	[SourceID] [numeric](18, 0) NULL,
	[DataSource] [char](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_citation] PRIMARY KEY CLUSTERED 
(
	[CitationID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_Citation_Status]') AND type = 'F')
ALTER TABLE [dbo].[Citation]  WITH CHECK ADD  CONSTRAINT [FK_Citation_Status] FOREIGN KEY([StatusID])
REFERENCES [Status] ([StatusID])
GO
ALTER TABLE [dbo].[Citation] CHECK CONSTRAINT [FK_Citation_Status]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_Citation_Type]') AND type = 'F')
ALTER TABLE [dbo].[Citation]  WITH CHECK ADD  CONSTRAINT [FK_Citation_Type] FOREIGN KEY([Type])
REFERENCES [Type] ([TypeID])
GO
ALTER TABLE [dbo].[Citation] CHECK CONSTRAINT [FK_Citation_Type]
GO
