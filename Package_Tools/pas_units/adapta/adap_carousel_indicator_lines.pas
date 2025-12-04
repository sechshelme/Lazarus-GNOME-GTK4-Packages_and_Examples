unit adap_carousel_indicator_lines;

interface

uses
  fp_adapta;

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

{G_DECLARE_FINAL_TYPE (AdapCarouselIndicatorLines, adap_carousel_indicator_lines, ADAP, CAROUSEL_INDICATOR_LINES, GtkWidget) }
function adap_carousel_indicator_lines_new:PGtkWidget;cdecl;external libadapta;
function adap_carousel_indicator_lines_get_carousel(self:PAdapCarouselIndicatorLines):PAdapCarousel;cdecl;external libadapta;
procedure adap_carousel_indicator_lines_set_carousel(self:PAdapCarouselIndicatorLines; carousel:PAdapCarousel);cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:01:34 ===

function ADAP_TYPE_CAROUSEL_INDICATOR_LINES: TGType;
function ADAP_CAROUSEL_INDICATOR_LINES(obj: Pointer): PAdapCarouselIndicatorLines;
function ADAP_IS_CAROUSEL_INDICATOR_LINES(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_CAROUSEL_INDICATOR_LINES: TGType;
begin
  Result := adap_carousel_indicator_lines_get_type;
end;

function ADAP_CAROUSEL_INDICATOR_LINES(obj: Pointer): PAdapCarouselIndicatorLines;
begin
  Result := PAdapCarouselIndicatorLines(g_type_check_instance_cast(obj, ADAP_TYPE_CAROUSEL_INDICATOR_LINES));
end;

function ADAP_IS_CAROUSEL_INDICATOR_LINES(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_CAROUSEL_INDICATOR_LINES);
end;

type 
  TAdapCarouselIndicatorLines = record
  end;
  PAdapCarouselIndicatorLines = ^TAdapCarouselIndicatorLines;

  TAdapCarouselIndicatorLinesClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapCarouselIndicatorLinesClass = ^TAdapCarouselIndicatorLinesClass;

function adap_carousel_indicator_lines_get_type: TGType; cdecl; external libgxxxxxxx;



end.
