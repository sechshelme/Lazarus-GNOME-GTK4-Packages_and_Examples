
unit adw_dialog;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_dialog.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_dialog.h
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
PAdwBreakpoint  = ^AdwBreakpoint;
PAdwDialog  = ^AdwDialog;
PAdwDialogClass  = ^AdwDialogClass;
PAdwDialogPresentationMode  = ^AdwDialogPresentationMode;
Pchar  = ^char;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2023-2024 GNOME Foundation Inc.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * Author: Alice Mikhaylenko <alicem@gnome.org>
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-breakpoint.h"}
{$include "adw-enums.h"}
type
  PAdwDialogPresentationMode = ^TAdwDialogPresentationMode;
  TAdwDialogPresentationMode =  Longint;
  Const
    ADW_DIALOG_AUTO = 0;
    ADW_DIALOG_FLOATING = 1;
    ADW_DIALOG_BOTTOM_SHEET = 2;
;

{ was #define dname def_expr }
function ADW_TYPE_DIALOG : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AdwDialog, adw_dialog, ADW, DIALOG, GtkWidget) }
{< private > }
type
  PAdwDialogClass = ^TAdwDialogClass;
  TAdwDialogClass = record
      parent_class : TGtkWidgetClass;
      close_attempt : procedure (dialog:PAdwDialog);cdecl;
      closed : procedure (dialog:PAdwDialog);cdecl;
      padding : array[0..3] of Tgpointer;
    end;


function adw_dialog_new:PAdwDialog;cdecl;external;
function adw_dialog_get_child(self:PAdwDialog):PGtkWidget;cdecl;external;
procedure adw_dialog_set_child(self:PAdwDialog; child:PGtkWidget);cdecl;external;
(* Const before type ignored *)
function adw_dialog_get_title(self:PAdwDialog):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_dialog_set_title(self:PAdwDialog; title:Pchar);cdecl;external;
function adw_dialog_get_can_close(self:PAdwDialog):Tgboolean;cdecl;external;
procedure adw_dialog_set_can_close(self:PAdwDialog; can_close:Tgboolean);cdecl;external;
function adw_dialog_get_content_width(self:PAdwDialog):longint;cdecl;external;
procedure adw_dialog_set_content_width(self:PAdwDialog; content_width:longint);cdecl;external;
function adw_dialog_get_content_height(self:PAdwDialog):longint;cdecl;external;
procedure adw_dialog_set_content_height(self:PAdwDialog; content_height:longint);cdecl;external;
function adw_dialog_get_follows_content_size(self:PAdwDialog):Tgboolean;cdecl;external;
procedure adw_dialog_set_follows_content_size(self:PAdwDialog; follows_content_size:Tgboolean);cdecl;external;
function adw_dialog_get_presentation_mode(self:PAdwDialog):TAdwDialogPresentationMode;cdecl;external;
procedure adw_dialog_set_presentation_mode(self:PAdwDialog; presentation_mode:TAdwDialogPresentationMode);cdecl;external;
function adw_dialog_get_focus(self:PAdwDialog):PGtkWidget;cdecl;external;
procedure adw_dialog_set_focus(self:PAdwDialog; focus:PGtkWidget);cdecl;external;
function adw_dialog_get_default_widget(self:PAdwDialog):PGtkWidget;cdecl;external;
procedure adw_dialog_set_default_widget(self:PAdwDialog; default_widget:PGtkWidget);cdecl;external;
function adw_dialog_close(self:PAdwDialog):Tgboolean;cdecl;external;
procedure adw_dialog_force_close(self:PAdwDialog);cdecl;external;
procedure adw_dialog_add_breakpoint(self:PAdwDialog; breakpoint:PAdwBreakpoint);cdecl;external;
function adw_dialog_get_current_breakpoint(self:PAdwDialog):PAdwBreakpoint;cdecl;external;
procedure adw_dialog_present(self:PAdwDialog; parent:PGtkWidget);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_DIALOG : longint; { return type might be wrong }
  begin
    ADW_TYPE_DIALOG:=adw_dialog_get_type;
  end;


end.
