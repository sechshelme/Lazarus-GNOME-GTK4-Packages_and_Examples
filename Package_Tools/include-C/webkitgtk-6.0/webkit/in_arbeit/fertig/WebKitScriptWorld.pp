
unit WebKitScriptWorld;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitScriptWorld.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitScriptWorld.h
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
PWebKitScriptWorld  = ^WebKitScriptWorld;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2013 Igalia S.L.
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
{$if !defined(__WEBKIT_WEB_PROCESS_EXTENSION_H_INSIDE__) && !defined(BUILDING_WEBKIT)}
{$error "Only <webkit/webkit-web-process-extension.h> can be included directly."}
{$endif}
{$ifndef WebKitScriptWorld_h}
{$define WebKitScriptWorld_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_SCRIPT_WORLD : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitScriptWorld, webkit_script_world, WEBKIT, SCRIPT_WORLD, GObject ) }
function webkit_script_world_get_default:PWebKitScriptWorld;cdecl;external;
function webkit_script_world_new:PWebKitScriptWorld;cdecl;external;
(* Const before type ignored *)
function webkit_script_world_new_with_name(name:Pchar):PWebKitScriptWorld;cdecl;external;
(* Const before type ignored *)
function webkit_script_world_get_name(world:PWebKitScriptWorld):Pchar;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_SCRIPT_WORLD : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_SCRIPT_WORLD:=webkit_script_world_get_type;
  end;


end.
