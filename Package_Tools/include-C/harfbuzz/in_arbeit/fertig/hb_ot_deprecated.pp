
unit hb_ot_deprecated;
interface

{
  Automatically converted by H2Pas 1.0.0 from hb_ot_deprecated.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hb_ot_deprecated.h
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
Pdword  = ^dword;
Phb_face_t  = ^hb_face_t;
Phb_ot_var_axis_t  = ^hb_ot_var_axis_t;
Phb_tag_t  = ^hb_tag_t;
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
 * Google Author(s): Behdad Esfahbod
  }
{$if !defined(HB_OT_H_IN) && !defined(HB_NO_SINGLE_HEADER_ERROR)}
{$error "Include <hb-ot.h> instead."}
{$endif}
{$ifndef HB_OT_DEPRECATED_H}
{$define HB_OT_DEPRECATED_H}
{$include "hb.h"}
{$include "hb-ot-name.h"}
{$ifndef HB_DISABLE_DEPRECATED}
{ https://github.com/harfbuzz/harfbuzz/issues/1734  }
{*
 * HB_MATH_GLYPH_PART_FLAG_EXTENDER:
 *
 * Use #HB_OT_MATH_GLYPH_PART_FLAG_EXTENDER instead.
 *
 * Deprecated: 2.5.1
  }

const
  HB_MATH_GLYPH_PART_FLAG_EXTENDER = HB_OT_MATH_GLYPH_PART_FLAG_EXTENDER;  
{ https://github.com/harfbuzz/harfbuzz/pull/3417  }
{*
 * HB_OT_MATH_SCRIPT:
 *
 * Use #HB_SCRIPT_MATH or #HB_OT_TAG_MATH_SCRIPT instead.
 *
 * <note>Previous versions of this documentation recommended passing
 * #HB_OT_MATH_SCRIPT to hb_buffer_set_script() to enable math shaping, but this
 * usage is no longer supported. Use #HB_SCRIPT_MATH instead.</note>
 *
 * Since: 1.3.3
 * Deprecated: 3.4.0
  }
  HB_OT_MATH_SCRIPT = HB_OT_TAG_MATH_SCRIPT;  
{ Like hb_ot_layout_table_find_script, but takes zero-terminated array of scripts to test  }
(* Const before type ignored *)

function hb_ot_layout_table_choose_script(face:Phb_face_t; table_tag:Thb_tag_t; script_tags:Phb_tag_t; script_index:Pdword; chosen_script:Phb_tag_t):Thb_bool_t;cdecl;external;
function hb_ot_layout_script_find_language(face:Phb_face_t; table_tag:Thb_tag_t; script_index:dword; language_tag:Thb_tag_t; language_index:Pdword):Thb_bool_t;cdecl;external;
procedure hb_ot_tags_from_script(script:Thb_script_t; script_tag_1:Phb_tag_t; script_tag_2:Phb_tag_t);cdecl;external;
function hb_ot_tag_from_language(language:Thb_language_t):Thb_tag_t;cdecl;external;
{*
 * HB_OT_VAR_NO_AXIS_INDEX:
 *
 * Do not use.
 *
 * Since: 1.4.2
 * Deprecated: 2.2.0
  }
const
  HB_OT_VAR_NO_AXIS_INDEX = $FFFFFFFF;  
{*
 * hb_ot_var_axis_t:
 * @tag: axis tag
 * @name_id: axis name identifier
 * @min_value: minimum value of the axis
 * @default_value: default value of the axis
 * @max_value: maximum value of the axis
 *
 * Use #hb_ot_var_axis_info_t instead.
 *
 * Since: 1.4.2
 * Deprecated: 2.2.0
  }
type
  Phb_ot_var_axis_t = ^Thb_ot_var_axis_t;
  Thb_ot_var_axis_t = record
      tag : Thb_tag_t;
      name_id : Thb_ot_name_id_t;
      min_value : single;
      default_value : single;
      max_value : single;
    end;
{ IN/OUT  }{ OUT  }
function hb_ot_var_get_axes(face:Phb_face_t; start_offset:dword; axes_count:Pdword; axes_array:Phb_ot_var_axis_t):dword;cdecl;external;
function hb_ot_var_find_axis(face:Phb_face_t; axis_tag:Thb_tag_t; axis_index:Pdword; axis_info:Phb_ot_var_axis_t):Thb_bool_t;cdecl;external;
{$endif}
{$endif}
{ HB_OT_DEPRECATED_H  }

implementation


end.
