
unit adap_clamp_scrollable;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_clamp_scrollable.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_clamp_scrollable.h
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
PAdapClampScrollable  = ^AdapClampScrollable;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2020 Purism SPC
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
function ADAP_TYPE_CLAMP_SCROLLABLE : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapClampScrollable, adap_clamp_scrollable, ADAP, CLAMP_SCROLLABLE, GtkWidget) }
function adap_clamp_scrollable_new:PGtkWidget;cdecl;external;
function adap_clamp_scrollable_get_child(self:PAdapClampScrollable):PGtkWidget;cdecl;external;
procedure adap_clamp_scrollable_set_child(self:PAdapClampScrollable; child:PGtkWidget);cdecl;external;
function adap_clamp_scrollable_get_maximum_size(self:PAdapClampScrollable):longint;cdecl;external;
procedure adap_clamp_scrollable_set_maximum_size(self:PAdapClampScrollable; maximum_size:longint);cdecl;external;
function adap_clamp_scrollable_get_tightening_threshold(self:PAdapClampScrollable):longint;cdecl;external;
procedure adap_clamp_scrollable_set_tightening_threshold(self:PAdapClampScrollable; tightening_threshold:longint);cdecl;external;
function adap_clamp_scrollable_get_unit(self:PAdapClampScrollable):TAdapLengthUnit;cdecl;external;
procedure adap_clamp_scrollable_set_unit(self:PAdapClampScrollable; unit:TAdapLengthUnit);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_CLAMP_SCROLLABLE : longint; { return type might be wrong }
  begin
    ADAP_TYPE_CLAMP_SCROLLABLE:=adap_clamp_scrollable_get_type;
  end;


end.
