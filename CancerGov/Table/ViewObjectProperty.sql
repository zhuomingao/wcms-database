SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ViewObjectProperty]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ViewObjectProperty](
	[NCIViewObjectID] [uniqueidentifier] NOT NULL,
	[PropertyName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PropertyValue] [varchar](7800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_StagingViewObjectProperty_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_ViewObjectProperty_UpdateUserID]  DEFAULT (user_name())
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[ViewObjectProperty]') AND name = N'IX_ViewObjectProperty_NCIViewObjectID')
CREATE CLUSTERED INDEX [IX_ViewObjectProperty_NCIViewObjectID] ON [dbo].[ViewObjectProperty] 
(
	[NCIViewObjectID] ASC,
	[PropertyName] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_StagingViewObjectProperty_StagingViewObjects]') AND type = 'F')
ALTER TABLE [dbo].[ViewObjectProperty]  WITH NOCHECK ADD  CONSTRAINT [FK_StagingViewObjectProperty_StagingViewObjects] FOREIGN KEY([NCIViewObjectID])
REFERENCES [ViewObjects] ([NCIViewObjectID])
GO
ALTER TABLE [dbo].[ViewObjectProperty] CHECK CONSTRAINT [FK_StagingViewObjectProperty_StagingViewObjects]
GO
