SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ProtocolTrialSite]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ProtocolTrialSite](
	[ProtocolContactInfoID] [int] NOT NULL,
	[ProtocolID] [int] NOT NULL,
	[OrganizationID] [int] NULL,
	[PersonID] [int] NULL,
	[OrganizationName] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PersonGivenName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PersonSurName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrganizationRole] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Country] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZIP] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL CONSTRAINT [DF__ProtocolT__Updatedate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__ProtocolT__UpdatUserID]  DEFAULT (suser_sname()),
	[PersonProfessionalSuffix] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[statefullname] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [UQ_ProtocolTrialSite_contactinfo] UNIQUE NONCLUSTERED 
(
	[ProtocolContactInfoID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[ProtocolTrialSite]') AND name = N'CI_ProtocolTrialSite')
CREATE CLUSTERED INDEX [CI_ProtocolTrialSite] ON [dbo].[ProtocolTrialSite] 
(
	[ProtocolID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_protocolTrialSite_Protocol]') AND type = 'F')
ALTER TABLE [dbo].[ProtocolTrialSite]  WITH CHECK ADD  CONSTRAINT [FK_protocolTrialSite_Protocol] FOREIGN KEY([ProtocolID])
REFERENCES [Protocol] ([protocolid])
GO
ALTER TABLE [dbo].[ProtocolTrialSite] CHECK CONSTRAINT [FK_protocolTrialSite_Protocol]
GO
