SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PRODLayoutDefinition]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PRODLayoutDefinition](
	[NodeID] [uniqueidentifier] NOT NULL,
	[LayoutTemplateID] [uniqueidentifier] NOT NULL,
	[ContentAreaTemplateID] [uniqueidentifier] NOT NULL,
	[CreateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateDate] [datetime] NULL DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL DEFAULT (getdate()),
 CONSTRAINT [PK_PRODlayoutDefinition] PRIMARY KEY CLUSTERED 
(
	[NodeID] ASC,
	[LayoutTemplateID] ASC,
	[ContentAreaTemplateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PRODLayoutDefinition_ContentAreaTemplates]') AND parent_object_id = OBJECT_ID(N'[dbo].[PRODLayoutDefinition]'))
ALTER TABLE [dbo].[PRODLayoutDefinition]  WITH CHECK ADD  CONSTRAINT [FK_PRODLayoutDefinition_ContentAreaTemplates] FOREIGN KEY([ContentAreaTemplateID])
REFERENCES [ContentAreaTemplate] ([ContentAreaTemplateID])
GO
ALTER TABLE [dbo].[PRODLayoutDefinition] CHECK CONSTRAINT [FK_PRODLayoutDefinition_ContentAreaTemplates]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PRODLayoutDefinition_LayoutTemplate]') AND parent_object_id = OBJECT_ID(N'[dbo].[PRODLayoutDefinition]'))
ALTER TABLE [dbo].[PRODLayoutDefinition]  WITH CHECK ADD  CONSTRAINT [FK_PRODLayoutDefinition_LayoutTemplate] FOREIGN KEY([LayoutTemplateID])
REFERENCES [LayoutTemplate] ([LayoutTemplateID])
GO
ALTER TABLE [dbo].[PRODLayoutDefinition] CHECK CONSTRAINT [FK_PRODLayoutDefinition_LayoutTemplate]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PRODLayoutDefinition_Node]') AND parent_object_id = OBJECT_ID(N'[dbo].[PRODLayoutDefinition]'))
ALTER TABLE [dbo].[PRODLayoutDefinition]  WITH CHECK ADD  CONSTRAINT [FK_PRODLayoutDefinition_Node] FOREIGN KEY([NodeID])
REFERENCES [PRODNode] ([NodeID])
GO
ALTER TABLE [dbo].[PRODLayoutDefinition] CHECK CONSTRAINT [FK_PRODLayoutDefinition_Node]
GO
