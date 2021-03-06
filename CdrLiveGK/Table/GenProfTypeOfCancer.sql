SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GenProfTypeOfCancer]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GenProfTypeOfCancer](
	[GenProfID] [int] NOT NULL,
	[CancerTypeSiteID] [int] NOT NULL,
	[FamilyCancerSyndromeID] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_GenProfTypeOfCancer_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_GenProfTypeOfCancer_UpdateUserID]  DEFAULT (user_name())
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[GenProfTypeOfCancer]') AND name = N'CI_GenProfTypeOfCancer')
CREATE CLUSTERED INDEX [CI_GenProfTypeOfCancer] ON [dbo].[GenProfTypeOfCancer] 
(
	[GenProfID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[GenProfTypeOfCancer]') AND name = N'IX_GenProfTypeOfCancer_CancerTypeSiteID')
CREATE NONCLUSTERED INDEX [IX_GenProfTypeOfCancer_CancerTypeSiteID] ON [dbo].[GenProfTypeOfCancer] 
(
	[CancerTypeSiteID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[GenProfTypeOfCancer]') AND name = N'IX_GenProfTypeOfCancer_FamilyCancerSyndromeID')
CREATE NONCLUSTERED INDEX [IX_GenProfTypeOfCancer_FamilyCancerSyndromeID] ON [dbo].[GenProfTypeOfCancer] 
(
	[FamilyCancerSyndromeID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_GenProfTypeOfCancer_GenProf]') AND type = 'F')
ALTER TABLE [dbo].[GenProfTypeOfCancer]  WITH CHECK ADD  CONSTRAINT [FK_GenProfTypeOfCancer_GenProf] FOREIGN KEY([GenProfID])
REFERENCES [GenProf] ([GenProfID])
GO
ALTER TABLE [dbo].[GenProfTypeOfCancer] CHECK CONSTRAINT [FK_GenProfTypeOfCancer_GenProf]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_GenProfTypeOfCancer_GenProfCancerTypeSite]') AND type = 'F')
ALTER TABLE [dbo].[GenProfTypeOfCancer]  WITH CHECK ADD  CONSTRAINT [FK_GenProfTypeOfCancer_GenProfCancerTypeSite] FOREIGN KEY([CancerTypeSiteID])
REFERENCES [GenProfCancerTypeSite] ([CancerTypeSiteID])
GO
ALTER TABLE [dbo].[GenProfTypeOfCancer] CHECK CONSTRAINT [FK_GenProfTypeOfCancer_GenProfCancerTypeSite]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_GenProfTypeOfCancer_GenProfFamilyCancerSyndrome]') AND type = 'F')
ALTER TABLE [dbo].[GenProfTypeOfCancer]  WITH CHECK ADD  CONSTRAINT [FK_GenProfTypeOfCancer_GenProfFamilyCancerSyndrome] FOREIGN KEY([FamilyCancerSyndromeID])
REFERENCES [GenProfFamilyCancerSyndrome] ([FamilyCancerSyndromeID])
GO
ALTER TABLE [dbo].[GenProfTypeOfCancer] CHECK CONSTRAINT [FK_GenProfTypeOfCancer_GenProfFamilyCancerSyndrome]
GO
