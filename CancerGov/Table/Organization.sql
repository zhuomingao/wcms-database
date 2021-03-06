SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Organization]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Organization](
	[OrganizationID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Organization_OrganizationID]  DEFAULT (newid()),
	[ParentOrganizationID] [uniqueidentifier] NULL,
	[PrimaryType] [uniqueidentifier] NULL,
	[Name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ShortName] [varchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [varchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CitySuffix] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StateID] [uniqueidentifier] NULL,
	[CountryID] [uniqueidentifier] NULL,
	[PostalCode] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_Organization_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_Organization_UpdateUserID]  DEFAULT (user_name()),
	[SourceID] [numeric](18, 0) NULL,
	[DataSource] [char](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_organization] PRIMARY KEY NONCLUSTERED 
(
	[OrganizationID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[Organization]') AND name = N'IX_Org_SourceID_DataSource')
CREATE NONCLUSTERED INDEX [IX_Org_SourceID_DataSource] ON [dbo].[Organization] 
(
	[SourceID] ASC,
	[DataSource] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[Organization]') AND name = N'IX_Organization_City')
CREATE NONCLUSTERED INDEX [IX_Organization_City] ON [dbo].[Organization] 
(
	[City] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[Organization]') AND name = N'Organization1')
CREATE NONCLUSTERED INDEX [Organization1] ON [dbo].[Organization] 
(
	[OrganizationID] ASC,
	[City] ASC,
	[StateID] ASC,
	[CountryID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_Organization_Country]') AND type = 'F')
ALTER TABLE [dbo].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_Organization_Country] FOREIGN KEY([CountryID])
REFERENCES [Country] ([CountryID])
GO
ALTER TABLE [dbo].[Organization] CHECK CONSTRAINT [FK_Organization_Country]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_Organization_State]') AND type = 'F')
ALTER TABLE [dbo].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_Organization_State] FOREIGN KEY([StateID])
REFERENCES [State] ([StateID])
GO
ALTER TABLE [dbo].[Organization] CHECK CONSTRAINT [FK_Organization_State]
GO
