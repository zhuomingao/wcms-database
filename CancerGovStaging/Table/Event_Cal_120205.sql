SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Event_Cal_120205]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Event_Cal_120205](
	[NIHID] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Mail] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[GivenName] [nvarchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SN] [nvarchar](64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[OrganizationalStat] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NIHOrgPath] [nvarchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
