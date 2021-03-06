SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ProtocolModality]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ProtocolModality](
	[ProtocolID] [int] NOT NULL,
	[ModalityID] [int] NOT NULL,
	[UpdateDate] [datetime] NULL CONSTRAINT [DF_ProtocolModality_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_ProtocolModality_UpdateUserID]  DEFAULT (suser_sname()),
 CONSTRAINT [PK_ProtocolModality] PRIMARY KEY CLUSTERED 
(
	[ProtocolID] ASC,
	[ModalityID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[ProtocolModality]') AND name = N'NC_protocolmodality')
CREATE NONCLUSTERED INDEX [NC_protocolmodality] ON [dbo].[ProtocolModality] 
(
	[ModalityID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_protocolmodality_Modality]') AND type = 'F')
ALTER TABLE [dbo].[ProtocolModality]  WITH CHECK ADD  CONSTRAINT [FK_protocolmodality_Modality] FOREIGN KEY([ModalityID])
REFERENCES [modality] ([modalityid])
GO
ALTER TABLE [dbo].[ProtocolModality] CHECK CONSTRAINT [FK_protocolmodality_Modality]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_protocolModality_Protocol]') AND type = 'F')
ALTER TABLE [dbo].[ProtocolModality]  WITH CHECK ADD  CONSTRAINT [FK_protocolModality_Protocol] FOREIGN KEY([ProtocolID])
REFERENCES [Protocol] ([protocolid])
GO
ALTER TABLE [dbo].[ProtocolModality] CHECK CONSTRAINT [FK_protocolModality_Protocol]
GO
