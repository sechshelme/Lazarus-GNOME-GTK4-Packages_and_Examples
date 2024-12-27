
unit hb_ot_shape;
interface

{
  Automatically converted by H2Pas 1.0.0 from hb_ot_shape.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hb_ot_shape.h
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
Phb_buffer_t  = ^hb_buffer_t;
Phb_feature_t  = ^hb_feature_t;
Phb_font_t  = ^hb_font_t;
Phb_set_t  = ^hb_set_t;
Phb_shape_plan_t  = ^hb_shape_plan_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2013  Red Hat, Inc.
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
  }
{$if !defined(HB_OT_H_IN) && !defined(HB_NO_SINGLE_HEADER_ERROR)}
{$error "Include <hb-ot.h> instead."}
{$endif}
{$ifndef HB_OT_SHAPE_H}
{$define HB_OT_SHAPE_H}
{$include "hb.h"}
{ TODO port to shape-plan / set.  }
(* Const before type ignored *)

procedure hb_ot_shape_glyphs_closure(font:Phb_font_t; buffer:Phb_buffer_t; features:Phb_feature_t; num_features:dword; glyphs:Phb_set_t);cdecl;external;
{ OUT  }procedure hb_ot_shape_plan_collect_lookups(shape_plan:Phb_shape_plan_t; table_tag:Thb_tag_t; lookup_indexes:Phb_set_t);cdecl;external;
{$endif}
{ HB_OT_SHAPE_H  }

implementation


end.
