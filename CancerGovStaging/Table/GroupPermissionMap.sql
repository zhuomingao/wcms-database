SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GroupPermissionMap]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GroupPermissionMap](
	[groupID] [int] NOT NULL,
	[permissionID] [int] NOT NULL,
	[creationDate] [datetime] NOT NULL CONSTRAINT [DF_GroupPermissionMap_creationDate]  DEFAULT (getdate()),
	[creationUser] [uniqueidentifier] NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_GroupPermissionMap_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_GroupPermissionMap_UpdateUserID]  DEFAULT (user_name()),
 CONSTRAINT [IX_GroupPermissionMap_GrpPermUnique] UNIQUE NONCLUSTERED 
(
	[groupID] ASC,
	[permissionID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_GroupPermissionMap_Permissions]') AND type = 'F')
ALTER TABLE [dbo].[GroupPermissionMap]  WITH NOCHECK ADD  CONSTRAINT [FK_GroupPermissionMap_Permissions] FOREIGN KEY([permissionID])
REFERENCES [Permissions] ([permissionID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[GroupPermissionMap] CHECK CONSTRAINT [FK_GroupPermissionMap_Permissions]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_GroupPermissionMap_UserGroups]') AND type = 'F')
ALTER TABLE [dbo].[GroupPermissionMap]  WITH NOCHECK ADD  CONSTRAINT [FK_GroupPermissionMap_UserGroups] FOREIGN KEY([groupID])
REFERENCES [Groups] ([GroupID])
GO
ALTER TABLE [dbo].[GroupPermissionMap] CHECK CONSTRAINT [FK_GroupPermissionMap_UserGroups]
GO
