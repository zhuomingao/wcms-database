SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GenProfPracticeLocation]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GenProfPracticeLocation](
	[GenProfID] [int] NOT NULL,
	[City] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PostalCode] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Country] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_GenProfPracticeLocation_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_GenProfPracticeLocation_UpdateUserID]  DEFAULT (user_name())
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[GenProfPracticeLocation]') AND name = N'CI_GenProfPracticeLocation')
CREATE CLUSTERED INDEX [CI_GenProfPracticeLocation] ON [dbo].[GenProfPracticeLocation] 
(
	[GenProfID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[GenProfPracticeLocation]') AND name = N'IX_GenProfPracticeLocation_City')
CREATE NONCLUSTERED INDEX [IX_GenProfPracticeLocation_City] ON [dbo].[GenProfPracticeLocation] 
(
	[City] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[GenProfPracticeLocation]') AND name = N'IX_GenProfPracticeLocation_State')
CREATE NONCLUSTERED INDEX [IX_GenProfPracticeLocation_State] ON [dbo].[GenProfPracticeLocation] 
(
	[State] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_GenProfPracticeLocation_GenProf]') AND type = 'F')
ALTER TABLE [dbo].[GenProfPracticeLocation]  WITH CHECK ADD  CONSTRAINT [FK_GenProfPracticeLocation_GenProf] FOREIGN KEY([GenProfID])
REFERENCES [GenProf] ([GenProfID])
GO
ALTER TABLE [dbo].[GenProfPracticeLocation] CHECK CONSTRAINT [FK_GenProfPracticeLocation_GenProf]
GO
