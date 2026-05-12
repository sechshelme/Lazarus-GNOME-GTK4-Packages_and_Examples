
unit mongoc_client;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_client.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_client.h
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
Pchar  = ^char;
Pmongoc_apm_callbacks_t  = ^mongoc_apm_callbacks_t;
Pmongoc_auto_encryption_opts_t  = ^mongoc_auto_encryption_opts_t;
Pmongoc_change_stream_t  = ^mongoc_change_stream_t;
Pmongoc_client_session_t  = ^mongoc_client_session_t;
Pmongoc_client_t  = ^mongoc_client_t;
Pmongoc_collection_t  = ^mongoc_collection_t;
Pmongoc_cursor_t  = ^mongoc_cursor_t;
Pmongoc_database_t  = ^mongoc_database_t;
Pmongoc_gridfs_t  = ^mongoc_gridfs_t;
Pmongoc_host_list_t  = ^mongoc_host_list_t;
Pmongoc_read_concern_t  = ^mongoc_read_concern_t;
Pmongoc_read_prefs_t  = ^mongoc_read_prefs_t;
Pmongoc_server_api_t  = ^mongoc_server_api_t;
Pmongoc_server_description_t  = ^mongoc_server_description_t;
Pmongoc_session_opt_t  = ^mongoc_session_opt_t;
Pmongoc_ssl_opt_t  = ^mongoc_ssl_opt_t;
Pmongoc_stream_initiator_t  = ^mongoc_stream_initiator_t;
Pmongoc_stream_t  = ^mongoc_stream_t;
Pmongoc_uri_t  = ^mongoc_uri_t;
Pmongoc_write_concern_t  = ^mongoc_write_concern_t;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2013 MongoDB, Inc.
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
{$ifndef MONGOC_CLIENT_H}
{$define MONGOC_CLIENT_H}
{$include <bson/bson.h>}
{$include "mongoc-apm.h"}
{$include "mongoc-client-side-encryption.h"}
{$include "mongoc-collection.h"}
{$include "mongoc-config.h"}
{$include "mongoc-cursor.h"}
{$include "mongoc-database.h"}
{$include "mongoc-gridfs.h"}
{$include "mongoc-index.h"}
{$include "mongoc-macros.h"}
{$include "mongoc-read-prefs.h"}
{$include "mongoc-server-api.h"}
{$ifdef MONGOC_ENABLE_SSL}
{$include "mongoc-ssl.h"}
{$endif}
{$include "mongoc-stream.h"}
{$include "mongoc-uri.h"}
{$include "mongoc-write-concern.h"}
{$include "mongoc-read-concern.h"}
{$include "mongoc-server-description.h"}
{ This define is part of our public API. But per MongoDB 4.4, there is no
 * longer a size limit on collection names.  }

const
  MONGOC_NAMESPACE_MAX = 128;  
{$ifndef MONGOC_DEFAULT_CONNECTTIMEOUTMS}

const
  MONGOC_DEFAULT_CONNECTTIMEOUTMS = 10*1000;  
{$endif}
{$ifndef MONGOC_DEFAULT_SOCKETTIMEOUTMS}
{
 * NOTE: The default socket timeout for connections is 5 minutes. This
 *       means that if your MongoDB server dies or becomes unavailable
 *       it will take 5 minutes to detect this.
 *
 *       You can change this by providing sockettimeoutms= in your
 *       connection URI.
  }

const
  MONGOC_DEFAULT_SOCKETTIMEOUTMS = (1000*60)*5;  
{$endif}
{*
 * mongoc_client_t:
 *
 * The mongoc_client_t structure maintains information about a connection to
 * a MongoDB server.
  }
type
{*
 * mongoc_stream_initiator_t:
 * @uri: The uri and options for the stream.
 * @host: The host and port (or UNIX domain socket path) to connect to.
 * @user_data: The pointer passed to mongoc_client_set_stream_initiator.
 * @error: A location for an error.
 *
 * Creates a new mongoc_stream_t for the host and port. Begin a
 * non-blocking connect and return immediately.
 *
 * This can be used by language bindings to create network transports other
 * than those built into libmongoc. An example of such would be the streams
 * API provided by PHP.
 *
 * Returns: A newly allocated mongoc_stream_t or NULL on failure.
  }
