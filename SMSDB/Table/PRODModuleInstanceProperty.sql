SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PRODModuleInstanceProperty]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PRODModuleInstanceProperty](
	[InstancePropertyID] [uniqueidentifier] NOT NULL,
	[ModuleInstanceID] [uniqueidentifier] NOT NULL,
	[PropertyTemplateID] [uniqueidentifier] NOT NULL,
	[CreateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF__PRODModuleIns__Creat__2C538F61]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL CONSTRAINT [DF__PRODModuleIns__Updat__2D47B39A]  DEFAULT (getdate()),
	[PropertyValue] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_PRODModuleInstanceProperties] PRIMARY KEY NONCLUSTERED 
(
	[InstancePropertyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PRODModuleInstanceProperties_ModuleInstances]') AND parent_object_id = OBJECT_ID(N'[dbo].[PRODModuleInstanceProperty]'))
ALTER TABLE [dbo].[PRODModuleInstanceProperty]  WITH CHECK ADD  CONSTRAINT [FK_PRODModuleInstanceProperties_ModuleInstances] FOREIGN KEY([ModuleInstanceID])
REFERENCES [PRODModuleInstance] ([ModuleInstanceID])
GO
ALTER TABLE [dbo].[PRODModuleInstanceProperty] CHECK CONSTRAINT [FK_PRODModuleInstanceProperties_ModuleInstances]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PRODModuleInstanceProperties_PropertyTemplates]') AND parent_object_id = OBJECT_ID(N'[dbo].[PRODModuleInstanceProperty]'))
ALTER TABLE [dbo].[PRODModuleInstanceProperty]  WITH CHECK ADD  CONSTRAINT [FK_PRODModuleInstanceProperties_PropertyTemplates] FOREIGN KEY([PropertyTemplateID])
REFERENCES [PropertyTemplate] ([PropertyTemplateID])
GO
ALTER TABLE [dbo].[PRODModuleInstanceProperty] CHECK CONSTRAINT [FK_PRODModuleInstanceProperties_PropertyTemplates]
GO
