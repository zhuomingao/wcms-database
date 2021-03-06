SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[NCIObjectProperty]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[NCIObjectProperty](
	[ObjectInstanceID] [uniqueidentifier] NOT NULL,
	[PropertyName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PropertyValue] [varchar](7800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL CONSTRAINT [DF__NCIObject__Updat__76026BA8]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__NCIObject__Updat__76F68FE1]  DEFAULT (user_name())
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[NCIObjectProperty]') AND name = N'IX_nciobjectProperty_objectInstanceIDPN')
CREATE UNIQUE CLUSTERED INDEX [IX_nciobjectProperty_objectInstanceIDPN] ON [dbo].[NCIObjectProperty] 
(
	[ObjectInstanceID] ASC,
	[PropertyName] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_NCIObjectProperty_NCIObjects]') AND type = 'F')
ALTER TABLE [dbo].[NCIObjectProperty]  WITH CHECK ADD  CONSTRAINT [FK_NCIObjectProperty_NCIObjects] FOREIGN KEY([ObjectInstanceID])
REFERENCES [NCIObjects] ([ObjectInstanceID])
GO
ALTER TABLE [dbo].[NCIObjectProperty] CHECK CONSTRAINT [FK_NCIObjectProperty_NCIObjects]
GO
