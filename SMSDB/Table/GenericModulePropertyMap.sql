SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GenericModulePropertyMap]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GenericModulePropertyMap](
	[GenericModuleID] [uniqueidentifier] NOT NULL,
	[PropertyTemplateID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_GenericModulePropertyMap_GenericModuleID_PropertyTemplateID] PRIMARY KEY CLUSTERED 
(
	[GenericModuleID] ASC,
	[PropertyTemplateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GenericModulePropertyMap_GenericModuleID]') AND parent_object_id = OBJECT_ID(N'[dbo].[GenericModulePropertyMap]'))
ALTER TABLE [dbo].[GenericModulePropertyMap]  WITH CHECK ADD  CONSTRAINT [FK_GenericModulePropertyMap_GenericModuleID] FOREIGN KEY([GenericModuleID])
REFERENCES [GenericModule] ([GenericModuleID])
GO
ALTER TABLE [dbo].[GenericModulePropertyMap] CHECK CONSTRAINT [FK_GenericModulePropertyMap_GenericModuleID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GenericModulePropertyMap_PropertyTemplateID]') AND parent_object_id = OBJECT_ID(N'[dbo].[GenericModulePropertyMap]'))
ALTER TABLE [dbo].[GenericModulePropertyMap]  WITH CHECK ADD  CONSTRAINT [FK_GenericModulePropertyMap_PropertyTemplateID] FOREIGN KEY([PropertyTemplateID])
REFERENCES [PropertyTemplate] ([PropertyTemplateID])
GO
ALTER TABLE [dbo].[GenericModulePropertyMap] CHECK CONSTRAINT [FK_GenericModulePropertyMap_PropertyTemplateID]
GO
