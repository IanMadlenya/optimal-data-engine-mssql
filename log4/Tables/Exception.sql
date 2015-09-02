﻿CREATE TABLE [log4].[Exception] (
    [ExceptionId]       INT            IDENTITY (1, 1) NOT NULL,
    [UtcDate]           DATETIME       CONSTRAINT [DF_Exception_UtcDate] DEFAULT (getutcdate()) NULL,
    [SystemDate]        DATETIME       CONSTRAINT [DF_Exception_SystemDate] DEFAULT (getdate()) NULL,
    [ErrorContext]      NVARCHAR (512) NULL,
    [ErrorNumber]       INT            NULL,
    [ErrorSeverity]     INT            NULL,
    [ErrorState]        INT            NULL,
    [ErrorProcedure]    NVARCHAR (128) NULL,
    [ErrorLine]         INT            NULL,
    [ErrorMessage]      NVARCHAR (MAX) NULL,
    [SessionId]         INT            NULL,
    [ServerName]        NVARCHAR (128) NULL,
    [DatabaseName]      NVARCHAR (128) NULL,
    [HostName]          NVARCHAR (128) NULL,
    [ProgramName]       NVARCHAR (128) NULL,
    [NTDomain]          NVARCHAR (128) NULL,
    [NTUsername]        NVARCHAR (128) NULL,
    [LoginName]         NVARCHAR (128) NULL,
    [OriginalLoginName] NVARCHAR (128) NULL,
    [SessionLoginTime]  DATETIME       NULL,
    CONSTRAINT [PK_Exception] PRIMARY KEY NONCLUSTERED ([ExceptionId] ASC) WITH (FILLFACTOR = 100)
);

