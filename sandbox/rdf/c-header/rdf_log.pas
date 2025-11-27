unit rdf_log;

interface

uses
  fp_rdf, rdf;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Plibrdf_log_level = ^Tlibrdf_log_level;
  Tlibrdf_log_level = longint;

const
  LIBRDF_LOG_NONE = 0;
  LIBRDF_LOG_DEBUG = 1;
  LIBRDF_LOG_INFO = 2;
  LIBRDF_LOG_WARN = 3;
  LIBRDF_LOG_ERROR = 4;
  LIBRDF_LOG_FATAL = 5;
  LIBRDF_LOG_LAST = LIBRDF_LOG_FATAL;

type
  Plibrdf_log_facility = ^Tlibrdf_log_facility;
  Tlibrdf_log_facility = longint;

const
  LIBRDF_FROM_NONE = 0;
  LIBRDF_FROM_CONCEPTS = 1;
  LIBRDF_FROM_DIGEST = 2;
  LIBRDF_FROM_FILES = 3;
  LIBRDF_FROM_HASH = 4;
  LIBRDF_FROM_INIT = 5;
  LIBRDF_FROM_ITERATOR = 6;
  LIBRDF_FROM_LIST = 7;
  LIBRDF_FROM_MODEL = 8;
  LIBRDF_FROM_NODE = 9;
  LIBRDF_FROM_PARSER = 10;
  LIBRDF_FROM_QUERY = 11;
  LIBRDF_FROM_SERIALIZER = 12;
  LIBRDF_FROM_STATEMENT = 13;
  LIBRDF_FROM_STORAGE = 14;
  LIBRDF_FROM_STREAM = 15;
  LIBRDF_FROM_URI = 16;
  LIBRDF_FROM_UTF8 = 17;
  LIBRDF_FROM_MEMORY = 18;
  LIBRDF_FROM_RAPTOR = 19;
  LIBRDF_FROM_LAST = LIBRDF_FROM_RAPTOR;

type
  Tlibrdf_log_message = record
    code: longint;
    level: Tlibrdf_log_level;
    facility: Tlibrdf_log_facility;
    message: pchar;
    locator: Praptor_locator;
  end;
  Plibrdf_log_message = ^Tlibrdf_log_message;

  Tlibrdf_log_level_func = function(user_data: pointer; message: pchar; arguments: Tva_list): longint; cdecl;
  Tlibrdf_log_func = function(user_data: pointer; message: Plibrdf_log_message): longint; cdecl;

function librdf_log_message_code(message: Plibrdf_log_message): longint; cdecl; external librdf;
function librdf_log_message_level(message: Plibrdf_log_message): Tlibrdf_log_level; cdecl; external librdf;
function librdf_log_message_facility(message: Plibrdf_log_message): Tlibrdf_log_facility; cdecl; external librdf;
function librdf_log_message_message(message: Plibrdf_log_message): pchar; cdecl; external librdf;
function librdf_log_message_locator(message: Plibrdf_log_message): Praptor_locator; cdecl; external librdf;
procedure librdf_log_simple(world: Plibrdf_world; code: longint; level: Tlibrdf_log_level; facility: Tlibrdf_log_facility; locator: pointer;
  message: pchar); cdecl; external librdf;
procedure librdf_log(world: Plibrdf_world; code: longint; level: Tlibrdf_log_level; facility: Tlibrdf_log_facility; locator: pointer;
  message: pchar; args: array of const); cdecl; external librdf;
procedure librdf_log(world: Plibrdf_world; code: longint; level: Tlibrdf_log_level; facility: Tlibrdf_log_facility; locator: pointer;
  message: pchar); cdecl; external librdf;

// === Konventiert am: 27-11-25 17:39:30 ===


implementation



end.
