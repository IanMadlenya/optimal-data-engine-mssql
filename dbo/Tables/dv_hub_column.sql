﻿CREATE TABLE [dbo].[dv_hub_column] (
    [hub_col_key]         INT                IDENTITY (1, 1) NOT NULL,
    [hub_key_column_key]  INT                NOT NULL,
    [link_key_column_key] INT                NULL,
    [column_key]          INT                NOT NULL,
    [release_key]         INT                CONSTRAINT [DF_dv_hub_column_release_key] DEFAULT ((0)) NOT NULL,
    [version_number]      INT                CONSTRAINT [DF__dv_hub_co__versi__2AD55B43] DEFAULT ((1)) NOT NULL,
    [updated_by]          VARCHAR (30)       CONSTRAINT [DF__dv_hub_co__updat__2BC97F7C] DEFAULT (suser_name()) NULL,
    [updated_datetime]    DATETIMEOFFSET (7) CONSTRAINT [DF__dv_hub_co__updat__2CBDA3B5] DEFAULT (sysdatetimeoffset()) NULL,
    CONSTRAINT [PK__dv_hub_c__1990F0D2AC6D4CF1] PRIMARY KEY CLUSTERED ([hub_col_key] ASC),
    CONSTRAINT [FK__dv_hub_column__dv_column] FOREIGN KEY ([column_key]) REFERENCES [dbo].[dv_column] ([column_key]),
    CONSTRAINT [FK__dv_hub_column__dv_hub_key_column] FOREIGN KEY ([hub_key_column_key]) REFERENCES [dbo].[dv_hub_key_column] ([hub_key_column_key]),
    CONSTRAINT [FK__dv_hub_column__dv_link_key_column] FOREIGN KEY ([link_key_column_key]) REFERENCES [dbo].[dv_link_key_column] ([link_key_column_key]),
    CONSTRAINT [FK_dv_hub_column_dv_release_master] FOREIGN KEY ([release_key]) REFERENCES [dv_release].[dv_release_master] ([release_key]),
    CONSTRAINT [dv_hub_column_unique] UNIQUE NONCLUSTERED ([hub_key_column_key] ASC, [column_key] ASC),
    CONSTRAINT [dv_hub_source_column_unique] UNIQUE NONCLUSTERED ([column_key] ASC)
);






GO
CREATE TRIGGER [dbo].[dv_hub_column_audit] ON [dbo].[dv_hub_column]
AFTER INSERT, UPDATE
AS
	BEGIN
	    UPDATE [a]
		 SET
			[updated_datetime] = SYSDATETIMEOFFSET()
		   , [updated_by] = SUSER_NAME() FROM [dbo].[dv_hub_column] AS [a]
									   JOIN [inserted] AS [b]
									   ON [a].[hub_col_key] = [b].[hub_col_key];
	END;