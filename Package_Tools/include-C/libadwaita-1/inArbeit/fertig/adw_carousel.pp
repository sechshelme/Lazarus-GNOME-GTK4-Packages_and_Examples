
unit adw_carousel;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_carousel.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_carousel.h
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
PAdwSpringParams  = ^AdwSpringParams;
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
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-spring-params.h"}

{ was #define dname def_expr }
function ADW_TYPE_CAROUSEL : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwCarousel, adw_carousel, ADW, CAROUSEL, GtkWidget) }
function adw_carousel_new:PGtkWidget;cdecl;external;
procedure adw_carousel_prepend(self:PAdwCarousel; child:PGtkWidget);cdecl;external;
procedure adw_carousel_append(self:PAdwCarousel; child:PGtkWidget);cdecl;external;
procedure adw_carousel_insert(self:PAdwCarousel; child:PGtkWidget; position:longint);cdecl;external;
procedure adw_carousel_reorder(self:PAdwCarousel; child:PGtkWidget; position:longint);cdecl;external;
procedure adw_carousel_remove(self:PAdwCarousel; child:PGtkWidget);cdecl;external;
procedure adw_carousel_scroll_to(self:PAdwCarousel; widget:PGtkWidget; animate:Tgboolean);cdecl;external;
function adw_carousel_get_nth_page(self:PAdwCarousel; n:Tguint):PGtkWidget;cdecl;external;
function adw_carousel_get_n_pages(self:PAdwCarousel):Tguint;cdecl;external;
function adw_carousel_get_position(self:PAdwCarousel):Tdouble;cdecl;external;
function adw_carousel_get_interactive(self:PAdwCarousel):Tgboolean;cdecl;external;
procedure adw_carousel_set_interactive(self:PAdwCarousel; interactive:Tgboolean);cdecl;external;
function adw_carousel_get_spacing(self:PAdwCarousel):Tguint;cdecl;external;
procedure adw_carousel_set_spacing(self:PAdwCarousel; spacing:Tguint);cdecl;external;
function adw_carousel_get_scroll_params(self:PAdwCarousel):PAdwSpringParams;cdecl;external;
procedure adw_carousel_set_scroll_params(self:PAdwCarousel; params:PAdwSpringParams);cdecl;external;
function adw_carousel_get_allow_mouse_drag(self:PAdwCarousel):Tgboolean;cdecl;external;
procedure adw_carousel_set_allow_mouse_drag(self:PAdwCarousel; allow_mouse_drag:Tgboolean);cdecl;external;
function adw_carousel_get_allow_scroll_wheel(self:PAdwCarousel):Tgboolean;cdecl;external;
procedure adw_carousel_set_allow_scroll_wheel(self:PAdwCarousel; allow_scroll_wheel:Tgboolean);cdecl;external;
function adw_carousel_get_allow_long_swipes(self:PAdwCarousel):Tgboolean;cdecl;external;
procedure adw_carousel_set_allow_long_swipes(self:PAdwCarousel; allow_long_swipes:Tgboolean);cdecl;external;
function adw_carousel_get_reveal_duration(self:PAdwCarousel):Tguint;cdecl;external;
procedure adw_carousel_set_reveal_duration(self:PAdwCarousel; reveal_duration:Tguint);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_CAROUSEL : longint; { return type might be wrong }
  begin
    ADW_TYPE_CAROUSEL:=adw_carousel_get_type;
  end;


end.
