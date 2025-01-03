
unit WebKitWebContext;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitWebContext.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitWebContext.h
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
Pgchar  = ^gchar;
PGList  = ^GList;
PGVariant  = ^GVariant;
PWebKitCacheModel  = ^WebKitCacheModel;
PWebKitGeolocationManager  = ^WebKitGeolocationManager;
PWebKitNetworkSession  = ^WebKitNetworkSession;
PWebKitSecurityManager  = ^WebKitSecurityManager;
PWebKitURISchemeRequest  = ^WebKitURISchemeRequest;
PWebKitUserMessage  = ^WebKitUserMessage;
PWebKitWebContext  = ^WebKitWebContext;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2011 Igalia S.L.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
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
{$ifndef WebKitWebContext_h}
{$define WebKitWebContext_h}
{$include <glib-object.h>}
{$include <webkit/WebKitAutomationSession.h>}
{$include <webkit/WebKitCookieManager.h>}
{$include <webkit/WebKitDefines.h>}
{$include <webkit/WebKitDownload.h>}
{$include <webkit/WebKitGeolocationManager.h>}
{$include <webkit/WebKitNetworkProxySettings.h>}
{$include <webkit/WebKitNetworkSession.h>}
{$include <webkit/WebKitSecurityManager.h>}
{$include <webkit/WebKitURISchemeRequest.h>}
{$include <webkit/WebKitUserMessage.h>}
{$include <webkit/WebKitWebsiteDataManager.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_WEB_CONTEXT : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitWebContext, webkit_web_context, WEBKIT, WEB_CONTEXT, GObject) }
{*
 * WebKitCacheModel:
 * @WEBKIT_CACHE_MODEL_DOCUMENT_VIEWER: Disable the cache completely, which
 *   substantially reduces memory usage. Useful for applications that only
 *   access a single local file, with no navigation to other pages. No remote
 *   resources will be cached.
 * @WEBKIT_CACHE_MODEL_DOCUMENT_BROWSER: A cache model optimized for viewing
 *   a series of local files -- for example, a documentation viewer or a website
 *   designer. WebKit will cache a moderate number of resources.
 * @WEBKIT_CACHE_MODEL_WEB_BROWSER: Improve document load speed substantially
 *   by caching a very large number of resources and previously viewed content.
 *
 * Enum values used for determining the #WebKitWebContext cache model.
  }
type
  PWebKitCacheModel = ^TWebKitCacheModel;
  TWebKitCacheModel =  Longint;
  Const
    WEBKIT_CACHE_MODEL_DOCUMENT_VIEWER = 0;
    WEBKIT_CACHE_MODEL_WEB_BROWSER = 1;
    WEBKIT_CACHE_MODEL_DOCUMENT_BROWSER = 2;
;
{*
 * WebKitURISchemeRequestCallback:
 * @request: the #WebKitURISchemeRequest
 * @user_data: user data passed to the callback
 *
 * Type definition for a function that will be called back when an URI request is
 * made for a user registered URI scheme.
  }
type

  TWebKitURISchemeRequestCallback = procedure (request:PWebKitURISchemeRequest; user_data:Tgpointer);cdecl;

function webkit_web_context_get_default:PWebKitWebContext;cdecl;external;
function webkit_web_context_new:PWebKitWebContext;cdecl;external;
function webkit_web_context_is_automation_allowed(context:PWebKitWebContext):Tgboolean;cdecl;external;
procedure webkit_web_context_set_automation_allowed(context:PWebKitWebContext; allowed:Tgboolean);cdecl;external;
function webkit_web_context_get_network_session_for_automation(context:PWebKitWebContext):PWebKitNetworkSession;cdecl;external;
procedure webkit_web_context_set_cache_model(context:PWebKitWebContext; cache_model:TWebKitCacheModel);cdecl;external;
function webkit_web_context_get_cache_model(context:PWebKitWebContext):TWebKitCacheModel;cdecl;external;
function webkit_web_context_get_geolocation_manager(context:PWebKitWebContext):PWebKitGeolocationManager;cdecl;external;
function webkit_web_context_get_security_manager(context:PWebKitWebContext):PWebKitSecurityManager;cdecl;external;
(* Const before type ignored *)
procedure webkit_web_context_register_uri_scheme(context:PWebKitWebContext; scheme:Pgchar; callback:TWebKitURISchemeRequestCallback; user_data:Tgpointer; user_data_destroy_func:TGDestroyNotify);cdecl;external;
(* Const before type ignored *)
procedure webkit_web_context_add_path_to_sandbox(context:PWebKitWebContext; path:Pchar; read_only:Tgboolean);cdecl;external;
function webkit_web_context_get_spell_checking_enabled(context:PWebKitWebContext):Tgboolean;cdecl;external;
procedure webkit_web_context_set_spell_checking_enabled(context:PWebKitWebContext; enabled:Tgboolean);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function webkit_web_context_get_spell_checking_languages(context:PWebKitWebContext):^Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
procedure webkit_web_context_set_spell_checking_languages(context:PWebKitWebContext; languages:PPgchar);cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
procedure webkit_web_context_set_preferred_languages(context:PWebKitWebContext; languages:PPgchar);cdecl;external;
{*
 * webkit_web_context_set_web_process_extensions_directory:
 * @context: a #WebKitWebContext
 * @directory: the directory to add
 *
 * Set the directory where WebKit will look for web process extensions.
 *
 * This method must be called before loading anything in this context,
 * otherwise it will not have any effect. You can connect to
 * #WebKitWebContext::initialize-web-process-extensions to call this method
 * before anything is loaded.
  }
(* Const before type ignored *)
procedure webkit_web_context_set_web_process_extensions_directory(context:PWebKitWebContext; directory:Pgchar);cdecl;external;
{*
 * webkit_web_context_set_web_process_extensions_initialization_user_data:
 * @context: a #WebKitWebContext
 * @user_data: a #GVariant
 *
 * Set user data to be passed to Web Extensions on initialization.
 *
 * The data will be passed to the
 * #WebKitWebProcessExtensionInitializeWithUserDataFunction.
 * This method must be called before loading anything in this context,
 * otherwise it will not have any effect. You can connect to
 * #WebKitWebContext::initialize-web-process-extensions to call this method
 * before anything is loaded.
 *
 * Since: 2.4
  }
procedure webkit_web_context_set_web_process_extensions_initialization_user_data(context:PWebKitWebContext; user_data:PGVariant);cdecl;external;
{*
 * WebKitWebContext::initialize-web-process-extensions:
 * @context: the #WebKitWebContext
 *
 * This signal is emitted when a new web process is about to be
 * launched. It signals the most appropriate moment to use
 * webkit_web_context_set_web_process_extensions_initialization_user_data()
 * and webkit_web_context_set_web_process_extensions_directory().
 *
 * Since: 2.4
  }
procedure webkit_web_context_initialize_notification_permissions(context:PWebKitWebContext; allowed_origins:PGList; disallowed_origins:PGList);cdecl;external;
procedure webkit_web_context_send_message_to_all_extensions(context:PWebKitWebContext; message:PWebKitUserMessage);cdecl;external;
(* Const before type ignored *)
function webkit_web_context_get_time_zone_override(context:PWebKitWebContext):Pgchar;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_WEB_CONTEXT : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_WEB_CONTEXT:=webkit_web_context_get_type;
  end;


end.
