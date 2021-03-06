SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GlossaryTerm]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GlossaryTerm](
	[GlossaryTermID] [int] NOT NULL,
	[TermName] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TermPronunciation] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SpanishTermName] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_GlossaryTerm_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_GlossaryTerm_UpdateUserID]  DEFAULT (user_name()),
 CONSTRAINT [PK_GlossaryTerm] PRIMARY KEY CLUSTERED 
(
	[GlossaryTermID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[GlossaryTerm]') AND name = N'NC_GloassaryTerm_sp')
CREATE NONCLUSTERED INDEX [NC_GloassaryTerm_sp] ON [dbo].[GlossaryTerm] 
(
	[SpanishTermName] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
