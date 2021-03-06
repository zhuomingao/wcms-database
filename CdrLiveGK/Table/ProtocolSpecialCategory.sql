SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ProtocolSpecialCategory]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ProtocolSpecialCategory](
	[ProtocolID] [int] NOT NULL,
	[ProtocolSpecialCategory] [varchar](256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[UpdateDate] [datetime] NULL CONSTRAINT [DF_ProtocolSpecialCategory_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_ProtocolSpecialCategory_updateUserID]  DEFAULT (suser_sname())
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[ProtocolSpecialCategory]') AND name = N'CI_protocolspecialCategory')
CREATE CLUSTERED INDEX [CI_protocolspecialCategory] ON [dbo].[ProtocolSpecialCategory] 
(
	[ProtocolID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[ProtocolSpecialCategory]') AND name = N'NC_protocolspecialCategory')
CREATE NONCLUSTERED INDEX [NC_protocolspecialCategory] ON [dbo].[ProtocolSpecialCategory] 
(
	[ProtocolSpecialCategory] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_protocolSpecialCategory_Protocol]') AND type = 'F')
ALTER TABLE [dbo].[ProtocolSpecialCategory]  WITH CHECK ADD  CONSTRAINT [FK_protocolSpecialCategory_Protocol] FOREIGN KEY([ProtocolID])
REFERENCES [Protocol] ([protocolid])
GO
ALTER TABLE [dbo].[ProtocolSpecialCategory] CHECK CONSTRAINT [FK_protocolSpecialCategory_Protocol]
GO
