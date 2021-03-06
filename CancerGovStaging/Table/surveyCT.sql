SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[surveyCT]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[surveyCT](
	[SurveyID] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[SetID] [int] NOT NULL,
	[Question1] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question2] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question3] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question4] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question5] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question6] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question7] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question8] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question9] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question10A] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question10B] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question10C] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question10D] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question10E] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question10F] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question10G] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question10H] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question11] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question12] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question13] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NOT NULL DEFAULT (getdate()),
	[UpdateUserIP] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[SurveyID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
