SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ProtocolLeadOrg]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ProtocolLeadOrg](
	[ProtocolContactInfoID] [int] IDENTITY(1073741823,1) NOT NULL,
	[ProtocolID] [int] NOT NULL,
	[OrganizationID] [int] NULL,
	[PersonID] [int] NULL,
	[OrganizationName] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PersonGivenName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PersonSurName] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL CONSTRAINT [DF_ProtocolLocation_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_ProtocolLocation_UpdateUserID]  DEFAULT (suser_sname()),
	[PersonProfessionalSuffix] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Country] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrganizationRole] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PersonRole] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [UQ_ProtocolLeadOrg_contactinfo] UNIQUE NONCLUSTERED 
(
	[ProtocolContactInfoID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[ProtocolLeadOrg]') AND name = N'ProtocolLeadOrg')
CREATE CLUSTERED INDEX [ProtocolLeadOrg] ON [dbo].[ProtocolLeadOrg] 
(
	[ProtocolID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_protocolLeadOrg_Protocol]') AND type = 'F')
ALTER TABLE [dbo].[ProtocolLeadOrg]  WITH CHECK ADD  CONSTRAINT [FK_protocolLeadOrg_Protocol] FOREIGN KEY([ProtocolID])
REFERENCES [Protocol] ([protocolid])
GO
ALTER TABLE [dbo].[ProtocolLeadOrg] CHECK CONSTRAINT [FK_protocolLeadOrg_Protocol]
GO
