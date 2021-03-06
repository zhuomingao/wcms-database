SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PrettyUrl]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PrettyUrl](
	[PrettyUrlID] [uniqueidentifier] NOT NULL,
	[NodeID] [uniqueidentifier] NULL,
	[PrettyURL] [varchar](512) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[RealURL] [varchar](512) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsPrimary] [bit] NOT NULL CONSTRAINT [DF_PrettyUrls_IsPrimary]  DEFAULT ((1)),
	[CreateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_PrettyUrl_CreateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL CONSTRAINT [DF_PrettyUrl_UpdateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_PrettyURL] PRIMARY KEY NONCLUSTERED 
(
	[PrettyUrlID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PrettyUrl]') AND name = N'CI_PrettyUrl')
CREATE CLUSTERED INDEX [CI_PrettyUrl] ON [dbo].[PrettyUrl] 
(
	[NodeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PrettyUrl]') AND name = N'UQ_PrettyURL')
CREATE UNIQUE NONCLUSTERED INDEX [UQ_PrettyURL] ON [dbo].[PrettyUrl] 
(
	[NodeID] ASC,
	[PrettyURL] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PrettyUrls_Node]') AND parent_object_id = OBJECT_ID(N'[dbo].[PrettyUrl]'))
ALTER TABLE [dbo].[PrettyUrl]  WITH CHECK ADD  CONSTRAINT [FK_PrettyUrls_Node] FOREIGN KEY([NodeID])
REFERENCES [Node] ([NodeID])
GO
ALTER TABLE [dbo].[PrettyUrl] CHECK CONSTRAINT [FK_PrettyUrls_Node]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_prettyURL_isPrimary]') AND parent_object_id = OBJECT_ID(N'[dbo].[PrettyUrl]'))
ALTER TABLE [dbo].[PrettyUrl]  WITH CHECK ADD  CONSTRAINT [CK_prettyURL_isPrimary] CHECK  (([dbo].[Core_function_PrimaryPrettyURLCount]([isPrimary],[nodeID])<=(1)))
GO
ALTER TABLE [dbo].[PrettyUrl] CHECK CONSTRAINT [CK_prettyURL_isPrimary]
GO
