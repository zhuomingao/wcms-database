SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GenProfCancerTypeSite]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[GenProfCancerTypeSite](
	[CancerTypeSiteID] [int] NOT NULL,
	[CancerTypeSite] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NOT NULL CONSTRAINT [DF_GenProfCancerTypeSite_UpdateDate]  DEFAULT (getdate()),
	[UpdateUserID] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_GenProfCancerTypeSite_UpdateUserID]  DEFAULT (user_name()),
 CONSTRAINT [PK_GenProfCancerTypeSite] PRIMARY KEY CLUSTERED 
(
	[CancerTypeSiteID] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY]
END
GO
GRANT SELECT ON [dbo].[GenProfCancerTypeSite] TO [Gatekeeper_role]
GO
GRANT SELECT ON [dbo].[GenProfCancerTypeSite] TO [webSiteUser_role]
GO
GRANT SELECT ON [dbo].[GenProfCancerTypeSite] ([CancerTypeSiteID]) TO [Gatekeeper_role]
GO
GRANT SELECT ON [dbo].[GenProfCancerTypeSite] ([CancerTypeSiteID]) TO [webSiteUser_role]
GO
GRANT SELECT ON [dbo].[GenProfCancerTypeSite] ([CancerTypeSite]) TO [Gatekeeper_role]
GO
GRANT SELECT ON [dbo].[GenProfCancerTypeSite] ([CancerTypeSite]) TO [webSiteUser_role]
GO
GRANT SELECT ON [dbo].[GenProfCancerTypeSite] ([UpdateDate]) TO [Gatekeeper_role]
GO
GRANT SELECT ON [dbo].[GenProfCancerTypeSite] ([UpdateDate]) TO [webSiteUser_role]
GO
GRANT SELECT ON [dbo].[GenProfCancerTypeSite] ([UpdateUserID]) TO [Gatekeeper_role]
GO
GRANT SELECT ON [dbo].[GenProfCancerTypeSite] ([UpdateUserID]) TO [webSiteUser_role]
GO
