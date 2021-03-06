SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[AuditGroups]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AuditGroups](
	[AuditActionType] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[groupID] [int] NOT NULL,
	[typeID] [int] NOT NULL,
	[parentGroupId] [int] NULL,
	[groupIDName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[groupName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[adminEmail] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[creationDate] [datetime] NOT NULL,
	[creationUser] [uniqueidentifier] NULL,
	[isActive] [bit] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AuditActionDate] [datetime] NOT NULL DEFAULT (getdate()),
	[AuditActionUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL DEFAULT (user_name())
) ON [PRIMARY]
END
GO
