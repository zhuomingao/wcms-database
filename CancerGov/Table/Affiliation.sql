SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Affiliation]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Affiliation](
	[AffiliationID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Affiliation_AffiliationID]  DEFAULT (newid()),
	[PersonID] [uniqueidentifier] NOT NULL,
	[OrganizationID] [uniqueidentifier] NOT NULL,
	[Type] [uniqueidentifier] NOT NULL,
	[Title] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_Affiliation_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_Affiliation_UpdateUserID]  DEFAULT (user_name()),
	[SourceID] [numeric](18, 0) NULL,
	[DataSource] [char](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Affiliation] PRIMARY KEY NONCLUSTERED 
(
	[AffiliationID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[Affiliation]') AND name = N'IX_Affiliation_SourceID_DataSource')
CREATE NONCLUSTERED INDEX [IX_Affiliation_SourceID_DataSource] ON [dbo].[Affiliation] 
(
	[SourceID] ASC,
	[DataSource] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_affiliation_organization]') AND type = 'F')
ALTER TABLE [dbo].[Affiliation]  WITH CHECK ADD  CONSTRAINT [FK_affiliation_organization] FOREIGN KEY([OrganizationID])
REFERENCES [Organization] ([OrganizationID])
GO
ALTER TABLE [dbo].[Affiliation] CHECK CONSTRAINT [FK_affiliation_organization]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_affiliation_person]') AND type = 'F')
ALTER TABLE [dbo].[Affiliation]  WITH CHECK ADD  CONSTRAINT [FK_affiliation_person] FOREIGN KEY([PersonID])
REFERENCES [Person] ([PersonID])
GO
ALTER TABLE [dbo].[Affiliation] CHECK CONSTRAINT [FK_affiliation_person]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_Affiliation_Type]') AND type = 'F')
ALTER TABLE [dbo].[Affiliation]  WITH CHECK ADD  CONSTRAINT [FK_Affiliation_Type] FOREIGN KEY([Type])
REFERENCES [Type] ([TypeID])
GO
ALTER TABLE [dbo].[Affiliation] CHECK CONSTRAINT [FK_Affiliation_Type]
GO
