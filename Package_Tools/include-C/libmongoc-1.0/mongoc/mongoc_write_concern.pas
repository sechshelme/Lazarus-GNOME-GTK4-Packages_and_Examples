unit mongoc_write_concern;

interface

uses
  fp_mongoc;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  MONGOC_WRITE_CONCERN_W_UNACKNOWLEDGED = 0;
  MONGOC_WRITE_CONCERN_W_ERRORS_IGNORED = -(1);
  MONGOC_WRITE_CONCERN_W_DEFAULT = -(2);
  MONGOC_WRITE_CONCERN_W_MAJORITY = -(3);
  MONGOC_WRITE_CONCERN_W_TAG = -(4);

type
  Pmongoc_write_concern_t = type Pointer;

function mongoc_write_concern_new: Pmongoc_write_concern_t; cdecl; external libmongoc;
function mongoc_write_concern_copy(write_concern: Pmongoc_write_concern_t): Pmongoc_write_concern_t; cdecl; external libmongoc;
procedure mongoc_write_concern_destroy(write_concern: Pmongoc_write_concern_t); cdecl; external libmongoc;
function mongoc_write_concern_get_fsync(write_concern: Pmongoc_write_concern_t): Tbool; cdecl; external libmongoc; deprecated;
procedure mongoc_write_concern_set_fsync(write_concern: Pmongoc_write_concern_t; fsync_: Tbool); cdecl; external libmongoc; deprecated;
function mongoc_write_concern_get_journal(write_concern: Pmongoc_write_concern_t): Tbool; cdecl; external libmongoc;
function mongoc_write_concern_journal_is_set(write_concern: Pmongoc_write_concern_t): Tbool; cdecl; external libmongoc;
procedure mongoc_write_concern_set_journal(write_concern: Pmongoc_write_concern_t; journal: Tbool); cdecl; external libmongoc;
function mongoc_write_concern_get_w(write_concern: Pmongoc_write_concern_t): Tint32_t; cdecl; external libmongoc;
procedure mongoc_write_concern_set_w(write_concern: Pmongoc_write_concern_t; w: Tint32_t); cdecl; external libmongoc;
function mongoc_write_concern_get_wtag(write_concern: Pmongoc_write_concern_t): pchar; cdecl; external libmongoc;
procedure mongoc_write_concern_set_wtag(write_concern: Pmongoc_write_concern_t; tag: pchar); cdecl; external libmongoc;
function mongoc_write_concern_get_wtimeout(write_concern: Pmongoc_write_concern_t): Tint32_t; cdecl; external libmongoc;
function mongoc_write_concern_get_wtimeout_int64(write_concern: Pmongoc_write_concern_t): Tint64_t; cdecl; external libmongoc;
procedure mongoc_write_concern_set_wtimeout(write_concern: Pmongoc_write_concern_t; wtimeout_msec: Tint32_t); cdecl; external libmongoc;
procedure mongoc_write_concern_set_wtimeout_int64(write_concern: Pmongoc_write_concern_t; wtimeout_msec: Tint64_t); cdecl; external libmongoc;
function mongoc_write_concern_get_wmajority(write_concern: Pmongoc_write_concern_t): Tbool; cdecl; external libmongoc;
procedure mongoc_write_concern_set_wmajority(write_concern: Pmongoc_write_concern_t; wtimeout_msec: Tint32_t); cdecl; external libmongoc;
function mongoc_write_concern_is_acknowledged(write_concern: Pmongoc_write_concern_t): Tbool; cdecl; external libmongoc;
function mongoc_write_concern_is_valid(write_concern: Pmongoc_write_concern_t): Tbool; cdecl; external libmongoc;
function mongoc_write_concern_append(write_concern: Pmongoc_write_concern_t; doc: Pbson_t): Tbool; cdecl; external libmongoc;
function mongoc_write_concern_is_default(write_concern: Pmongoc_write_concern_t): Tbool; cdecl; external libmongoc;

// === Konventiert am: 15-5-26 15:14:07 ===


implementation



end.
