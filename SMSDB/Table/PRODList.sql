SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PRODList]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PRODList](
	[ListID] [uniqueidentifier] NOT NULL,
	[Description] [varchar](1500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShowLinkDescriptions] [bit] NOT NULL CONSTRAINT [DF_PRODLists_ShowLinkDescriptions]  DEFAULT ((0)),
	[ShowShortTitle] [bit] NOT NULL CONSTRAINT [DF_PRODLists_ShowShortTitle]  DEFAULT ((1)),
	[CreateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF__PRODList__CreateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL CONSTRAINT [DF__PRODList__UpdateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_PRODList] PRIMARY KEY CLUSTERED 
(
	[ListID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PRODList_object]') AND parent_object_id = OBJECT_ID(N'[dbo].[PRODList]'))
ALTER TABLE [dbo].[PRODList]  WITH CHECK ADD  CONSTRAINT [FK_PRODList_object] FOREIGN KEY([ListID])
REFERENCES [PRODObject] ([ObjectID])
GO
ALTER TABLE [dbo].[PRODList] CHECK CONSTRAINT [FK_PRODList_object]
GO
