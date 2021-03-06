SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[TSMacros]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[TSMacros](
	[MacroName] [varchar](512) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[MacroValue] [varchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[MacroID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_TSMacros_MacroID]  DEFAULT (newid()),
	[UpdateDate] [datetime] NULL CONSTRAINT [DF_TSMacros_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_TSMacros_UpdateUserID]  DEFAULT (user_name()),
	[IsOnProduction] [bit] NULL CONSTRAINT [DF_TSMacros_IsOnProduction]  DEFAULT (0),
	[Status] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_TSMacros_Status]  DEFAULT ('EDIT'),
 CONSTRAINT [PK_TSMacros] PRIMARY KEY CLUSTERED 
(
	[MacroName] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
