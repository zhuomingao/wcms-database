SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PRODPrettyUrl]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PRODPrettyUrl](
	[PrettyUrlID] [uniqueidentifier] NOT NULL,
	[NodeID] [uniqueidentifier] NULL,
	[PrettyURL] [varchar](512) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[RealURL] [varchar](512) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsPrimary] [bit] NOT NULL CONSTRAINT [DF_PRODPrettyUrls_IsPrimary]  DEFAULT ((1)),
	[CreateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF__PRODPrettyUrl__Createdate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL CONSTRAINT [DF__PRODPrettyUrl__Updatedate]  DEFAULT (getdate())
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[PRODPrettyUrl]') AND name = N'CI_PRODPrettyUrl')
CREATE CLUSTERED INDEX [CI_PRODPrettyUrl] ON [dbo].[PRODPrettyUrl] 
(
	[NodeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PRODPrettyUrls_Node]') AND parent_object_id = OBJECT_ID(N'[dbo].[PRODPrettyUrl]'))
ALTER TABLE [dbo].[PRODPrettyUrl]  WITH CHECK ADD  CONSTRAINT [FK_PRODPrettyUrls_Node] FOREIGN KEY([NodeID])
REFERENCES [PRODNode] ([NodeID])
GO
ALTER TABLE [dbo].[PRODPrettyUrl] CHECK CONSTRAINT [FK_PRODPrettyUrls_Node]
GO
