
unit chafa_canvas;
interface

{
  Automatically converted by H2Pas 1.0.0 from chafa_canvas.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    chafa_canvas.h
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
PChafaCanvas  = ^ChafaCanvas;
PChafaCanvasConfig  = ^ChafaCanvasConfig;
PChafaPlacement  = ^ChafaPlacement;
PChafaTermInfo  = ^ChafaTermInfo;
Pgchar  = ^gchar;
Pgint  = ^gint;
PGString  = ^GString;
Pguint8  = ^guint8;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*-  }
{ Copyright (C) 2018-2023 Hans Petter Jansson
 *
 * This file is part of Chafa, a program that shows pictures on text terminals.
 *
 * Chafa is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Chafa is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with Chafa.  If not, see <http://www.gnu.org/licenses/>.  }
{$ifndef __CHAFA_CANVAS_H__}
{$define __CHAFA_CANVAS_H__}
{$if !defined (__CHAFA_H_INSIDE__) && !defined (CHAFA_COMPILATION)}
{$error "Only <chafa.h> can be included directly."}
{$endif}
{$include <chafa-term-info.h>}
type
(* Const before type ignored *)

function chafa_canvas_new(config:PChafaCanvasConfig):PChafaCanvas;cdecl;external;
function chafa_canvas_new_similar(orig:PChafaCanvas):PChafaCanvas;cdecl;external;
procedure chafa_canvas_ref(canvas:PChafaCanvas);cdecl;external;
procedure chafa_canvas_unref(canvas:PChafaCanvas);cdecl;external;
(* Const before type ignored *)
function chafa_canvas_peek_config(canvas:PChafaCanvas):PChafaCanvasConfig;cdecl;external;
procedure chafa_canvas_set_placement(canvas:PChafaCanvas; placement:PChafaPlacement);cdecl;external;
(* Const before type ignored *)
procedure chafa_canvas_draw_all_pixels(canvas:PChafaCanvas; src_pixel_type:TChafaPixelType; src_pixels:Pguint8; src_width:Tgint; src_height:Tgint; 
            src_rowstride:Tgint);cdecl;external;
function chafa_canvas_print(canvas:PChafaCanvas; term_info:PChafaTermInfo):PGString;cdecl;external;
procedure chafa_canvas_print_rows(canvas:PChafaCanvas; term_info:PChafaTermInfo; array_out:PPPGString; array_len_out:Pgint);cdecl;external;
function chafa_canvas_print_rows_strv(canvas:PChafaCanvas; term_info:PChafaTermInfo):^Pgchar;cdecl;external;
function chafa_canvas_get_char_at(canvas:PChafaCanvas; x:Tgint; y:Tgint):Tgunichar;cdecl;external;
function chafa_canvas_set_char_at(canvas:PChafaCanvas; x:Tgint; y:Tgint; c:Tgunichar):Tgint;cdecl;external;
procedure chafa_canvas_get_colors_at(canvas:PChafaCanvas; x:Tgint; y:Tgint; fg_out:Pgint; bg_out:Pgint);cdecl;external;
procedure chafa_canvas_set_colors_at(canvas:PChafaCanvas; x:Tgint; y:Tgint; fg:Tgint; bg:Tgint);cdecl;external;
procedure chafa_canvas_get_raw_colors_at(canvas:PChafaCanvas; x:Tgint; y:Tgint; fg_out:Pgint; bg_out:Pgint);cdecl;external;
procedure chafa_canvas_set_raw_colors_at(canvas:PChafaCanvas; x:Tgint; y:Tgint; fg:Tgint; bg:Tgint);cdecl;external;
{CHAFA_DEPRECATED_IN_1_2 }
(* Const before type ignored *)
procedure chafa_canvas_set_contents_rgba8(canvas:PChafaCanvas; src_pixels:Pguint8; src_width:Tgint; src_height:Tgint; src_rowstride:Tgint);cdecl;external;
{CHAFA_DEPRECATED_IN_1_6 }
function chafa_canvas_build_ansi(canvas:PChafaCanvas):PGString;cdecl;external;
{$endif}
{ __CHAFA_CANVAS_H__  }

implementation


end.
