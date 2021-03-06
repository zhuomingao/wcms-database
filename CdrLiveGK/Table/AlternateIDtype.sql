SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[AlternateIDtype]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[AlternateIDtype](
	[idtypeid] [tinyint] NOT NULL,
	[idtype] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[updatedate] [datetime] NULL CONSTRAINT [DF__Alternate__updateDate]  DEFAULT (getdate()),
	[updateuserid] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Alternate__updateUserid]  DEFAULT (suser_sname()),
 CONSTRAINT [PK_alternateidtype] PRIMARY KEY CLUSTERED 
(
	[idtypeid] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
