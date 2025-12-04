
unit adap_carousel_indicator_lines;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_carousel_indicator_lines.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_carousel_indicator_lines.h
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
PAdapCarousel  = ^AdapCarousel;
PAdapCarouselIndicatorLines  = ^AdapCarouselIndicatorLines;
PGtkWidget  = ^GtkWidget;
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

{ was #define dname def_expr }
function ADAP_TYPE_CAROUSEL_INDICATOR_LINES : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapCarouselIndicatorLines, adap_carousel_indicator_lines, ADAP, CAROUSEL_INDICATOR_LINES, GtkWidget) }
function adap_carousel_indicator_lines_new:PGtkWidget;cdecl;external;
function adap_carousel_indicator_lines_get_carousel(self:PAdapCarouselIndicatorLines):PAdapCarousel;cdecl;external;
procedure adap_carousel_indicator_lines_set_carousel(self:PAdapCarouselIndicatorLines; carousel:PAdapCarousel);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_CAROUSEL_INDICATOR_LINES : longint; { return type might be wrong }
  begin
    ADAP_TYPE_CAROUSEL_INDICATOR_LINES:=adap_carousel_indicator_lines_get_type;
  end;


end.
