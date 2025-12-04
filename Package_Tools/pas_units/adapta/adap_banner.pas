unit adap_banner;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2022 Jamie Murphy <hello@itsjamie.dev>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-enums.h"}

{G_DECLARE_FINAL_TYPE (AdapBanner, adap_banner, ADAP, BANNER, GtkWidget) }
function adap_banner_new(title:Pchar):PGtkWidget;cdecl;external libadapta;
function adap_banner_get_title(self:PAdapBanner):Pchar;cdecl;external libadapta;
procedure adap_banner_set_title(self:PAdapBanner; title:Pchar);cdecl;external libadapta;
function adap_banner_get_button_label(self:PAdapBanner):Pchar;cdecl;external libadapta;
procedure adap_banner_set_button_label(self:PAdapBanner; _label:Pchar);cdecl;external libadapta;
function adap_banner_get_revealed(self:PAdapBanner):Tgboolean;cdecl;external libadapta;
procedure adap_banner_set_revealed(self:PAdapBanner; revealed:Tgboolean);cdecl;external libadapta;
function adap_banner_get_use_markup(self:PAdapBanner):Tgboolean;cdecl;external libadapta;
procedure adap_banner_set_use_markup(self:PAdapBanner; use_markup:Tgboolean);cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:01:08 ===

function ADAP_TYPE_BANNER: TGType;
function ADAP_BANNER(obj: Pointer): PAdapBanner;
function ADAP_IS_BANNER(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_BANNER: TGType;
begin
  Result := adap_banner_get_type;
end;

function ADAP_BANNER(obj: Pointer): PAdapBanner;
begin
  Result := PAdapBanner(g_type_check_instance_cast(obj, ADAP_TYPE_BANNER));
end;

function ADAP_IS_BANNER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_BANNER);
end;

type 
  TAdapBanner = record
  end;
  PAdapBanner = ^TAdapBanner;

  TAdapBannerClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapBannerClass = ^TAdapBannerClass;

function adap_banner_get_type: TGType; cdecl; external libgxxxxxxx;



end.
