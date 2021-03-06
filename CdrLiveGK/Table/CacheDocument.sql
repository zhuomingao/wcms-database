SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[CacheDocument]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CacheDocument](
	[CacheDocumentID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentID] [int] NOT NULL,
	[Audience] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Format] [varchar](850) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateCached] [datetime] NOT NULL CONSTRAINT [DF_CacheDocument_DateCached]  DEFAULT (getdate()),
	[DocumentHTML] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DateLastAccessed] [datetime] NULL,
	[Retrived] [int] NULL,
 CONSTRAINT [PK_CacheDocument] PRIMARY KEY NONCLUSTERED 
(
	[CacheDocumentID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[CacheDocument]') AND name = N'IX_CacheDocument_Audience')
CREATE NONCLUSTERED INDEX [IX_CacheDocument_Audience] ON [dbo].[CacheDocument] 
(
	[Audience] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[CacheDocument]') AND name = N'IX_CacheDocument_DocumentID')
CREATE NONCLUSTERED INDEX [IX_CacheDocument_DocumentID] ON [dbo].[CacheDocument] 
(
	[DocumentID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[CacheDocument]') AND name = N'IX_CacheDocument_Format')
CREATE NONCLUSTERED INDEX [IX_CacheDocument_Format] ON [dbo].[CacheDocument] 
(
	[Format] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
