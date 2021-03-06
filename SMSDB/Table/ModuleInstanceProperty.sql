SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ModuleInstanceProperty]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ModuleInstanceProperty](
	[InstancePropertyID] [uniqueidentifier] NOT NULL,
	[ModuleInstanceID] [uniqueidentifier] NOT NULL,
	[PropertyTemplateID] [uniqueidentifier] NOT NULL,
	[CreateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_ModuleIns_Createdate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL CONSTRAINT [DF_ModuleIns_UpdateDate]  DEFAULT (getdate()),
	[PropertyValue] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_ModuleInstanceProperties] PRIMARY KEY NONCLUSTERED 
(
	[InstancePropertyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ModuleInstanceProperty]') AND name = N'CI_ModuleInstanceProperty')
CREATE CLUSTERED INDEX [CI_ModuleInstanceProperty] ON [dbo].[ModuleInstanceProperty] 
(
	[ModuleInstanceID] ASC,
	[PropertyTemplateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ModuleInstanceProperties_ModuleInstances]') AND parent_object_id = OBJECT_ID(N'[dbo].[ModuleInstanceProperty]'))
ALTER TABLE [dbo].[ModuleInstanceProperty]  WITH CHECK ADD  CONSTRAINT [FK_ModuleInstanceProperties_ModuleInstances] FOREIGN KEY([ModuleInstanceID])
REFERENCES [ModuleInstance] ([ModuleInstanceID])
GO
ALTER TABLE [dbo].[ModuleInstanceProperty] CHECK CONSTRAINT [FK_ModuleInstanceProperties_ModuleInstances]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ModuleInstanceProperties_PropertyTemplates]') AND parent_object_id = OBJECT_ID(N'[dbo].[ModuleInstanceProperty]'))
ALTER TABLE [dbo].[ModuleInstanceProperty]  WITH CHECK ADD  CONSTRAINT [FK_ModuleInstanceProperties_PropertyTemplates] FOREIGN KEY([PropertyTemplateID])
REFERENCES [PropertyTemplate] ([PropertyTemplateID])
GO
ALTER TABLE [dbo].[ModuleInstanceProperty] CHECK CONSTRAINT [FK_ModuleInstanceProperties_PropertyTemplates]
GO
