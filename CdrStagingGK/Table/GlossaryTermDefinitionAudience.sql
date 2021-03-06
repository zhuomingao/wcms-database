SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GlossaryTermDefinitionAudience]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GlossaryTermDefinitionAudience](
	[GlossaryTermDefinitionAudienceID] [int] IDENTITY(1,1) NOT NULL,
	[GlossaryTermDefinitionID] [int] NOT NULL,
	[Audience] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_GlossaryTermDefinitionAudience_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_GlossaryTermDefinitionAudience_UpdateUserID]  DEFAULT (user_name()),
 CONSTRAINT [PK_GlossaryTermDefinitionAudience] PRIMARY KEY CLUSTERED 
(
	[GlossaryTermDefinitionAudienceID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_GlossaryTermDefinitionAudience_GlossaryTermDefinition]') AND type = 'F')
ALTER TABLE [dbo].[GlossaryTermDefinitionAudience]  WITH CHECK ADD  CONSTRAINT [FK_GlossaryTermDefinitionAudience_GlossaryTermDefinition] FOREIGN KEY([GlossaryTermDefinitionID])
REFERENCES [GlossaryTermDefinition] ([GlossaryTermDefinitionID])
GO
ALTER TABLE [dbo].[GlossaryTermDefinitionAudience] CHECK CONSTRAINT [FK_GlossaryTermDefinitionAudience_GlossaryTermDefinition]
GO
