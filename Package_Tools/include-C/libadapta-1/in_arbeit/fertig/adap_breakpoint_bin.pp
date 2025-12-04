
unit adap_breakpoint_bin;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_breakpoint_bin.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_breakpoint_bin.h
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
PAdapBreakpoint  = ^AdapBreakpoint;
PAdapBreakpointBin  = ^AdapBreakpointBin;
PAdapBreakpointBinClass  = ^AdapBreakpointBinClass;
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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-breakpoint.h"}

{ was #define dname def_expr }
function ADAP_TYPE_BREAKPOINT_BIN : longint; { return type might be wrong }

{////////G_DECLARE_DERIVABLE_TYPE (AdapBreakpointBin, adap_breakpoint_bin, ADAP, BREAKPOINT_BIN, GtkWidget) }
{< private > }
type
  PAdapBreakpointBinClass = ^TAdapBreakpointBinClass;
  TAdapBreakpointBinClass = record
      parent_class : TGtkWidgetClass;
      padding : array[0..3] of Tgpointer;
    end;


function adap_breakpoint_bin_new:PGtkWidget;cdecl;external;
function adap_breakpoint_bin_get_child(self:PAdapBreakpointBin):PGtkWidget;cdecl;external;
procedure adap_breakpoint_bin_set_child(self:PAdapBreakpointBin; child:PGtkWidget);cdecl;external;
procedure adap_breakpoint_bin_add_breakpoint(self:PAdapBreakpointBin; breakpoint:PAdapBreakpoint);cdecl;external;
procedure adap_breakpoint_bin_remove_breakpoint(self:PAdapBreakpointBin; breakpoint:PAdapBreakpoint);cdecl;external;
function adap_breakpoint_bin_get_current_breakpoint(self:PAdapBreakpointBin):PAdapBreakpoint;cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_BREAKPOINT_BIN : longint; { return type might be wrong }
  begin
    ADAP_TYPE_BREAKPOINT_BIN:=adap_breakpoint_bin_get_type;
  end;


end.
