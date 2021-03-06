SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[NCIUsers]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[NCIUsers](
	[userID] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [DF_users_userID]  DEFAULT (newid()),
	[loginName] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[email] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[password] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[lastVisit] [datetime] NULL,
	[secontToLastVist] [datetime] NULL,
	[nSessions] [int] NULL,
	[registrationDate] [datetime] NOT NULL CONSTRAINT [DF_NCIUsers_registrationDate]  DEFAULT (getdate()),
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_NCIusers_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_NCIUsers_UpdateUserID]  DEFAULT (user_name()),
	[PasswordLastUpdated] [datetime] NULL CONSTRAINT [DF_NCIUsers_PasswordLastUpdated]  DEFAULT (getdate()),
 CONSTRAINT [PK_users] PRIMARY KEY NONCLUSTERED 
(
	[userID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[NCIUsers]') AND name = N'usersLoginName')
CREATE UNIQUE CLUSTERED INDEX [usersLoginName] ON [dbo].[NCIUsers] 
(
	[loginName] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[NCIUsers]') AND name = N'usersLastVisit')
CREATE NONCLUSTERED INDEX [usersLastVisit] ON [dbo].[NCIUsers] 
(
	[lastVisit] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
GRANT SELECT ON [dbo].[NCIUsers] TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIUsers] ([userID]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIUsers] ([loginName]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIUsers] ([email]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIUsers] ([password]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIUsers] ([lastVisit]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIUsers] ([secontToLastVist]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIUsers] ([nSessions]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIUsers] ([registrationDate]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIUsers] ([UpdateDate]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIUsers] ([UpdateUserID]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[NCIUsers] ([PasswordLastUpdated]) TO [webadminuser_role]
GO
