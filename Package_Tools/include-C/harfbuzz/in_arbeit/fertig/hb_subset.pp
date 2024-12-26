
unit hb_subset;
interface

{
  Automatically converted by H2Pas 1.0.0 from hb_subset.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hb_subset.h
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
Phb_face_t  = ^hb_face_t;
Phb_map_t  = ^hb_map_t;
Phb_set_t  = ^hb_set_t;
Phb_subset_flags_t  = ^hb_subset_flags_t;
Phb_subset_input_t  = ^hb_subset_input_t;
Phb_subset_plan_t  = ^hb_subset_plan_t;
Phb_subset_sets_t  = ^hb_subset_sets_t;
Phb_user_data_key_t  = ^hb_user_data_key_t;
Psingle  = ^single;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2018  Google, Inc.
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
 * Google Author(s): Rod Sheeter
  }
{$ifndef HB_SUBSET_H}
{$define HB_SUBSET_H}
{$include "hb.h"}
{$include "hb-ot.h"}
{*
 * hb_subset_input_t:
 *
 * Things that change based on the input. Characters to keep, etc.
  }
type
{*
 * hb_subset_plan_t:
 *
 * Contains information about how the subset operation will be executed.
 * Such as mappings from the old glyph ids to the new ones in the subset.
  }
{*
 * hb_subset_flags_t:
 * @HB_SUBSET_FLAGS_DEFAULT: all flags at their default value of false.
 * @HB_SUBSET_FLAGS_NO_HINTING: If set hinting instructions will be dropped in
 * the produced subset. Otherwise hinting instructions will be retained.
 * @HB_SUBSET_FLAGS_RETAIN_GIDS: If set glyph indices will not be modified in
 * the produced subset. If glyphs are dropped their indices will be retained
 * as an empty glyph.
 * @HB_SUBSET_FLAGS_DESUBROUTINIZE: If set and subsetting a CFF font the
 * subsetter will attempt to remove subroutines from the CFF glyphs.
 * @HB_SUBSET_FLAGS_NAME_LEGACY: If set non-unicode name records will be
 * retained in the subset.
 * @HB_SUBSET_FLAGS_SET_OVERLAPS_FLAG:	If set the subsetter will set the
 * OVERLAP_SIMPLE flag on each simple glyph.
 * @HB_SUBSET_FLAGS_PASSTHROUGH_UNRECOGNIZED: If set the subsetter will not
 * drop unrecognized tables and instead pass them through untouched.
 * @HB_SUBSET_FLAGS_NOTDEF_OUTLINE: If set the notdef glyph outline will be
 * retained in the final subset.
 * @HB_SUBSET_FLAGS_GLYPH_NAMES: If set the PS glyph names will be retained
 * in the final subset.
 * @HB_SUBSET_FLAGS_NO_PRUNE_UNICODE_RANGES: If set then the unicode ranges in
 * OS/2 will not be recalculated.
 * @HB_SUBSET_FLAGS_NO_LAYOUT_CLOSURE: If set don't perform glyph closure on layout
 * substitution rules (GSUB). Since: 7.2.0.
 * @HB_SUBSET_FLAGS_IFTB_REQUIREMENTS: If set enforce requirements on the output subset
 * to allow it to be used with incremental font transfer IFTB patches. Primarily,
 * this forces all outline data to use long (32 bit) offsets. Since: EXPERIMENTAL
 *
 * List of boolean properties that can be configured on the subset input.
 *
 * Since: 2.9.0
 * }
{< flags > }
{$ifdef HB_EXPERIMENTAL_API}
{$endif}
type
  Phb_subset_flags_t = ^Thb_subset_flags_t;
  Thb_subset_flags_t =  Longint;
  Const
    HB_SUBSET_FLAGS_DEFAULT = $00000000;
    HB_SUBSET_FLAGS_NO_HINTING = $00000001;
    HB_SUBSET_FLAGS_RETAIN_GIDS = $00000002;
    HB_SUBSET_FLAGS_DESUBROUTINIZE = $00000004;
    HB_SUBSET_FLAGS_NAME_LEGACY = $00000008;
    HB_SUBSET_FLAGS_SET_OVERLAPS_FLAG = $00000010;
    HB_SUBSET_FLAGS_PASSTHROUGH_UNRECOGNIZED = $00000020;
    HB_SUBSET_FLAGS_NOTDEF_OUTLINE = $00000040;
    HB_SUBSET_FLAGS_GLYPH_NAMES = $00000080;
    HB_SUBSET_FLAGS_NO_PRUNE_UNICODE_RANGES = $00000100;
    HB_SUBSET_FLAGS_NO_LAYOUT_CLOSURE = $00000200;
    HB_SUBSET_FLAGS_IFTB_REQUIREMENTS = $00000400;
;
{*
 * hb_subset_sets_t:
 * @HB_SUBSET_SETS_GLYPH_INDEX: the set of glyph indexes to retain in the subset.
 * @HB_SUBSET_SETS_UNICODE: the set of unicode codepoints to retain in the subset.
 * @HB_SUBSET_SETS_NO_SUBSET_TABLE_TAG: the set of table tags which specifies tables that should not be
 * subsetted.
 * @HB_SUBSET_SETS_DROP_TABLE_TAG: the set of table tags which specifies tables which will be dropped
 * in the subset.
 * @HB_SUBSET_SETS_NAME_ID: the set of name ids that will be retained.
 * @HB_SUBSET_SETS_NAME_LANG_ID: the set of name lang ids that will be retained.
 * @HB_SUBSET_SETS_LAYOUT_FEATURE_TAG: the set of layout feature tags that will be retained
 * in the subset.
 * @HB_SUBSET_SETS_LAYOUT_SCRIPT_TAG: the set of layout script tags that will be retained
 * in the subset. Defaults to all tags. Since: 5.0.0
 *
 * List of sets that can be configured on the subset input.
 *
 * Since: 2.9.1
 * }
