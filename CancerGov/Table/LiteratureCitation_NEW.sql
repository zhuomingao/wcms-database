SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[LiteratureCitation_NEW]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LiteratureCitation_NEW](
	[LiteratureCitationID] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[Type] [uniqueidentifier] NOT NULL,
	[Title] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SearchTitle] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Author] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PublicationInfo] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Annotation] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ParentLiteratureCitationID] [uniqueidentifier] NULL,
	[CancerLitID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateAbstractRequested] [datetime] NULL,
	[DateAbstractReceived] [datetime] NULL,
	[RequestAbstract] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NOT NULL DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL DEFAULT (user_name()),
	[SourceID] [numeric](18, 0) NULL,
	[DataSource] [char](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_LiteratureCitation_NEW_Type]') AND type = 'F')
ALTER TABLE [dbo].[LiteratureCitation_NEW]  WITH CHECK ADD  CONSTRAINT [FK_LiteratureCitation_NEW_Type] FOREIGN KEY([Type])
REFERENCES [Type] ([TypeID])
GO
ALTER TABLE [dbo].[LiteratureCitation_NEW] CHECK CONSTRAINT [FK_LiteratureCitation_NEW_Type]
GO
