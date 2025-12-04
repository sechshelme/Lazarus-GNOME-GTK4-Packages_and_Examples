unit adap_carousel_indicator_dots;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2020 Alice Mikhaylenko <alicem@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-carousel.h"}

{G_DECLARE_FINAL_TYPE (AdapCarouselIndicatorDots, adap_carousel_indicator_dots, ADAP, CAROUSEL_INDICATOR_DOTS, GtkWidget) }
function adap_carousel_indicator_dots_new:PGtkWidget;cdecl;external libadapta;
function adap_carousel_indicator_dots_get_carousel(self:PAdapCarouselIndicatorDots):PAdapCarousel;cdecl;external libadapta;
procedure adap_carousel_indicator_dots_set_carousel(self:PAdapCarouselIndicatorDots; carousel:PAdapCarousel);cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:01:31 ===

function ADAP_TYPE_CAROUSEL_INDICATOR_DOTS: TGType;
function ADAP_CAROUSEL_INDICATOR_DOTS(obj: Pointer): PAdapCarouselIndicatorDots;
function ADAP_IS_CAROUSEL_INDICATOR_DOTS(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_CAROUSEL_INDICATOR_DOTS: TGType;
begin
  Result := adap_carousel_indicator_dots_get_type;
end;

function ADAP_CAROUSEL_INDICATOR_DOTS(obj: Pointer): PAdapCarouselIndicatorDots;
begin
  Result := PAdapCarouselIndicatorDots(g_type_check_instance_cast(obj, ADAP_TYPE_CAROUSEL_INDICATOR_DOTS));
end;

function ADAP_IS_CAROUSEL_INDICATOR_DOTS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_CAROUSEL_INDICATOR_DOTS);
end;

type 
  TAdapCarouselIndicatorDots = record
  end;
  PAdapCarouselIndicatorDots = ^TAdapCarouselIndicatorDots;

  TAdapCarouselIndicatorDotsClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapCarouselIndicatorDotsClass = ^TAdapCarouselIndicatorDotsClass;

function adap_carousel_indicator_dots_get_type: TGType; cdecl; external libgxxxxxxx;



end.
