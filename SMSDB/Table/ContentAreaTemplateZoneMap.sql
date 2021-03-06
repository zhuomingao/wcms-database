SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContentAreaTemplateZoneMap]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ContentAreaTemplateZoneMap](
	[ContentAreaTemplateID] [uniqueidentifier] NOT NULL,
	[TemplateZoneID] [uniqueidentifier] NOT NULL,
	[CreateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateDate] [datetime] NULL DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL DEFAULT (getdate()),
 CONSTRAINT [PK_ContentAreaTemplateZoneMap] PRIMARY KEY CLUSTERED 
(
	[ContentAreaTemplateID] ASC,
	[TemplateZoneID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContentAreaTemplateZoneMap_ContentAreaTemplate]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContentAreaTemplateZoneMap]'))
ALTER TABLE [dbo].[ContentAreaTemplateZoneMap]  WITH CHECK ADD  CONSTRAINT [FK_ContentAreaTemplateZoneMap_ContentAreaTemplate] FOREIGN KEY([ContentAreaTemplateID])
REFERENCES [ContentAreaTemplate] ([ContentAreaTemplateID])
GO
ALTER TABLE [dbo].[ContentAreaTemplateZoneMap] CHECK CONSTRAINT [FK_ContentAreaTemplateZoneMap_ContentAreaTemplate]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ContentAreaTemplateZoneMap_TemplateZone]') AND parent_object_id = OBJECT_ID(N'[dbo].[ContentAreaTemplateZoneMap]'))
ALTER TABLE [dbo].[ContentAreaTemplateZoneMap]  WITH CHECK ADD  CONSTRAINT [FK_ContentAreaTemplateZoneMap_TemplateZone] FOREIGN KEY([TemplateZoneID])
REFERENCES [TemplateZone] ([TemplateZoneID])
GO
ALTER TABLE [dbo].[ContentAreaTemplateZoneMap] CHECK CONSTRAINT [FK_ContentAreaTemplateZoneMap_TemplateZone]
GO
