
unit adw_clamp_layout;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_clamp_layout.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_clamp_layout.h
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
PAdwClampLayout  = ^AdwClampLayout;
PGtkLayoutManager  = ^GtkLayoutManager;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2018-2020 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-length-unit.h"}

{ was #define dname def_expr }
function ADW_TYPE_CLAMP_LAYOUT : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwClampLayout, adw_clamp_layout, ADW, CLAMP_LAYOUT, GtkLayoutManager) }
function adw_clamp_layout_new:PGtkLayoutManager;cdecl;external;
function adw_clamp_layout_get_maximum_size(self:PAdwClampLayout):longint;cdecl;external;
procedure adw_clamp_layout_set_maximum_size(self:PAdwClampLayout; maximum_size:longint);cdecl;external;
function adw_clamp_layout_get_tightening_threshold(self:PAdwClampLayout):longint;cdecl;external;
procedure adw_clamp_layout_set_tightening_threshold(self:PAdwClampLayout; tightening_threshold:longint);cdecl;external;
function adw_clamp_layout_get_unit(self:PAdwClampLayout):TAdwLengthUnit;cdecl;external;
procedure adw_clamp_layout_set_unit(self:PAdwClampLayout; unit:TAdwLengthUnit);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_CLAMP_LAYOUT : longint; { return type might be wrong }
  begin
    ADW_TYPE_CLAMP_LAYOUT:=adw_clamp_layout_get_type;
  end;


end.
