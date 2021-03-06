SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ProtocolSearchSysCache]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ProtocolSearchSysCache](
	[ProtocolSearchID] [int] NOT NULL,
	[ProtocolID] [int] NOT NULL,
	rank int
) ON [PRIMARY]
END
GO
