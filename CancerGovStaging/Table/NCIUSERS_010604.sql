SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[NCIUSERS_010604]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[NCIUSERS_010604](
	[userID] [uniqueidentifier] NOT NULL,
	[loginName] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[email] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[password] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[lastVisit] [datetime] NULL,
	[secontToLastVist] [datetime] NULL,
	[nSessions] [int] NULL,
	[registrationDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PasswordLastUpdated] [datetime] NULL
) ON [PRIMARY]
END
GO
