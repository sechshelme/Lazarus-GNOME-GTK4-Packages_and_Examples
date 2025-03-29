
unit gtksourcegutterrenderer;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcegutterrenderer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcegutterrenderer.h
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
PGdkRectangle  = ^GdkRectangle;
Pgfloat  = ^gfloat;
PGtkSnapshot  = ^GtkSnapshot;
PGtkSourceBuffer  = ^GtkSourceBuffer;
PGtkSourceGutterLines  = ^GtkSourceGutterLines;
PGtkSourceGutterRenderer  = ^GtkSourceGutterRenderer;
PGtkSourceGutterRendererAlignmentMode  = ^GtkSourceGutterRendererAlignmentMode;
PGtkSourceGutterRendererClass  = ^GtkSourceGutterRendererClass;
PGtkSourceView  = ^GtkSourceView;
PGtkTextIter  = ^GtkTextIter;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2010 - Jesse van den Kieboom
 *
 * GtkSourceView is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * GtkSourceView is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$include <gtk/gtk.h>}
{$include "gtksourcetypes.h"}

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_GUTTER_RENDERER : longint; { return type might be wrong }

{*
 * GtkSourceGutterRendererAlignmentMode:
 * @GTK_SOURCE_GUTTER_RENDERER_ALIGNMENT_MODE_CELL: The full cell.
 * @GTK_SOURCE_GUTTER_RENDERER_ALIGNMENT_MODE_FIRST: The first line.
 * @GTK_SOURCE_GUTTER_RENDERER_ALIGNMENT_MODE_LAST: The last line.
 *
 * The alignment mode of the renderer, when a cell spans multiple lines (due to
 * text wrapping).
 * }
type
  PGtkSourceGutterRendererAlignmentMode = ^TGtkSourceGutterRendererAlignmentMode;
  TGtkSourceGutterRendererAlignmentMode =  Longint;
  Const
    GTK_SOURCE_GUTTER_RENDERER_ALIGNMENT_MODE_CELL = 0;
    GTK_SOURCE_GUTTER_RENDERER_ALIGNMENT_MODE_FIRST = 1;
    GTK_SOURCE_GUTTER_RENDERER_ALIGNMENT_MODE_LAST = 2;
;
{*
	 * GtkSourceGutterRendererClass::change_view:
	 * @renderer: a #GtkSourceGutterRenderer.
	 * @old_view: (nullable): the old #GtkTextView.
	 *
	 * This is called when the text view changes for @renderer.
	  }
{*
	 * GtkSourceGutterRendererClass::change_buffer:
	 * @renderer: a #GtkSourceGutterRenderer.
	 * @old_buffer: (nullable): the old #GtkTextBuffer.
	 *
	 * This is called when the text buffer changes for @renderer.
	  }
{ Signal handlers  }
{< private > }
type
  PGtkSourceGutterRendererClass = ^TGtkSourceGutterRendererClass;
  TGtkSourceGutterRendererClass = record
      parent_class : TGtkWidgetClass;
      query_data : procedure (renderer:PGtkSourceGutterRenderer; lines:PGtkSourceGutterLines; line:Tguint);cdecl;
      begin : procedure (renderer:PGtkSourceGutterRenderer; lines:PGtkSourceGutterLines);cdecl;
      snapshot_line : procedure (renderer:PGtkSourceGutterRenderer; snapshot:PGtkSnapshot; lines:PGtkSourceGutterLines; line:Tguint);cdecl;
      end : procedure (renderer:PGtkSourceGutterRenderer);cdecl;
      change_view : procedure (renderer:PGtkSourceGutterRenderer; old_view:PGtkSourceView);cdecl;
      change_buffer : procedure (renderer:PGtkSourceGutterRenderer; old_buffer:PGtkSourceBuffer);cdecl;
      query_activatable : function (renderer:PGtkSourceGutterRenderer; iter:PGtkTextIter; area:PGdkRectangle):Tgboolean;cdecl;
      activate : procedure (renderer:PGtkSourceGutterRenderer; iter:PGtkTextIter; area:PGdkRectangle; button:Tguint; state:TGdkModifierType; 
                    n_presses:Tgint);cdecl;
      _reserved : array[0..19] of Tgpointer;
    end;

{G_DECLARE_DERIVABLE_TYPE (GtkSourceGutterRenderer, gtk_source_gutter_renderer, GTK_SOURCE, GUTTER_RENDERER, GtkWidget) }

function gtk_source_gutter_renderer_get_xalign(renderer:PGtkSourceGutterRenderer):Tgfloat;cdecl;external;
procedure gtk_source_gutter_renderer_set_xalign(renderer:PGtkSourceGutterRenderer; xalign:Tgfloat);cdecl;external;
function gtk_source_gutter_renderer_get_yalign(renderer:PGtkSourceGutterRenderer):Tgfloat;cdecl;external;
procedure gtk_source_gutter_renderer_set_yalign(renderer:PGtkSourceGutterRenderer; yalign:Tgfloat);cdecl;external;
function gtk_source_gutter_renderer_get_xpad(renderer:PGtkSourceGutterRenderer):Tgint;cdecl;external;
procedure gtk_source_gutter_renderer_set_xpad(renderer:PGtkSourceGutterRenderer; xpad:Tgint);cdecl;external;
function gtk_source_gutter_renderer_get_ypad(renderer:PGtkSourceGutterRenderer):Tgint;cdecl;external;
procedure gtk_source_gutter_renderer_set_ypad(renderer:PGtkSourceGutterRenderer; ypad:Tgint);cdecl;external;
function gtk_source_gutter_renderer_get_alignment_mode(renderer:PGtkSourceGutterRenderer):TGtkSourceGutterRendererAlignmentMode;cdecl;external;
procedure gtk_source_gutter_renderer_set_alignment_mode(renderer:PGtkSourceGutterRenderer; mode:TGtkSourceGutterRendererAlignmentMode);cdecl;external;
function gtk_source_gutter_renderer_get_buffer(renderer:PGtkSourceGutterRenderer):PGtkSourceBuffer;cdecl;external;
function gtk_source_gutter_renderer_get_view(renderer:PGtkSourceGutterRenderer):PGtkSourceView;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_source_gutter_renderer_activate(renderer:PGtkSourceGutterRenderer; iter:PGtkTextIter; area:PGdkRectangle; button:Tguint; state:TGdkModifierType; 
            n_presses:Tgint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gtk_source_gutter_renderer_query_activatable(renderer:PGtkSourceGutterRenderer; iter:PGtkTextIter; area:PGdkRectangle):Tgboolean;cdecl;external;
procedure gtk_source_gutter_renderer_align_cell(renderer:PGtkSourceGutterRenderer; line:Tguint; width:Tgfloat; height:Tgfloat; x:Pgfloat; 
            y:Pgfloat);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_GUTTER_RENDERER : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_GUTTER_RENDERER:=gtk_source_gutter_renderer_get_type;
  end;


end.
