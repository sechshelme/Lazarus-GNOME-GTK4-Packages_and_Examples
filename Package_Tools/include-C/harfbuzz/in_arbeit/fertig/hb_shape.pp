
unit hb_shape;
interface

{
  Automatically converted by H2Pas 1.0.0 from hb_shape.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hb_shape.h
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
Phb_buffer_t  = ^hb_buffer_t;
Phb_feature_t  = ^hb_feature_t;
Phb_font_t  = ^hb_font_t;
Phb_tag_t  = ^hb_tag_t;
Psingle  = ^single;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2009  Red Hat, Inc.
 * Copyright © 2012  Google, Inc.
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
 * Red Hat Author(s): Behdad Esfahbod
 * Google Author(s): Behdad Esfahbod
  }
{$if !defined(HB_H_IN) && !defined(HB_NO_SINGLE_HEADER_ERROR)}
{$error "Include <hb.h> instead."}
{$endif}
{$ifndef HB_SHAPE_H}
{$define HB_SHAPE_H}
{$include "hb-common.h"}
{$include "hb-buffer.h"}
{$include "hb-font.h"}
(* Const before type ignored *)

procedure hb_shape(font:Phb_font_t; buffer:Phb_buffer_t; features:Phb_feature_t; num_features:dword);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function hb_shape_full(font:Phb_font_t; buffer:Phb_buffer_t; features:Phb_feature_t; num_features:dword; shaper_list:PPchar):Thb_bool_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
{ IN/OUT  }
{ OUT  }
{ OUT  }function hb_shape_justify(font:Phb_font_t; buffer:Phb_buffer_t; features:Phb_feature_t; num_features:dword; shaper_list:PPchar; 
           min_target_advance:single; max_target_advance:single; advance:Psingle; var_tag:Phb_tag_t; var_value:Psingle):Thb_bool_t;cdecl;external;
(* Const before type ignored *)
function hb_shape_list_shapers:^Pchar;cdecl;external;
{$endif}
{ HB_SHAPE_H  }

implementation


end.
