SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TemplateZone]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TemplateZone](
	[TemplateZoneID] [uniqueidentifier] NOT NULL,
	[ZoneName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TemplateZoneTypeID] [int] NOT NULL,
	[CreateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateDate] [datetime] NULL DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL DEFAULT (getdate()),
 CONSTRAINT [PK_TemplateZones] PRIMARY KEY CLUSTERED 
(
	[TemplateZoneID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
