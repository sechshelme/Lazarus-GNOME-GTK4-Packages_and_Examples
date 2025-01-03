
unit WebKitScriptDialog;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitScriptDialog.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitScriptDialog.h
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
PWebKitScriptDialog  = ^WebKitScriptDialog;
PWebKitScriptDialogType  = ^WebKitScriptDialogType;
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
{$ifndef WebKitScriptDialog_h}
{$define WebKitScriptDialog_h}
{$include <glib-object.h>}
{$include <webkit/WebKitDefines.h>}

{ was #define dname def_expr }
function WEBKIT_TYPE_SCRIPT_DIALOG : longint; { return type might be wrong }

type
{*
 * WebKitScriptDialogType:
 * @WEBKIT_SCRIPT_DIALOG_ALERT: Alert script dialog, used to show a
 * message to the user.
 * @WEBKIT_SCRIPT_DIALOG_CONFIRM: Confirm script dialog, used to ask
 * confirmation to the user.
 * @WEBKIT_SCRIPT_DIALOG_PROMPT: Prompt script dialog, used to ask
 * information to the user.
 * @WEBKIT_SCRIPT_DIALOG_BEFORE_UNLOAD_CONFIRM: Before unload confirm dialog,
 * used to ask confirmation to leave the current page to the user. Since 2.12
 *
 * Enum values used for determining the type of #WebKitScriptDialog
  }

  PWebKitScriptDialogType = ^TWebKitScriptDialogType;
  TWebKitScriptDialogType =  Longint;
  Const
    WEBKIT_SCRIPT_DIALOG_ALERT = 0;
    WEBKIT_SCRIPT_DIALOG_CONFIRM = 1;
    WEBKIT_SCRIPT_DIALOG_PROMPT = 2;
    WEBKIT_SCRIPT_DIALOG_BEFORE_UNLOAD_CONFIRM = 3;
;

function webkit_script_dialog_get_type:TGType;cdecl;external;
function webkit_script_dialog_ref(dialog:PWebKitScriptDialog):PWebKitScriptDialog;cdecl;external;
procedure webkit_script_dialog_unref(dialog:PWebKitScriptDialog);cdecl;external;
function webkit_script_dialog_get_dialog_type(dialog:PWebKitScriptDialog):TWebKitScriptDialogType;cdecl;external;
(* Const before type ignored *)
function webkit_script_dialog_get_message(dialog:PWebKitScriptDialog):Pgchar;cdecl;external;
procedure webkit_script_dialog_confirm_set_confirmed(dialog:PWebKitScriptDialog; confirmed:Tgboolean);cdecl;external;
(* Const before type ignored *)
function webkit_script_dialog_prompt_get_default_text(dialog:PWebKitScriptDialog):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure webkit_script_dialog_prompt_set_text(dialog:PWebKitScriptDialog; text:Pgchar);cdecl;external;
procedure webkit_script_dialog_close(dialog:PWebKitScriptDialog);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function WEBKIT_TYPE_SCRIPT_DIALOG : longint; { return type might be wrong }
  begin
    WEBKIT_TYPE_SCRIPT_DIALOG:=webkit_script_dialog_get_type;
  end;


end.
