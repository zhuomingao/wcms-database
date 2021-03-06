USE [cancergov]
GO
/****** Object:  Role [gatekeeper_role]    Script Date: 12/21/2007 17:07:34 ******/
EXEC dbo.sp_addrole @rolename = N'gatekeeper_role'
GO
/****** Object:  Role [prettyurluser_role]    Script Date: 12/21/2007 17:07:34 ******/
EXEC dbo.sp_addrole @rolename = N'prettyurluser_role'
GO
/****** Object:  Role [redirectuser_role]    Script Date: 12/21/2007 17:07:34 ******/
EXEC dbo.sp_addrole @rolename = N'redirectuser_role'
GO
/****** Object:  Role [webadminuser_role]    Script Date: 12/21/2007 17:07:34 ******/
EXEC dbo.sp_addrole @rolename = N'webadminuser_role'
GO
/****** Object:  Role [websiteuser_role]    Script Date: 12/21/2007 17:07:34 ******/
EXEC dbo.sp_addrole @rolename = N'websiteuser_role'
GO
/****** Object:  User [LinkCheckUser]    Script Date: 12/21/2007 17:07:34 ******/
EXEC dbo.sp_grantdbaccess @loginame = N'LinkCheckUser', @name_in_db = N'LinkCheckUser'
GO
/****** Object:  User [gatekeeperuser]    Script Date: 12/21/2007 17:07:34 ******/
EXEC dbo.sp_grantdbaccess @loginame = N'gatekeeperuser', @name_in_db = N'gatekeeperuser'
GO
/****** Object:  User [prettyurluser]    Script Date: 12/21/2007 17:07:34 ******/
EXEC dbo.sp_grantdbaccess @loginame = N'prettyurluser', @name_in_db = N'prettyurluser'
GO
/****** Object:  User [webadminuser]    Script Date: 12/21/2007 17:07:34 ******/
EXEC dbo.sp_grantdbaccess @loginame = N'webadminuser', @name_in_db = N'webadminuser'
GO
/****** Object:  User [websiteuser]    Script Date: 12/21/2007 17:07:34 ******/
EXEC dbo.sp_grantdbaccess @loginame = N'websiteuser', @name_in_db = N'websiteuser'
GO
