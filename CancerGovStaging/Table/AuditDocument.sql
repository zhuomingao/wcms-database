SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[AuditDocument]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AuditDocument](
	[AuditActionType] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DocumentID] [uniqueidentifier] NOT NULL,
	[Title] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShortTitle] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](2500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GroupID] [int] NULL,
	[DataType] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DataSize] [int] NULL,
	[IsWirelessPage] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TOC] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Data] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RunTimeOwnerID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateDate] [datetime] NULL,
	[PostedDate] [datetime] NULL,
	[ReleaseDate] [datetime] NULL,
	[ExpirationDate] [datetime] NULL,
	[DisplayDateMode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AuditActionDate] [datetime] NOT NULL DEFAULT (getdate()),
	[AuditActionUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL DEFAULT (user_name())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
