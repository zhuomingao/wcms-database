SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[AuditViewObjectTypeProperty]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AuditViewObjectTypeProperty](
	[AuditActionType] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[NCIObjectID] [uniqueidentifier] NULL,
	[PropertyName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PropertyValue] [varchar](7800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Comments] [varchar](2500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsDefaultValue] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL,
	[ValueType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Editable] [bit] NULL,
	[AuditActionDate] [datetime] NOT NULL DEFAULT (getdate()),
	[AuditActionUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL DEFAULT (user_name())
) ON [PRIMARY]
END
GO
