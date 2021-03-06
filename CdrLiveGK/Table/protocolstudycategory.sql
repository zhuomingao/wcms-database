SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[protocolstudycategory]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[protocolstudycategory](
	[protocolid] [int] NOT NULL,
	[studyCategoryid] [tinyint] NOT NULL,
	[updatedate] [datetime] NULL CONSTRAINT [DF__protocols__updatedate]  DEFAULT (getdate()),
	[updateuserid] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__protocols__updateUserid]  DEFAULT (suser_sname())
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[protocolstudycategory]') AND name = N'CI_protocolstudycategory')
CREATE CLUSTERED INDEX [CI_protocolstudycategory] ON [dbo].[protocolstudycategory] 
(
	[protocolid] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[protocolstudycategory]') AND name = N'NC_protocolstudycategory')
CREATE NONCLUSTERED INDEX [NC_protocolstudycategory] ON [dbo].[protocolstudycategory] 
(
	[studyCategoryid] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_protocolstudyCategory_Protocol]') AND type = 'F')
ALTER TABLE [dbo].[protocolstudycategory]  WITH CHECK ADD  CONSTRAINT [FK_protocolstudyCategory_Protocol] FOREIGN KEY([protocolid])
REFERENCES [Protocol] ([protocolid])
GO
ALTER TABLE [dbo].[protocolstudycategory] CHECK CONSTRAINT [FK_protocolstudyCategory_Protocol]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_protocolStudyCategory_studyCategory]') AND type = 'F')
ALTER TABLE [dbo].[protocolstudycategory]  WITH CHECK ADD  CONSTRAINT [FK_protocolStudyCategory_studyCategory] FOREIGN KEY([studyCategoryid])
REFERENCES [studycategory] ([studycategoryid])
GO
ALTER TABLE [dbo].[protocolstudycategory] CHECK CONSTRAINT [FK_protocolStudyCategory_studyCategory]
GO
