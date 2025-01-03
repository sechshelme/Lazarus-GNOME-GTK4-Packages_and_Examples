
unit WebKitNetworkProxySettings;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitNetworkProxySettings.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitNetworkProxySettings.h
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
Pgchar  = ^gchar;
PWebKitNetworkProxyMode  = ^WebKitNetworkProxyMode;
PWebKitNetworkProxySettings  = ^WebKitNetworkProxySettings;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2017 Igalia S.L.
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
{$ifndef WebKitNetworkProxySettings_h}
{$define WebKitNetworkProxySettings_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_NETWORK_NETWORK_PROXY_SETTINGS : longint; { return type might be wrong }

{*
 * WebKitNetworkProxyMode:
 * @WEBKIT_NETWORK_PROXY_MODE_DEFAULT: Use the default proxy of the system.
 * @WEBKIT_NETWORK_PROXY_MODE_NO_PROXY: Do not use any proxy.
 * @WEBKIT_NETWORK_PROXY_MODE_CUSTOM: Use custom proxy settings.
 *
 * Enum values used to set the network proxy mode.
 *
 * Since: 2.16
  }
type
  PWebKitNetworkProxyMode = ^TWebKitNetworkProxyMode;
  TWebKitNetworkProxyMode =  Longint;
  Const
    WEBKIT_NETWORK_PROXY_MODE_DEFAULT = 0;
    WEBKIT_NETWORK_PROXY_MODE_NO_PROXY = 1;
    WEBKIT_NETWORK_PROXY_MODE_CUSTOM = 2;
;
type

function webkit_network_proxy_settings_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function webkit_network_proxy_settings_new(default_proxy_uri:Pgchar; ignore_hosts:PPgchar):PWebKitNetworkProxySettings;cdecl;external;
function webkit_network_proxy_settings_copy(proxy_settings:PWebKitNetworkProxySettings):PWebKitNetworkProxySettings;cdecl;external;
procedure webkit_network_proxy_settings_free(proxy_settings:PWebKitNetworkProxySettings);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure webkit_network_proxy_settings_add_proxy_for_scheme(proxy_settings:PWebKitNetworkProxySettings; scheme:Pgchar; proxy_uri:Pgchar);cdecl;external;
{$endif}
{ WebKitNetworkProxySettings_h  }

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_NETWORK_NETWORK_PROXY_SETTINGS : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_NETWORK_NETWORK_PROXY_SETTINGS:=webkit_network_proxy_settings_get_type;
  end;


end.
