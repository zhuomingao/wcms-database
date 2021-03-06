SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SiteNavItem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SiteNavItem](
	[NavItemID] [uniqueidentifier] NOT NULL,
	[NodeID] [uniqueidentifier] NOT NULL,
	[DisplayName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateDate] [datetime] NULL DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL DEFAULT (getdate()),
	[NavCategory] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NavImg] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_SiteNavItem] PRIMARY KEY CLUSTERED 
(
	[NavItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SiteNavItem_Node]') AND parent_object_id = OBJECT_ID(N'[dbo].[SiteNavItem]'))
ALTER TABLE [dbo].[SiteNavItem]  WITH CHECK ADD  CONSTRAINT [FK_SiteNavItem_Node] FOREIGN KEY([NodeID])
REFERENCES [Node] ([NodeID])
GO
ALTER TABLE [dbo].[SiteNavItem] CHECK CONSTRAINT [FK_SiteNavItem_Node]
GO
