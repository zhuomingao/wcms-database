SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[XMLQuery]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[XMLQuery](
	[XMLQueryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[QueryText] [varchar](7400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Comments] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_XMLQuery_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_XMLQuery_UpdateUserID]  DEFAULT (user_name()),
 CONSTRAINT [PK_XMLQuery] PRIMARY KEY CLUSTERED 
(
	[XMLQueryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_XMLQueryUniqueName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
GRANT DELETE ON [dbo].[XMLQuery] TO [gatekeeper_role]
GO
GRANT INSERT ON [dbo].[XMLQuery] TO [gatekeeper_role]
GO
GRANT REFERENCES ON [dbo].[XMLQuery] TO [gatekeeper_role]
GO
GRANT SELECT ON [dbo].[XMLQuery] TO [gatekeeper_role]
GO
GRANT UPDATE ON [dbo].[XMLQuery] TO [gatekeeper_role]
GO
