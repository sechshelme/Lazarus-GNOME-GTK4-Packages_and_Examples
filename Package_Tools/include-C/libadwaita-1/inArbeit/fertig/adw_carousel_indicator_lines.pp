
unit adw_carousel_indicator_lines;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_carousel_indicator_lines.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_carousel_indicator_lines.h
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
PAdwCarousel  = ^AdwCarousel;
PAdwCarouselIndicatorLines  = ^AdwCarouselIndicatorLines;
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
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-carousel.h"}

{ was #define dname def_expr }
function ADW_TYPE_CAROUSEL_INDICATOR_LINES : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwCarouselIndicatorLines, adw_carousel_indicator_lines, ADW, CAROUSEL_INDICATOR_LINES, GtkWidget) }
function adw_carousel_indicator_lines_new:PGtkWidget;cdecl;external;
function adw_carousel_indicator_lines_get_carousel(self:PAdwCarouselIndicatorLines):PAdwCarousel;cdecl;external;
procedure adw_carousel_indicator_lines_set_carousel(self:PAdwCarouselIndicatorLines; carousel:PAdwCarousel);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_CAROUSEL_INDICATOR_LINES : longint; { return type might be wrong }
  begin
    ADW_TYPE_CAROUSEL_INDICATOR_LINES:=adw_carousel_indicator_lines_get_type;
  end;


end.
