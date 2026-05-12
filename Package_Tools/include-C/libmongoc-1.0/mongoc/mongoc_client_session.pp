
unit mongoc_client_session;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_client_session.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_client_session.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pbson_error_t  = ^bson_error_t;
Pbson_t  = ^bson_t;
Pmongoc_client_session_t  = ^mongoc_client_session_t;
Pmongoc_client_t  = ^mongoc_client_t;
Pmongoc_read_concern_t  = ^mongoc_read_concern_t;
Pmongoc_read_prefs_t  = ^mongoc_read_prefs_t;
Pmongoc_session_opt_t  = ^mongoc_session_opt_t;
Pmongoc_transaction_opt_t  = ^mongoc_transaction_opt_t;
Pmongoc_transaction_state_t  = ^mongoc_transaction_state_t;
Pmongoc_write_concern_t  = ^mongoc_write_concern_t;
Puint32_t  = ^uint32_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2017 MongoDB, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
  }
{$include "mongoc-prelude.h"}
{$ifndef MONGOC_CLIENT_SESSION_H}
{$define MONGOC_CLIENT_SESSION_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}
{ mongoc_client_session_t, mongoc_transaction_opt_t, and
   mongoc_session_opt_t are typedef'ed here  }
{$include "mongoc-client.h"}
type

  Tmongoc_client_session_with_transaction_cb_t = function (session:Pmongoc_client_session_t; ctx:pointer; reply:PPbson_t; error:Pbson_error_t):Tbool;cdecl;

  Pmongoc_transaction_state_t = ^Tmongoc_transaction_state_t;
  Tmongoc_transaction_state_t =  Longint;
  Const
    MONGOC_TRANSACTION_NONE = 0;
    MONGOC_TRANSACTION_STARTING = 1;
    MONGOC_TRANSACTION_IN_PROGRESS = 2;
    MONGOC_TRANSACTION_COMMITTED = 3;
    MONGOC_TRANSACTION_ABORTED = 4;
;
{ these options types are named "opt_t" but their functions are named with
 * "opts", for consistency with the older mongoc_ssl_opt_t  }

function mongoc_transaction_opts_new:Pmongoc_transaction_opt_t;cdecl;external;
(* Const before type ignored *)
function mongoc_transaction_opts_clone(opts:Pmongoc_transaction_opt_t):Pmongoc_transaction_opt_t;cdecl;external;
procedure mongoc_transaction_opts_destroy(opts:Pmongoc_transaction_opt_t);cdecl;external;
procedure mongoc_transaction_opts_set_max_commit_time_ms(opts:Pmongoc_transaction_opt_t; max_commit_time_ms:Tint64_t);cdecl;external;
function mongoc_transaction_opts_get_max_commit_time_ms(opts:Pmongoc_transaction_opt_t):Tint64_t;cdecl;external;
(* Const before type ignored *)
procedure mongoc_transaction_opts_set_read_concern(opts:Pmongoc_transaction_opt_t; read_concern:Pmongoc_read_concern_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_transaction_opts_get_read_concern(opts:Pmongoc_transaction_opt_t):Pmongoc_read_concern_t;cdecl;external;
(* Const before type ignored *)
procedure mongoc_transaction_opts_set_write_concern(opts:Pmongoc_transaction_opt_t; write_concern:Pmongoc_write_concern_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_transaction_opts_get_write_concern(opts:Pmongoc_transaction_opt_t):Pmongoc_write_concern_t;cdecl;external;
(* Const before type ignored *)
procedure mongoc_transaction_opts_set_read_prefs(opts:Pmongoc_transaction_opt_t; read_prefs:Pmongoc_read_prefs_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_transaction_opts_get_read_prefs(opts:Pmongoc_transaction_opt_t):Pmongoc_read_prefs_t;cdecl;external;
function mongoc_session_opts_new:Pmongoc_session_opt_t;cdecl;external;
procedure mongoc_session_opts_set_causal_consistency(opts:Pmongoc_session_opt_t; causal_consistency:Tbool);cdecl;external;
(* Const before type ignored *)
function mongoc_session_opts_get_causal_consistency(opts:Pmongoc_session_opt_t):Tbool;cdecl;external;
procedure mongoc_session_opts_set_snapshot(opts:Pmongoc_session_opt_t; snapshot:Tbool);cdecl;external;
(* Const before type ignored *)
function mongoc_session_opts_get_snapshot(opts:Pmongoc_session_opt_t):Tbool;cdecl;external;
(* Const before type ignored *)
procedure mongoc_session_opts_set_default_transaction_opts(opts:Pmongoc_session_opt_t; txn_opts:Pmongoc_transaction_opt_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_session_opts_get_default_transaction_opts(opts:Pmongoc_session_opt_t):Pmongoc_transaction_opt_t;cdecl;external;
(* Const before type ignored *)
function mongoc_session_opts_get_transaction_opts(session:Pmongoc_client_session_t):Pmongoc_transaction_opt_t;cdecl;external;
(* Const before type ignored *)
function mongoc_session_opts_clone(opts:Pmongoc_session_opt_t):Pmongoc_session_opt_t;cdecl;external;
procedure mongoc_session_opts_destroy(opts:Pmongoc_session_opt_t);cdecl;external;
(* Const before type ignored *)
function mongoc_client_session_get_client(session:Pmongoc_client_session_t):Pmongoc_client_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_client_session_get_opts(session:Pmongoc_client_session_t):Pmongoc_session_opt_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_client_session_get_lsid(session:Pmongoc_client_session_t):Pbson_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_client_session_get_cluster_time(session:Pmongoc_client_session_t):Pbson_t;cdecl;external;
(* Const before type ignored *)
procedure mongoc_client_session_advance_cluster_time(session:Pmongoc_client_session_t; cluster_time:Pbson_t);cdecl;external;
(* Const before type ignored *)
procedure mongoc_client_session_get_operation_time(session:Pmongoc_client_session_t; timestamp:Puint32_t; increment:Puint32_t);cdecl;external;
(* Const before type ignored *)
function mongoc_client_session_get_server_id(session:Pmongoc_client_session_t):Tuint32_t;cdecl;external;
procedure mongoc_client_session_advance_operation_time(session:Pmongoc_client_session_t; timestamp:Tuint32_t; increment:Tuint32_t);cdecl;external;
(* Const before type ignored *)
function mongoc_client_session_with_transaction(session:Pmongoc_client_session_t; cb:Tmongoc_client_session_with_transaction_cb_t; opts:Pmongoc_transaction_opt_t; ctx:pointer; reply:Pbson_t; 
           error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_client_session_start_transaction(session:Pmongoc_client_session_t; opts:Pmongoc_transaction_opt_t; error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_client_session_in_transaction(session:Pmongoc_client_session_t):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_client_session_get_transaction_state(session:Pmongoc_client_session_t):Tmongoc_transaction_state_t;cdecl;external;
function mongoc_client_session_commit_transaction(session:Pmongoc_client_session_t; reply:Pbson_t; error:Pbson_error_t):Tbool;cdecl;external;
function mongoc_client_session_abort_transaction(session:Pmongoc_client_session_t; error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_client_session_append(client_session:Pmongoc_client_session_t; opts:Pbson_t; error:Pbson_error_t):Tbool;cdecl;external;
{ There is no mongoc_client_session_end, only mongoc_client_session_destroy.
 * Driver Sessions Spec: "In languages that have idiomatic ways of disposing of
 * resources, drivers SHOULD support that in addition to or instead of
 * endSession."
  }
procedure mongoc_client_session_destroy(session:Pmongoc_client_session_t);cdecl;external;
function mongoc_client_session_get_dirty(session:Pmongoc_client_session_t):Tbool;cdecl;external;
{$endif}
{ MONGOC_CLIENT_SESSION_H  }

implementation


end.
