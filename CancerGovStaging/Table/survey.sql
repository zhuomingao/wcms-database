SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[survey]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[survey](
	[SurveyID] [uniqueidentifier] NOT NULL,
	[Question1] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question2] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question3] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question4] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question3A] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question4A] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question5] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question6] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question7A] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question7B] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question7C] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question7D] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question8] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question9A] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question9B] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question9C] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question10] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question11] [varchar](2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question12] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question13] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Question14] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_survey_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserIP] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[SurveyID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
