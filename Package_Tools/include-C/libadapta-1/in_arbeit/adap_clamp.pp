
unit adap_clamp;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_clamp.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_clamp.h
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
PAdapClamp  = ^AdapClamp;
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
{$include "adap-length-unit.h"}

{ was #define dname def_expr }
function ADAP_TYPE_CLAMP : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapClamp, adap_clamp, ADAP, CLAMP, GtkWidget) }
function adap_clamp_new:PGtkWidget;cdecl;external;
function adap_clamp_get_child(self:PAdapClamp):PGtkWidget;cdecl;external;
procedure adap_clamp_set_child(self:PAdapClamp; child:PGtkWidget);cdecl;external;
function adap_clamp_get_maximum_size(self:PAdapClamp):longint;cdecl;external;
procedure adap_clamp_set_maximum_size(self:PAdapClamp; maximum_size:longint);cdecl;external;
function adap_clamp_get_tightening_threshold(self:PAdapClamp):longint;cdecl;external;
procedure adap_clamp_set_tightening_threshold(self:PAdapClamp; tightening_threshold:longint);cdecl;external;
function adap_clamp_get_unit(self:PAdapClamp):TAdapLengthUnit;cdecl;external;
procedure adap_clamp_set_unit(self:PAdapClamp; unit:TAdapLengthUnit);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_CLAMP : longint; { return type might be wrong }
  begin
    ADAP_TYPE_CLAMP:=adap_clamp_get_type;
  end;


end.
