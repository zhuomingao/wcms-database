SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Header]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Header](
	[HeaderId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Header_HeaderId]  DEFAULT (newid()),
	[Name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ContentType] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Data] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Type] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsApproved] [bit] NULL,
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_Header_UpdateUserID]  DEFAULT ('(getuserID())'),
	[UpdateDate] [datetime] NULL CONSTRAINT [DF_Header_UpdateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_Header] PRIMARY KEY CLUSTERED 
(
	[HeaderId] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
GRANT SELECT ON [dbo].[Header] TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[Header] ([HeaderId]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[Header] ([Name]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[Header] ([ContentType]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[Header] ([Data]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[Header] ([Type]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[Header] ([IsApproved]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[Header] ([UpdateUserID]) TO [webadminuser_role]
GO
GRANT SELECT ON [dbo].[Header] ([UpdateDate]) TO [webadminuser_role]
GO
