SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GenProf]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GenProf](
	[GenProfID] [int] NOT NULL,
	[ShortName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FirstName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[LastName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Suffix] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Degree] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_GenProf_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_GenProf_UpdateUserID]  DEFAULT (user_name()),
 CONSTRAINT [PK_GenProf] PRIMARY KEY CLUSTERED 
(
	[GenProfID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[GenProf]') AND name = N'IX_GenProf_LastName')
CREATE NONCLUSTERED INDEX [IX_GenProf_LastName] ON [dbo].[GenProf] 
(
	[LastName] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
