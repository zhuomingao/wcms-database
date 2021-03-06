SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Document]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Document](
	[DocumentID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_StagingDocument_DocumentID]  DEFAULT (newid()),
	[Title] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShortTitle] [varchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [varchar](2500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GroupID] [int] NULL,
	[DataType] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DataSize] [int] NULL,
	[IsWirelessPage] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_StagingDocument_IsWirelessPage]  DEFAULT ('N'),
	[TOC] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Data] [text] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RunTimeOwnerID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_Document_CreateDate]  DEFAULT (getdate()),
	[ReleaseDate] [datetime] NULL CONSTRAINT [DF_Document_ReleaseDate]  DEFAULT ('1/1/1980'),
	[ExpirationDate] [datetime] NULL CONSTRAINT [DF_Document_ExpirationDate]  DEFAULT ('1/1/2100'),
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_StagingDocument_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_Document_UpdateUserID]  DEFAULT (user_name()),
	[PostedDate] [datetime] NULL,
	[DisplayDateMode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_StagingDocument] PRIMARY KEY NONCLUSTERED 
(
	[DocumentID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
GRANT SELECT ON [dbo].[Document] TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[Document] ([DocumentID]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[Document] ([Title]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[Document] ([ShortTitle]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[Document] ([Description]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[Document] ([GroupID]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[Document] ([DataType]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[Document] ([DataSize]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[Document] ([IsWirelessPage]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[Document] ([TOC]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[Document] ([Data]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[Document] ([RunTimeOwnerID]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[Document] ([CreateDate]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[Document] ([ReleaseDate]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[Document] ([ExpirationDate]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[Document] ([UpdateDate]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[Document] ([UpdateUserID]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[Document] ([PostedDate]) TO [websiteuser_role]
GO
GRANT SELECT ON [dbo].[Document] ([DisplayDateMode]) TO [websiteuser_role]
GO
