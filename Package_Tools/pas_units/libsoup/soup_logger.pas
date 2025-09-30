unit soup_logger;

interface

uses
  fp_glib2, fp_soup, soup_message;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PSoupLoggerLogLevel = ^TSoupLoggerLogLevel;
  TSoupLoggerLogLevel = longint;

const
  SOUP_LOGGER_LOG_NONE = 0;
  SOUP_LOGGER_LOG_MINIMAL = 1;
  SOUP_LOGGER_LOG_HEADERS = 2;
  SOUP_LOGGER_LOG_BODY = 3;

type
  TSoupLogger = record
  end;
  PSoupLogger = ^TSoupLogger;

  TSoupLoggerFilter = function(logger: PSoupLogger; msg: PSoupMessage; user_data: Tgpointer): TSoupLoggerLogLevel; cdecl;
  TSoupLoggerPrinter = procedure(logger: PSoupLogger; level: TSoupLoggerLogLevel; direction: char; data: pchar; user_data: Tgpointer); cdecl;

  TSoupLoggerClass = record
    parent_class: TGObjectClass;
  end;
  PSoupLoggerClass = ^TSoupLoggerClass;

function soup_logger_get_type: TGType; cdecl; external libsoup;
function soup_logger_new(level: TSoupLoggerLogLevel): PSoupLogger; cdecl; external libsoup;
procedure soup_logger_set_request_filter(logger: PSoupLogger; request_filter: TSoupLoggerFilter; filter_data: Tgpointer; destroy: TGDestroyNotify); cdecl; external libsoup;
procedure soup_logger_set_response_filter(logger: PSoupLogger; response_filter: TSoupLoggerFilter; filter_data: Tgpointer; destroy: TGDestroyNotify); cdecl; external libsoup;
procedure soup_logger_set_printer(logger: PSoupLogger; printer: TSoupLoggerPrinter; printer_data: Tgpointer; destroy: TGDestroyNotify); cdecl; external libsoup;
procedure soup_logger_set_max_body_size(logger: PSoupLogger; max_body_size: longint); cdecl; external libsoup;
function soup_logger_get_max_body_size(logger: PSoupLogger): longint; cdecl; external libsoup;

// === Konventiert am: 29-9-25 19:44:38 ===

function SOUP_TYPE_LOGGER: TGType;
function SOUP_LOGGER(obj: Pointer): PSoupLogger;
function SOUP_IS_LOGGER(obj: Pointer): Tgboolean;

implementation

function SOUP_TYPE_LOGGER: TGType;
begin
  Result := soup_logger_get_type;
end;

function SOUP_LOGGER(obj: Pointer): PSoupLogger;
begin
  Result := PSoupLogger(g_type_check_instance_cast(obj, SOUP_TYPE_LOGGER));
end;

function SOUP_IS_LOGGER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SOUP_TYPE_LOGGER);
end;



end.
