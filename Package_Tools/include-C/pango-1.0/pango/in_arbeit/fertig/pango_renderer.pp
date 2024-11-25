
unit pango_renderer;
interface

{
  Automatically converted by H2Pas 1.0.0 from pango_renderer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pango_renderer.h
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
Pchar  = ^char;
PPangoAttrShape  = ^PangoAttrShape;
PPangoColor  = ^PangoColor;
PPangoFont  = ^PangoFont;
PPangoGlyphItem  = ^PangoGlyphItem;
PPangoGlyphString  = ^PangoGlyphString;
PPangoLayout  = ^PangoLayout;
PPangoLayoutLine  = ^PangoLayoutLine;
PPangoLayoutRun  = ^PangoLayoutRun;
PPangoMatrix  = ^PangoMatrix;
PPangoRenderer  = ^PangoRenderer;
PPangoRendererClass  = ^PangoRendererClass;
PPangoRendererPrivate  = ^PangoRendererPrivate;
PPangoRenderPart  = ^PangoRenderPart;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pango-renderer.h: Base class for rendering
 *
 * Copyright (C) 2004, Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$ifndef __PANGO_RENDERER_H_}
{$define __PANGO_RENDERER_H_}
{$include <pango/pango-layout.h>}

{ was #define dname def_expr }
function PANGO_TYPE_RENDERER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_RENDERER(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_RENDERER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_RENDERER(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_RENDERER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_RENDERER_GET_CLASS(obj : longint) : longint;

type
{*
 * PangoRenderPart:
 * @PANGO_RENDER_PART_FOREGROUND: the text itself
 * @PANGO_RENDER_PART_BACKGROUND: the area behind the text
 * @PANGO_RENDER_PART_UNDERLINE: underlines
 * @PANGO_RENDER_PART_STRIKETHROUGH: strikethrough lines
 * @PANGO_RENDER_PART_OVERLINE: overlines
 *
 * `PangoRenderPart` defines different items to render for such
 * purposes as setting colors.
 *
 * Since: 1.8
 * }
{ When extending, note N_RENDER_PARTS #define in pango-renderer.c  }

  PPangoRenderPart = ^TPangoRenderPart;
  TPangoRenderPart =  Longint;
  Const
    PANGO_RENDER_PART_FOREGROUND = 0;
    PANGO_RENDER_PART_BACKGROUND = 1;
    PANGO_RENDER_PART_UNDERLINE = 2;
    PANGO_RENDER_PART_STRIKETHROUGH = 3;
    PANGO_RENDER_PART_OVERLINE = 4;
;
{*
 * PangoRenderer:
 * @matrix: (nullable): the current transformation matrix for
 *   the Renderer; may be %NULL, which should be treated the
 *   same as the identity matrix.
 *
 * `PangoRenderer` is a base class for objects that can render text
 * provided as `PangoGlyphString` or `PangoLayout`.
 *
 * By subclassing `PangoRenderer` and overriding operations such as
 * @draw_glyphs and @draw_rectangle, renderers for particular font
 * backends and destinations can be created.
 *
 * Since: 1.8
  }
{< private > }
{< public > }
{ May be NULL  }
{< private > }
type
  PPangoRenderer = ^TPangoRenderer;
  TPangoRenderer = record
      parent_instance : TGObject;
      underline : TPangoUnderline;
      strikethrough : Tgboolean;
      active_count : longint;
      matrix : PPangoMatrix;
      priv : PPangoRendererPrivate;
    end;

{*
 * PangoRendererClass:
 * @draw_glyphs: draws a `PangoGlyphString`
 * @draw_rectangle: draws a rectangle
 * @draw_error_underline: draws a squiggly line that approximately
 * covers the given rectangle in the style of an underline used to
 * indicate a spelling error.
 * @draw_shape: draw content for a glyph shaped with `PangoAttrShape`
 *   @x, @y are the coordinates of the left edge of the baseline,
 *   in user coordinates.
 * @draw_trapezoid: draws a trapezoidal filled area
 * @draw_glyph: draws a single glyph
 * @part_changed: do renderer specific processing when rendering
 *  attributes change
 * @begin: Do renderer-specific initialization before drawing
 * @end: Do renderer-specific cleanup after drawing
 * @prepare_run: updates the renderer for a new run
 * @draw_glyph_item: draws a `PangoGlyphItem`
 *
 * Class structure for `PangoRenderer`.
 *
 * The following vfuncs take user space coordinates in Pango units
 * and have default implementations:
 * - draw_glyphs
 * - draw_rectangle
 * - draw_error_underline
 * - draw_shape
 * - draw_glyph_item
 *
 * The default draw_shape implementation draws nothing.
 *
 * The following vfuncs take device space coordinates as doubles
 * and must be implemented:
 * - draw_trapezoid
 * - draw_glyph
 *
 * Since: 1.8
  }
{< private > }
{ vtable - not signals  }
{< public > }
(* Const before type ignored *)
{< private > }
{ Padding for future expansion  }
  PPangoRendererClass = ^TPangoRendererClass;
  TPangoRendererClass = record
      parent_class : TGObjectClass;
      draw_glyphs : procedure (renderer:PPangoRenderer; font:PPangoFont; glyphs:PPangoGlyphString; x:longint; y:longint);cdecl;
      draw_rectangle : procedure (renderer:PPangoRenderer; part:TPangoRenderPart; x:longint; y:longint; width:longint; 
                    height:longint);cdecl;
      draw_error_underline : procedure (renderer:PPangoRenderer; x:longint; y:longint; width:longint; height:longint);cdecl;
      draw_shape : procedure (renderer:PPangoRenderer; attr:PPangoAttrShape; x:longint; y:longint);cdecl;
      draw_trapezoid : procedure (renderer:PPangoRenderer; part:TPangoRenderPart; y1_:Tdouble; x11:Tdouble; x21:Tdouble; 
                    y2:Tdouble; x12:Tdouble; x22:Tdouble);cdecl;
      draw_glyph : procedure (renderer:PPangoRenderer; font:PPangoFont; glyph:TPangoGlyph; x:Tdouble; y:Tdouble);cdecl;
      part_changed : procedure (renderer:PPangoRenderer; part:TPangoRenderPart);cdecl;
      begin : procedure (renderer:PPangoRenderer);cdecl;
      end : procedure (renderer:PPangoRenderer);cdecl;
      prepare_run : procedure (renderer:PPangoRenderer; run:PPangoLayoutRun);cdecl;
      draw_glyph_item : procedure (renderer:PPangoRenderer; text:Pchar; glyph_item:PPangoGlyphItem; x:longint; y:longint);cdecl;
      _pango_reserved2 : procedure ;cdecl;
      _pango_reserved3 : procedure ;cdecl;
      _pango_reserved4 : procedure ;cdecl;
    end;


function pango_renderer_get_type:TGType;cdecl;external;
procedure pango_renderer_draw_layout(renderer:PPangoRenderer; layout:PPangoLayout; x:longint; y:longint);cdecl;external;
procedure pango_renderer_draw_layout_line(renderer:PPangoRenderer; line:PPangoLayoutLine; x:longint; y:longint);cdecl;external;
procedure pango_renderer_draw_glyphs(renderer:PPangoRenderer; font:PPangoFont; glyphs:PPangoGlyphString; x:longint; y:longint);cdecl;external;
(* Const before type ignored *)
procedure pango_renderer_draw_glyph_item(renderer:PPangoRenderer; text:Pchar; glyph_item:PPangoGlyphItem; x:longint; y:longint);cdecl;external;
procedure pango_renderer_draw_rectangle(renderer:PPangoRenderer; part:TPangoRenderPart; x:longint; y:longint; width:longint; 
            height:longint);cdecl;external;
procedure pango_renderer_draw_error_underline(renderer:PPangoRenderer; x:longint; y:longint; width:longint; height:longint);cdecl;external;
procedure pango_renderer_draw_trapezoid(renderer:PPangoRenderer; part:TPangoRenderPart; y1_:Tdouble; x11:Tdouble; x21:Tdouble; 
            y2:Tdouble; x12:Tdouble; x22:Tdouble);cdecl;external;
procedure pango_renderer_draw_glyph(renderer:PPangoRenderer; font:PPangoFont; glyph:TPangoGlyph; x:Tdouble; y:Tdouble);cdecl;external;
procedure pango_renderer_activate(renderer:PPangoRenderer);cdecl;external;
procedure pango_renderer_deactivate(renderer:PPangoRenderer);cdecl;external;
procedure pango_renderer_part_changed(renderer:PPangoRenderer; part:TPangoRenderPart);cdecl;external;
(* Const before type ignored *)
procedure pango_renderer_set_color(renderer:PPangoRenderer; part:TPangoRenderPart; color:PPangoColor);cdecl;external;
function pango_renderer_get_color(renderer:PPangoRenderer; part:TPangoRenderPart):PPangoColor;cdecl;external;
procedure pango_renderer_set_alpha(renderer:PPangoRenderer; part:TPangoRenderPart; alpha:Tguint16);cdecl;external;
function pango_renderer_get_alpha(renderer:PPangoRenderer; part:TPangoRenderPart):Tguint16;cdecl;external;
(* Const before type ignored *)
procedure pango_renderer_set_matrix(renderer:PPangoRenderer; matrix:PPangoMatrix);cdecl;external;
(* Const before type ignored *)
function pango_renderer_get_matrix(renderer:PPangoRenderer):PPangoMatrix;cdecl;external;
function pango_renderer_get_layout(renderer:PPangoRenderer):PPangoLayout;cdecl;external;
function pango_renderer_get_layout_line(renderer:PPangoRenderer):PPangoLayoutLine;cdecl;external;
{$endif}
{ __PANGO_RENDERER_H_  }

implementation

{ was #define dname def_expr }
function PANGO_TYPE_RENDERER : longint; { return type might be wrong }
  begin
    PANGO_TYPE_RENDERER:=pango_renderer_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_RENDERER(object : longint) : longint;
begin
  PANGO_RENDERER:=G_TYPE_CHECK_INSTANCE_CAST(object,PANGO_TYPE_RENDERER,PangoRenderer);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_RENDERER_CLASS(klass : longint) : longint;
begin
  PANGO_RENDERER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,PANGO_TYPE_RENDERER,PangoRendererClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_RENDERER(object : longint) : longint;
begin
  PANGO_IS_RENDERER:=G_TYPE_CHECK_INSTANCE_TYPE(object,PANGO_TYPE_RENDERER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_RENDERER_CLASS(klass : longint) : longint;
begin
  PANGO_IS_RENDERER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,PANGO_TYPE_RENDERER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_RENDERER_GET_CLASS(obj : longint) : longint;
begin
  PANGO_RENDERER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,PANGO_TYPE_RENDERER,PangoRendererClass);
end;


end.
