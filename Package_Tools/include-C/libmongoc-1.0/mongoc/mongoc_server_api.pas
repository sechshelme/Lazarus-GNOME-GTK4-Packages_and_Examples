unit mongoc_server_api;

interface

uses
  fp_mongoc, mongoc_optional;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pmongoc_server_api_version_t = ^Tmongoc_server_api_version_t;
  Tmongoc_server_api_version_t = longint;

const
  MONGOC_SERVER_API_V1 = 0;

type
  Pmongoc_server_api_t = type Pointer;

function mongoc_server_api_version_to_string(version: Tmongoc_server_api_version_t): pchar; cdecl; external libmongoc;
function mongoc_server_api_version_from_string(version: pchar; out_: Pmongoc_server_api_version_t): boolean; cdecl; external libmongoc;
function mongoc_server_api_new(version: Tmongoc_server_api_version_t): Pmongoc_server_api_t; cdecl; external libmongoc;
function mongoc_server_api_copy(api: Pmongoc_server_api_t): Pmongoc_server_api_t; cdecl; external libmongoc;
procedure mongoc_server_api_destroy(api: Pmongoc_server_api_t); cdecl; external libmongoc;
procedure mongoc_server_api_strict(api: Pmongoc_server_api_t; strict: boolean); cdecl; external libmongoc;
procedure mongoc_server_api_deprecation_errors(api: Pmongoc_server_api_t; deprecation_errors: boolean); cdecl; external libmongoc;
function mongoc_server_api_get_deprecation_errors(api: Pmongoc_server_api_t): Pmongoc_optional_t; cdecl; external libmongoc;
function mongoc_server_api_get_strict(api: Pmongoc_server_api_t): Pmongoc_optional_t; cdecl; external libmongoc;
function mongoc_server_api_get_version(api: Pmongoc_server_api_t): Tmongoc_server_api_version_t; cdecl; external libmongoc;

// === Konventiert am: 15-5-26 15:14:59 ===


implementation



end.
