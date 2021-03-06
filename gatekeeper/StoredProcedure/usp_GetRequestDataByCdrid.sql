IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetRequestDataByCdrid]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetRequestDataByCdrid]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].usp_GetRequestDataByCdrid
	@RequestID int,
	@CDRID int,
	@Status_Code int OUTPUT,
	@Status_Text varchar(255) OUTPUT
AS
BEGIN
	BEGIN TRY
	set nocount ON

		SET @Status_Code = 0
		SET @Status_Text = 'OK'

		select req.RequestDataID, req.RequestID, req.PacketNumber, req.ActionType, req.DataSetID,
				req.CDRID, req.CDRVersion, req.ReceivedDate, req.Status, req.DependencyStatus,
				req.Location, req.groupID, 
				case req.isArchived 
					when 0 then 
							(select data from dbo.documentdata where requestdataID = Req.requestDataID )
							else (select data from dbo.Archiveddocumentdata where requestdataID = Req.requestDataID) end as data
		from dbo.RequestData req
		where RequestID = @RequestID and
			CDRID = @CDRID

		IF( @@ROWCOUNT < 1 )
		BEGIN
			SET @Status_Code = -1
			SET @Status_Text = 'usp_GetRequestDataByCdrid -- No match found for @RequestID = ' + CAST(@RequestID AS varchar) +
				' @CDRID = ' + CAST(@CDRID AS varchar)
		END

		RETURN 0  --Succesful return 0
	END TRY

	BEGIN CATCH
		SET @Status_Code = -1000	-- Very big error
		SET @Status_Text = 'usp_InsertRequestData - ' + ERROR_MESSAGE()
		RETURN 100101  --Error code
	END CATCH 
END


GO
GRANT EXECUTE ON [dbo].[usp_GetRequestDataByCdrid] TO [gatekeeper_role]
GO