(* Const before type ignored *)
(* Const before type ignored *)

  Pmongoc_stream_initiator_t = ^Tmongoc_stream_initiator_t;
  Tmongoc_stream_initiator_t = function (uri:Pmongoc_uri_t; host:Pmongoc_host_list_t; user_data:pointer; error:Pbson_error_t):Pmongoc_stream_t;cdecl;
(* Const before type ignored *)

function mongoc_client_new(uri_string:Pchar):Pmongoc_client_t;cdecl;external;
(* Const before type ignored *)
function mongoc_client_new_from_uri(uri:Pmongoc_uri_t):Pmongoc_client_t;cdecl;external;
(* Const before type ignored *)
function mongoc_client_new_from_uri_with_error(uri:Pmongoc_uri_t; error:Pbson_error_t):Pmongoc_client_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_client_get_uri(client:Pmongoc_client_t):Pmongoc_uri_t;cdecl;external;
procedure mongoc_client_set_stream_initiator(client:Pmongoc_client_t; initiator:Tmongoc_stream_initiator_t; user_data:pointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_client_command(client:Pmongoc_client_t; db_name:Pchar; flags:Tmongoc_query_flags_t; skip:Tuint32_t; limit:Tuint32_t; 
           batch_size:Tuint32_t; query:Pbson_t; fields:Pbson_t; read_prefs:Pmongoc_read_prefs_t):Pmongoc_cursor_t;cdecl;external;
procedure mongoc_client_kill_cursor(client:Pmongoc_client_t; cursor_id:Tint64_t);cdecl;external;
{xxxxxxxx ;//xxxxxxxx BSON_GNUC_DEPRECATED;; }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_client_command_simple(client:Pmongoc_client_t; db_name:Pchar; command:Pbson_t; read_prefs:Pmongoc_read_prefs_t; reply:Pbson_t; 
           error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_client_read_command_with_opts(client:Pmongoc_client_t; db_name:Pchar; command:Pbson_t; read_prefs:Pmongoc_read_prefs_t; opts:Pbson_t; 
           reply:Pbson_t; error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_client_write_command_with_opts(client:Pmongoc_client_t; db_name:Pchar; command:Pbson_t; opts:Pbson_t; reply:Pbson_t; 
           error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ IGNORED  }(* Const before type ignored *)
function mongoc_client_read_write_command_with_opts(client:Pmongoc_client_t; db_name:Pchar; command:Pbson_t; read_prefs:Pmongoc_read_prefs_t; opts:Pbson_t; 
           reply:Pbson_t; error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_client_command_with_opts(client:Pmongoc_client_t; db_name:Pchar; command:Pbson_t; read_prefs:Pmongoc_read_prefs_t; opts:Pbson_t; 
           reply:Pbson_t; error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_client_command_simple_with_server_id(client:Pmongoc_client_t; db_name:Pchar; command:Pbson_t; read_prefs:Pmongoc_read_prefs_t; server_id:Tuint32_t; 
           reply:Pbson_t; error:Pbson_error_t):Tbool;cdecl;external;
procedure mongoc_client_destroy(client:Pmongoc_client_t);cdecl;external;
(* Const before type ignored *)
function mongoc_client_start_session(client:Pmongoc_client_t; opts:Pmongoc_session_opt_t; error:Pbson_error_t):Pmongoc_client_session_t;cdecl;external;
(* Const before type ignored *)
function mongoc_client_get_database(client:Pmongoc_client_t; name:Pchar):Pmongoc_database_t;cdecl;external;
function mongoc_client_get_default_database(client:Pmongoc_client_t):Pmongoc_database_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_client_get_gridfs(client:Pmongoc_client_t; db:Pchar; prefix:Pchar; error:Pbson_error_t):Pmongoc_gridfs_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_client_get_collection(client:Pmongoc_client_t; db:Pchar; collection:Pchar):Pmongoc_collection_t;cdecl;external;
function mongoc_client_get_database_names(client:Pmongoc_client_t; error:Pbson_error_t):^Pchar;cdecl;external;
{xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (mongoc_client_get_database_names_with_opts); }
(* Const before type ignored *)
function mongoc_client_get_database_names_with_opts(client:Pmongoc_client_t; opts:Pbson_t; error:Pbson_error_t):^Pchar;cdecl;external;
function mongoc_client_find_databases(client:Pmongoc_client_t; error:Pbson_error_t):Pmongoc_cursor_t;cdecl;external;
{xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (mongoc_client_find_databases_with_opts); }
(* Const before type ignored *)
function mongoc_client_find_databases_with_opts(client:Pmongoc_client_t; opts:Pbson_t):Pmongoc_cursor_t;cdecl;external;
function mongoc_client_get_server_status(client:Pmongoc_client_t; read_prefs:Pmongoc_read_prefs_t; reply:Pbson_t; error:Pbson_error_t):Tbool;cdecl;external;
{xxxxxxxx ;//xxxxxxxx BSON_GNUC_DEPRECATED;; }
function mongoc_client_get_max_message_size(client:Pmongoc_client_t):Tint32_t;cdecl;external;
{xxxxxxxx ;//xxxxxxxx BSON_GNUC_DEPRECATED;; }
function mongoc_client_get_max_bson_size(client:Pmongoc_client_t):Tint32_t;cdecl;external;
{xxxxxxxx ;//xxxxxxxx BSON_GNUC_DEPRECATED;; }
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_client_get_write_concern(client:Pmongoc_client_t):Pmongoc_write_concern_t;cdecl;external;
(* Const before type ignored *)
procedure mongoc_client_set_write_concern(client:Pmongoc_client_t; write_concern:Pmongoc_write_concern_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_client_get_read_concern(client:Pmongoc_client_t):Pmongoc_read_concern_t;cdecl;external;
(* Const before type ignored *)
procedure mongoc_client_set_read_concern(client:Pmongoc_client_t; read_concern:Pmongoc_read_concern_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_client_get_read_prefs(client:Pmongoc_client_t):Pmongoc_read_prefs_t;cdecl;external;
(* Const before type ignored *)
procedure mongoc_client_set_read_prefs(client:Pmongoc_client_t; read_prefs:Pmongoc_read_prefs_t);cdecl;external;
{$ifdef MONGOC_ENABLE_SSL}
(* Const before type ignored *)
procedure mongoc_client_set_ssl_opts(client:Pmongoc_client_t; opts:Pmongoc_ssl_opt_t);cdecl;external;
{$endif}

function mongoc_client_set_apm_callbacks(client:Pmongoc_client_t; callbacks:Pmongoc_apm_callbacks_t; context:pointer):Tbool;cdecl;external;
function mongoc_client_get_server_description(client:Pmongoc_client_t; server_id:Tuint32_t):Pmongoc_server_description_t;cdecl;external;
(* Const before type ignored *)
function mongoc_client_get_server_descriptions(client:Pmongoc_client_t; n:Psize_t):^Pmongoc_server_description_t;cdecl;external;
procedure mongoc_server_descriptions_destroy_all(sds:PPmongoc_server_description_t; n:Tsize_t);cdecl;external;
(* Const before type ignored *)
function mongoc_client_select_server(client:Pmongoc_client_t; for_writes:Tbool; prefs:Pmongoc_read_prefs_t; error:Pbson_error_t):Pmongoc_server_description_t;cdecl;external;
function mongoc_client_set_error_api(client:Pmongoc_client_t; version:Tint32_t):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_client_set_appname(client:Pmongoc_client_t; appname:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_client_watch(client:Pmongoc_client_t; pipeline:Pbson_t; opts:Pbson_t):Pmongoc_change_stream_t;cdecl;external;
procedure mongoc_client_reset(client:Pmongoc_client_t);cdecl;external;
function mongoc_client_enable_auto_encryption(client:Pmongoc_client_t; opts:Pmongoc_auto_encryption_opts_t; error:Pbson_error_t):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_client_get_crypt_shared_version(client:Pmongoc_client_t):Pchar;cdecl;external;
(* Const before type ignored *)
function mongoc_client_set_server_api(client:Pmongoc_client_t; api:Pmongoc_server_api_t; error:Pbson_error_t):Tbool;cdecl;external;
function mongoc_client_get_handshake_description(client:Pmongoc_client_t; server_id:Tuint32_t; opts:Pbson_t; error:Pbson_error_t):Pmongoc_server_description_t;cdecl;external;
{$endif}
{ MONGOC_CLIENT_H  }

implementation


end.
