
unit pangocairo;
interface

{
  Automatically converted by H2Pas 1.0.0 from pangocairo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pangocairo.h
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
Pcairo_font_options_t  = ^cairo_font_options_t;
Pcairo_scaled_font_t  = ^cairo_scaled_font_t;
Pcairo_t  = ^cairo_t;
Pchar  = ^char;
Pgpointer  = ^gpointer;
PPangoAttrShape  = ^PangoAttrShape;
PPangoCairoFont  = ^PangoCairoFont;
PPangoCairoFontMap  = ^PangoCairoFontMap;
PPangoContext  = ^PangoContext;
PPangoFont  = ^PangoFont;
PPangoFontMap  = ^PangoFontMap;
PPangoGlyphItem  = ^PangoGlyphItem;
PPangoGlyphString  = ^PangoGlyphString;
PPangoLayout  = ^PangoLayout;
PPangoLayoutLine  = ^PangoLayoutLine;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pangocairo.h:
 *
 * Copyright (C) 1999, 2004 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$ifndef __PANGOCAIRO_H__}
{$define __PANGOCAIRO_H__}
{$include <pango/pango.h>}
{$include <cairo.h>}
{*
 * PangoCairoFont:
 *
 * `PangoCairoFont` is an interface exported by fonts for
 * use with Cairo.
 *
 * The actual type of the font will depend on the particular
 * font technology Cairo was compiled to use.
 *
 * Since: 1.18
 * }
type
{ This is a hack because PangoCairo is hijacking the Pango namespace, but
 * consumers of the PangoCairo API expect these symbols to live under the
 * PangoCairo namespace.
  }

