SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[TemplateProperty]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[TemplateProperty](
	[NCITemplateID] [uniqueidentifier] NOT NULL,
	[PropertyName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PropertyValue] [varchar](7800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsDefaultValue] [varchar](2500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_TemplateProperty_Default]  DEFAULT ('Yes'),
	[Comments] [varchar](2500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ValueType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Editable] [bit] NULL CONSTRAINT [DF_TemplateProperty_Editable]  DEFAULT (0),
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_TemplateProperty_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_TemplateProperty_UpdateUserID]  DEFAULT (user_name()),
 CONSTRAINT [IX_TemplateProperty_Templ_PropName] UNIQUE NONCLUSTERED 
(
	[NCITemplateID] ASC,
	[PropertyName] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_TemplateProperty_NCITemplate]') AND type = 'F')
ALTER TABLE [dbo].[TemplateProperty]  WITH NOCHECK ADD  CONSTRAINT [FK_TemplateProperty_NCITemplate] FOREIGN KEY([NCITemplateID])
REFERENCES [NCITemplate] ([NCITemplateID])
GO
ALTER TABLE [dbo].[TemplateProperty] CHECK CONSTRAINT [FK_TemplateProperty_NCITemplate]
GO
