SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[LiteratureCitation]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[LiteratureCitation](
	[LiteratureCitationID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_LiteratureCitation_LiteratureCitationID]  DEFAULT (newid()),
	[Type] [uniqueidentifier] NOT NULL,
	[Title] [char](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SearchTitle] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Author] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PublicationInfo] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Annotation] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ParentLiteratureCitationID] [uniqueidentifier] NULL,
	[CancerLitID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateAbstractRequested] [datetime] NULL,
	[DateAbstractReceived] [datetime] NULL,
	[RequestAbstract] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_LiteratureCitation_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_LiteratureCitation_UpdateUserID]  DEFAULT (user_name()),
	[SourceID] [numeric](18, 0) NULL,
	[DataSource] [char](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_LiteratureCitation] PRIMARY KEY CLUSTERED 
(
	[LiteratureCitationID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_LiteratureCitation_Type]') AND type = 'F')
ALTER TABLE [dbo].[LiteratureCitation]  WITH CHECK ADD  CONSTRAINT [FK_LiteratureCitation_Type] FOREIGN KEY([Type])
REFERENCES [Type] ([TypeID])
GO
ALTER TABLE [dbo].[LiteratureCitation] CHECK CONSTRAINT [FK_LiteratureCitation_Type]
GO