{ was #define dname def_expr }
function PANGO_TYPE_CAIRO_FONT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_CAIRO_FONT(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_CAIRO_FONT(object : longint) : longint;

{*
 * PangoCairoFontMap:
 *
 * `PangoCairoFontMap` is an interface exported by font maps for
 * use with Cairo.
 *
 * The actual type of the font map will depend on the particular
 * font technology Cairo was compiled to use.
 *
 * Since: 1.10
 * }
type

{ was #define dname def_expr }
function PANGO_TYPE_CAIRO_FONT_MAP : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_CAIRO_FONT_MAP(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_CAIRO_FONT_MAP(object : longint) : longint;

{*
 * PangoCairoShapeRendererFunc:
 * @cr: a Cairo context with current point set to where the shape should
 * be rendered
 * @attr: the %PANGO_ATTR_SHAPE to render
 * @do_path: whether only the shape path should be appended to current
 * path of @cr and no filling/stroking done.  This will be set
 * to %TRUE when called from pango_cairo_layout_path() and
 * pango_cairo_layout_line_path() rendering functions.
 * @data: (closure): user data passed to pango_cairo_context_set_shape_renderer()
 *
 * Function type for rendering attributes of type %PANGO_ATTR_SHAPE
 * with Pango's Cairo renderer.
  }
type

  TPangoCairoShapeRendererFunc = procedure (cr:Pcairo_t; attr:PPangoAttrShape; do_path:Tgboolean; data:Tgpointer);cdecl;
{
 * PangoCairoFontMap
  }

function pango_cairo_font_map_get_type:TGType;cdecl;external;
function pango_cairo_font_map_new:PPangoFontMap;cdecl;external;
function pango_cairo_font_map_new_for_font_type(fonttype:Tcairo_font_type_t):PPangoFontMap;cdecl;external;
function pango_cairo_font_map_get_default:PPangoFontMap;cdecl;external;
procedure pango_cairo_font_map_set_default(fontmap:PPangoCairoFontMap);cdecl;external;
function pango_cairo_font_map_get_font_type(fontmap:PPangoCairoFontMap):Tcairo_font_type_t;cdecl;external;
procedure pango_cairo_font_map_set_resolution(fontmap:PPangoCairoFontMap; dpi:Tdouble);cdecl;external;
function pango_cairo_font_map_get_resolution(fontmap:PPangoCairoFontMap):Tdouble;cdecl;external;
{$ifndef PANGO_DISABLE_DEPRECATED}

function pango_cairo_font_map_create_context(fontmap:PPangoCairoFontMap):PPangoContext;cdecl;external;
{$endif}
{
 * PangoCairoFont
  }

function pango_cairo_font_get_type:TGType;cdecl;external;
function pango_cairo_font_get_scaled_font(font:PPangoCairoFont):Pcairo_scaled_font_t;cdecl;external;
{ Update a Pango context for the current state of a cairo context
  }
procedure pango_cairo_update_context(cr:Pcairo_t; context:PPangoContext);cdecl;external;
(* Const before type ignored *)
procedure pango_cairo_context_set_font_options(context:PPangoContext; options:Pcairo_font_options_t);cdecl;external;
(* Const before type ignored *)
function pango_cairo_context_get_font_options(context:PPangoContext):Pcairo_font_options_t;cdecl;external;
procedure pango_cairo_context_set_resolution(context:PPangoContext; dpi:Tdouble);cdecl;external;
function pango_cairo_context_get_resolution(context:PPangoContext):Tdouble;cdecl;external;
procedure pango_cairo_context_set_shape_renderer(context:PPangoContext; func:TPangoCairoShapeRendererFunc; data:Tgpointer; dnotify:TGDestroyNotify);cdecl;external;
function pango_cairo_context_get_shape_renderer(context:PPangoContext; data:Pgpointer):TPangoCairoShapeRendererFunc;cdecl;external;
{ Convenience
  }
function pango_cairo_create_context(cr:Pcairo_t):PPangoContext;cdecl;external;
function pango_cairo_create_layout(cr:Pcairo_t):PPangoLayout;cdecl;external;
procedure pango_cairo_update_layout(cr:Pcairo_t; layout:PPangoLayout);cdecl;external;
{
 * Rendering
  }
procedure pango_cairo_show_glyph_string(cr:Pcairo_t; font:PPangoFont; glyphs:PPangoGlyphString);cdecl;external;
(* Const before type ignored *)
procedure pango_cairo_show_glyph_item(cr:Pcairo_t; text:Pchar; glyph_item:PPangoGlyphItem);cdecl;external;
procedure pango_cairo_show_layout_line(cr:Pcairo_t; line:PPangoLayoutLine);cdecl;external;
procedure pango_cairo_show_layout(cr:Pcairo_t; layout:PPangoLayout);cdecl;external;
procedure pango_cairo_show_error_underline(cr:Pcairo_t; x:Tdouble; y:Tdouble; width:Tdouble; height:Tdouble);cdecl;external;
{
 * Rendering to a path
  }
procedure pango_cairo_glyph_string_path(cr:Pcairo_t; font:PPangoFont; glyphs:PPangoGlyphString);cdecl;external;
procedure pango_cairo_layout_line_path(cr:Pcairo_t; line:PPangoLayoutLine);cdecl;external;
procedure pango_cairo_layout_path(cr:Pcairo_t; layout:PPangoLayout);cdecl;external;
procedure pango_cairo_error_underline_path(cr:Pcairo_t; x:Tdouble; y:Tdouble; width:Tdouble; height:Tdouble);cdecl;external;
{$endif}
{ __PANGOCAIRO_H__  }

implementation

{ was #define dname def_expr }
function PANGO_TYPE_CAIRO_FONT : longint; { return type might be wrong }
  begin
    PANGO_TYPE_CAIRO_FONT:=pango_cairo_font_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_CAIRO_FONT(object : longint) : longint;
begin
  PANGO_CAIRO_FONT:=G_TYPE_CHECK_INSTANCE_CAST(object,PANGO_TYPE_CAIRO_FONT,PangoCairoFont);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_CAIRO_FONT(object : longint) : longint;
begin
  PANGO_IS_CAIRO_FONT:=G_TYPE_CHECK_INSTANCE_TYPE(object,PANGO_TYPE_CAIRO_FONT);
end;

{ was #define dname def_expr }
function PANGO_TYPE_CAIRO_FONT_MAP : longint; { return type might be wrong }
  begin
    PANGO_TYPE_CAIRO_FONT_MAP:=pango_cairo_font_map_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_CAIRO_FONT_MAP(object : longint) : longint;
begin
  PANGO_CAIRO_FONT_MAP:=G_TYPE_CHECK_INSTANCE_CAST(object,PANGO_TYPE_CAIRO_FONT_MAP,PangoCairoFontMap);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_CAIRO_FONT_MAP(object : longint) : longint;
begin
  PANGO_IS_CAIRO_FONT_MAP:=G_TYPE_CHECK_INSTANCE_TYPE(object,PANGO_TYPE_CAIRO_FONT_MAP);
end;


end.
