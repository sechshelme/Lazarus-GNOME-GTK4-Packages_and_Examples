
unit adap_entry_row;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_entry_row.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_entry_row.h
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
PAdapEntryRow  = ^AdapEntryRow;
PAdapEntryRowClass  = ^AdapEntryRowClass;
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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include "adap-preferences-row.h"}

{ was #define dname def_expr }
function ADAP_TYPE_ENTRY_ROW : longint; { return type might be wrong }

{////////G_DECLARE_DERIVABLE_TYPE (AdapEntryRow, adap_entry_row, ADAP, ENTRY_ROW, AdapPreferencesRow) }
{*
 * AdapEntryRowClass
 * @parent_class: The parent class
  }
type
  PAdapEntryRowClass = ^TAdapEntryRowClass;
  TAdapEntryRowClass = record
      parent_class : TAdapPreferencesRowClass;
    end;


function adap_entry_row_new:PGtkWidget;cdecl;external;
procedure adap_entry_row_add_prefix(self:PAdapEntryRow; widget:PGtkWidget);cdecl;external;
procedure adap_entry_row_add_suffix(self:PAdapEntryRow; widget:PGtkWidget);cdecl;external;
procedure adap_entry_row_remove(self:PAdapEntryRow; widget:PGtkWidget);cdecl;external;
function adap_entry_row_get_show_apply_button(self:PAdapEntryRow):Tgboolean;cdecl;external;
procedure adap_entry_row_set_show_apply_button(self:PAdapEntryRow; show_apply_button:Tgboolean);cdecl;external;
function adap_entry_row_get_input_hints(self:PAdapEntryRow):TGtkInputHints;cdecl;external;
procedure adap_entry_row_set_input_hints(self:PAdapEntryRow; hints:TGtkInputHints);cdecl;external;
function adap_entry_row_get_input_purpose(self:PAdapEntryRow):TGtkInputPurpose;cdecl;external;
procedure adap_entry_row_set_input_purpose(self:PAdapEntryRow; purpose:TGtkInputPurpose);cdecl;external;
function adap_entry_row_get_enable_emoji_completion(self:PAdapEntryRow):Tgboolean;cdecl;external;
procedure adap_entry_row_set_enable_emoji_completion(self:PAdapEntryRow; enable_emoji_completion:Tgboolean);cdecl;external;
function adap_entry_row_get_attributes(self:PAdapEntryRow):PPangoAttrList;cdecl;external;
procedure adap_entry_row_set_attributes(self:PAdapEntryRow; attributes:PPangoAttrList);cdecl;external;
function adap_entry_row_get_activates_default(self:PAdapEntryRow):Tgboolean;cdecl;external;
procedure adap_entry_row_set_activates_default(self:PAdapEntryRow; activates:Tgboolean);cdecl;external;
function adap_entry_row_get_text_length(self:PAdapEntryRow):Tguint;cdecl;external;
function adap_entry_row_grab_focus_without_selecting(self:PAdapEntryRow):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_ENTRY_ROW : longint; { return type might be wrong }
  begin
    ADAP_TYPE_ENTRY_ROW:=adap_entry_row_get_type;
  end;


end.
