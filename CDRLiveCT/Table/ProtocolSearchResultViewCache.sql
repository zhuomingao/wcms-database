SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ProtocolSearchResultViewCache]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ProtocolSearchResultViewCache](
	[ResultViewCacheID] [int] IDENTITY(1,1) NOT NULL,
	[ResultViewHTML] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CachedDate] [datetime] NULL CONSTRAINT [DF_ProtocolSearchResultViewCache_CachedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_ProtocolSearchResultViewCache] PRIMARY KEY CLUSTERED 
(
	[ResultViewCacheID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
