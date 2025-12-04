unit adap_breakpoint_bin;

interface

uses
  fp_adapta;

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

{////////G_DECLARE_DERIVABLE_TYPE (AdapBreakpointBin, adap_breakpoint_bin, ADAP, BREAKPOINT_BIN, GtkWidget) }
{< private > }
type
  PAdapBreakpointBinClass = ^TAdapBreakpointBinClass;
  TAdapBreakpointBinClass = record
      parent_class : TGtkWidgetClass;
      padding : array[0..3] of Tgpointer;
    end;


function adap_breakpoint_bin_new:PGtkWidget;cdecl;external libadapta;
function adap_breakpoint_bin_get_child(self:PAdapBreakpointBin):PGtkWidget;cdecl;external libadapta;
procedure adap_breakpoint_bin_set_child(self:PAdapBreakpointBin; child:PGtkWidget);cdecl;external libadapta;
procedure adap_breakpoint_bin_add_breakpoint(self:PAdapBreakpointBin; breakpoint:PAdapBreakpoint);cdecl;external libadapta;
procedure adap_breakpoint_bin_remove_breakpoint(self:PAdapBreakpointBin; breakpoint:PAdapBreakpoint);cdecl;external libadapta;
function adap_breakpoint_bin_get_current_breakpoint(self:PAdapBreakpointBin):PAdapBreakpoint;cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:01:18 ===

function ADAP_TYPE_BREAKPOINT_BIN: TGType;
function ADAP_BREAKPOINT_BIN(obj: Pointer): PAdapBreakpointBin;
function ADAP_IS_BREAKPOINT_BIN(obj: Pointer): Tgboolean;
function ADAP_BREAKPOINT_BIN_CLASS(klass: Pointer): PAdapBreakpointBinClass;
function ADAP_IS_BREAKPOINT_BIN_CLASS(klass: Pointer): Tgboolean;
function ADAP_BREAKPOINT_BIN_GET_CLASS(obj: Pointer): PAdapBreakpointBinClass;

implementation

function ADAP_TYPE_BREAKPOINT_BIN: TGType;
begin
  Result := adap_breakpoint_bin_get_type;
end;

function ADAP_BREAKPOINT_BIN(obj: Pointer): PAdapBreakpointBin;
begin
  Result := PAdapBreakpointBin(g_type_check_instance_cast(obj, ADAP_TYPE_BREAKPOINT_BIN));
end;

function ADAP_IS_BREAKPOINT_BIN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_BREAKPOINT_BIN);
end;

function ADAP_BREAKPOINT_BIN_CLASS(klass: Pointer): PAdapBreakpointBinClass;
begin
  Result := PAdapBreakpointBinClass(g_type_check_class_cast(klass, ADAP_TYPE_BREAKPOINT_BIN));
end;

function ADAP_IS_BREAKPOINT_BIN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADAP_TYPE_BREAKPOINT_BIN);
end;

function ADAP_BREAKPOINT_BIN_GET_CLASS(obj: Pointer): PAdapBreakpointBinClass;
begin
  Result := PAdapBreakpointBinClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAdapBreakpointBin = record
    parent_instance: TGtkWidget;
  end;
  PAdapBreakpointBin = ^TAdapBreakpointBin;

  TAdapBreakpointBinClass = record
  end;
  PAdapBreakpointBinClass = ^TAdapBreakpointBinClass;

function adap_breakpoint_bin_get_type: TGType; cdecl; external libgxxxxxxx;



end.
