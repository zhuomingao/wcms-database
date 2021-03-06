SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GroupUserMap]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GroupUserMap](
	[UserID] [uniqueidentifier] NOT NULL,
	[GroupID] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_GroupUserMap_CreateDate]  DEFAULT (getdate()),
	[CreateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_GroupUserMap_CreateUserID]  DEFAULT (suser_sname()),
	[UpdateDate] [datetime] NULL CONSTRAINT [DF_GroupUserMap_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_GroupUserMap_UpdateUserID]  DEFAULT (suser_sname()),
 CONSTRAINT [PK_GroupUserMap] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[GroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupUserMap_GroupID]') AND parent_object_id = OBJECT_ID(N'[dbo].[GroupUserMap]'))
ALTER TABLE [dbo].[GroupUserMap]  WITH NOCHECK ADD  CONSTRAINT [FK_GroupUserMap_GroupID] FOREIGN KEY([GroupID])
REFERENCES [Group] ([GroupID])
GO
ALTER TABLE [dbo].[GroupUserMap] CHECK CONSTRAINT [FK_GroupUserMap_GroupID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupUserMap_UserID]') AND parent_object_id = OBJECT_ID(N'[dbo].[GroupUserMap]'))
ALTER TABLE [dbo].[GroupUserMap]  WITH NOCHECK ADD  CONSTRAINT [FK_GroupUserMap_UserID] FOREIGN KEY([UserID])
REFERENCES [User] ([UserID])
GO
ALTER TABLE [dbo].[GroupUserMap] CHECK CONSTRAINT [FK_GroupUserMap_UserID]
GO
