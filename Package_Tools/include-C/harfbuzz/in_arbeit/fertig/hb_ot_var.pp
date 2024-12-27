
unit hb_ot_var;
interface

{
  Automatically converted by H2Pas 1.0.0 from hb_ot_var.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hb_ot_var.h
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
Phb_ot_var_axis_flags_t  = ^hb_ot_var_axis_flags_t;
Phb_ot_var_axis_info_t  = ^hb_ot_var_axis_info_t;
Phb_variation_t  = ^hb_variation_t;
Plongint  = ^longint;
Psingle  = ^single;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2017  Google, Inc.
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
{$ifndef HB_OT_VAR_H}
{$define HB_OT_VAR_H}
{$include "hb.h"}
{*
 * HB_OT_TAG_VAR_AXIS_ITALIC:
 *
 * Registered tag for the roman/italic axis.
  }

{ was #define dname def_expr }
function HB_OT_TAG_VAR_AXIS_ITALIC : longint; { return type might be wrong }

{*
 * HB_OT_TAG_VAR_AXIS_OPTICAL_SIZE:
 *
 * Registered tag for the optical-size axis.
 * <note>Note: The optical-size axis supersedes the OpenType `size` feature.</note>
  }
{ was #define dname def_expr }
function HB_OT_TAG_VAR_AXIS_OPTICAL_SIZE : longint; { return type might be wrong }

{*
 * HB_OT_TAG_VAR_AXIS_SLANT:
 *
 * Registered tag for the slant axis
  }
{ was #define dname def_expr }
function HB_OT_TAG_VAR_AXIS_SLANT : longint; { return type might be wrong }

{*
 * HB_OT_TAG_VAR_AXIS_WIDTH:
 *
 * Registered tag for the width axis.
  }
{ was #define dname def_expr }
function HB_OT_TAG_VAR_AXIS_WIDTH : longint; { return type might be wrong }

{*
 * HB_OT_TAG_VAR_AXIS_WEIGHT:
 *
 * Registered tag for the weight axis.
  }
{ was #define dname def_expr }
function HB_OT_TAG_VAR_AXIS_WEIGHT : longint; { return type might be wrong }

{
 * fvar / avar
  }
function hb_ot_var_has_data(face:Phb_face_t):Thb_bool_t;cdecl;external;
{
 * Variation axes.
  }
function hb_ot_var_get_axis_count(face:Phb_face_t):dword;cdecl;external;
{*
 * hb_ot_var_axis_flags_t:
 * @HB_OT_VAR_AXIS_FLAG_HIDDEN: The axis should not be exposed directly in user interfaces.
 *
 * Flags for #hb_ot_var_axis_info_t.
 *
 * Since: 2.2.0
  }
{< flags > }
{< private > }
{< skip > }
type
  Phb_ot_var_axis_flags_t = ^Thb_ot_var_axis_flags_t;
  Thb_ot_var_axis_flags_t =  Longint;
  Const
    HB_OT_VAR_AXIS_FLAG_HIDDEN = $00000001;
    _HB_OT_VAR_AXIS_FLAG_MAX_VALUE = HB_TAG_MAX_SIGNED;
;
{*
 * hb_ot_var_axis_info_t:
 * @axis_index: Index of the axis in the variation-axis array
 * @tag: The #hb_tag_t tag identifying the design variation of the axis
 * @name_id: The `name` table Name ID that provides display names for the axis
 * @flags: The #hb_ot_var_axis_flags_t flags for the axis
 * @min_value: The minimum value on the variation axis that the font covers
 * @default_value: The position on the variation axis corresponding to the font's defaults
 * @max_value: The maximum value on the variation axis that the font covers
 * 
 * Data type for holding variation-axis values.
 *
 * The minimum, default, and maximum values are in un-normalized, user scales.
 *
 * <note>Note: at present, the only flag defined for @flags is
 * #HB_OT_VAR_AXIS_FLAG_HIDDEN.</note>
 *
 * Since: 2.2.0
  }
{< private > }
type
  Phb_ot_var_axis_info_t = ^Thb_ot_var_axis_info_t;
  Thb_ot_var_axis_info_t = record
      axis_index : dword;
      tag : Thb_tag_t;
      name_id : Thb_ot_name_id_t;
      flags : Thb_ot_var_axis_flags_t;
      min_value : single;
      default_value : single;
      max_value : single;
      reserved : dword;
    end;
{ IN/OUT  }{ OUT  }
function hb_ot_var_get_axis_infos(face:Phb_face_t; start_offset:dword; axes_count:Pdword; axes_array:Phb_ot_var_axis_info_t):dword;cdecl;external;
function hb_ot_var_find_axis_info(face:Phb_face_t; axis_tag:Thb_tag_t; axis_info:Phb_ot_var_axis_info_t):Thb_bool_t;cdecl;external;
{
 * Named instances.
  }
function hb_ot_var_get_named_instance_count(face:Phb_face_t):dword;cdecl;external;
function hb_ot_var_named_instance_get_subfamily_name_id(face:Phb_face_t; instance_index:dword):Thb_ot_name_id_t;cdecl;external;
function hb_ot_var_named_instance_get_postscript_name_id(face:Phb_face_t; instance_index:dword):Thb_ot_name_id_t;cdecl;external;
{ IN/OUT  }
{ OUT  }function hb_ot_var_named_instance_get_design_coords(face:Phb_face_t; instance_index:dword; coords_length:Pdword; coords:Psingle):dword;cdecl;external;
{
 * Conversions.
  }
(* Const before type ignored *)
{ IN  }
{ OUT  }
procedure hb_ot_var_normalize_variations(face:Phb_face_t; variations:Phb_variation_t; variations_length:dword; coords:Plongint; coords_length:dword);cdecl;external;
(* Const before type ignored *)
{ IN  }
{ OUT  }procedure hb_ot_var_normalize_coords(face:Phb_face_t; coords_length:dword; design_coords:Psingle; normalized_coords:Plongint);cdecl;external;
{$endif}
{ HB_OT_VAR_H  }

implementation

{ was #define dname def_expr }
function HB_OT_TAG_VAR_AXIS_ITALIC : longint; { return type might be wrong }
  begin
    HB_OT_TAG_VAR_AXIS_ITALIC:=HB_TAG('i','t','a','l');
  end;

{ was #define dname def_expr }
function HB_OT_TAG_VAR_AXIS_OPTICAL_SIZE : longint; { return type might be wrong }
  begin
    HB_OT_TAG_VAR_AXIS_OPTICAL_SIZE:=HB_TAG('o','p','s','z');
  end;

{ was #define dname def_expr }
function HB_OT_TAG_VAR_AXIS_SLANT : longint; { return type might be wrong }
  begin
    HB_OT_TAG_VAR_AXIS_SLANT:=HB_TAG('s','l','n','t');
  end;

{ was #define dname def_expr }
function HB_OT_TAG_VAR_AXIS_WIDTH : longint; { return type might be wrong }
  begin
    HB_OT_TAG_VAR_AXIS_WIDTH:=HB_TAG('w','d','t','h');
  end;

{ was #define dname def_expr }
function HB_OT_TAG_VAR_AXIS_WEIGHT : longint; { return type might be wrong }
  begin
    HB_OT_TAG_VAR_AXIS_WEIGHT:=HB_TAG('w','g','h','t');
  end;


end.
