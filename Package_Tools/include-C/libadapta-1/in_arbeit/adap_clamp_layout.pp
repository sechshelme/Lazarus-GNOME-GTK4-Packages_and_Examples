
unit adap_clamp_layout;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_clamp_layout.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_clamp_layout.h
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
PAdapClampLayout  = ^AdapClampLayout;
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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-length-unit.h"}

{ was #define dname def_expr }
function ADAP_TYPE_CLAMP_LAYOUT : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapClampLayout, adap_clamp_layout, ADAP, CLAMP_LAYOUT, GtkLayoutManager) }
function adap_clamp_layout_new:PGtkLayoutManager;cdecl;external;
function adap_clamp_layout_get_maximum_size(self:PAdapClampLayout):longint;cdecl;external;
procedure adap_clamp_layout_set_maximum_size(self:PAdapClampLayout; maximum_size:longint);cdecl;external;
function adap_clamp_layout_get_tightening_threshold(self:PAdapClampLayout):longint;cdecl;external;
procedure adap_clamp_layout_set_tightening_threshold(self:PAdapClampLayout; tightening_threshold:longint);cdecl;external;
function adap_clamp_layout_get_unit(self:PAdapClampLayout):TAdapLengthUnit;cdecl;external;
procedure adap_clamp_layout_set_unit(self:PAdapClampLayout; unit:TAdapLengthUnit);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_CLAMP_LAYOUT : longint; { return type might be wrong }
  begin
    ADAP_TYPE_CLAMP_LAYOUT:=adap_clamp_layout_get_type;
  end;


end.
