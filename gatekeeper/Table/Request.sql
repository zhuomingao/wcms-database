SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Request]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Request](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[ExternalRequestID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RequestType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Source] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DTDVersion] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExpectedDocCount] [int] NULL,
	[DataType] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InitiateDate] [datetime] NOT NULL DEFAULT (getdate()),
	[CompleteReceivedTime] [datetime] NULL,
	[PublicationTarget] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_Request_PublicationTarget]  DEFAULT ('Gatekeeper'),
	[UpdateDate] [datetime] NOT NULL DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_request_updateUserID]  DEFAULT (suser_sname()),
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
