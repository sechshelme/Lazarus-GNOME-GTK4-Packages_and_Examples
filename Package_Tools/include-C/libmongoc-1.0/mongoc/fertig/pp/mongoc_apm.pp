
unit mongoc_apm;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_apm.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_apm.h
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
Pbson_oid_t  = ^bson_oid_t;
Pbson_t  = ^bson_t;
Pchar  = ^char;
Pmongoc_apm_callbacks_t  = ^mongoc_apm_callbacks_t;
Pmongoc_apm_command_failed_t  = ^mongoc_apm_command_failed_t;
Pmongoc_apm_command_started_t  = ^mongoc_apm_command_started_t;
Pmongoc_apm_command_succeeded_t  = ^mongoc_apm_command_succeeded_t;
Pmongoc_apm_server_changed_t  = ^mongoc_apm_server_changed_t;
Pmongoc_apm_server_closed_t  = ^mongoc_apm_server_closed_t;
Pmongoc_apm_server_heartbeat_failed_t  = ^mongoc_apm_server_heartbeat_failed_t;
Pmongoc_apm_server_heartbeat_started_t  = ^mongoc_apm_server_heartbeat_started_t;
Pmongoc_apm_server_heartbeat_succeeded_t  = ^mongoc_apm_server_heartbeat_succeeded_t;
Pmongoc_apm_server_opening_t  = ^mongoc_apm_server_opening_t;
Pmongoc_apm_topology_changed_t  = ^mongoc_apm_topology_changed_t;
Pmongoc_apm_topology_closed_t  = ^mongoc_apm_topology_closed_t;
Pmongoc_apm_topology_opening_t  = ^mongoc_apm_topology_opening_t;
Pmongoc_host_list_t  = ^mongoc_host_list_t;
Pmongoc_server_description_t  = ^mongoc_server_description_t;
Pmongoc_topology_description_t  = ^mongoc_topology_description_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2015 MongoDB, Inc.
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
{$ifndef MONGOC_APM_H}
{$define MONGOC_APM_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}
{$include "mongoc-host-list.h"}
{$include "mongoc-server-description.h"}
{$include "mongoc-topology-description.h"}
{
 * Application Performance Management (APM) interface, complies with two specs.
 * MongoDB's Command Logging and Monitoring Spec:
 *
 * https://github.com/mongodb/specifications/tree/master/source/command-logging-and-monitoring
 *
 * MongoDB's Spec for Monitoring Server Discovery and Monitoring (SDAM) events:
 *
 * https://github.com/mongodb/specifications/tree/master/source/server-discovery-and-monitoring
 *
  }
{
 * callbacks to receive APM events
  }
type
{
 * command monitoring events
  }
{
 * SDAM monitoring events
  }
{
 * event field accessors
  }
{ command-started event fields  }
(* Const before type ignored *)
(* Const before type ignored *)

