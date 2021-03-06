SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ProtocolOldID]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ProtocolOldID](
	[ProtocolID] [int] NOT NULL,
	[OldPrimaryProtocolID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_ProtocolOldID] PRIMARY KEY CLUSTERED 
(
	[ProtocolID] ASC,
	[OldPrimaryProtocolID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
GRANT SELECT ON [dbo].[ProtocolOldID] TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[ProtocolOldID] ([ProtocolID]) TO [prettyurluser_role]
GO
GRANT SELECT ON [dbo].[ProtocolOldID] ([OldPrimaryProtocolID]) TO [prettyurluser_role]
GO
