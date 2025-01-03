
unit WebKitWebsiteDataManager;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitWebsiteDataManager.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitWebsiteDataManager.h
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
Pgchar  = ^gchar;
PGDateTime  = ^GDateTime;
PGError  = ^GError;
PGList  = ^GList;
PWebKitFaviconDatabase  = ^WebKitFaviconDatabase;
PWebKitITPFirstParty  = ^WebKitITPFirstParty;
PWebKitITPThirdParty  = ^WebKitITPThirdParty;
PWebKitTLSErrorsPolicy  = ^WebKitTLSErrorsPolicy;
PWebKitWebsiteDataManager  = ^WebKitWebsiteDataManager;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2015 Igalia S.L.
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
{$ifndef WebKitWebsiteDataManager_h}
{$define WebKitWebsiteDataManager_h}
{$include <gio/gio.h>}
{$include <webkit/WebKitCookieManager.h>}
{$include <webkit/WebKitDefines.h>}
{$include <webkit/WebKitFaviconDatabase.h>}
{$include <webkit/WebKitMemoryPressureSettings.h>}
{$include <webkit/WebKitNetworkProxySettings.h>}
{$include <webkit/WebKitWebsiteData.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_WEBSITE_DATA_MANAGER : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitWebsiteDataManager, webkit_website_data_manager, WEBKIT, WEBSITE_DATA_MANAGER, GObject) }
{*
 * WebKitTLSErrorsPolicy:
 * @WEBKIT_TLS_ERRORS_POLICY_IGNORE: Ignore TLS errors.
 * @WEBKIT_TLS_ERRORS_POLICY_FAIL: TLS errors will emit
 *   #WebKitWebView::load-failed-with-tls-errors and, if the signal is handled,
 *   finish the load. In case the signal is not handled,
 *   #WebKitWebView::load-failed is emitted before the load finishes.
 *
 * Enum values used to denote the TLS errors policy.
  }
type
  PWebKitTLSErrorsPolicy = ^TWebKitTLSErrorsPolicy;
  TWebKitTLSErrorsPolicy =  Longint;
  Const
    WEBKIT_TLS_ERRORS_POLICY_IGNORE = 0;
    WEBKIT_TLS_ERRORS_POLICY_FAIL = 1;
;

function webkit_website_data_manager_is_ephemeral(manager:PWebKitWebsiteDataManager):Tgboolean;cdecl;external;
(* Const before type ignored *)
function webkit_website_data_manager_get_base_data_directory(manager:PWebKitWebsiteDataManager):Pgchar;cdecl;external;
(* Const before type ignored *)
function webkit_website_data_manager_get_base_cache_directory(manager:PWebKitWebsiteDataManager):Pgchar;cdecl;external;
procedure webkit_website_data_manager_set_favicons_enabled(manager:PWebKitWebsiteDataManager; enabled:Tgboolean);cdecl;external;
function webkit_website_data_manager_get_favicons_enabled(manager:PWebKitWebsiteDataManager):Tgboolean;cdecl;external;
function webkit_website_data_manager_get_favicon_database(manager:PWebKitWebsiteDataManager):PWebKitFaviconDatabase;cdecl;external;
procedure webkit_website_data_manager_fetch(manager:PWebKitWebsiteDataManager; types:TWebKitWebsiteDataTypes; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function webkit_website_data_manager_fetch_finish(manager:PWebKitWebsiteDataManager; result:PGAsyncResult; error:PPGError):PGList;cdecl;external;
procedure webkit_website_data_manager_remove(manager:PWebKitWebsiteDataManager; types:TWebKitWebsiteDataTypes; website_data:PGList; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function webkit_website_data_manager_remove_finish(manager:PWebKitWebsiteDataManager; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure webkit_website_data_manager_clear(manager:PWebKitWebsiteDataManager; types:TWebKitWebsiteDataTypes; timespan:TGTimeSpan; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function webkit_website_data_manager_clear_finish(manager:PWebKitWebsiteDataManager; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
{ was #define dname def_expr }
function WEBKIT_TYPE_ITP_FIRST_PARTY : longint; { return type might be wrong }

type

function webkit_itp_first_party_get_type:TGType;cdecl;external;
function webkit_itp_first_party_ref(itp_first_party:PWebKitITPFirstParty):PWebKitITPFirstParty;cdecl;external;
procedure webkit_itp_first_party_unref(itp_first_party:PWebKitITPFirstParty);cdecl;external;
(* Const before type ignored *)
function webkit_itp_first_party_get_domain(itp_first_party:PWebKitITPFirstParty):Pchar;cdecl;external;
function webkit_itp_first_party_get_website_data_access_allowed(itp_first_party:PWebKitITPFirstParty):Tgboolean;cdecl;external;
function webkit_itp_first_party_get_last_update_time(itp_first_party:PWebKitITPFirstParty):PGDateTime;cdecl;external;
{ was #define dname def_expr }
function WEBKIT_TYPE_ITP_THIRD_PARTY : longint; { return type might be wrong }

type

function webkit_itp_third_party_get_type:TGType;cdecl;external;
function webkit_itp_third_party_ref(itp_third_party:PWebKitITPThirdParty):PWebKitITPThirdParty;cdecl;external;
procedure webkit_itp_third_party_unref(itp_third_party:PWebKitITPThirdParty);cdecl;external;
(* Const before type ignored *)
function webkit_itp_third_party_get_domain(itp_third_party:PWebKitITPThirdParty):Pchar;cdecl;external;
function webkit_itp_third_party_get_first_parties(itp_third_party:PWebKitITPThirdParty):PGList;cdecl;external;
procedure webkit_website_data_manager_get_itp_summary(manager:PWebKitWebsiteDataManager; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function webkit_website_data_manager_get_itp_summary_finish(manager:PWebKitWebsiteDataManager; result:PGAsyncResult; error:PPGError):PGList;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_WEBSITE_DATA_MANAGER : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_WEBSITE_DATA_MANAGER:=webkit_website_data_manager_get_type;
  end;

{ was #define dname def_expr }
function WEBKIT_TYPE_ITP_FIRST_PARTY : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_ITP_FIRST_PARTY:=webkit_itp_first_party_get_type;
  end;

{ was #define dname def_expr }
function WEBKIT_TYPE_ITP_THIRD_PARTY : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_ITP_THIRD_PARTY:=webkit_itp_third_party_get_type;
  end;


end.
