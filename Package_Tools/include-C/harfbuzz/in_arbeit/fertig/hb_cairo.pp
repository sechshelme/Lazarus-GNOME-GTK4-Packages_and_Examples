
unit hb_cairo;
interface

{
  Automatically converted by H2Pas 1.0.0 from hb_cairo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hb_cairo.h
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
Pcairo_font_face_t  = ^cairo_font_face_t;
Pcairo_glyph_t  = ^cairo_glyph_t;
Pcairo_scaled_font_t  = ^cairo_scaled_font_t;
Pcairo_text_cluster_flags_t  = ^cairo_text_cluster_flags_t;
Pcairo_text_cluster_t  = ^cairo_text_cluster_t;
Pchar  = ^char;
Pdword  = ^dword;
Phb_buffer_t  = ^hb_buffer_t;
Phb_cairo_font_init_func_t  = ^hb_cairo_font_init_func_t;
Phb_face_t  = ^hb_face_t;
Phb_font_t  = ^hb_font_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2022 Red Hat, Inc.
 *
 *  This is part of HarfBuzz, a text shaping library.
 *
 * Permission is hereby granted, without written agreement and without
 * license or royalty fees, to use, copy, modify, and distribute this
 * software and its documentation for any purpose, provided that the
 * above copyright notice and the following two paragraphs appear in
 * all copies of this software.
 *
 * IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE TO ANY PARTY FOR
 * DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES
 * ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN
 * IF THE COPYRIGHT HOLDER HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
 *
 * THE COPYRIGHT HOLDER SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING,
 * BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 * FITNESS FOR A PARTICULAR PURPOSE.  THE SOFTWARE PROVIDED HEREUNDER IS
 * ON AN "AS IS" BASIS, AND THE COPYRIGHT HOLDER HAS NO OBLIGATION TO
 * PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
 *
 * Red Hat Author(s): Matthias Clasen
  }
{$ifndef HB_CAIRO_H}
{$define HB_CAIRO_H}
{$include "hb.h"}
{$include <cairo.h>}

function hb_cairo_font_face_create_for_font(font:Phb_font_t):Pcairo_font_face_t;cdecl;external;
function hb_cairo_font_face_get_font(font_face:Pcairo_font_face_t):Phb_font_t;cdecl;external;
function hb_cairo_font_face_create_for_face(face:Phb_face_t):Pcairo_font_face_t;cdecl;external;
function hb_cairo_font_face_get_face(font_face:Pcairo_font_face_t):Phb_face_t;cdecl;external;
{*
 * hb_cairo_font_init_func_t:
 * @font: The #hb_font_t being created
 * @scaled_font: The respective #cairo_scaled_font_t
 * @user_data: User data accompanying this method
 *
 * The type of a virtual method to be called when a cairo
 * face created using hb_cairo_font_face_create_for_face()
 * creates an #hb_font_t for a #cairo_scaled_font_t.
 *
 * Return value: the #hb_font_t value to use; in most cases same as @font
 *
 * Since: 7.0.0
  }
type
  Phb_cairo_font_init_func_t = ^Thb_cairo_font_init_func_t;
  Thb_cairo_font_init_func_t = function (font:Phb_font_t; scaled_font:Pcairo_scaled_font_t; user_data:pointer):Phb_font_t;cdecl;

procedure hb_cairo_font_face_set_font_init_func(font_face:Pcairo_font_face_t; func:Thb_cairo_font_init_func_t; user_data:pointer; destroy:Thb_destroy_func_t);cdecl;external;
function hb_cairo_scaled_font_get_font(scaled_font:Pcairo_scaled_font_t):Phb_font_t;cdecl;external;
procedure hb_cairo_font_face_set_scale_factor(font_face:Pcairo_font_face_t; scale_factor:dword);cdecl;external;
function hb_cairo_font_face_get_scale_factor(font_face:Pcairo_font_face_t):dword;cdecl;external;
(* Const before type ignored *)
procedure hb_cairo_glyphs_from_buffer(buffer:Phb_buffer_t; utf8_clusters:Thb_bool_t; x_scale_factor:Tdouble; y_scale_factor:Tdouble; x:Tdouble; 
            y:Tdouble; utf8:Pchar; utf8_len:longint; glyphs:PPcairo_glyph_t; num_glyphs:Pdword; 
            clusters:PPcairo_text_cluster_t; num_clusters:Pdword; cluster_flags:Pcairo_text_cluster_flags_t);cdecl;external;
{$endif}
{ HB_CAIRO_H  }

implementation


end.
