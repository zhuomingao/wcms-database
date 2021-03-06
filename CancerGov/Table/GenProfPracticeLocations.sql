SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GenProfPracticeLocations]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GenProfPracticeLocations](
	[GenProfID] [int] NULL,
	[InstitutionName] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AddressLine1] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AddressLine2] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AddressLine3] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AddressLine4] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PostalCode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Country] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Phone] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[eMail] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NOT NULL DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL DEFAULT (user_name())
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[GenProfPracticeLocations]') AND name = N'GenProfPracticeLocations2')
CREATE CLUSTERED INDEX [GenProfPracticeLocations2] ON [dbo].[GenProfPracticeLocations] 
(
	[GenProfID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
