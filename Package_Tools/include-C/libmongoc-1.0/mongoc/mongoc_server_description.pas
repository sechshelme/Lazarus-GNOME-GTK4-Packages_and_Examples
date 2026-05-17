unit mongoc_server_description;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_mongoc, mongoc_host_list;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  Pmongoc_server_description_t = type Pointer;
  PPmongoc_server_description_t = ^Pmongoc_server_description_t;
  {$ENDIF read_struct}

{$IFDEF read_function}
procedure mongoc_server_description_destroy(description: Pmongoc_server_description_t); cdecl; external libmongoc;
function mongoc_server_description_new_copy(description: Pmongoc_server_description_t): Pmongoc_server_description_t; cdecl; external libmongoc;
function mongoc_server_description_id(description: Pmongoc_server_description_t): Tuint32_t; cdecl; external libmongoc;
function mongoc_server_description_host(description: Pmongoc_server_description_t): Pmongoc_host_list_t; cdecl; external libmongoc;
function mongoc_server_description_last_update_time(description: Pmongoc_server_description_t): Tint64_t; cdecl; external libmongoc;
function mongoc_server_description_round_trip_time(description: Pmongoc_server_description_t): Tint64_t; cdecl; external libmongoc;
function mongoc_server_description_type(description: Pmongoc_server_description_t): pchar; cdecl; external libmongoc;
function mongoc_server_description_hello_response(description: Pmongoc_server_description_t): Pbson_t; cdecl; external libmongoc;
function mongoc_server_description_ismaster(description: Pmongoc_server_description_t): Pbson_t; cdecl; external libmongoc; deprecated;
function mongoc_server_description_compressor_id(description: Pmongoc_server_description_t): Tint32_t; cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:14:56 ===


implementation



end.
