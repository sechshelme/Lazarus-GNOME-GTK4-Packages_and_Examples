
unit adap_expander_row;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_expander_row.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_expander_row.h
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
PAdapExpanderRow  = ^AdapExpanderRow;
PAdapExpanderRowClass  = ^AdapExpanderRowClass;
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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-preferences-row.h"}

{ was #define dname def_expr }
function ADAP_TYPE_EXPANDER_ROW : longint; { return type might be wrong }

{////////G_DECLARE_DERIVABLE_TYPE (AdapExpanderRow, adap_expander_row, ADAP, EXPANDER_ROW, AdapPreferencesRow) }
{*
 * AdapExpanderRowClass
 * @parent_class: The parent class
  }
{< private > }
type
  PAdapExpanderRowClass = ^TAdapExpanderRowClass;
  TAdapExpanderRowClass = record
      parent_class : TAdapPreferencesRowClass;
      padding : array[0..3] of Tgpointer;
    end;


function adap_expander_row_new:PGtkWidget;cdecl;external;
{xxxxxxxxADAP_DEPRECATED_IN_1_4_FOR (adap_expander_row_add_suffix) }
procedure adap_expander_row_add_action(self:PAdapExpanderRow; widget:PGtkWidget);cdecl;external;
procedure adap_expander_row_add_prefix(self:PAdapExpanderRow; widget:PGtkWidget);cdecl;external;
procedure adap_expander_row_add_suffix(self:PAdapExpanderRow; widget:PGtkWidget);cdecl;external;
procedure adap_expander_row_add_row(self:PAdapExpanderRow; child:PGtkWidget);cdecl;external;
procedure adap_expander_row_remove(self:PAdapExpanderRow; child:PGtkWidget);cdecl;external;
(* Const before type ignored *)
function adap_expander_row_get_subtitle(self:PAdapExpanderRow):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_expander_row_set_subtitle(self:PAdapExpanderRow; subtitle:Pchar);cdecl;external;
{xxxxADAP_DEPRECATED_IN_1_3_FOR (adap_expander_row_add_prefix) }
(* Const before type ignored *)
function adap_expander_row_get_icon_name(self:PAdapExpanderRow):Pchar;cdecl;external;
{xxxxxxADAP_DEPRECATED_IN_1_3_FOR (adap_expander_row_add_prefix) }
(* Const before type ignored *)
procedure adap_expander_row_set_icon_name(self:PAdapExpanderRow; icon_name:Pchar);cdecl;external;
function adap_expander_row_get_expanded(self:PAdapExpanderRow):Tgboolean;cdecl;external;
procedure adap_expander_row_set_expanded(self:PAdapExpanderRow; expanded:Tgboolean);cdecl;external;
function adap_expander_row_get_enable_expansion(self:PAdapExpanderRow):Tgboolean;cdecl;external;
procedure adap_expander_row_set_enable_expansion(self:PAdapExpanderRow; enable_expansion:Tgboolean);cdecl;external;
function adap_expander_row_get_show_enable_switch(self:PAdapExpanderRow):Tgboolean;cdecl;external;
procedure adap_expander_row_set_show_enable_switch(self:PAdapExpanderRow; show_enable_switch:Tgboolean);cdecl;external;
function adap_expander_row_get_title_lines(self:PAdapExpanderRow):longint;cdecl;external;
procedure adap_expander_row_set_title_lines(self:PAdapExpanderRow; title_lines:longint);cdecl;external;
function adap_expander_row_get_subtitle_lines(self:PAdapExpanderRow):longint;cdecl;external;
procedure adap_expander_row_set_subtitle_lines(self:PAdapExpanderRow; subtitle_lines:longint);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_EXPANDER_ROW : longint; { return type might be wrong }
  begin
    ADAP_TYPE_EXPANDER_ROW:=adap_expander_row_get_type;
  end;


end.
