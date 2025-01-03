
unit WebKitUserContent;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitUserContent.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitUserContent.h
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
PWebKitUserContentFilter  = ^WebKitUserContentFilter;
PWebKitUserContentInjectedFrames  = ^WebKitUserContentInjectedFrames;
PWebKitUserScript  = ^WebKitUserScript;
PWebKitUserScriptInjectionTime  = ^WebKitUserScriptInjectionTime;
PWebKitUserStyleLevel  = ^WebKitUserStyleLevel;
PWebKitUserStyleSheet  = ^WebKitUserStyleSheet;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2014 Igalia S.L.
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
{$ifndef WebKitUserContent_h}
{$define WebKitUserContent_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}
{*
 * WebKitUserContentInjectedFrames:
 * @WEBKIT_USER_CONTENT_INJECT_ALL_FRAMES: Insert the user style
 *   sheet in all the frames loaded by the web view, including
 *   nested frames. This is the default.
 * @WEBKIT_USER_CONTENT_INJECT_TOP_FRAME: Insert the user style
 *   sheet *only* in the top-level frame loaded by the web view,
 *   and *not* in the nested frames.
 *
 * Specifies in which frames user style sheets are to be inserted in.
 *
 * Since: 2.6
  }
type
  PWebKitUserContentInjectedFrames = ^TWebKitUserContentInjectedFrames;
  TWebKitUserContentInjectedFrames =  Longint;
  Const
    WEBKIT_USER_CONTENT_INJECT_ALL_FRAMES = 0;
    WEBKIT_USER_CONTENT_INJECT_TOP_FRAME = 1;
;
{*
 * WebKitUserStyleLevel:
 * @WEBKIT_USER_STYLE_LEVEL_USER: The style sheet is an user style sheet,
 *   its contents always override other style sheets. This is the default.
 * @WEBKIT_USER_STYLE_LEVEL_AUTHOR: The style sheet will be treated as if
 *   it was provided by the loaded documents. That means other user style
 *   sheets may still override it.
 *
 * Specifies how to treat an user style sheet.
 *
 * Since: 2.6
  }
type
  PWebKitUserStyleLevel = ^TWebKitUserStyleLevel;
  TWebKitUserStyleLevel =  Longint;
  Const
    WEBKIT_USER_STYLE_LEVEL_USER = 0;
    WEBKIT_USER_STYLE_LEVEL_AUTHOR = 1;
;

{ was #define dname def_expr }
function WEBKIT_TYPE_USER_STYLE_SHEET : longint; { return type might be wrong }

type

function webkit_user_style_sheet_get_type:TGType;cdecl;external;
function webkit_user_style_sheet_ref(user_style_sheet:PWebKitUserStyleSheet):PWebKitUserStyleSheet;cdecl;external;
procedure webkit_user_style_sheet_unref(user_style_sheet:PWebKitUserStyleSheet);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function webkit_user_style_sheet_new(source:Pgchar; injected_frames:TWebKitUserContentInjectedFrames; level:TWebKitUserStyleLevel; allow_list:PPgchar; block_list:PPgchar):PWebKitUserStyleSheet;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function webkit_user_style_sheet_new_for_world(source:Pgchar; injected_frames:TWebKitUserContentInjectedFrames; level:TWebKitUserStyleLevel; world_name:Pgchar; allow_list:PPgchar; 
           block_list:PPgchar):PWebKitUserStyleSheet;cdecl;external;
{*
 * WebKitUserScriptInjectionTime:
 * @WEBKIT_USER_SCRIPT_INJECT_AT_DOCUMENT_START: Insert the code of the user
 *   script at the beginning of loaded documents. This is the default.
 * @WEBKIT_USER_SCRIPT_INJECT_AT_DOCUMENT_END: Insert the code of the user
 *   script at the end of the loaded documents.
 *
 * Specifies at which place of documents an user script will be inserted.
 *
 * Since: 2.6
  }
type
  PWebKitUserScriptInjectionTime = ^TWebKitUserScriptInjectionTime;
  TWebKitUserScriptInjectionTime =  Longint;
  Const
    WEBKIT_USER_SCRIPT_INJECT_AT_DOCUMENT_START = 0;
    WEBKIT_USER_SCRIPT_INJECT_AT_DOCUMENT_END = 1;
;

{ was #define dname def_expr }
function WEBKIT_TYPE_USER_SCRIPT : longint; { return type might be wrong }

type

function webkit_user_script_get_type:TGType;cdecl;external;
function webkit_user_script_ref(user_script:PWebKitUserScript):PWebKitUserScript;cdecl;external;
procedure webkit_user_script_unref(user_script:PWebKitUserScript);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function webkit_user_script_new(source:Pgchar; injected_frames:TWebKitUserContentInjectedFrames; injection_time:TWebKitUserScriptInjectionTime; allow_list:PPgchar; block_list:PPgchar):PWebKitUserScript;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function webkit_user_script_new_for_world(source:Pgchar; injected_frames:TWebKitUserContentInjectedFrames; injection_time:TWebKitUserScriptInjectionTime; world_name:Pgchar; allow_list:PPgchar; 
           block_list:PPgchar):PWebKitUserScript;cdecl;external;
{ was #define dname def_expr }
function WEBKIT_TYPE_USER_CONTENT_FILTER : longint; { return type might be wrong }

type

function webkit_user_content_filter_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function webkit_user_content_filter_get_identifier(user_content_filter:PWebKitUserContentFilter):Pchar;cdecl;external;
function webkit_user_content_filter_ref(user_content_filter:PWebKitUserContentFilter):PWebKitUserContentFilter;cdecl;external;
procedure webkit_user_content_filter_unref(user_content_filter:PWebKitUserContentFilter);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_USER_STYLE_SHEET : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_USER_STYLE_SHEET:=webkit_user_style_sheet_get_type;
  end;

{ was #define dname def_expr }
function WEBKIT_TYPE_USER_SCRIPT : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_USER_SCRIPT:=webkit_user_script_get_type;
  end;

{ was #define dname def_expr }
function WEBKIT_TYPE_USER_CONTENT_FILTER : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_USER_CONTENT_FILTER:=webkit_user_content_filter_get_type;
  end;


end.
