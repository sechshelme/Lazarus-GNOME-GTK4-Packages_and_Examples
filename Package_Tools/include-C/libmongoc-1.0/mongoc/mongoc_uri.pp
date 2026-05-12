
unit mongoc_uri;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_uri.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_uri.h
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
Pmongoc_host_list_t  = ^mongoc_host_list_t;
Pmongoc_read_concern_t  = ^mongoc_read_concern_t;
Pmongoc_read_prefs_t  = ^mongoc_read_prefs_t;
Pmongoc_uri_t  = ^mongoc_uri_t;
Pmongoc_write_concern_t  = ^mongoc_write_concern_t;
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
{$ifndef MONGOC_URI_H}
{$define MONGOC_URI_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}
{$include "mongoc-host-list.h"}
{$include "mongoc-read-prefs.h"}
{$include "mongoc-read-concern.h"}
{$include "mongoc-write-concern.h"}
{$include "mongoc-config.h"}
{$ifndef MONGOC_DEFAULT_PORT}

const
  MONGOC_DEFAULT_PORT = 27017;  
{$endif}

const
  MONGOC_URI_APPNAME = 'appname';  
  MONGOC_URI_AUTHMECHANISM = 'authmechanism';  
  MONGOC_URI_AUTHMECHANISMPROPERTIES = 'authmechanismproperties';  
  MONGOC_URI_AUTHSOURCE = 'authsource';  
  MONGOC_URI_CANONICALIZEHOSTNAME = 'canonicalizehostname';  
  MONGOC_URI_CONNECTTIMEOUTMS = 'connecttimeoutms';  
  MONGOC_URI_COMPRESSORS = 'compressors';  
  MONGOC_URI_DIRECTCONNECTION = 'directconnection';  
  MONGOC_URI_GSSAPISERVICENAME = 'gssapiservicename';  
  MONGOC_URI_HEARTBEATFREQUENCYMS = 'heartbeatfrequencyms';  
  MONGOC_URI_JOURNAL = 'journal';  
  MONGOC_URI_LOADBALANCED = 'loadbalanced';  
  MONGOC_URI_LOCALTHRESHOLDMS = 'localthresholdms';  
  MONGOC_URI_MAXIDLETIMEMS = 'maxidletimems';  
  MONGOC_URI_MAXPOOLSIZE = 'maxpoolsize';  
  MONGOC_URI_MAXSTALENESSSECONDS = 'maxstalenessseconds';  
  MONGOC_URI_MINPOOLSIZE = 'minpoolsize';  
  MONGOC_URI_READCONCERNLEVEL = 'readconcernlevel';  
  MONGOC_URI_READPREFERENCE = 'readpreference';  
  MONGOC_URI_READPREFERENCETAGS = 'readpreferencetags';  
  MONGOC_URI_REPLICASET = 'replicaset';  
  MONGOC_URI_RETRYREADS = 'retryreads';  
  MONGOC_URI_RETRYWRITES = 'retrywrites';  
  MONGOC_URI_SAFE = 'safe';  
  MONGOC_URI_SERVERSELECTIONTIMEOUTMS = 'serverselectiontimeoutms';  
  MONGOC_URI_SERVERSELECTIONTRYONCE = 'serverselectiontryonce';  
  MONGOC_URI_SLAVEOK = 'slaveok';  
  MONGOC_URI_SOCKETCHECKINTERVALMS = 'socketcheckintervalms';  
  MONGOC_URI_SOCKETTIMEOUTMS = 'sockettimeoutms';  
  MONGOC_URI_SRVSERVICENAME = 'srvservicename';  
  MONGOC_URI_SRVMAXHOSTS = 'srvmaxhosts';  
  MONGOC_URI_TLS = 'tls';  
  MONGOC_URI_TLSCERTIFICATEKEYFILE = 'tlscertificatekeyfile';  
  MONGOC_URI_TLSCERTIFICATEKEYFILEPASSWORD = 'tlscertificatekeyfilepassword';  
  MONGOC_URI_TLSCAFILE = 'tlscafile';  
  MONGOC_URI_TLSALLOWINVALIDCERTIFICATES = 'tlsallowinvalidcertificates';  
  MONGOC_URI_TLSALLOWINVALIDHOSTNAMES = 'tlsallowinvalidhostnames';  
  MONGOC_URI_TLSINSECURE = 'tlsinsecure';  
  MONGOC_URI_TLSDISABLECERTIFICATEREVOCATIONCHECK = 'tlsdisablecertificaterevocationcheck';  
  MONGOC_URI_TLSDISABLEOCSPENDPOINTCHECK = 'tlsdisableocspendpointcheck';  
  MONGOC_URI_W = 'w';  
  MONGOC_URI_WAITQUEUEMULTIPLE = 'waitqueuemultiple';  
  MONGOC_URI_WAITQUEUETIMEOUTMS = 'waitqueuetimeoutms';  
  MONGOC_URI_WTIMEOUTMS = 'wtimeoutms';  
  MONGOC_URI_ZLIBCOMPRESSIONLEVEL = 'zlibcompressionlevel';  
{ Deprecated in MongoDB 4.2, use "tls" variants instead.  }
  MONGOC_URI_SSL = 'ssl';  
  MONGOC_URI_SSLCLIENTCERTIFICATEKEYFILE = 'sslclientcertificatekeyfile';  
  MONGOC_URI_SSLCLIENTCERTIFICATEKEYPASSWORD = 'sslclientcertificatekeypassword';  
  MONGOC_URI_SSLCERTIFICATEAUTHORITYFILE = 'sslcertificateauthorityfile';  
  MONGOC_URI_SSLALLOWINVALIDCERTIFICATES = 'sslallowinvalidcertificates';  
  MONGOC_URI_SSLALLOWINVALIDHOSTNAMES = 'sslallowinvalidhostnames';  
