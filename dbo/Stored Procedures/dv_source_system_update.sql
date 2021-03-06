﻿CREATE PROC [dbo].[dv_source_system_update] 
    @system_key int,
    @source_system_name varchar(50),
	@is_retired bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[dv_source_system]
	SET    [source_system_name] = @source_system_name, [is_retired] = @is_retired
	WHERE  [source_system_key] = @system_key
	
	-- Begin Return Select <- do not remove
	SELECT [source_system_key], [source_system_name], [is_retired]
	FROM   [dbo].[dv_source_system]
	WHERE  [source_system_key] = @system_key	
	-- End Return Select <- do not remove

	COMMIT