function mongoc_apm_command_started_get_command(event:Pmongoc_apm_command_started_t):Pbson_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_apm_command_started_get_database_name(event:Pmongoc_apm_command_started_t):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_apm_command_started_get_command_name(event:Pmongoc_apm_command_started_t):Pchar;cdecl;external;
(* Const before type ignored *)
function mongoc_apm_command_started_get_request_id(event:Pmongoc_apm_command_started_t):Tint64_t;cdecl;external;
(* Const before type ignored *)
function mongoc_apm_command_started_get_operation_id(event:Pmongoc_apm_command_started_t):Tint64_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_apm_command_started_get_host(event:Pmongoc_apm_command_started_t):Pmongoc_host_list_t;cdecl;external;
(* Const before type ignored *)
function mongoc_apm_command_started_get_server_id(event:Pmongoc_apm_command_started_t):Tuint32_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_apm_command_started_get_service_id(event:Pmongoc_apm_command_started_t):Pbson_oid_t;cdecl;external;
(* Const before type ignored *)
function mongoc_apm_command_started_get_server_connection_id(event:Pmongoc_apm_command_started_t):Tint32_t;cdecl;external;
{xxxxxxxxxxxxxxx   BSON_GNUC_DEPRECATED_FOR (      "mongoc_apm_command_started_get_server_connection_id_int64"); }
(* Const before type ignored *)
function mongoc_apm_command_started_get_server_connection_id_int64(event:Pmongoc_apm_command_started_t):Tint64_t;cdecl;external;
(* Const before type ignored *)
function mongoc_apm_command_started_get_context(event:Pmongoc_apm_command_started_t):pointer;cdecl;external;
{ command-succeeded event fields  }
(* Const before type ignored *)
function mongoc_apm_command_succeeded_get_duration(event:Pmongoc_apm_command_succeeded_t):Tint64_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_apm_command_succeeded_get_reply(event:Pmongoc_apm_command_succeeded_t):Pbson_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_apm_command_succeeded_get_command_name(event:Pmongoc_apm_command_succeeded_t):Pchar;cdecl;external;
(* Const before type ignored *)
function mongoc_apm_command_succeeded_get_request_id(event:Pmongoc_apm_command_succeeded_t):Tint64_t;cdecl;external;
(* Const before type ignored *)
function mongoc_apm_command_succeeded_get_operation_id(event:Pmongoc_apm_command_succeeded_t):Tint64_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_apm_command_succeeded_get_host(event:Pmongoc_apm_command_succeeded_t):Pmongoc_host_list_t;cdecl;external;
(* Const before type ignored *)
function mongoc_apm_command_succeeded_get_server_id(event:Pmongoc_apm_command_succeeded_t):Tuint32_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_apm_command_succeeded_get_service_id(event:Pmongoc_apm_command_succeeded_t):Pbson_oid_t;cdecl;external;
(* Const before type ignored *)
function mongoc_apm_command_succeeded_get_server_connection_id(event:Pmongoc_apm_command_succeeded_t):Tint32_t;cdecl;external;
{xxxxxxxxxxxx   BSON_GNUC_DEPRECATED_FOR (      "mongoc_apm_command_succeeded_get_server_connection_id_int64"); }
(* Const before type ignored *)
function mongoc_apm_command_succeeded_get_server_connection_id_int64(event:Pmongoc_apm_command_succeeded_t):Tint64_t;cdecl;external;
(* Const before type ignored *)
function mongoc_apm_command_succeeded_get_context(event:Pmongoc_apm_command_succeeded_t):pointer;cdecl;external;
{ command-failed event fields  }
(* Const before type ignored *)
function mongoc_apm_command_failed_get_duration(event:Pmongoc_apm_command_failed_t):Tint64_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_apm_command_failed_get_command_name(event:Pmongoc_apm_command_failed_t):Pchar;cdecl;external;
{ retrieve the error by filling out the passed-in "error" struct  }
(* Const before type ignored *)
procedure mongoc_apm_command_failed_get_error(event:Pmongoc_apm_command_failed_t; error:Pbson_error_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_apm_command_failed_get_reply(event:Pmongoc_apm_command_failed_t):Pbson_t;cdecl;external;
(* Const before type ignored *)
function mongoc_apm_command_failed_get_request_id(event:Pmongoc_apm_command_failed_t):Tint64_t;cdecl;external;
(* Const before type ignored *)
function mongoc_apm_command_failed_get_operation_id(event:Pmongoc_apm_command_failed_t):Tint64_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_apm_command_failed_get_host(event:Pmongoc_apm_command_failed_t):Pmongoc_host_list_t;cdecl;external;
(* Const before type ignored *)
function mongoc_apm_command_failed_get_server_id(event:Pmongoc_apm_command_failed_t):Tuint32_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_apm_command_failed_get_service_id(event:Pmongoc_apm_command_failed_t):Pbson_oid_t;cdecl;external;
(* Const before type ignored *)
function mongoc_apm_command_failed_get_server_connection_id(event:Pmongoc_apm_command_failed_t):Tint32_t;cdecl;external;
{xxxxxxxxxxx   BSON_GNUC_DEPRECATED_FOR (      "mongoc_apm_command_failed_get_server_connection_id_int64"); }
(* Const before type ignored *)
function mongoc_apm_command_failed_get_server_connection_id_int64(event:Pmongoc_apm_command_failed_t):Tint64_t;cdecl;external;
(* Const before type ignored *)
function mongoc_apm_command_failed_get_context(event:Pmongoc_apm_command_failed_t):pointer;cdecl;external;
{ server-changed event fields  }
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_apm_server_changed_get_host(event:Pmongoc_apm_server_changed_t):Pmongoc_host_list_t;cdecl;external;
(* Const before type ignored *)
procedure mongoc_apm_server_changed_get_topology_id(event:Pmongoc_apm_server_changed_t; topology_id:Pbson_oid_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_apm_server_changed_get_previous_description(event:Pmongoc_apm_server_changed_t):Pmongoc_server_description_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_apm_server_changed_get_new_description(event:Pmongoc_apm_server_changed_t):Pmongoc_server_description_t;cdecl;external;
(* Const before type ignored *)
function mongoc_apm_server_changed_get_context(event:Pmongoc_apm_server_changed_t):pointer;cdecl;external;
{ server-opening event fields  }
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_apm_server_opening_get_host(event:Pmongoc_apm_server_opening_t):Pmongoc_host_list_t;cdecl;external;
(* Const before type ignored *)
procedure mongoc_apm_server_opening_get_topology_id(event:Pmongoc_apm_server_opening_t; topology_id:Pbson_oid_t);cdecl;external;
(* Const before type ignored *)
function mongoc_apm_server_opening_get_context(event:Pmongoc_apm_server_opening_t):pointer;cdecl;external;
{ server-closed event fields  }
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_apm_server_closed_get_host(event:Pmongoc_apm_server_closed_t):Pmongoc_host_list_t;cdecl;external;
(* Const before type ignored *)
procedure mongoc_apm_server_closed_get_topology_id(event:Pmongoc_apm_server_closed_t; topology_id:Pbson_oid_t);cdecl;external;
(* Const before type ignored *)
function mongoc_apm_server_closed_get_context(event:Pmongoc_apm_server_closed_t):pointer;cdecl;external;
{ topology-changed event fields  }
(* Const before type ignored *)
procedure mongoc_apm_topology_changed_get_topology_id(event:Pmongoc_apm_topology_changed_t; topology_id:Pbson_oid_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_apm_topology_changed_get_previous_description(event:Pmongoc_apm_topology_changed_t):Pmongoc_topology_description_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_apm_topology_changed_get_new_description(event:Pmongoc_apm_topology_changed_t):Pmongoc_topology_description_t;cdecl;external;
(* Const before type ignored *)
function mongoc_apm_topology_changed_get_context(event:Pmongoc_apm_topology_changed_t):pointer;cdecl;external;
{ topology-opening event field  }
(* Const before type ignored *)
procedure mongoc_apm_topology_opening_get_topology_id(event:Pmongoc_apm_topology_opening_t; topology_id:Pbson_oid_t);cdecl;external;
(* Const before type ignored *)
function mongoc_apm_topology_opening_get_context(event:Pmongoc_apm_topology_opening_t):pointer;cdecl;external;
{ topology-closed event field  }
(* Const before type ignored *)
procedure mongoc_apm_topology_closed_get_topology_id(event:Pmongoc_apm_topology_closed_t; topology_id:Pbson_oid_t);cdecl;external;
(* Const before type ignored *)
function mongoc_apm_topology_closed_get_context(event:Pmongoc_apm_topology_closed_t):pointer;cdecl;external;
{ heartbeat-started event field  }
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_apm_server_heartbeat_started_get_host(event:Pmongoc_apm_server_heartbeat_started_t):Pmongoc_host_list_t;cdecl;external;
(* Const before type ignored *)
function mongoc_apm_server_heartbeat_started_get_context(event:Pmongoc_apm_server_heartbeat_started_t):pointer;cdecl;external;
(* Const before type ignored *)
function mongoc_apm_server_heartbeat_started_get_awaited(event:Pmongoc_apm_server_heartbeat_started_t):Tbool;cdecl;external;
{ heartbeat-succeeded event fields  }
(* Const before type ignored *)
function mongoc_apm_server_heartbeat_succeeded_get_duration(event:Pmongoc_apm_server_heartbeat_succeeded_t):Tint64_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_apm_server_heartbeat_succeeded_get_reply(event:Pmongoc_apm_server_heartbeat_succeeded_t):Pbson_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_apm_server_heartbeat_succeeded_get_host(event:Pmongoc_apm_server_heartbeat_succeeded_t):Pmongoc_host_list_t;cdecl;external;
(* Const before type ignored *)
function mongoc_apm_server_heartbeat_succeeded_get_context(event:Pmongoc_apm_server_heartbeat_succeeded_t):pointer;cdecl;external;
(* Const before type ignored *)
function mongoc_apm_server_heartbeat_succeeded_get_awaited(event:Pmongoc_apm_server_heartbeat_succeeded_t):Tbool;cdecl;external;
{ heartbeat-failed event fields  }
(* Const before type ignored *)
function mongoc_apm_server_heartbeat_failed_get_duration(event:Pmongoc_apm_server_heartbeat_failed_t):Tint64_t;cdecl;external;
(* Const before type ignored *)
procedure mongoc_apm_server_heartbeat_failed_get_error(event:Pmongoc_apm_server_heartbeat_failed_t; error:Pbson_error_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_apm_server_heartbeat_failed_get_host(event:Pmongoc_apm_server_heartbeat_failed_t):Pmongoc_host_list_t;cdecl;external;
(* Const before type ignored *)
function mongoc_apm_server_heartbeat_failed_get_context(event:Pmongoc_apm_server_heartbeat_failed_t):pointer;cdecl;external;
(* Const before type ignored *)
function mongoc_apm_server_heartbeat_failed_get_awaited(event:Pmongoc_apm_server_heartbeat_failed_t):Tbool;cdecl;external;
{
 * callbacks
  }
(* Const before type ignored *)
type

  Tmongoc_apm_command_started_cb_t = procedure (event:Pmongoc_apm_command_started_t);cdecl;
(* Const before type ignored *)

  Tmongoc_apm_command_succeeded_cb_t = procedure (event:Pmongoc_apm_command_succeeded_t);cdecl;
(* Const before type ignored *)

  Tmongoc_apm_command_failed_cb_t = procedure (event:Pmongoc_apm_command_failed_t);cdecl;
(* Const before type ignored *)

  Tmongoc_apm_server_changed_cb_t = procedure (event:Pmongoc_apm_server_changed_t);cdecl;
(* Const before type ignored *)

  Tmongoc_apm_server_opening_cb_t = procedure (event:Pmongoc_apm_server_opening_t);cdecl;
(* Const before type ignored *)

  Tmongoc_apm_server_closed_cb_t = procedure (event:Pmongoc_apm_server_closed_t);cdecl;
(* Const before type ignored *)

  Tmongoc_apm_topology_changed_cb_t = procedure (event:Pmongoc_apm_topology_changed_t);cdecl;
(* Const before type ignored *)

  Tmongoc_apm_topology_opening_cb_t = procedure (event:Pmongoc_apm_topology_opening_t);cdecl;
(* Const before type ignored *)

  Tmongoc_apm_topology_closed_cb_t = procedure (event:Pmongoc_apm_topology_closed_t);cdecl;
(* Const before type ignored *)

  Tmongoc_apm_server_heartbeat_started_cb_t = procedure (event:Pmongoc_apm_server_heartbeat_started_t);cdecl;
(* Const before type ignored *)

  Tmongoc_apm_server_heartbeat_succeeded_cb_t = procedure (event:Pmongoc_apm_server_heartbeat_succeeded_t);cdecl;
(* Const before type ignored *)

  Tmongoc_apm_server_heartbeat_failed_cb_t = procedure (event:Pmongoc_apm_server_heartbeat_failed_t);cdecl;
{
 * registering callbacks
  }

function mongoc_apm_callbacks_new:Pmongoc_apm_callbacks_t;cdecl;external;
procedure mongoc_apm_callbacks_destroy(callbacks:Pmongoc_apm_callbacks_t);cdecl;external;
procedure mongoc_apm_set_command_started_cb(callbacks:Pmongoc_apm_callbacks_t; cb:Tmongoc_apm_command_started_cb_t);cdecl;external;
procedure mongoc_apm_set_command_succeeded_cb(callbacks:Pmongoc_apm_callbacks_t; cb:Tmongoc_apm_command_succeeded_cb_t);cdecl;external;
procedure mongoc_apm_set_command_failed_cb(callbacks:Pmongoc_apm_callbacks_t; cb:Tmongoc_apm_command_failed_cb_t);cdecl;external;
procedure mongoc_apm_set_server_changed_cb(callbacks:Pmongoc_apm_callbacks_t; cb:Tmongoc_apm_server_changed_cb_t);cdecl;external;
procedure mongoc_apm_set_server_opening_cb(callbacks:Pmongoc_apm_callbacks_t; cb:Tmongoc_apm_server_opening_cb_t);cdecl;external;
procedure mongoc_apm_set_server_closed_cb(callbacks:Pmongoc_apm_callbacks_t; cb:Tmongoc_apm_server_closed_cb_t);cdecl;external;
procedure mongoc_apm_set_topology_changed_cb(callbacks:Pmongoc_apm_callbacks_t; cb:Tmongoc_apm_topology_changed_cb_t);cdecl;external;
procedure mongoc_apm_set_topology_opening_cb(callbacks:Pmongoc_apm_callbacks_t; cb:Tmongoc_apm_topology_opening_cb_t);cdecl;external;
procedure mongoc_apm_set_topology_closed_cb(callbacks:Pmongoc_apm_callbacks_t; cb:Tmongoc_apm_topology_closed_cb_t);cdecl;external;
procedure mongoc_apm_set_server_heartbeat_started_cb(callbacks:Pmongoc_apm_callbacks_t; cb:Tmongoc_apm_server_heartbeat_started_cb_t);cdecl;external;
procedure mongoc_apm_set_server_heartbeat_succeeded_cb(callbacks:Pmongoc_apm_callbacks_t; cb:Tmongoc_apm_server_heartbeat_succeeded_cb_t);cdecl;external;
procedure mongoc_apm_set_server_heartbeat_failed_cb(callbacks:Pmongoc_apm_callbacks_t; cb:Tmongoc_apm_server_heartbeat_failed_cb_t);cdecl;external;
{$endif}
{ MONGOC_APM_H  }

implementation


end.
