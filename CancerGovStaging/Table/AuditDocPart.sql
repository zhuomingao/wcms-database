SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[AuditDocPart]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AuditDocPart](
	[AuditActionType] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AuditActionDate] [datetime] NULL CONSTRAINT [DF_AuditDocPart_AuditActionDate]  DEFAULT (getdate()),
	[AuditActionUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_AuditDocPart_AuditActionUserID]  DEFAULT (user_id()),
	[DocPartID] [uniqueidentifier] NULL,
	[DocumentID] [uniqueidentifier] NULL,
	[Priority] [int] NULL,
	[Heading] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Content] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateUserID] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__AuditDocP__Updat__270FB757]  DEFAULT (user_name()),
	[UpdateDate] [datetime] NULL CONSTRAINT [DF__AuditDocP__Updat__2803DB90]  DEFAULT (getdate()),
	[ShowTitleOrNot] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
