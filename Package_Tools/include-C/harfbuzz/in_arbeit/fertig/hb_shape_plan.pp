
unit hb_shape_plan;
interface

{
  Automatically converted by H2Pas 1.0.0 from hb_shape_plan.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hb_shape_plan.h
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
Phb_face_t  = ^hb_face_t;
Phb_feature_t  = ^hb_feature_t;
Phb_font_t  = ^hb_font_t;
Phb_segment_properties_t  = ^hb_segment_properties_t;
Phb_shape_plan_t  = ^hb_shape_plan_t;
Phb_user_data_key_t  = ^hb_user_data_key_t;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
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
 * Google Author(s): Behdad Esfahbod
  }
{$if !defined(HB_H_IN) && !defined(HB_NO_SINGLE_HEADER_ERROR)}
{$error "Include <hb.h> instead."}
{$endif}
{$ifndef HB_SHAPE_PLAN_H}
{$define HB_SHAPE_PLAN_H}
{$include "hb-common.h"}
{$include "hb-font.h"}
{*
 * hb_shape_plan_t:
 *
 * Data type for holding a shaping plan. 
 *
 * Shape plans contain information about how HarfBuzz will shape a
 * particular text segment, based on the segment's properties and the
 * capabilities in the font face in use.
 *
 * Shape plans can be queried about how shaping will perform, given a set
 * of specific input parameters (script, language, direction, features,
 * etc.).
 *
 * }
type
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)

function hb_shape_plan_create(face:Phb_face_t; props:Phb_segment_properties_t; user_features:Phb_feature_t; num_user_features:dword; shaper_list:PPchar):Phb_shape_plan_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function hb_shape_plan_create_cached(face:Phb_face_t; props:Phb_segment_properties_t; user_features:Phb_feature_t; num_user_features:dword; shaper_list:PPchar):Phb_shape_plan_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function hb_shape_plan_create2(face:Phb_face_t; props:Phb_segment_properties_t; user_features:Phb_feature_t; num_user_features:dword; coords:Plongint; 
           num_coords:dword; shaper_list:PPchar):Phb_shape_plan_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function hb_shape_plan_create_cached2(face:Phb_face_t; props:Phb_segment_properties_t; user_features:Phb_feature_t; num_user_features:dword; coords:Plongint; 
           num_coords:dword; shaper_list:PPchar):Phb_shape_plan_t;cdecl;external;
function hb_shape_plan_get_empty:Phb_shape_plan_t;cdecl;external;
function hb_shape_plan_reference(shape_plan:Phb_shape_plan_t):Phb_shape_plan_t;cdecl;external;
procedure hb_shape_plan_destroy(shape_plan:Phb_shape_plan_t);cdecl;external;
function hb_shape_plan_set_user_data(shape_plan:Phb_shape_plan_t; key:Phb_user_data_key_t; data:pointer; destroy:Thb_destroy_func_t; replace:Thb_bool_t):Thb_bool_t;cdecl;external;
(* Const before type ignored *)
function hb_shape_plan_get_user_data(shape_plan:Phb_shape_plan_t; key:Phb_user_data_key_t):pointer;cdecl;external;
(* Const before type ignored *)
function hb_shape_plan_execute(shape_plan:Phb_shape_plan_t; font:Phb_font_t; buffer:Phb_buffer_t; features:Phb_feature_t; num_features:dword):Thb_bool_t;cdecl;external;
(* Const before type ignored *)
function hb_shape_plan_get_shaper(shape_plan:Phb_shape_plan_t):Pchar;cdecl;external;
{$endif}
{ HB_SHAPE_PLAN_H  }

implementation


end.
