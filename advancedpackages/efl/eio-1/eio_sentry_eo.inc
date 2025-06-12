{$IFDEF read_interface}


type
  PEio_Sentry = ^TEio_Sentry;
  TEio_Sentry = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEio_Sentry_Event = ^TEio_Sentry_Event;

  TEio_Sentry_Event = record
    trigger: pchar;
    source: pchar;
  end;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EIO_SENTRY_CLASS: PEfl_Class;

function eio_sentry_class_get: PEfl_Class; cdecl; external libeio;
function eio_sentry_add(obj: PEo; path: pchar): TEina_Bool; cdecl; external libeio;
procedure eio_sentry_remove(obj: PEo; path: pchar); cdecl; external libeio;
function eio_sentry_fallback_check(obj: PEo; path: pchar): TEina_Bool; cdecl; external libeio;

var
  _EIO_SENTRY_EVENT_FILE_CREATED: TEfl_Event_Description; cvar;external libeio;
  _EIO_SENTRY_EVENT_FILE_DELETED: TEfl_Event_Description; cvar;external libeio;
  _EIO_SENTRY_EVENT_FILE_MODIFIED: TEfl_Event_Description; cvar;external libeio;
  _EIO_SENTRY_EVENT_FILE_CLOSED: TEfl_Event_Description; cvar;external libeio;
  _EIO_SENTRY_EVENT_DIRECTORY_CREATED: TEfl_Event_Description; cvar;external libeio;
  _EIO_SENTRY_EVENT_DIRECTORY_DELETED: TEfl_Event_Description; cvar;external libeio;
  _EIO_SENTRY_EVENT_DIRECTORY_MODIFIED: TEfl_Event_Description; cvar;external libeio;
  _EIO_SENTRY_EVENT_DIRECTORY_CLOSED: TEfl_Event_Description; cvar;external libeio;
  _EIO_SENTRY_EVENT_SELF_RENAME: TEfl_Event_Description; cvar;external libeio;
  _EIO_SENTRY_EVENT_SELF_DELETED: TEfl_Event_Description; cvar;external libeio;
  _EIO_SENTRY_EVENT_ERROR: TEfl_Event_Description; cvar;external libeio;

function EIO_SENTRY_EVENT_FILE_CREATED: PEfl_Event_Description;
function EIO_SENTRY_EVENT_FILE_DELETED: PEfl_Event_Description;
function EIO_SENTRY_EVENT_FILE_MODIFIED: PEfl_Event_Description;
function EIO_SENTRY_EVENT_FILE_CLOSED: PEfl_Event_Description;
function EIO_SENTRY_EVENT_DIRECTORY_CREATED: PEfl_Event_Description;
function EIO_SENTRY_EVENT_DIRECTORY_DELETED: PEfl_Event_Description;
function EIO_SENTRY_EVENT_DIRECTORY_MODIFIED: PEfl_Event_Description;
function EIO_SENTRY_EVENT_DIRECTORY_CLOSED: PEfl_Event_Description;
function EIO_SENTRY_EVENT_SELF_RENAME: PEfl_Event_Description;
function EIO_SENTRY_EVENT_SELF_DELETED: PEfl_Event_Description;
function EIO_SENTRY_EVENT_ERROR: PEfl_Event_Description;
{$endif}

// === Konventiert am: 12-6-25 16:11:40 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EIO_SENTRY_CLASS: PEfl_Class;
begin
  EIO_SENTRY_CLASS := eio_sentry_class_get;
end;

function EIO_SENTRY_EVENT_FILE_CREATED: PEfl_Event_Description;
begin
  EIO_SENTRY_EVENT_FILE_CREATED := @(_EIO_SENTRY_EVENT_FILE_CREATED);
end;

function EIO_SENTRY_EVENT_FILE_DELETED: PEfl_Event_Description;
begin
  EIO_SENTRY_EVENT_FILE_DELETED := @(_EIO_SENTRY_EVENT_FILE_DELETED);
end;

function EIO_SENTRY_EVENT_FILE_MODIFIED: PEfl_Event_Description;
begin
  EIO_SENTRY_EVENT_FILE_MODIFIED := @(_EIO_SENTRY_EVENT_FILE_MODIFIED);
end;

function EIO_SENTRY_EVENT_FILE_CLOSED: PEfl_Event_Description;
begin
  EIO_SENTRY_EVENT_FILE_CLOSED := @(_EIO_SENTRY_EVENT_FILE_CLOSED);
end;

function EIO_SENTRY_EVENT_DIRECTORY_CREATED: PEfl_Event_Description;
begin
  EIO_SENTRY_EVENT_DIRECTORY_CREATED := @(_EIO_SENTRY_EVENT_DIRECTORY_CREATED);
end;

function EIO_SENTRY_EVENT_DIRECTORY_DELETED: PEfl_Event_Description;
begin
  EIO_SENTRY_EVENT_DIRECTORY_DELETED := @(_EIO_SENTRY_EVENT_DIRECTORY_DELETED);
end;

function EIO_SENTRY_EVENT_DIRECTORY_MODIFIED: PEfl_Event_Description;
begin
  EIO_SENTRY_EVENT_DIRECTORY_MODIFIED := @(_EIO_SENTRY_EVENT_DIRECTORY_MODIFIED);
end;

function EIO_SENTRY_EVENT_DIRECTORY_CLOSED: PEfl_Event_Description;
begin
  EIO_SENTRY_EVENT_DIRECTORY_CLOSED := @(_EIO_SENTRY_EVENT_DIRECTORY_CLOSED);
end;

function EIO_SENTRY_EVENT_SELF_RENAME: PEfl_Event_Description;
begin
  EIO_SENTRY_EVENT_SELF_RENAME := @(_EIO_SENTRY_EVENT_SELF_RENAME);
end;

function EIO_SENTRY_EVENT_SELF_DELETED: PEfl_Event_Description;
begin
  EIO_SENTRY_EVENT_SELF_DELETED := @(_EIO_SENTRY_EVENT_SELF_DELETED);
end;

function EIO_SENTRY_EVENT_ERROR: PEfl_Event_Description;
begin
  EIO_SENTRY_EVENT_ERROR := @(_EIO_SENTRY_EVENT_ERROR);
end;
{$endif}


{$ENDIF read_implementation}
