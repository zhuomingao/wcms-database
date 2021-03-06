SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GenProfFamilyCancerSyndrome]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GenProfFamilyCancerSyndrome](
	[FamilyCancerSyndromeID] [int] NOT NULL,
	[GenProfID] [int] NOT NULL,
	[FamilyCancerSyndrome] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_GenProfFamilyCancerSyndrome_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_GenProfFamilyCancerSyndrome_UpdateUserID]  DEFAULT (user_name()),
 CONSTRAINT [PK_GenProfFamilyCancerSyndrome] PRIMARY KEY NONCLUSTERED 
(
	[FamilyCancerSyndromeID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[GenProfFamilyCancerSyndrome]') AND name = N'CI_GenProfFamilyCancerSyndrome')
CREATE CLUSTERED INDEX [CI_GenProfFamilyCancerSyndrome] ON [dbo].[GenProfFamilyCancerSyndrome] 
(
	[GenProfID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[GenProfFamilyCancerSyndrome]') AND name = N'NC_GenProfFamilyCancerSyndrome')
CREATE NONCLUSTERED INDEX [NC_GenProfFamilyCancerSyndrome] ON [dbo].[GenProfFamilyCancerSyndrome] 
(
	[FamilyCancerSyndrome] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_GenProfFamilyCancerSyndrome_GenProf]') AND type = 'F')
ALTER TABLE [dbo].[GenProfFamilyCancerSyndrome]  WITH CHECK ADD  CONSTRAINT [FK_GenProfFamilyCancerSyndrome_GenProf] FOREIGN KEY([GenProfID])
REFERENCES [GenProf] ([GenProfID])
GO
ALTER TABLE [dbo].[GenProfFamilyCancerSyndrome] CHECK CONSTRAINT [FK_GenProfFamilyCancerSyndrome_GenProf]
GO
