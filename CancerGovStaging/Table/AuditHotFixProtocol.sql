SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[AuditHotFixProtocol]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AuditHotFixProtocol](
	[AuditActionType] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AuditActionDate] [datetime] NOT NULL DEFAULT (getdate()),
	[AuditActionUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL DEFAULT (user_name()),
	[ProtocolID] [uniqueidentifier] NULL,
	[Comments] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Title] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShortTitle] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Abstract] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DosageForms] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DosageSchedule] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EndPoints] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EntryCriteria] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Objectives] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Outline] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ProjectedAccrual] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SpeciaStudyParameters] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Stratification] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Warning] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdatedDate] [datetime] NULL,
	[ApprovedDate] [datetime] NULL,
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IsApproved] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
