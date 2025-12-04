unit adap_bin;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 Purism SPC
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

{////////G_DECLARE_DERIVABLE_TYPE (AdapBin, adap_bin, ADAP, BIN, GtkWidget) }
type
  PAdapBinClass = ^TAdapBinClass;
  TAdapBinClass = record
      parent_class : TGtkWidgetClass;
    end;


function adap_bin_new:PGtkWidget;cdecl;external libadapta;
function adap_bin_get_child(self:PAdapBin):PGtkWidget;cdecl;external libadapta;
procedure adap_bin_set_child(self:PAdapBin; child:PGtkWidget);cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:01:11 ===

function ADAP_TYPE_BIN: TGType;
function ADAP_BIN(obj: Pointer): PAdapBin;
function ADAP_IS_BIN(obj: Pointer): Tgboolean;
function ADAP_BIN_CLASS(klass: Pointer): PAdapBinClass;
function ADAP_IS_BIN_CLASS(klass: Pointer): Tgboolean;
function ADAP_BIN_GET_CLASS(obj: Pointer): PAdapBinClass;

implementation

function ADAP_TYPE_BIN: TGType;
begin
  Result := adap_bin_get_type;
end;

function ADAP_BIN(obj: Pointer): PAdapBin;
begin
  Result := PAdapBin(g_type_check_instance_cast(obj, ADAP_TYPE_BIN));
end;

function ADAP_IS_BIN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_BIN);
end;

function ADAP_BIN_CLASS(klass: Pointer): PAdapBinClass;
begin
  Result := PAdapBinClass(g_type_check_class_cast(klass, ADAP_TYPE_BIN));
end;

function ADAP_IS_BIN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADAP_TYPE_BIN);
end;

function ADAP_BIN_GET_CLASS(obj: Pointer): PAdapBinClass;
begin
  Result := PAdapBinClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAdapBin = record
    parent_instance: TGtkWidget;
  end;
  PAdapBin = ^TAdapBin;

  TAdapBinClass = record
  end;
  PAdapBinClass = ^TAdapBinClass;

function adap_bin_get_type: TGType; cdecl; external libgxxxxxxx;



end.
