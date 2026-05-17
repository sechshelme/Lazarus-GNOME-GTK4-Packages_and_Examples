unit mongoc_bulk_operation;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_mongoc, mongoc_write_concern;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_struct}
type
  Pmongoc_client_session_t = type Pointer;
  Pmongoc_bulk_operation_t = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
procedure mongoc_bulk_operation_destroy(bulk: Pmongoc_bulk_operation_t); cdecl; external libmongoc;
function mongoc_bulk_operation_execute(bulk: Pmongoc_bulk_operation_t; reply: Pbson_t; error: Pbson_error_t): Tuint32_t; cdecl; external libmongoc;
procedure mongoc_bulk_operation_delete(bulk: Pmongoc_bulk_operation_t; selector: Pbson_t); cdecl; external libmongoc; deprecated;
procedure mongoc_bulk_operation_delete_one(bulk: Pmongoc_bulk_operation_t; selector: Pbson_t); cdecl; external libmongoc; deprecated;
procedure mongoc_bulk_operation_insert(bulk: Pmongoc_bulk_operation_t; document: Pbson_t); cdecl; external libmongoc;
function mongoc_bulk_operation_insert_with_opts(bulk: Pmongoc_bulk_operation_t; document: Pbson_t; opts: Pbson_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
procedure mongoc_bulk_operation_remove(bulk: Pmongoc_bulk_operation_t; selector: Pbson_t); cdecl; external libmongoc;
function mongoc_bulk_operation_remove_many_with_opts(bulk: Pmongoc_bulk_operation_t; selector: Pbson_t; opts: Pbson_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
procedure mongoc_bulk_operation_remove_one(bulk: Pmongoc_bulk_operation_t; selector: Pbson_t); cdecl; external libmongoc;
function mongoc_bulk_operation_remove_one_with_opts(bulk: Pmongoc_bulk_operation_t; selector: Pbson_t; opts: Pbson_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
procedure mongoc_bulk_operation_replace_one(bulk: Pmongoc_bulk_operation_t; selector: Pbson_t; document: Pbson_t; upsert: Boolean); cdecl; external libmongoc;
function mongoc_bulk_operation_replace_one_with_opts(bulk: Pmongoc_bulk_operation_t; selector: Pbson_t; document: Pbson_t; opts: Pbson_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
procedure mongoc_bulk_operation_update(bulk: Pmongoc_bulk_operation_t; selector: Pbson_t; document: Pbson_t; upsert: Boolean); cdecl; external libmongoc;
function mongoc_bulk_operation_update_many_with_opts(bulk: Pmongoc_bulk_operation_t; selector: Pbson_t; document: Pbson_t; opts: Pbson_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
procedure mongoc_bulk_operation_update_one(bulk: Pmongoc_bulk_operation_t; selector: Pbson_t; document: Pbson_t; upsert: Boolean); cdecl; external libmongoc;
function mongoc_bulk_operation_update_one_with_opts(bulk: Pmongoc_bulk_operation_t; selector: Pbson_t; document: Pbson_t; opts: Pbson_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
procedure mongoc_bulk_operation_set_bypass_document_validation(bulk: Pmongoc_bulk_operation_t; bypass: Boolean); cdecl; external libmongoc;
procedure mongoc_bulk_operation_set_comment(bulk: Pmongoc_bulk_operation_t; comment: Pbson_value_t); cdecl; external libmongoc;
procedure mongoc_bulk_operation_set_let(bulk: Pmongoc_bulk_operation_t; let: Pbson_t); cdecl; external libmongoc;
function mongoc_bulk_operation_new(ordered: Boolean): Pmongoc_bulk_operation_t; cdecl; external libmongoc;
procedure mongoc_bulk_operation_set_write_concern(bulk: Pmongoc_bulk_operation_t; write_concern: Pmongoc_write_concern_t); cdecl; external libmongoc;
procedure mongoc_bulk_operation_set_database(bulk: Pmongoc_bulk_operation_t; database: pchar); cdecl; external libmongoc;
procedure mongoc_bulk_operation_set_collection(bulk: Pmongoc_bulk_operation_t; collection: pchar); cdecl; external libmongoc;
procedure mongoc_bulk_operation_set_client(bulk: Pmongoc_bulk_operation_t; client: pointer); cdecl; external libmongoc;
procedure mongoc_bulk_operation_set_client_session(bulk: Pmongoc_bulk_operation_t; client_session: Pmongoc_client_session_t); cdecl; external libmongoc;
procedure mongoc_bulk_operation_set_hint(bulk: Pmongoc_bulk_operation_t; server_id: Tuint32_t); cdecl; external libmongoc;
function mongoc_bulk_operation_get_hint(bulk: Pmongoc_bulk_operation_t): Tuint32_t; cdecl; external libmongoc;
function mongoc_bulk_operation_get_write_concern(bulk: Pmongoc_bulk_operation_t): Pmongoc_write_concern_t; cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:16:31 ===


implementation



end.
