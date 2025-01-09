
unit adw_expander_row;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_expander_row.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_expander_row.h
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
PAdwExpanderRow  = ^AdwExpanderRow;
PAdwExpanderRowClass  = ^AdwExpanderRowClass;
Pchar  = ^char;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2018 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-preferences-row.h"}

{ was #define dname def_expr }
function ADW_TYPE_EXPANDER_ROW : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AdwExpanderRow, adw_expander_row, ADW, EXPANDER_ROW, AdwPreferencesRow) }
{*
 * AdwExpanderRowClass
 * @parent_class: The parent class
  }
{< private > }
type
  PAdwExpanderRowClass = ^TAdwExpanderRowClass;
  TAdwExpanderRowClass = record
      parent_class : TAdwPreferencesRowClass;
      padding : array[0..3] of Tgpointer;
    end;


function adw_expander_row_new:PGtkWidget;cdecl;external;
procedure adw_expander_row_add_action(self:PAdwExpanderRow; widget:PGtkWidget);cdecl;external;
procedure adw_expander_row_add_prefix(self:PAdwExpanderRow; widget:PGtkWidget);cdecl;external;
procedure adw_expander_row_add_suffix(self:PAdwExpanderRow; widget:PGtkWidget);cdecl;external;
procedure adw_expander_row_add_row(self:PAdwExpanderRow; child:PGtkWidget);cdecl;external;
procedure adw_expander_row_remove(self:PAdwExpanderRow; child:PGtkWidget);cdecl;external;
(* Const before type ignored *)
function adw_expander_row_get_subtitle(self:PAdwExpanderRow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_expander_row_set_subtitle(self:PAdwExpanderRow; subtitle:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_expander_row_get_icon_name(self:PAdwExpanderRow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_expander_row_set_icon_name(self:PAdwExpanderRow; icon_name:Pchar);cdecl;external;
function adw_expander_row_get_expanded(self:PAdwExpanderRow):Tgboolean;cdecl;external;
procedure adw_expander_row_set_expanded(self:PAdwExpanderRow; expanded:Tgboolean);cdecl;external;
function adw_expander_row_get_enable_expansion(self:PAdwExpanderRow):Tgboolean;cdecl;external;
procedure adw_expander_row_set_enable_expansion(self:PAdwExpanderRow; enable_expansion:Tgboolean);cdecl;external;
function adw_expander_row_get_show_enable_switch(self:PAdwExpanderRow):Tgboolean;cdecl;external;
procedure adw_expander_row_set_show_enable_switch(self:PAdwExpanderRow; show_enable_switch:Tgboolean);cdecl;external;
function adw_expander_row_get_title_lines(self:PAdwExpanderRow):Tgboolean;cdecl;external;
procedure adw_expander_row_set_title_lines(self:PAdwExpanderRow; title_lines:longint);cdecl;external;
function adw_expander_row_get_subtitle_lines(self:PAdwExpanderRow):Tgboolean;cdecl;external;
procedure adw_expander_row_set_subtitle_lines(self:PAdwExpanderRow; subtitle_lines:longint);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_EXPANDER_ROW : longint; { return type might be wrong }
  begin
    ADW_TYPE_EXPANDER_ROW:=adw_expander_row_get_type;
  end;


end.
