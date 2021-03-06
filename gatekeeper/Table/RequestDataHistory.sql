SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RequestDataHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RequestDataHistory](
	[RequestDataHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[RequestID] [int] NULL,
	[Entry] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[EntryDateTime] [datetime] NOT NULL DEFAULT (getdate()),
	[BatchID] [int] NULL,
	[RequestDataID] [int] NULL,
	[EntryType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[RequestDataHistory]') AND name = N'CI_requestDatahistory_CDRID')
CREATE CLUSTERED INDEX [CI_requestDatahistory_CDRID] ON [dbo].[RequestDataHistory] 
(
	[RequestDataID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[RequestData_RequestDataHistory_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[RequestDataHistory]'))
ALTER TABLE [dbo].[RequestDataHistory]  WITH CHECK ADD  CONSTRAINT [RequestData_RequestDataHistory_FK1] FOREIGN KEY([RequestDataID])
REFERENCES [RequestData] ([RequestDataID])
GO
ALTER TABLE [dbo].[RequestDataHistory] CHECK CONSTRAINT [RequestData_RequestDataHistory_FK1]
GO
