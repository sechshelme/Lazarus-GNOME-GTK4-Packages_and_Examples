unit adap_clamp_layout;

interface

uses
  fp_adapta;

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

{G_DECLARE_FINAL_TYPE (AdapClampLayout, adap_clamp_layout, ADAP, CLAMP_LAYOUT, GtkLayoutManager) }
function adap_clamp_layout_new:PGtkLayoutManager;cdecl;external libadapta;
function adap_clamp_layout_get_maximum_size(self:PAdapClampLayout):longint;cdecl;external libadapta;
procedure adap_clamp_layout_set_maximum_size(self:PAdapClampLayout; maximum_size:longint);cdecl;external libadapta;
function adap_clamp_layout_get_tightening_threshold(self:PAdapClampLayout):longint;cdecl;external libadapta;
procedure adap_clamp_layout_set_tightening_threshold(self:PAdapClampLayout; tightening_threshold:longint);cdecl;external libadapta;
function adap_clamp_layout_get_unit(self:PAdapClampLayout):TAdapLengthUnit;cdecl;external libadapta;
procedure adap_clamp_layout_set_unit(self:PAdapClampLayout; unit:TAdapLengthUnit);cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:01:39 ===

function ADAP_TYPE_CLAMP_LAYOUT: TGType;
function ADAP_CLAMP_LAYOUT(obj: Pointer): PAdapClampLayout;
function ADAP_IS_CLAMP_LAYOUT(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_CLAMP_LAYOUT: TGType;
begin
  Result := adap_clamp_layout_get_type;
end;

function ADAP_CLAMP_LAYOUT(obj: Pointer): PAdapClampLayout;
begin
  Result := PAdapClampLayout(g_type_check_instance_cast(obj, ADAP_TYPE_CLAMP_LAYOUT));
end;

function ADAP_IS_CLAMP_LAYOUT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_CLAMP_LAYOUT);
end;

type 
  TAdapClampLayout = record
  end;
  PAdapClampLayout = ^TAdapClampLayout;

  TAdapClampLayoutClass = record
    parent_class: TGtkLayoutManagerClass;
  end;
  PAdapClampLayoutClass = ^TAdapClampLayoutClass;

function adap_clamp_layout_get_type: TGType; cdecl; external libgxxxxxxx;



end.
