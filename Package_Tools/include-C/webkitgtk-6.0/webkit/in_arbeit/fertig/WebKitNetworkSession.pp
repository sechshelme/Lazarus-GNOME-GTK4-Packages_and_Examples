
unit WebKitNetworkSession;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitNetworkSession.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitNetworkSession.h
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
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PGList  = ^GList;
PGTlsCertificate  = ^GTlsCertificate;
PWebKitCookieManager  = ^WebKitCookieManager;
PWebKitDownload  = ^WebKitDownload;
PWebKitMemoryPressureSettings  = ^WebKitMemoryPressureSettings;
PWebKitNetworkProxySettings  = ^WebKitNetworkProxySettings;
PWebKitNetworkSession  = ^WebKitNetworkSession;
PWebKitWebsiteDataManager  = ^WebKitWebsiteDataManager;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2023 Igalia S.L.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public License
 * along with this library; see the file COPYING.LIB.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$if !defined(__WEBKIT_H_INSIDE__) && !defined(BUILDING_WEBKIT)}
{$error "Only <webkit/webkit.h> can be included directly."}
{$endif}
{$ifndef WebKitNetworkSession_h}
{$define WebKitNetworkSession_h}
{$include <gio/gio.h>}
{$include <webkit/WebKitCookieManager.h>}
{$include <webkit/WebKitDefines.h>}
{$include <webkit/WebKitDownload.h>}
{$include <webkit/WebKitMemoryPressureSettings.h>}
{$include <webkit/WebKitNetworkProxySettings.h>}
{$include <webkit/WebKitWebsiteDataManager.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_NETWORK_SESSION : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitNetworkSession, webkit_network_session, WEBKIT, NETWORK_SESSION, GObject) }
function webkit_network_session_get_default:PWebKitNetworkSession;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function webkit_network_session_new(data_directory:Pchar; cache_directory:Pchar):PWebKitNetworkSession;cdecl;external;
function webkit_network_session_new_ephemeral:PWebKitNetworkSession;cdecl;external;
function webkit_network_session_is_ephemeral(session:PWebKitNetworkSession):Tgboolean;cdecl;external;
function webkit_network_session_get_website_data_manager(session:PWebKitNetworkSession):PWebKitWebsiteDataManager;cdecl;external;
function webkit_network_session_get_cookie_manager(session:PWebKitNetworkSession):PWebKitCookieManager;cdecl;external;
procedure webkit_network_session_set_itp_enabled(session:PWebKitNetworkSession; enabled:Tgboolean);cdecl;external;
function webkit_network_session_get_itp_enabled(session:PWebKitNetworkSession):Tgboolean;cdecl;external;
procedure webkit_network_session_set_persistent_credential_storage_enabled(session:PWebKitNetworkSession; enabled:Tgboolean);cdecl;external;
function webkit_network_session_get_persistent_credential_storage_enabled(session:PWebKitNetworkSession):Tgboolean;cdecl;external;
procedure webkit_network_session_set_tls_errors_policy(session:PWebKitNetworkSession; policy:TWebKitTLSErrorsPolicy);cdecl;external;
function webkit_network_session_get_tls_errors_policy(session:PWebKitNetworkSession):TWebKitTLSErrorsPolicy;cdecl;external;
(* Const before type ignored *)
procedure webkit_network_session_allow_tls_certificate_for_host(session:PWebKitNetworkSession; certificate:PGTlsCertificate; host:Pchar);cdecl;external;
procedure webkit_network_session_set_proxy_settings(session:PWebKitNetworkSession; proxy_mode:TWebKitNetworkProxyMode; proxy_settings:PWebKitNetworkProxySettings);cdecl;external;
procedure webkit_network_session_set_memory_pressure_settings(settings:PWebKitMemoryPressureSettings);cdecl;external;
procedure webkit_network_session_get_itp_summary(session:PWebKitNetworkSession; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function webkit_network_session_get_itp_summary_finish(session:PWebKitNetworkSession; result:PGAsyncResult; error:PPGError):PGList;cdecl;external;
(* Const before type ignored *)
procedure webkit_network_session_prefetch_dns(session:PWebKitNetworkSession; hostname:Pchar);cdecl;external;
(* Const before type ignored *)
function webkit_network_session_download_uri(session:PWebKitNetworkSession; uri:Pchar):PWebKitDownload;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_NETWORK_SESSION : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_NETWORK_SESSION:=webkit_network_session_get_type;
  end;


end.
