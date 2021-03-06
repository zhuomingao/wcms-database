SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BatchRequestData]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BatchRequestData](
	[BatchID] [int] NOT NULL,
	[RequestDataID] [int] NOT NULL,
	[requestID] [int] NOT NULL,
 CONSTRAINT [BatchRequestData_PK] PRIMARY KEY CLUSTERED 
(
	[BatchID] ASC,
	[RequestDataID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Batch_BatchRequestData_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[BatchRequestData]'))
ALTER TABLE [dbo].[BatchRequestData]  WITH CHECK ADD  CONSTRAINT [Batch_BatchRequestData_FK1] FOREIGN KEY([BatchID])
REFERENCES [Batch] ([BatchID])
GO
ALTER TABLE [dbo].[BatchRequestData] CHECK CONSTRAINT [Batch_BatchRequestData_FK1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_batchrequestData_request]') AND parent_object_id = OBJECT_ID(N'[dbo].[BatchRequestData]'))
ALTER TABLE [dbo].[BatchRequestData]  WITH CHECK ADD  CONSTRAINT [FK_batchrequestData_request] FOREIGN KEY([requestID])
REFERENCES [Request] ([RequestID])
GO
ALTER TABLE [dbo].[BatchRequestData] CHECK CONSTRAINT [FK_batchrequestData_request]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[RequestData_BatchRequestData_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[BatchRequestData]'))
ALTER TABLE [dbo].[BatchRequestData]  WITH CHECK ADD  CONSTRAINT [RequestData_BatchRequestData_FK1] FOREIGN KEY([RequestDataID])
REFERENCES [RequestData] ([RequestDataID])
GO
ALTER TABLE [dbo].[BatchRequestData] CHECK CONSTRAINT [RequestData_BatchRequestData_FK1]
GO
