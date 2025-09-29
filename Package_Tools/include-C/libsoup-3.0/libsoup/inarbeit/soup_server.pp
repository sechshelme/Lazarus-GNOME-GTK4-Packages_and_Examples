
unit soup_server;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_server.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_server.h
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
Pchar  = ^char;
PGError  = ^GError;
PGHashTable  = ^GHashTable;
PGIOStream  = ^GIOStream;
PGSList  = ^GSList;
PGSocket  = ^GSocket;
PGSocketAddress  = ^GSocketAddress;
PGTlsCertificate  = ^GTlsCertificate;
PGTlsDatabase  = ^GTlsDatabase;
PSoupAuthDomain  = ^SoupAuthDomain;
PSoupServer  = ^SoupServer;
PSoupServerClass  = ^SoupServerClass;
PSoupServerListenOptions  = ^SoupServerListenOptions;
PSoupServerMessage  = ^SoupServerMessage;
PSoupWebsocketConnection  = ^SoupWebsocketConnection;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2000-2003, Ximian, Inc.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}
{$include "soup-uri-utils.h"}
{$include "soup-websocket-connection.h"}

{ was #define dname def_expr }
function SOUP_TYPE_SERVER : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (SoupServer, soup_server, SOUP, SERVER, GObject) }
type
  PSoupServerListenOptions = ^TSoupServerListenOptions;
  TSoupServerListenOptions =  Longint;
  Const
    SOUP_SERVER_LISTEN_HTTPS = 1 shl 0;
    SOUP_SERVER_LISTEN_IPV4_ONLY = 1 shl 1;
    SOUP_SERVER_LISTEN_IPV6_ONLY = 1 shl 2;
;
{ signals  }
type
  PSoupServerClass = ^TSoupServerClass;
  TSoupServerClass = record
      parent_class : TGObjectClass;
      request_started : procedure (server:PSoupServer; msg:PSoupServerMessage);cdecl;
      request_read : procedure (server:PSoupServer; msg:PSoupServerMessage);cdecl;
      request_finished : procedure (server:PSoupServer; msg:PSoupServerMessage);cdecl;
      request_aborted : procedure (server:PSoupServer; msg:PSoupServerMessage);cdecl;
      padding : array[0..5] of Tgpointer;
    end;

(* Const before type ignored *)

function soup_server_new(optname1:Pchar; args:array of const):PSoupServer;cdecl;external;
function soup_server_new(optname1:Pchar):PSoupServer;cdecl;external;
procedure soup_server_set_tls_certificate(server:PSoupServer; certificate:PGTlsCertificate);cdecl;external;
function soup_server_get_tls_certificate(server:PSoupServer):PGTlsCertificate;cdecl;external;
procedure soup_server_set_tls_database(server:PSoupServer; tls_database:PGTlsDatabase);cdecl;external;
function soup_server_get_tls_database(server:PSoupServer):PGTlsDatabase;cdecl;external;
procedure soup_server_set_tls_auth_mode(server:PSoupServer; mode:TGTlsAuthenticationMode);cdecl;external;
function soup_server_get_tls_auth_mode(server:PSoupServer):TGTlsAuthenticationMode;cdecl;external;
function soup_server_is_https(server:PSoupServer):Tgboolean;cdecl;external;
function soup_server_listen(server:PSoupServer; address:PGSocketAddress; options:TSoupServerListenOptions; error:PPGError):Tgboolean;cdecl;external;
function soup_server_listen_all(server:PSoupServer; port:Tguint; options:TSoupServerListenOptions; error:PPGError):Tgboolean;cdecl;external;
function soup_server_listen_local(server:PSoupServer; port:Tguint; options:TSoupServerListenOptions; error:PPGError):Tgboolean;cdecl;external;
function soup_server_listen_socket(server:PSoupServer; socket:PGSocket; options:TSoupServerListenOptions; error:PPGError):Tgboolean;cdecl;external;
function soup_server_get_uris(server:PSoupServer):PGSList;cdecl;external;
function soup_server_get_listeners(server:PSoupServer):PGSList;cdecl;external;
procedure soup_server_disconnect(server:PSoupServer);cdecl;external;
function soup_server_accept_iostream(server:PSoupServer; stream:PGIOStream; local_addr:PGSocketAddress; remote_addr:PGSocketAddress; error:PPGError):Tgboolean;cdecl;external;
{ Handlers and auth  }
(* Const before type ignored *)
type

  TSoupServerCallback = procedure (server:PSoupServer; msg:PSoupServerMessage; path:Pchar; query:PGHashTable; user_data:Tgpointer);cdecl;
(* Const before type ignored *)

procedure soup_server_add_handler(server:PSoupServer; path:Pchar; callback:TSoupServerCallback; user_data:Tgpointer; destroy:TGDestroyNotify);cdecl;external;
(* Const before type ignored *)
procedure soup_server_add_early_handler(server:PSoupServer; path:Pchar; callback:TSoupServerCallback; user_data:Tgpointer; destroy:TGDestroyNotify);cdecl;external;
(* Const before type ignored *)
type

  TSoupServerWebsocketCallback = procedure (server:PSoupServer; msg:PSoupServerMessage; path:Pchar; connection:PSoupWebsocketConnection; user_data:Tgpointer);cdecl;
(* Const before type ignored *)
(* Const before type ignored *)

procedure soup_server_add_websocket_handler(server:PSoupServer; path:Pchar; origin:Pchar; protocols:PPchar; callback:TSoupServerWebsocketCallback; 
            user_data:Tgpointer; destroy:TGDestroyNotify);cdecl;external;
procedure soup_server_add_websocket_extension(server:PSoupServer; extension_type:TGType);cdecl;external;
procedure soup_server_remove_websocket_extension(server:PSoupServer; extension_type:TGType);cdecl;external;
(* Const before type ignored *)
procedure soup_server_remove_handler(server:PSoupServer; path:Pchar);cdecl;external;
procedure soup_server_add_auth_domain(server:PSoupServer; auth_domain:PSoupAuthDomain);cdecl;external;
procedure soup_server_remove_auth_domain(server:PSoupServer; auth_domain:PSoupAuthDomain);cdecl;external;
{ I/O  }
procedure soup_server_pause_message(server:PSoupServer; msg:PSoupServerMessage);cdecl;external;
{ SOUP_DEPRECATED_IN_3_2_FOR(soup_server_message_pause) }
procedure soup_server_unpause_message(server:PSoupServer; msg:PSoupServerMessage);cdecl;external;
{ SOUP_DEPRECATED_IN_3_2_FOR(soup_server_message_unpause) }

implementation

{ was #define dname def_expr }
function SOUP_TYPE_SERVER : longint; { return type might be wrong }
  begin
    SOUP_TYPE_SERVER:=soup_server_get_type;
  end;


end.
