SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ProtocolDrug]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ProtocolDrug](
	[ProtocolID] [int] NOT NULL,
	[DrugID] [int] NOT NULL,
	[UpdateDate] [datetime] NULL CONSTRAINT [DF_ProtocolDrug_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_ProtocolDrug_UpdateUserID]  DEFAULT (suser_sname())
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[ProtocolDrug]') AND name = N'CI_protocolDrug')
CREATE CLUSTERED INDEX [CI_protocolDrug] ON [dbo].[ProtocolDrug] 
(
	[ProtocolID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[ProtocolDrug]') AND name = N'NC_protocolDrug')
CREATE NONCLUSTERED INDEX [NC_protocolDrug] ON [dbo].[ProtocolDrug] 
(
	[DrugID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_protocolDrug_Protocol]') AND type = 'F')
ALTER TABLE [dbo].[ProtocolDrug]  WITH CHECK ADD  CONSTRAINT [FK_protocolDrug_Protocol] FOREIGN KEY([ProtocolID])
REFERENCES [Protocol] ([protocolid])
GO
ALTER TABLE [dbo].[ProtocolDrug] CHECK CONSTRAINT [FK_protocolDrug_Protocol]
GO
