
unit WebKitInputMethodContext;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitInputMethodContext.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitInputMethodContext.h
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
PGdkEvent  = ^GdkEvent;
PGdkRGBA  = ^GdkRGBA;
PGList  = ^GList;
Pguint  = ^guint;
PWebKitInputHints  = ^WebKitInputHints;
PWebKitInputMethodContext  = ^WebKitInputMethodContext;
PWebKitInputMethodContextClass  = ^WebKitInputMethodContextClass;
PWebKitInputMethodUnderline  = ^WebKitInputMethodUnderline;
PWebKitInputPurpose  = ^WebKitInputPurpose;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2012 Igalia S.L.
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
{$ifndef WebKitInputMethodContext_h}
{$define WebKitInputMethodContext_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}
{$include <gdk/gdk.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_INPUT_METHOD_UNDERLINE : longint; { return type might be wrong }

{WEBKIT_DECLARE_DERIVABLE_TYPE (WebKitInputMethodContext, webkit_input_method_context, WEBKIT, INPUT_METHOD_CONTEXT, GObject) }
{ was #define dname def_expr }
function WEBKIT_TYPE_INPUT_METHOD_CONTEXT : longint; { return type might be wrong }

{*
 * WebKitInputPurpose:
 * @WEBKIT_INPUT_PURPOSE_FREE_FORM: Editable element expects any characters
 * @WEBKIT_INPUT_PURPOSE_DIGITS: Editable element expects digits
 * @WEBKIT_INPUT_PURPOSE_NUMBER: Editable element expects a number
 * @WEBKIT_INPUT_PURPOSE_PHONE: Editable element expects a telephone
 * @WEBKIT_INPUT_PURPOSE_URL: Editable element expects a URL
 * @WEBKIT_INPUT_PURPOSE_EMAIL: Editable element expects an email
 * @WEBKIT_INPUT_PURPOSE_PASSWORD: Editable element expects a password
 *
 * Enum values used to describe the primary purpose of the active editable element.
 *
 * Since: 2.28
  }
type
  PWebKitInputPurpose = ^TWebKitInputPurpose;
  TWebKitInputPurpose =  Longint;
  Const
    WEBKIT_INPUT_PURPOSE_FREE_FORM = 0;
    WEBKIT_INPUT_PURPOSE_DIGITS = 1;
    WEBKIT_INPUT_PURPOSE_NUMBER = 2;
    WEBKIT_INPUT_PURPOSE_PHONE = 3;
    WEBKIT_INPUT_PURPOSE_URL = 4;
    WEBKIT_INPUT_PURPOSE_EMAIL = 5;
    WEBKIT_INPUT_PURPOSE_PASSWORD = 6;
;
{*
 * WebKitInputHints:
 * @WEBKIT_INPUT_HINT_NONE: No special behavior suggested
 * @WEBKIT_INPUT_HINT_SPELLCHECK: Suggest spell checking
 * @WEBKIT_INPUT_HINT_LOWERCASE: Suggest to not autocapitlize
 * @WEBKIT_INPUT_HINT_UPPERCASE_CHARS: Suggest to capitalize all text
 * @WEBKIT_INPUT_HINT_UPPERCASE_WORDS: Suggest to capitalize the first character of each word
 * @WEBKIT_INPUT_HINT_UPPERCASE_SENTENCES: Suggest to capitalize the first word of each sentence
 * @WEBKIT_INPUT_HINT_INHIBIT_OSK: Suggest to not show an onscreen keyboard
 *
 * Enum values used to describe hints that might be taken into account by input methods.
 *
 * Since: 2.28
  }
type
  PWebKitInputHints = ^TWebKitInputHints;
  TWebKitInputHints =  Longint;
  Const
    WEBKIT_INPUT_HINT_NONE = 0;
    WEBKIT_INPUT_HINT_SPELLCHECK = 1 shl 0;
    WEBKIT_INPUT_HINT_LOWERCASE = 1 shl 1;
    WEBKIT_INPUT_HINT_UPPERCASE_CHARS = 1 shl 2;
    WEBKIT_INPUT_HINT_UPPERCASE_WORDS = 1 shl 3;
    WEBKIT_INPUT_HINT_UPPERCASE_SENTENCES = 1 shl 4;
    WEBKIT_INPUT_HINT_INHIBIT_OSK = 1 shl 5;
;
type
{< public > }
{ Signals  }
(* Const before type ignored *)
{ Virtual functions  }
(* Const before type ignored *)
{< private > }
  PWebKitInputMethodContextClass = ^TWebKitInputMethodContextClass;
  TWebKitInputMethodContextClass = record
      parent_class : TGObjectClass;
      preedit_started : procedure (context:PWebKitInputMethodContext);cdecl;
      preedit_changed : procedure (context:PWebKitInputMethodContext);cdecl;
      preedit_finished : procedure (context:PWebKitInputMethodContext);cdecl;
      committed : procedure (context:PWebKitInputMethodContext; text:Pchar);cdecl;
      delete_surrounding : procedure (context:PWebKitInputMethodContext; offset:longint; n_chars:Tguint);cdecl;
      set_enable_preedit : procedure (context:PWebKitInputMethodContext; enabled:Tgboolean);cdecl;
      get_preedit : procedure (context:PWebKitInputMethodContext; text:PPgchar; underlines:PPGList; cursor_offset:Pguint);cdecl;
      filter_key_event : function (context:PWebKitInputMethodContext; key_event:PGdkEvent):Tgboolean;cdecl;
      notify_focus_in : procedure (context:PWebKitInputMethodContext);cdecl;
      notify_focus_out : procedure (context:PWebKitInputMethodContext);cdecl;
      notify_cursor_area : procedure (context:PWebKitInputMethodContext; x:longint; y:longint; width:longint; height:longint);cdecl;
      notify_surrounding : procedure (context:PWebKitInputMethodContext; text:Pgchar; length:Tguint; cursor_index:Tguint; selection_index:Tguint);cdecl;
      reset : procedure (context:PWebKitInputMethodContext);cdecl;
      _webkit_reserved0 : procedure ;cdecl;
      _webkit_reserved1 : procedure ;cdecl;
      _webkit_reserved2 : procedure ;cdecl;
      _webkit_reserved3 : procedure ;cdecl;
      _webkit_reserved4 : procedure ;cdecl;
      _webkit_reserved5 : procedure ;cdecl;
      _webkit_reserved6 : procedure ;cdecl;
      _webkit_reserved7 : procedure ;cdecl;
      _webkit_reserved8 : procedure ;cdecl;
      _webkit_reserved9 : procedure ;cdecl;
      _webkit_reserved10 : procedure ;cdecl;
      _webkit_reserved11 : procedure ;cdecl;
      _webkit_reserved12 : procedure ;cdecl;
      _webkit_reserved13 : procedure ;cdecl;
      _webkit_reserved14 : procedure ;cdecl;
      _webkit_reserved15 : procedure ;cdecl;
    end;


procedure webkit_input_method_context_set_enable_preedit(context:PWebKitInputMethodContext; enabled:Tgboolean);cdecl;external;
procedure webkit_input_method_context_get_preedit(context:PWebKitInputMethodContext; text:PPchar; underlines:PPGList; cursor_offset:Pguint);cdecl;external;
function webkit_input_method_context_filter_key_event(context:PWebKitInputMethodContext; key_event:PGdkEvent):Tgboolean;cdecl;external;
procedure webkit_input_method_context_notify_focus_in(context:PWebKitInputMethodContext);cdecl;external;
procedure webkit_input_method_context_notify_focus_out(context:PWebKitInputMethodContext);cdecl;external;
procedure webkit_input_method_context_notify_cursor_area(context:PWebKitInputMethodContext; x:longint; y:longint; width:longint; height:longint);cdecl;external;
(* Const before type ignored *)
procedure webkit_input_method_context_notify_surrounding(context:PWebKitInputMethodContext; text:Pgchar; length:longint; cursor_index:Tguint; selection_index:Tguint);cdecl;external;
procedure webkit_input_method_context_reset(context:PWebKitInputMethodContext);cdecl;external;
function webkit_input_method_underline_get_type:TGType;cdecl;external;
function webkit_input_method_underline_new(start_offset:Tguint; end_offset:Tguint):PWebKitInputMethodUnderline;cdecl;external;
function webkit_input_method_underline_copy(underline:PWebKitInputMethodUnderline):PWebKitInputMethodUnderline;cdecl;external;
procedure webkit_input_method_underline_free(underline:PWebKitInputMethodUnderline);cdecl;external;
(* Const before type ignored *)
procedure webkit_input_method_underline_set_color(underline:PWebKitInputMethodUnderline; rgba:PGdkRGBA);cdecl;external;
function webkit_input_method_context_get_input_purpose(context:PWebKitInputMethodContext):TWebKitInputPurpose;cdecl;external;
procedure webkit_input_method_context_set_input_purpose(context:PWebKitInputMethodContext; purpose:TWebKitInputPurpose);cdecl;external;
function webkit_input_method_context_get_input_hints(context:PWebKitInputMethodContext):TWebKitInputHints;cdecl;external;
procedure webkit_input_method_context_set_input_hints(context:PWebKitInputMethodContext; hints:TWebKitInputHints);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_INPUT_METHOD_UNDERLINE : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_INPUT_METHOD_UNDERLINE:=webkit_input_method_underline_get_type;
  end;

{ was #define dname def_expr }
function WEBKIT_TYPE_INPUT_METHOD_CONTEXT : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_INPUT_METHOD_CONTEXT:=webkit_input_method_context_get_type;
  end;


end.
