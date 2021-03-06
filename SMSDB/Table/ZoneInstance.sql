SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZoneInstance]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZoneInstance](
	[ZoneInstanceID] [uniqueidentifier] NOT NULL,
	[NodeID] [uniqueidentifier] NOT NULL,
	[CanInherit] [bit] NULL,
	[TemplateZoneID] [uniqueidentifier] NOT NULL,
	[CreateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateDate] [datetime] NULL DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL DEFAULT (getdate()),
 CONSTRAINT [PK_ZoneInstances] PRIMARY KEY CLUSTERED 
(
	[ZoneInstanceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ_ZoneInstance_NodeZone] UNIQUE NONCLUSTERED 
(
	[NodeID] ASC,
	[TemplateZoneID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ZoneInstance_NodeID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ZoneInstance]'))
ALTER TABLE [dbo].[ZoneInstance]  WITH CHECK ADD  CONSTRAINT [FK_ZoneInstance_NodeID] FOREIGN KEY([NodeID])
REFERENCES [Node] ([NodeID])
GO
ALTER TABLE [dbo].[ZoneInstance] CHECK CONSTRAINT [FK_ZoneInstance_NodeID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ZoneInstance_TemplateZoneID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ZoneInstance]'))
ALTER TABLE [dbo].[ZoneInstance]  WITH CHECK ADD  CONSTRAINT [FK_ZoneInstance_TemplateZoneID] FOREIGN KEY([TemplateZoneID])
REFERENCES [TemplateZone] ([TemplateZoneID])
GO
ALTER TABLE [dbo].[ZoneInstance] CHECK CONSTRAINT [FK_ZoneInstance_TemplateZoneID]
GO
