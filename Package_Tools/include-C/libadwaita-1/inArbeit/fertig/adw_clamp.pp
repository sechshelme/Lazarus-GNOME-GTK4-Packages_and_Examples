
unit adw_clamp;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_clamp.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_clamp.h
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
PAdwClamp  = ^AdwClamp;
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
{$include "adw-length-unit.h"}

{ was #define dname def_expr }
function ADW_TYPE_CLAMP : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwClamp, adw_clamp, ADW, CLAMP, GtkWidget) }
function adw_clamp_new:PGtkWidget;cdecl;external;
function adw_clamp_get_child(self:PAdwClamp):PGtkWidget;cdecl;external;
procedure adw_clamp_set_child(self:PAdwClamp; child:PGtkWidget);cdecl;external;
function adw_clamp_get_maximum_size(self:PAdwClamp):longint;cdecl;external;
procedure adw_clamp_set_maximum_size(self:PAdwClamp; maximum_size:longint);cdecl;external;
function adw_clamp_get_tightening_threshold(self:PAdwClamp):longint;cdecl;external;
procedure adw_clamp_set_tightening_threshold(self:PAdwClamp; tightening_threshold:longint);cdecl;external;
function adw_clamp_get_unit(self:PAdwClamp):TAdwLengthUnit;cdecl;external;
procedure adw_clamp_set_unit(self:PAdwClamp; unit:TAdwLengthUnit);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_CLAMP : longint; { return type might be wrong }
  begin
    ADW_TYPE_CLAMP:=adw_clamp_get_type;
  end;


end.
