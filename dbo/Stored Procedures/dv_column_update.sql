﻿CREATE PROC [dbo].[dv_column_update] 
    @column_key int,
    @table_key int,
	@satellite_col_key int,
    @column_name varchar(128),
    @column_type varchar(30),
    @column_length int = NULL,
    @column_precision int = NULL,
    @column_scale int = NULL,
    @Collation_Name nvarchar(128) = NULL,
    @bk_ordinal_position int,
    @source_ordinal_position int,
    @is_source_date bit,
    @is_retired bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[dv_column]
	SET    [table_key] = @table_key, [satellite_col_key] = @satellite_col_key, [column_name] = @column_name, [column_type] = @column_type, [column_length] = @column_length, [column_precision] = @column_precision, [column_scale] = @column_scale, [Collation_Name] = @Collation_Name, [bk_ordinal_position] = @bk_ordinal_position, [source_ordinal_position] = @source_ordinal_position, [is_source_date] = @is_source_date, [is_retired] = @is_retired
	WHERE  [column_key] = @column_key
	
	-- Begin Return Select <- do not remove
	SELECT [column_key], [table_key], [satellite_col_key], [column_name], [column_type], [column_length], [column_precision], [column_scale], [Collation_Name], [bk_ordinal_position], [source_ordinal_position], [is_source_date], [is_retired], [version_number], [updated_by], [update_date_time]
	FROM   [dbo].[dv_column]
	WHERE  [column_key] = @column_key	
	-- End Return Select <- do not remove

	COMMIT