SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[NCIObjectProperty]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[NCIObjectProperty](
	[ObjectInstanceID] [uniqueidentifier] NOT NULL,
	[PropertyName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PropertyValue] [varchar](7800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
