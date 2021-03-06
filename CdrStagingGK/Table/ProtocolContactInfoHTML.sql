SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ProtocolContactInfoHTML]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ProtocolContactInfoHTML](
	[ProtocolContactInfoHTMLID] [int] IDENTITY(1,1) NOT NULL,
	[ProtocolID] [int] NOT NULL,
	[City] [char](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Country] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OrganizationName] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HTML] [varchar](6500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[ProtocolContactInfoHTMLID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[ProtocolContactInfoHTML]') AND name = N'NC_protocolcontactinfohtml_protocolid')
CREATE NONCLUSTERED INDEX [NC_protocolcontactinfohtml_protocolid] ON [dbo].[ProtocolContactInfoHTML] 
(
	[ProtocolID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_protocolContactinfoHTML_Protocol]') AND type = 'F')
ALTER TABLE [dbo].[ProtocolContactInfoHTML]  WITH CHECK ADD  CONSTRAINT [FK_protocolContactinfoHTML_Protocol] FOREIGN KEY([ProtocolID])
REFERENCES [Protocol] ([protocolid])
GO
ALTER TABLE [dbo].[ProtocolContactInfoHTML] CHECK CONSTRAINT [FK_protocolContactinfoHTML_Protocol]
GO
