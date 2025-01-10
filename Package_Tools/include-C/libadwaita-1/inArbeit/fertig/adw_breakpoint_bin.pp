
unit adw_breakpoint_bin;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_breakpoint_bin.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_breakpoint_bin.h
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
PAdwBreakpoint  = ^AdwBreakpoint;
PAdwBreakpointBin  = ^AdwBreakpointBin;
PAdwBreakpointBinClass  = ^AdwBreakpointBinClass;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2023 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * Author: Alice Mikhaylenko <alice.mikhaylenko@puri.sm>
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-breakpoint.h"}

{ was #define dname def_expr }
function ADW_TYPE_BREAKPOINT_BIN : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AdwBreakpointBin, adw_breakpoint_bin, ADW, BREAKPOINT_BIN, GtkWidget) }
{< private > }
type
  PAdwBreakpointBinClass = ^TAdwBreakpointBinClass;
  TAdwBreakpointBinClass = record
      parent_class : TGtkWidgetClass;
      padding : array[0..3] of Tgpointer;
    end;


function adw_breakpoint_bin_new:PGtkWidget;cdecl;external;
function adw_breakpoint_bin_get_child(self:PAdwBreakpointBin):PGtkWidget;cdecl;external;
procedure adw_breakpoint_bin_set_child(self:PAdwBreakpointBin; child:PGtkWidget);cdecl;external;
procedure adw_breakpoint_bin_add_breakpoint(self:PAdwBreakpointBin; breakpoint:PAdwBreakpoint);cdecl;external;
procedure adw_breakpoint_bin_remove_breakpoint(self:PAdwBreakpointBin; breakpoint:PAdwBreakpoint);cdecl;external;
function adw_breakpoint_bin_get_current_breakpoint(self:PAdwBreakpointBin):PAdwBreakpoint;cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_BREAKPOINT_BIN : longint; { return type might be wrong }
  begin
    ADW_TYPE_BREAKPOINT_BIN:=adw_breakpoint_bin_get_type;
  end;


end.
