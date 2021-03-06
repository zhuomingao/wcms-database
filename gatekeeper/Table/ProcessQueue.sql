SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProcessQueue]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProcessQueue](
	[ProcessQueueID] [int] IDENTITY(1,1) NOT NULL,
	[BatchID] [int] NOT NULL,
 CONSTRAINT [PK_ProcessQueue] PRIMARY KEY CLUSTERED 
(
	[ProcessQueueID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[Batch_ProcessQueue_FK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProcessQueue]'))
ALTER TABLE [dbo].[ProcessQueue]  WITH CHECK ADD  CONSTRAINT [Batch_ProcessQueue_FK1] FOREIGN KEY([BatchID])
REFERENCES [Batch] ([BatchID])
GO
ALTER TABLE [dbo].[ProcessQueue] CHECK CONSTRAINT [Batch_ProcessQueue_FK1]
GO