type
  Phb_subset_sets_t = ^Thb_subset_sets_t;
  Thb_subset_sets_t =  Longint;
  Const
    HB_SUBSET_SETS_GLYPH_INDEX = 0;
    HB_SUBSET_SETS_UNICODE = 1;
    HB_SUBSET_SETS_NO_SUBSET_TABLE_TAG = 2;
    HB_SUBSET_SETS_DROP_TABLE_TAG = 3;
    HB_SUBSET_SETS_NAME_ID = 4;
    HB_SUBSET_SETS_NAME_LANG_ID = 5;
    HB_SUBSET_SETS_LAYOUT_FEATURE_TAG = 6;
    HB_SUBSET_SETS_LAYOUT_SCRIPT_TAG = 7;
;

function hb_subset_input_create_or_fail:Phb_subset_input_t;cdecl;external;
function hb_subset_input_reference(input:Phb_subset_input_t):Phb_subset_input_t;cdecl;external;
procedure hb_subset_input_destroy(input:Phb_subset_input_t);cdecl;external;
function hb_subset_input_set_user_data(input:Phb_subset_input_t; key:Phb_user_data_key_t; data:pointer; destroy:Thb_destroy_func_t; replace:Thb_bool_t):Thb_bool_t;cdecl;external;
(* Const before type ignored *)
function hb_subset_input_get_user_data(input:Phb_subset_input_t; key:Phb_user_data_key_t):pointer;cdecl;external;
procedure hb_subset_input_keep_everything(input:Phb_subset_input_t);cdecl;external;
function hb_subset_input_unicode_set(input:Phb_subset_input_t):Phb_set_t;cdecl;external;
function hb_subset_input_glyph_set(input:Phb_subset_input_t):Phb_set_t;cdecl;external;
function hb_subset_input_set(input:Phb_subset_input_t; set_type:Thb_subset_sets_t):Phb_set_t;cdecl;external;
function hb_subset_input_old_to_new_glyph_mapping(input:Phb_subset_input_t):Phb_map_t;cdecl;external;
function hb_subset_input_get_flags(input:Phb_subset_input_t):Thb_subset_flags_t;cdecl;external;
procedure hb_subset_input_set_flags(input:Phb_subset_input_t; value:dword);cdecl;external;
function hb_subset_input_pin_axis_to_default(input:Phb_subset_input_t; face:Phb_face_t; axis_tag:Thb_tag_t):Thb_bool_t;cdecl;external;
function hb_subset_input_pin_axis_location(input:Phb_subset_input_t; face:Phb_face_t; axis_tag:Thb_tag_t; axis_value:single):Thb_bool_t;cdecl;external;
{$ifdef HB_EXPERIMENTAL_API}
function hb_subset_input_set_axis_range(input:Phb_subset_input_t; face:Phb_face_t; axis_tag:Thb_tag_t; axis_min_value:single; axis_max_value:single; 
           axis_def_value:Psingle):Thb_bool_t;cdecl;external;
(* Const before type ignored *)
function hb_subset_input_override_name_table(input:Phb_subset_input_t; name_id:Thb_ot_name_id_t; platform_id:dword; encoding_id:dword; language_id:dword; 
           name_str:Pchar; str_len:longint):Thb_bool_t;cdecl;external;
{$endif}

function hb_subset_preprocess(source:Phb_face_t):Phb_face_t;cdecl;external;
(* Const before type ignored *)
function hb_subset_or_fail(source:Phb_face_t; input:Phb_subset_input_t):Phb_face_t;cdecl;external;
function hb_subset_plan_execute_or_fail(plan:Phb_subset_plan_t):Phb_face_t;cdecl;external;
(* Const before type ignored *)
function hb_subset_plan_create_or_fail(face:Phb_face_t; input:Phb_subset_input_t):Phb_subset_plan_t;cdecl;external;
procedure hb_subset_plan_destroy(plan:Phb_subset_plan_t);cdecl;external;
(* Const before type ignored *)
function hb_subset_plan_old_to_new_glyph_mapping(plan:Phb_subset_plan_t):Phb_map_t;cdecl;external;
(* Const before type ignored *)
function hb_subset_plan_new_to_old_glyph_mapping(plan:Phb_subset_plan_t):Phb_map_t;cdecl;external;
(* Const before type ignored *)
function hb_subset_plan_unicode_to_old_glyph_mapping(plan:Phb_subset_plan_t):Phb_map_t;cdecl;external;
function hb_subset_plan_reference(plan:Phb_subset_plan_t):Phb_subset_plan_t;cdecl;external;
function hb_subset_plan_set_user_data(plan:Phb_subset_plan_t; key:Phb_user_data_key_t; data:pointer; destroy:Thb_destroy_func_t; replace:Thb_bool_t):Thb_bool_t;cdecl;external;
(* Const before type ignored *)
function hb_subset_plan_get_user_data(plan:Phb_subset_plan_t; key:Phb_user_data_key_t):pointer;cdecl;external;
{$endif}
{ HB_SUBSET_H  }

implementation


end.
