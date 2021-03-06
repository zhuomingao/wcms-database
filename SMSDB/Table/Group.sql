SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Group]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Group](
	[GroupID] [uniqueidentifier] NOT NULL,
	[GroupName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL DEFAULT (''),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Groups_IsActive]  DEFAULT ((1)),
	[CreateDate] [datetime] NULL CONSTRAINT [DF_Groups_CreateDate]  DEFAULT (getdate()),
	[CreateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_Groups_CreateUserID]  DEFAULT (suser_sname()),
	[UpdateDate] [datetime] NULL CONSTRAINT [DF_Groups_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_Groups_UpdateUserID]  DEFAULT (suser_sname()),
	[DisableDate] [datetime] NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Groups_Members]') AND parent_object_id = OBJECT_ID(N'[dbo].[Group]'))
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Members] FOREIGN KEY([GroupID])
REFERENCES [Member] ([MemberID])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Groups_Members]
GO
