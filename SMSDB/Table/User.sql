SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User](
	[UserID] [uniqueidentifier] NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_User_IsActive]  DEFAULT ((0)),
	[LastLoginDate] [datetime] NULL CONSTRAINT [DF_User_LastLoginDate]  DEFAULT (getdate()),
	[DisableDate] [datetime] NULL CONSTRAINT [DF_User_DisableDate]  DEFAULT (getdate()),
	[LastActivityDate] [datetime] NULL CONSTRAINT [DF_User_LastActivityDate]  DEFAULT (getdate()),
	[UpdateDate] [datetime] NULL CONSTRAINT [DF_User_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_User_CreateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Members]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_Users_Members] FOREIGN KEY([UserID])
REFERENCES [Member] ([MemberID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_Users_Members]
GO
