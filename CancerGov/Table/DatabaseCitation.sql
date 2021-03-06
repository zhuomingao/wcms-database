SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DatabaseCitation]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[DatabaseCitation](
	[DatabaseCitationID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_DatabaseCitation_DatabaseCitationID]  DEFAULT (newid()),
	[Type] [uniqueidentifier] NULL,
	[DatabaseName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Author] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ParentDatabaseCitationID] [uniqueidentifier] NULL,
	[LastRevisedDate] [datetime] NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_DatabaseCitation_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_DatabaseCitation_UpdateUserID]  DEFAULT (user_name()),
	[SourceID] [numeric](18, 0) NULL,
	[DataSource] [char](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_DatabaseCitation] PRIMARY KEY CLUSTERED 
(
	[DatabaseCitationID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_DatabaseCitation_Type]') AND type = 'F')
ALTER TABLE [dbo].[DatabaseCitation]  WITH CHECK ADD  CONSTRAINT [FK_DatabaseCitation_Type] FOREIGN KEY([Type])
REFERENCES [Type] ([TypeID])
GO
ALTER TABLE [dbo].[DatabaseCitation] CHECK CONSTRAINT [FK_DatabaseCitation_Type]
GO
