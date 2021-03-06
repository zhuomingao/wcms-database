SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[PDQSearchModalities]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[PDQSearchModalities](
	[PDQSearchModalityID] [numeric](18, 0) NULL,
	[UpdateDate] [datetime] NULL CONSTRAINT [DF_PDQSearchModalities_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_PDQSearchModalities_UpdateUserID]  DEFAULT (user_name())
) ON [PRIMARY]
END
GO
