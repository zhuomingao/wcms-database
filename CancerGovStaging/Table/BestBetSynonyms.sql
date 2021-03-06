SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[BestBetSynonyms]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[BestBetSynonyms](
	[SynonymID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_BestBetsSynonyms_SynonymID]  DEFAULT (newid()),
	[CategoryID] [uniqueidentifier] NOT NULL,
	[SynName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	--[Weight] [int] NULL CONSTRAINT [DF_BestBetSynonyms_Weight]  DEFAULT (20),
	[UpdateDate] [datetime] NULL CONSTRAINT [DF_BestBetSynonyms_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_BestBetSynonyms_UpdateUserID]  DEFAULT (user_name()),
	[IsNegated] [bit] NULL CONSTRAINT [DF_BestBetSynonyms_IsNegated]  DEFAULT (0),
	[Notes] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    [IsExactMatch] [bit] NOT NULL CONSTRAINT [DF_BestBetSynonyms_IsExactMatch]  DEFAULT (0),
 CONSTRAINT [PK_BestBetsSynonyms] PRIMARY KEY CLUSTERED 
(
	[SynonymID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY],
 CONSTRAINT [IX_BestBetsSynNameCatID] UNIQUE NONCLUSTERED 
(
	[CategoryID] ASC,
	[SynName] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_BestBetsSynonyms_BestBetCategories]') AND type = 'F')
ALTER TABLE [dbo].[BestBetSynonyms]  WITH NOCHECK ADD  CONSTRAINT [FK_BestBetsSynonyms_BestBetCategories] FOREIGN KEY([CategoryID])
REFERENCES [BestBetCategories] ([CategoryID])
GO
ALTER TABLE [dbo].[BestBetSynonyms] CHECK CONSTRAINT [FK_BestBetsSynonyms_BestBetCategories]
GO
