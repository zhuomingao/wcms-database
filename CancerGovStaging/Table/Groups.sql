SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Groups]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Groups](
	[GroupID] [int] IDENTITY(150,1) NOT NULL,
	[typeID] [int] NOT NULL,
	[parentGroupId] [int] NULL,
	[groupIDName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[groupName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[adminEmail] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[creationDate] [datetime] NOT NULL CONSTRAINT [DF_Groups_creationDate]  DEFAULT (getdate()),
	[creationUser] [uniqueidentifier] NULL,
	[isActive] [bit] NOT NULL CONSTRAINT [DF_UserGroups_isActive]  DEFAULT (1),
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_Groups_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_Groups_UpdateUserID]  DEFAULT (user_name()),
 CONSTRAINT [PK_UserGroups] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[Groups]') AND name = N'UserGroupsParents')
CREATE NONCLUSTERED INDEX [UserGroupsParents] ON [dbo].[Groups] 
(
	[parentGroupId] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
GRANT SELECT ON [dbo].[Groups] TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[Groups] ([GroupID]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[Groups] ([typeID]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[Groups] ([parentGroupId]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[Groups] ([groupIDName]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[Groups] ([groupName]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[Groups] ([adminEmail]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[Groups] ([creationDate]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[Groups] ([creationUser]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[Groups] ([isActive]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[Groups] ([UpdateDate]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[Groups] ([UpdateUserID]) TO [webadminuser_role]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_UserGroups_UserGroups]') AND type = 'F')
ALTER TABLE [dbo].[Groups]  WITH NOCHECK ADD  CONSTRAINT [FK_UserGroups_UserGroups] FOREIGN KEY([parentGroupId])
REFERENCES [Groups] ([GroupID])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_UserGroups_UserGroups]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_UserGroups_UserGroupTypes]') AND type = 'F')
ALTER TABLE [dbo].[Groups]  WITH NOCHECK ADD  CONSTRAINT [FK_UserGroups_UserGroupTypes] FOREIGN KEY([typeID])
REFERENCES [GroupTypes] ([typeID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_UserGroups_UserGroupTypes]
GO
