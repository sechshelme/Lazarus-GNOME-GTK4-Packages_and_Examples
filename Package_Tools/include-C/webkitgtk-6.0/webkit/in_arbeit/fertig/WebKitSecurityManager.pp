
unit WebKitSecurityManager;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitSecurityManager.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitSecurityManager.h
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
PWebKitSecurityManager  = ^WebKitSecurityManager;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2012 Igalia S.L.
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
{$ifndef WebKitSecurityManager_h}
{$define WebKitSecurityManager_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_SECURITY_MANAGER : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitSecurityManager, webkit_security_manager, WEBKIT, SECURITY_MANAGER, GObject) }
(* Const before type ignored *)
procedure webkit_security_manager_register_uri_scheme_as_local(security_manager:PWebKitSecurityManager; scheme:Pgchar);cdecl;external;
(* Const before type ignored *)
function webkit_security_manager_uri_scheme_is_local(security_manager:PWebKitSecurityManager; scheme:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure webkit_security_manager_register_uri_scheme_as_no_access(security_manager:PWebKitSecurityManager; scheme:Pgchar);cdecl;external;
(* Const before type ignored *)
function webkit_security_manager_uri_scheme_is_no_access(security_manager:PWebKitSecurityManager; scheme:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure webkit_security_manager_register_uri_scheme_as_display_isolated(security_manager:PWebKitSecurityManager; scheme:Pgchar);cdecl;external;
(* Const before type ignored *)
function webkit_security_manager_uri_scheme_is_display_isolated(security_manager:PWebKitSecurityManager; scheme:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure webkit_security_manager_register_uri_scheme_as_secure(security_manager:PWebKitSecurityManager; scheme:Pgchar);cdecl;external;
(* Const before type ignored *)
function webkit_security_manager_uri_scheme_is_secure(security_manager:PWebKitSecurityManager; scheme:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure webkit_security_manager_register_uri_scheme_as_cors_enabled(security_manager:PWebKitSecurityManager; scheme:Pgchar);cdecl;external;
(* Const before type ignored *)
function webkit_security_manager_uri_scheme_is_cors_enabled(security_manager:PWebKitSecurityManager; scheme:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure webkit_security_manager_register_uri_scheme_as_empty_document(security_manager:PWebKitSecurityManager; scheme:Pgchar);cdecl;external;
(* Const before type ignored *)
function webkit_security_manager_uri_scheme_is_empty_document(security_manager:PWebKitSecurityManager; scheme:Pgchar):Tgboolean;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_SECURITY_MANAGER : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_SECURITY_MANAGER:=webkit_security_manager_get_type;
  end;


end.
