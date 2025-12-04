unit adap_clamp_scrollable;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta;

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

{G_DECLARE_FINAL_TYPE (AdapClampScrollable, adap_clamp_scrollable, ADAP, CLAMP_SCROLLABLE, GtkWidget) }
function adap_clamp_scrollable_new:PGtkWidget;cdecl;external libadapta;
function adap_clamp_scrollable_get_child(self:PAdapClampScrollable):PGtkWidget;cdecl;external libadapta;
procedure adap_clamp_scrollable_set_child(self:PAdapClampScrollable; child:PGtkWidget);cdecl;external libadapta;
function adap_clamp_scrollable_get_maximum_size(self:PAdapClampScrollable):longint;cdecl;external libadapta;
procedure adap_clamp_scrollable_set_maximum_size(self:PAdapClampScrollable; maximum_size:longint);cdecl;external libadapta;
function adap_clamp_scrollable_get_tightening_threshold(self:PAdapClampScrollable):longint;cdecl;external libadapta;
procedure adap_clamp_scrollable_set_tightening_threshold(self:PAdapClampScrollable; tightening_threshold:longint);cdecl;external libadapta;
function adap_clamp_scrollable_get_unit(self:PAdapClampScrollable):TAdapLengthUnit;cdecl;external libadapta;
procedure adap_clamp_scrollable_set_unit(self:PAdapClampScrollable; unit:TAdapLengthUnit);cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:09:19 ===

function ADAP_TYPE_CLAMP_SCROLLABLE: TGType;
function ADAP_CLAMP_SCROLLABLE(obj: Pointer): PAdapClampScrollable;
function ADAP_IS_CLAMP_SCROLLABLE(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_CLAMP_SCROLLABLE: TGType;
begin
  Result := adap_clamp_scrollable_get_type;
end;

function ADAP_CLAMP_SCROLLABLE(obj: Pointer): PAdapClampScrollable;
begin
  Result := PAdapClampScrollable(g_type_check_instance_cast(obj, ADAP_TYPE_CLAMP_SCROLLABLE));
end;

function ADAP_IS_CLAMP_SCROLLABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_CLAMP_SCROLLABLE);
end;

type 
  TAdapClampScrollable = record
  end;
  PAdapClampScrollable = ^TAdapClampScrollable;

  TAdapClampScrollableClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapClampScrollableClass = ^TAdapClampScrollableClass;

function adap_clamp_scrollable_get_type: TGType; cdecl; external libgxxxxxxx;



end.
