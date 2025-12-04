
unit adap_carousel;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_carousel.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_carousel.h
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
PAdapSpringParams  = ^AdapSpringParams;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2019 Alice Mikhaylenko <alicem@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-spring-params.h"}

{ was #define dname def_expr }
function ADAP_TYPE_CAROUSEL : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapCarousel, adap_carousel, ADAP, CAROUSEL, GtkWidget) }
function adap_carousel_new:PGtkWidget;cdecl;external;
procedure adap_carousel_prepend(self:PAdapCarousel; child:PGtkWidget);cdecl;external;
procedure adap_carousel_append(self:PAdapCarousel; child:PGtkWidget);cdecl;external;
procedure adap_carousel_insert(self:PAdapCarousel; child:PGtkWidget; position:longint);cdecl;external;
procedure adap_carousel_reorder(self:PAdapCarousel; child:PGtkWidget; position:longint);cdecl;external;
procedure adap_carousel_remove(self:PAdapCarousel; child:PGtkWidget);cdecl;external;
procedure adap_carousel_scroll_to(self:PAdapCarousel; widget:PGtkWidget; animate:Tgboolean);cdecl;external;
function adap_carousel_get_nth_page(self:PAdapCarousel; n:Tguint):PGtkWidget;cdecl;external;
function adap_carousel_get_n_pages(self:PAdapCarousel):Tguint;cdecl;external;
function adap_carousel_get_position(self:PAdapCarousel):Tdouble;cdecl;external;
function adap_carousel_get_interactive(self:PAdapCarousel):Tgboolean;cdecl;external;
procedure adap_carousel_set_interactive(self:PAdapCarousel; interactive:Tgboolean);cdecl;external;
function adap_carousel_get_spacing(self:PAdapCarousel):Tguint;cdecl;external;
procedure adap_carousel_set_spacing(self:PAdapCarousel; spacing:Tguint);cdecl;external;
function adap_carousel_get_scroll_params(self:PAdapCarousel):PAdapSpringParams;cdecl;external;
procedure adap_carousel_set_scroll_params(self:PAdapCarousel; params:PAdapSpringParams);cdecl;external;
function adap_carousel_get_allow_mouse_drag(self:PAdapCarousel):Tgboolean;cdecl;external;
procedure adap_carousel_set_allow_mouse_drag(self:PAdapCarousel; allow_mouse_drag:Tgboolean);cdecl;external;
function adap_carousel_get_allow_scroll_wheel(self:PAdapCarousel):Tgboolean;cdecl;external;
procedure adap_carousel_set_allow_scroll_wheel(self:PAdapCarousel; allow_scroll_wheel:Tgboolean);cdecl;external;
function adap_carousel_get_allow_long_swipes(self:PAdapCarousel):Tgboolean;cdecl;external;
procedure adap_carousel_set_allow_long_swipes(self:PAdapCarousel; allow_long_swipes:Tgboolean);cdecl;external;
function adap_carousel_get_reveal_duration(self:PAdapCarousel):Tguint;cdecl;external;
procedure adap_carousel_set_reveal_duration(self:PAdapCarousel; reveal_duration:Tguint);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_CAROUSEL : longint; { return type might be wrong }
  begin
    ADAP_TYPE_CAROUSEL:=adap_carousel_get_type;
  end;


end.
