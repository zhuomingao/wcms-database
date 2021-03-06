SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Node]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Node](
	[NodeID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Nodes_NodeID]  DEFAULT (newid()),
	[Title] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ShortTitle] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](1500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ParentNodeID] [uniqueidentifier] NULL,
	[ShowInNavigation] [bit] NOT NULL,
	[ShowInBreadCrumbs] [bit] NOT NULL,
	[Priority] [int] NOT NULL,
	[CreateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_Node_CreateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL CONSTRAINT [DF_Node_UpdateDate]  DEFAULT (getdate()),
	[status] [int] NOT NULL DEFAULT ((1)),
	[isPublished] [bit] NOT NULL DEFAULT ((0)),
	[DisplayPostedDate] [datetime] NOT NULL CONSTRAINT [DF_node_Posteddate]  DEFAULT ('1/1/1980'),
	[DisplayUpdateDate] [datetime] NOT NULL CONSTRAINT [DF_node_DisplayUpdateDate]  DEFAULT ('1/1/1980'),
	[DisplayReviewDate] [datetime] NOT NULL CONSTRAINT [DF_node_reviewdate]  DEFAULT ('1/1/1980'),
	[DisplayExpirationDate] [datetime] NOT NULL CONSTRAINT [DF_node_expirationdate]  DEFAULT ('1/1/2100'),
	[DisplayDateMode] [tinyint] NOT NULL CONSTRAINT [DF_node_DisplayDateMode]  DEFAULT ((0)),
 CONSTRAINT [PK_Node] PRIMARY KEY CLUSTERED 
(
	[NodeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Node_Node]') AND parent_object_id = OBJECT_ID(N'[dbo].[Node]'))
ALTER TABLE [dbo].[Node]  WITH CHECK ADD  CONSTRAINT [FK_Node_Node] FOREIGN KEY([ParentNodeID])
REFERENCES [Node] ([NodeID])
GO
ALTER TABLE [dbo].[Node] CHECK CONSTRAINT [FK_Node_Node]
GO
