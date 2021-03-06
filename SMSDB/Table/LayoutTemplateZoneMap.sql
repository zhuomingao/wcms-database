SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LayoutTemplateZoneMap]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LayoutTemplateZoneMap](
	[LayoutTemplateID] [uniqueidentifier] NOT NULL,
	[TemplateZoneID] [uniqueidentifier] NOT NULL,
	[CreateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateDate] [datetime] NULL DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL DEFAULT (getdate()),
 CONSTRAINT [PK_layoutTemplateZoneMap] PRIMARY KEY CLUSTERED 
(
	[LayoutTemplateID] ASC,
	[TemplateZoneID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LayoutTemplateZoneMap_LayoutTemplate]') AND parent_object_id = OBJECT_ID(N'[dbo].[LayoutTemplateZoneMap]'))
ALTER TABLE [dbo].[LayoutTemplateZoneMap]  WITH CHECK ADD  CONSTRAINT [FK_LayoutTemplateZoneMap_LayoutTemplate] FOREIGN KEY([LayoutTemplateID])
REFERENCES [LayoutTemplate] ([LayoutTemplateID])
GO
ALTER TABLE [dbo].[LayoutTemplateZoneMap] CHECK CONSTRAINT [FK_LayoutTemplateZoneMap_LayoutTemplate]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LayoutTemplateZoneMap_TemplateZones]') AND parent_object_id = OBJECT_ID(N'[dbo].[LayoutTemplateZoneMap]'))
ALTER TABLE [dbo].[LayoutTemplateZoneMap]  WITH CHECK ADD  CONSTRAINT [FK_LayoutTemplateZoneMap_TemplateZones] FOREIGN KEY([TemplateZoneID])
REFERENCES [TemplateZone] ([TemplateZoneID])
GO
ALTER TABLE [dbo].[LayoutTemplateZoneMap] CHECK CONSTRAINT [FK_LayoutTemplateZoneMap_TemplateZones]
GO
