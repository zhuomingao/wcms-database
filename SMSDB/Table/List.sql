SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[List]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[List](
	[ListID] [uniqueidentifier] NOT NULL,
	[Description] [varchar](1500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ShowLinkDescriptions] [bit] NOT NULL CONSTRAINT [DF_Lists_ShowLinkDescriptions]  DEFAULT ((0)),
	[ShowShortTitle] [bit] NOT NULL CONSTRAINT [DF_Lists_ShowShortTitle]  DEFAULT ((1)),
	[CreateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF__List__CreateDate__162F4418]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL CONSTRAINT [DF__List__UpdateDate__17236851]  DEFAULT (getdate()),
 CONSTRAINT [PK_List] PRIMARY KEY CLUSTERED 
(
	[ListID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_List_object]') AND parent_object_id = OBJECT_ID(N'[dbo].[List]'))
ALTER TABLE [dbo].[List]  WITH CHECK ADD  CONSTRAINT [FK_List_object] FOREIGN KEY([ListID])
REFERENCES [Object] ([ObjectID])
GO
ALTER TABLE [dbo].[List] CHECK CONSTRAINT [FK_List_object]
GO
