SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Terminology]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Terminology](
	[TermID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Terminology_TermID]  DEFAULT (newid()),
	[StatusID] [uniqueidentifier] NOT NULL,
	[StatusDate] [datetime] NULL,
	[Name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ShortName] [varchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Acronym] [varchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Definition] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_Terminology_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_Terminology_UpdateUserID]  DEFAULT (user_name()),
	[SourceID] [numeric](18, 0) NULL,
	[DataSource] [char](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_terminology] PRIMARY KEY NONCLUSTERED 
(
	[TermID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[Terminology]') AND name = N'IX_Terminology_Name')
CREATE CLUSTERED INDEX [IX_Terminology_Name] ON [dbo].[Terminology] 
(
	[Name] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[Terminology]') AND name = N'IX_Terminology_IDandName')
CREATE NONCLUSTERED INDEX [IX_Terminology_IDandName] ON [dbo].[Terminology] 
(
	[TermID] ASC,
	[Name] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[Terminology]') AND name = N'IX_Terminology_SourceID_DataSource')
CREATE NONCLUSTERED INDEX [IX_Terminology_SourceID_DataSource] ON [dbo].[Terminology] 
(
	[SourceID] ASC,
	[DataSource] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
