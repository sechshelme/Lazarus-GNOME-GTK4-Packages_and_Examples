
unit WebKitFindController;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitFindController.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitFindController.h
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
PWebKitFindController  = ^WebKitFindController;
PWebKitFindOptions  = ^WebKitFindOptions;
PWebKitWebView  = ^WebKitWebView;
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
{$ifndef WebKitFindController_h}
{$define WebKitFindController_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_FIND_CONTROLLER : longint; { return type might be wrong }

{WEBKIT_DECLARE_FINAL_TYPE (WebKitFindController, webkit_find_controller, WEBKIT, FIND_CONTROLLER, GObject) }
type
{*
 * WebKitFindOptions:
 * @WEBKIT_FIND_OPTIONS_NONE: no search flags, this means a case
 *   sensitive, no wrap, forward only search.
 * @WEBKIT_FIND_OPTIONS_CASE_INSENSITIVE: case insensitive search.
 * @WEBKIT_FIND_OPTIONS_AT_WORD_STARTS: search text only at the
 *   begining of the words.
 * @WEBKIT_FIND_OPTIONS_TREAT_MEDIAL_CAPITAL_AS_WORD_START: treat
 *   capital letters in the middle of words as word start.
 * @WEBKIT_FIND_OPTIONS_BACKWARDS: search backwards.
 * @WEBKIT_FIND_OPTIONS_WRAP_AROUND: if not present search will stop
 *   at the end of the document.
 *
 * Enum values used to specify search options.
  }

  PWebKitFindOptions = ^TWebKitFindOptions;
  TWebKitFindOptions =  Longint;
  Const
    WEBKIT_FIND_OPTIONS_NONE = 0;
    WEBKIT_FIND_OPTIONS_CASE_INSENSITIVE = 1 shl 0;
    WEBKIT_FIND_OPTIONS_AT_WORD_STARTS = 1 shl 1;
    WEBKIT_FIND_OPTIONS_TREAT_MEDIAL_CAPITAL_AS_WORD_START = 1 shl 2;
    WEBKIT_FIND_OPTIONS_BACKWARDS = 1 shl 3;
    WEBKIT_FIND_OPTIONS_WRAP_AROUND = 1 shl 4;
;
(* Const before type ignored *)

procedure webkit_find_controller_search(find_controller:PWebKitFindController; search_text:Pgchar; find_options:Tguint32; max_match_count:Tguint);cdecl;external;
procedure webkit_find_controller_search_finish(find_controller:PWebKitFindController);cdecl;external;
procedure webkit_find_controller_search_next(find_controller:PWebKitFindController);cdecl;external;
procedure webkit_find_controller_search_previous(find_controller:PWebKitFindController);cdecl;external;
(* Const before type ignored *)
procedure webkit_find_controller_count_matches(find_controller:PWebKitFindController; search_text:Pgchar; find_options:Tguint32; max_match_count:Tguint);cdecl;external;
(* Const before type ignored *)
function webkit_find_controller_get_search_text(find_controller:PWebKitFindController):Pgchar;cdecl;external;
function webkit_find_controller_get_options(find_controller:PWebKitFindController):Tguint32;cdecl;external;
function webkit_find_controller_get_max_match_count(find_controller:PWebKitFindController):Tguint;cdecl;external;
function webkit_find_controller_get_web_view(find_controller:PWebKitFindController):PWebKitWebView;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_FIND_CONTROLLER : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_FIND_CONTROLLER:=webkit_find_controller_get_type;
  end;


end.
