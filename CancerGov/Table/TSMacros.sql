SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[TSMacros]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[TSMacros](
	[MacroName] [varchar](512) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[MacroValue] [varchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[UpdateDate] [datetime] NULL CONSTRAINT [DF__TSMacros__Update__67E9567B]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__TSMacros__Update__68DD7AB4]  DEFAULT (user_name()),
	[IsOnProduction] [bit] NULL CONSTRAINT [DF__TSMacros__IsOnPr__69D19EED]  DEFAULT (1),
	[Status] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__TSMacros__Status__6AC5C326]  DEFAULT ('PRODUCTION'),
	[MacroID] [uniqueidentifier] NOT NULL CONSTRAINT [DF__TSMacros__MacroI__6BB9E75F]  DEFAULT (newid()),
 CONSTRAINT [PK__TSMacros__66F53242] PRIMARY KEY CLUSTERED 
(
	[MacroName] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
