
unit adw_entry_row;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_entry_row.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_entry_row.h
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
PAdwEntryRow  = ^AdwEntryRow;
PAdwEntryRowClass  = ^AdwEntryRowClass;
PGtkWidget  = ^GtkWidget;
PPangoAttrList  = ^PangoAttrList;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 Maximiliano Sandoval <msandova@protonmail.com>
 * Copyright (C) 2022 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include "adw-preferences-row.h"}

{ was #define dname def_expr }
function ADW_TYPE_ENTRY_ROW : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AdwEntryRow, adw_entry_row, ADW, ENTRY_ROW, AdwPreferencesRow) }
{*
 * AdwEntryRowClass
 * @parent_class: The parent class
  }
type
  PAdwEntryRowClass = ^TAdwEntryRowClass;
  TAdwEntryRowClass = record
      parent_class : TAdwPreferencesRowClass;
    end;


function adw_entry_row_new:PGtkWidget;cdecl;external;
procedure adw_entry_row_add_prefix(self:PAdwEntryRow; widget:PGtkWidget);cdecl;external;
procedure adw_entry_row_add_suffix(self:PAdwEntryRow; widget:PGtkWidget);cdecl;external;
procedure adw_entry_row_remove(self:PAdwEntryRow; widget:PGtkWidget);cdecl;external;
function adw_entry_row_get_show_apply_button(self:PAdwEntryRow):Tgboolean;cdecl;external;
procedure adw_entry_row_set_show_apply_button(self:PAdwEntryRow; show_apply_button:Tgboolean);cdecl;external;
function adw_entry_row_get_input_hints(self:PAdwEntryRow):TGtkInputHints;cdecl;external;
procedure adw_entry_row_set_input_hints(self:PAdwEntryRow; hints:TGtkInputHints);cdecl;external;
function adw_entry_row_get_input_purpose(self:PAdwEntryRow):TGtkInputPurpose;cdecl;external;
procedure adw_entry_row_set_input_purpose(self:PAdwEntryRow; purpose:TGtkInputPurpose);cdecl;external;
function adw_entry_row_get_enable_emoji_completion(self:PAdwEntryRow):Tgboolean;cdecl;external;
procedure adw_entry_row_set_enable_emoji_completion(self:PAdwEntryRow; enable_emoji_completion:Tgboolean);cdecl;external;
function adw_entry_row_get_attributes(self:PAdwEntryRow):PPangoAttrList;cdecl;external;
procedure adw_entry_row_set_attributes(self:PAdwEntryRow; attributes:PPangoAttrList);cdecl;external;
function adw_entry_row_get_activates_default(self:PAdwEntryRow):Tgboolean;cdecl;external;
procedure adw_entry_row_set_activates_default(self:PAdwEntryRow; activates:Tgboolean);cdecl;external;
function adw_entry_row_get_text_length(self:PAdwEntryRow):Tguint;cdecl;external;
function adw_entry_row_grab_focus_without_selecting(self:PAdwEntryRow):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_ENTRY_ROW : longint; { return type might be wrong }
  begin
    ADW_TYPE_ENTRY_ROW:=adw_entry_row_get_type;
  end;


end.
