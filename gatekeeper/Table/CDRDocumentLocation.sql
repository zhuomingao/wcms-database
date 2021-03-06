SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CDRDocumentLocation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CDRDocumentLocation](
	[CDRID] [int] NOT NULL,
	[stagingrequestDataID] [int] NULL,
	[previewrequestDataID] [int] NULL,
	[liveRequestDataID] [int] NULL,
	[stagingUpdateTime] [datetime] NULL DEFAULT (getdate()),
	[previewUpdateTime] [datetime] NULL DEFAULT (getdate()),
	[liveUpdateTime] [datetime] NULL DEFAULT (getdate()),
 CONSTRAINT [PK_DocumentStatus] PRIMARY KEY CLUSTERED 
(
	[CDRID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CDRDocumentLocation_LiveRequestDataID]') AND parent_object_id = OBJECT_ID(N'[dbo].[CDRDocumentLocation]'))
ALTER TABLE [dbo].[CDRDocumentLocation]  WITH CHECK ADD  CONSTRAINT [FK_CDRDocumentLocation_LiveRequestDataID] FOREIGN KEY([liveRequestDataID])
REFERENCES [RequestData] ([RequestDataID])
GO
ALTER TABLE [dbo].[CDRDocumentLocation] CHECK CONSTRAINT [FK_CDRDocumentLocation_LiveRequestDataID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CDRDocumentLocation_previewRequestDataID]') AND parent_object_id = OBJECT_ID(N'[dbo].[CDRDocumentLocation]'))
ALTER TABLE [dbo].[CDRDocumentLocation]  WITH CHECK ADD  CONSTRAINT [FK_CDRDocumentLocation_previewRequestDataID] FOREIGN KEY([previewrequestDataID])
REFERENCES [RequestData] ([RequestDataID])
GO
ALTER TABLE [dbo].[CDRDocumentLocation] CHECK CONSTRAINT [FK_CDRDocumentLocation_previewRequestDataID]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CDRDocumentLocation_stagingRequestDataID]') AND parent_object_id = OBJECT_ID(N'[dbo].[CDRDocumentLocation]'))
ALTER TABLE [dbo].[CDRDocumentLocation]  WITH CHECK ADD  CONSTRAINT [FK_CDRDocumentLocation_stagingRequestDataID] FOREIGN KEY([stagingrequestDataID])
REFERENCES [RequestData] ([RequestDataID])
GO
ALTER TABLE [dbo].[CDRDocumentLocation] CHECK CONSTRAINT [FK_CDRDocumentLocation_stagingRequestDataID]
GO
