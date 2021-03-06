SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[UserGroupPermissionMap]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[UserGroupPermissionMap](
	[userID] [uniqueidentifier] NOT NULL,
	[groupID] [int] NOT NULL,
	[permissionID] [int] NOT NULL,
	[creationDate] [datetime] NOT NULL CONSTRAINT [DF_UserGroupPermissionMap_creationDate]  DEFAULT (getdate()),
	[creationUser] [uniqueidentifier] NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_UserGroupPermissionMap_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_UserGroupPermissionMap_UpdateUserID]  DEFAULT (user_name()),
 CONSTRAINT [IX_UserGroupPermissionMap_Unique] UNIQUE NONCLUSTERED 
(
	[userID] ASC,
	[groupID] ASC,
	[permissionID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
GRANT SELECT ON [dbo].[UserGroupPermissionMap] TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[UserGroupPermissionMap] ([userID]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[UserGroupPermissionMap] ([groupID]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[UserGroupPermissionMap] ([permissionID]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[UserGroupPermissionMap] ([creationDate]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[UserGroupPermissionMap] ([creationUser]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[UserGroupPermissionMap] ([UpdateDate]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[UserGroupPermissionMap] ([UpdateUserID]) TO [webadminuser_role]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_UserGroupPermissionMap_NCIusers]') AND type = 'F')
ALTER TABLE [dbo].[UserGroupPermissionMap]  WITH NOCHECK ADD  CONSTRAINT [FK_UserGroupPermissionMap_NCIusers] FOREIGN KEY([userID])
REFERENCES [NCIUsers] ([userID])
GO
ALTER TABLE [dbo].[UserGroupPermissionMap] CHECK CONSTRAINT [FK_UserGroupPermissionMap_NCIusers]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_UserGroupPermissionMap_Permissions]') AND type = 'F')
ALTER TABLE [dbo].[UserGroupPermissionMap]  WITH NOCHECK ADD  CONSTRAINT [FK_UserGroupPermissionMap_Permissions] FOREIGN KEY([permissionID])
REFERENCES [Permissions] ([permissionID])
GO
ALTER TABLE [dbo].[UserGroupPermissionMap] CHECK CONSTRAINT [FK_UserGroupPermissionMap_Permissions]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_UserGroupPermissionMap_UserGroups]') AND type = 'F')
ALTER TABLE [dbo].[UserGroupPermissionMap]  WITH NOCHECK ADD  CONSTRAINT [FK_UserGroupPermissionMap_UserGroups] FOREIGN KEY([groupID])
REFERENCES [Groups] ([GroupID])
GO
ALTER TABLE [dbo].[UserGroupPermissionMap] CHECK CONSTRAINT [FK_UserGroupPermissionMap_UserGroups]
GO
