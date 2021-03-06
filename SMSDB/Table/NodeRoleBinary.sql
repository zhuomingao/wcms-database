SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NodeRoleBinary]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NodeRoleBinary](
	[NodeID] [uniqueidentifier] NOT NULL,
	[RolePermissionBinary] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_NodeRoleBinary] PRIMARY KEY CLUSTERED 
(
	[NodeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NodeRoleBinary_Nodes]') AND parent_object_id = OBJECT_ID(N'[dbo].[NodeRoleBinary]'))
ALTER TABLE [dbo].[NodeRoleBinary]  WITH CHECK ADD  CONSTRAINT [FK_NodeRoleBinary_Nodes] FOREIGN KEY([NodeID])
REFERENCES [Node] ([NodeID])
GO
ALTER TABLE [dbo].[NodeRoleBinary] CHECK CONSTRAINT [FK_NodeRoleBinary_Nodes]
GO
