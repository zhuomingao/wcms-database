SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ModuleInstance]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ModuleInstance](
	[ModuleInstanceID] [uniqueidentifier] NOT NULL,
	[ZoneInstanceID] [uniqueidentifier] NOT NULL,
	[ModuleID] [uniqueidentifier] NOT NULL,
	[Priority] [int] NOT NULL,
	[CreateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateDate] [datetime] NULL DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL DEFAULT (getdate()),
	[ObjectID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ModuleInstances] PRIMARY KEY CLUSTERED 
(
	[ModuleInstanceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ModuleInstance_moduleID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ModuleInstance]'))
ALTER TABLE [dbo].[ModuleInstance]  WITH CHECK ADD  CONSTRAINT [FK_ModuleInstance_moduleID] FOREIGN KEY([ModuleID])
REFERENCES [Module] ([ModuleID])
GO
ALTER TABLE [dbo].[ModuleInstance] CHECK CONSTRAINT [FK_ModuleInstance_moduleID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ModuleInstance_objectID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ModuleInstance]'))
ALTER TABLE [dbo].[ModuleInstance]  WITH CHECK ADD  CONSTRAINT [FK_ModuleInstance_objectID] FOREIGN KEY([ObjectID])
REFERENCES [Object] ([ObjectID])
GO
ALTER TABLE [dbo].[ModuleInstance] CHECK CONSTRAINT [FK_ModuleInstance_objectID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ModuleInstance_ZoneInstanceID]') AND parent_object_id = OBJECT_ID(N'[dbo].[ModuleInstance]'))
ALTER TABLE [dbo].[ModuleInstance]  WITH CHECK ADD  CONSTRAINT [FK_ModuleInstance_ZoneInstanceID] FOREIGN KEY([ZoneInstanceID])
REFERENCES [ZoneInstance] ([ZoneInstanceID])
GO
ALTER TABLE [dbo].[ModuleInstance] CHECK CONSTRAINT [FK_ModuleInstance_ZoneInstanceID]
GO
