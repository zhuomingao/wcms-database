SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[documentGroups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[documentGroups](
	[CDRID] [int] NOT NULL,
	[groupID] [int] NOT NULL
) ON [PRIMARY]
END
GO