type
(* Const before type ignored *)

function mongoc_uri_copy(uri:Pmongoc_uri_t):Pmongoc_uri_t;cdecl;external;
procedure mongoc_uri_destroy(uri:Pmongoc_uri_t);cdecl;external;
(* Const before type ignored *)
function mongoc_uri_new(uri_string:Pchar):Pmongoc_uri_t;cdecl;external;
(* Const before type ignored *)
function mongoc_uri_new_with_error(uri_string:Pchar; error:Pbson_error_t):Pmongoc_uri_t;cdecl;external;
(* Const before type ignored *)
function mongoc_uri_new_for_host_port(hostname:Pchar; port:Tuint16_t):Pmongoc_uri_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_uri_get_hosts(uri:Pmongoc_uri_t):Pmongoc_host_list_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_uri_get_service(uri:Pmongoc_uri_t):Pchar;cdecl;external;
{xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (mongoc_uri_get_srv_hostname); }
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_uri_get_srv_hostname(uri:Pmongoc_uri_t):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_uri_get_srv_service_name(uri:Pmongoc_uri_t):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_uri_get_database(uri:Pmongoc_uri_t):Pchar;cdecl;external;
(* Const before type ignored *)
function mongoc_uri_set_database(uri:Pmongoc_uri_t; database:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_uri_get_compressors(uri:Pmongoc_uri_t):Pbson_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_uri_get_options(uri:Pmongoc_uri_t):Pbson_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_uri_get_password(uri:Pmongoc_uri_t):Pchar;cdecl;external;
(* Const before type ignored *)
function mongoc_uri_set_password(uri:Pmongoc_uri_t; password:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_uri_has_option(uri:Pmongoc_uri_t; key:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_uri_option_is_int32(key:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_uri_option_is_int64(key:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_uri_option_is_bool(key:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_uri_option_is_utf8(key:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_uri_get_option_as_int32(uri:Pmongoc_uri_t; option:Pchar; fallback:Tint32_t):Tint32_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_uri_get_option_as_int64(uri:Pmongoc_uri_t; option:Pchar; fallback:Tint64_t):Tint64_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_uri_get_option_as_bool(uri:Pmongoc_uri_t; option:Pchar; fallback:Tbool):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_uri_get_option_as_utf8(uri:Pmongoc_uri_t; option:Pchar; fallback:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function mongoc_uri_set_option_as_int32(uri:Pmongoc_uri_t; option:Pchar; value:Tint32_t):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_uri_set_option_as_int64(uri:Pmongoc_uri_t; option:Pchar; value:Tint64_t):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_uri_set_option_as_bool(uri:Pmongoc_uri_t; option:Pchar; value:Tbool):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_uri_set_option_as_utf8(uri:Pmongoc_uri_t; option:Pchar; value:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_uri_get_read_prefs(uri:Pmongoc_uri_t):Pbson_t;cdecl;external;
{xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (mongoc_uri_get_read_prefs_t); }
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_uri_get_replica_set(uri:Pmongoc_uri_t):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_uri_get_string(uri:Pmongoc_uri_t):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_uri_get_username(uri:Pmongoc_uri_t):Pchar;cdecl;external;
(* Const before type ignored *)
function mongoc_uri_set_username(uri:Pmongoc_uri_t; username:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_uri_get_credentials(uri:Pmongoc_uri_t):Pbson_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_uri_get_auth_source(uri:Pmongoc_uri_t):Pchar;cdecl;external;
(* Const before type ignored *)
function mongoc_uri_set_auth_source(uri:Pmongoc_uri_t; value:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_uri_get_appname(uri:Pmongoc_uri_t):Pchar;cdecl;external;
(* Const before type ignored *)
function mongoc_uri_set_appname(uri:Pmongoc_uri_t; value:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_uri_set_compressors(uri:Pmongoc_uri_t; value:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_uri_get_auth_mechanism(uri:Pmongoc_uri_t):Pchar;cdecl;external;
(* Const before type ignored *)
function mongoc_uri_set_auth_mechanism(uri:Pmongoc_uri_t; value:Pchar):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_uri_get_mechanism_properties(uri:Pmongoc_uri_t; properties:Pbson_t):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_uri_set_mechanism_properties(uri:Pmongoc_uri_t; properties:Pbson_t):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_uri_get_ssl(uri:Pmongoc_uri_t):Tbool;cdecl;external;
{xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (mongoc_uri_get_tls); }
(* Const before type ignored *)
function mongoc_uri_get_tls(uri:Pmongoc_uri_t):Tbool;cdecl;external;
(* Const before type ignored *)
function mongoc_uri_unescape(escaped_string:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_uri_get_read_prefs_t(uri:Pmongoc_uri_t):Pmongoc_read_prefs_t;cdecl;external;
(* Const before type ignored *)
procedure mongoc_uri_set_read_prefs_t(uri:Pmongoc_uri_t; prefs:Pmongoc_read_prefs_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_uri_get_write_concern(uri:Pmongoc_uri_t):Pmongoc_write_concern_t;cdecl;external;
(* Const before type ignored *)
procedure mongoc_uri_set_write_concern(uri:Pmongoc_uri_t; wc:Pmongoc_write_concern_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function mongoc_uri_get_read_concern(uri:Pmongoc_uri_t):Pmongoc_read_concern_t;cdecl;external;
(* Const before type ignored *)
procedure mongoc_uri_set_read_concern(uri:Pmongoc_uri_t; rc:Pmongoc_read_concern_t);cdecl;external;
{$endif}
{ MONGOC_URI_H  }

implementation


end.
