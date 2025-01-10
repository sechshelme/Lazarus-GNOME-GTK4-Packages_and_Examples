
unit adw_clamp_scrollable;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_clamp_scrollable.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_clamp_scrollable.h
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
PAdwClampScrollable  = ^AdwClampScrollable;
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
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-length-unit.h"}

{ was #define dname def_expr }
function ADW_TYPE_CLAMP_SCROLLABLE : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwClampScrollable, adw_clamp_scrollable, ADW, CLAMP_SCROLLABLE, GtkWidget) }
function adw_clamp_scrollable_new:PGtkWidget;cdecl;external;
function adw_clamp_scrollable_get_child(self:PAdwClampScrollable):PGtkWidget;cdecl;external;
procedure adw_clamp_scrollable_set_child(self:PAdwClampScrollable; child:PGtkWidget);cdecl;external;
function adw_clamp_scrollable_get_maximum_size(self:PAdwClampScrollable):longint;cdecl;external;
procedure adw_clamp_scrollable_set_maximum_size(self:PAdwClampScrollable; maximum_size:longint);cdecl;external;
function adw_clamp_scrollable_get_tightening_threshold(self:PAdwClampScrollable):longint;cdecl;external;
procedure adw_clamp_scrollable_set_tightening_threshold(self:PAdwClampScrollable; tightening_threshold:longint);cdecl;external;
function adw_clamp_scrollable_get_unit(self:PAdwClampScrollable):TAdwLengthUnit;cdecl;external;
procedure adw_clamp_scrollable_set_unit(self:PAdwClampScrollable; unit:TAdwLengthUnit);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_CLAMP_SCROLLABLE : longint; { return type might be wrong }
  begin
    ADW_TYPE_CLAMP_SCROLLABLE:=adw_clamp_scrollable_get_type;
  end;


end.
