SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Protocol]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Protocol](
	[protocolid] [int] NOT NULL,
	[IsNew] [bit] NOT NULL CONSTRAINT [DF__Protocol__IsNew]  DEFAULT (1),
	[IsNIHClinicalCenterTrial] [bit] NOT NULL CONSTRAINT [DF__Protocol__IsNIHC]  DEFAULT (1),
	[IsActiveProtocol] [bit] NOT NULL CONSTRAINT [DF__Protocol__IsActive]  DEFAULT (1),
	[updatedate] [datetime] NULL CONSTRAINT [DF__Protocol__updatedate]  DEFAULT (getdate()),
	[updateUserid] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__Protocol__updateUserID]  DEFAULT (suser_sname()),
 CONSTRAINT [PK_protocol] PRIMARY KEY CLUSTERED 
(
	[protocolid] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
