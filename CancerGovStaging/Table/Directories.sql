SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Directories]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Directories](
	[DirectoryID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__Directori__Direc__7EACC042]  DEFAULT (newid()),
	[DirectoryName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF__Directori__Creat__7FA0E47B]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Directori__Updat__009508B4]  DEFAULT (user_name()),
	[UpdateDate] [datetime] NULL CONSTRAINT [DF__Directori__Updat__01892CED]  DEFAULT (getdate()),
 CONSTRAINT [PK__Directories__7DB89C09] PRIMARY KEY CLUSTERED 
(
	[DirectoryID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
