﻿CREATE TABLE [dv_log].[dv_execution] (
    [execution_key]            INT                IDENTITY (1, 1) NOT NULL,
    [execution_start_datetime] DATETIMEOFFSET (7) DEFAULT (sysdatetimeoffset()) NOT NULL,
    [execution_end_datetime]   DATETIMEOFFSET (7) NULL,
    [created_by]               VARCHAR (30)       DEFAULT (user_name()) NOT NULL,
    [updated_by]               VARCHAR (30)       DEFAULT (user_name()) NOT NULL,
    [update_date_time]         DATETIMEOFFSET (7) DEFAULT (sysdatetimeoffset()) NOT NULL,
    PRIMARY KEY CLUSTERED ([execution_key] ASC)
);


GO


CREATE TRIGGER [dv_log].[dv_execution_audit] ON [dv_log].[dv_execution]
AFTER INSERT, UPDATE
AS
	BEGIN
	    UPDATE [a]
		 SET
			[update_date_time] = SYSDATETIMEOFFSET()
		   , [updated_by] = SUSER_NAME() FROM [dv_log].[dv_execution] AS [a]
									   JOIN [inserted] AS [b]
									   ON [a].[execution_key] = [b].[execution_key];
	END;