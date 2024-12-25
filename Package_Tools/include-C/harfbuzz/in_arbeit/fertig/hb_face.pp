
unit hb_face;
interface

{
  Automatically converted by H2Pas 1.0.0 from hb_face.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hb_face.h
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
Phb_blob_t  = ^hb_blob_t;
Phb_face_t  = ^hb_face_t;
Phb_map_t  = ^hb_map_t;
Phb_reference_table_func_t  = ^hb_reference_table_func_t;
Phb_set_t  = ^hb_set_t;
Phb_tag_t  = ^hb_tag_t;
Phb_user_data_key_t  = ^hb_user_data_key_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2009  Red Hat, Inc.
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
{$if !defined(HB_H_IN) && !defined(HB_NO_SINGLE_HEADER_ERROR)}
{$error "Include <hb.h> instead."}
{$endif}
{$ifndef HB_FACE_H}
{$define HB_FACE_H}
{$include "hb-common.h"}
{$include "hb-blob.h"}
{$include "hb-map.h"}
{$include "hb-set.h"}

function hb_face_count(blob:Phb_blob_t):dword;cdecl;external;
{
 * hb_face_t
  }
{*
 * hb_face_t:
 *
 * Data type for holding font faces.
 *
 * }
type

function hb_face_create(blob:Phb_blob_t; index:dword):Phb_face_t;cdecl;external;
{*
 * hb_reference_table_func_t:
 * @face: an #hb_face_t to reference table for
 * @tag: the tag of the table to reference
 * @user_data: User data pointer passed by the caller
 *
 * Callback function for hb_face_create_for_tables().
 *
 * Return value: (transfer full): A pointer to the @tag table within @face
 *
 * Since: 0.9.2
  }
type
  Phb_reference_table_func_t = ^Thb_reference_table_func_t;
  Thb_reference_table_func_t = function (face:Phb_face_t; tag:Thb_tag_t; user_data:pointer):Phb_blob_t;cdecl;
{ calls destroy() when not needing user_data anymore  }

function hb_face_create_for_tables(reference_table_func:Thb_reference_table_func_t; user_data:pointer; destroy:Thb_destroy_func_t):Phb_face_t;cdecl;external;
function hb_face_get_empty:Phb_face_t;cdecl;external;
function hb_face_reference(face:Phb_face_t):Phb_face_t;cdecl;external;
procedure hb_face_destroy(face:Phb_face_t);cdecl;external;
function hb_face_set_user_data(face:Phb_face_t; key:Phb_user_data_key_t; data:pointer; destroy:Thb_destroy_func_t; replace:Thb_bool_t):Thb_bool_t;cdecl;external;
(* Const before type ignored *)
function hb_face_get_user_data(face:Phb_face_t; key:Phb_user_data_key_t):pointer;cdecl;external;
procedure hb_face_make_immutable(face:Phb_face_t);cdecl;external;
(* Const before type ignored *)
function hb_face_is_immutable(face:Phb_face_t):Thb_bool_t;cdecl;external;
(* Const before type ignored *)
function hb_face_reference_table(face:Phb_face_t; tag:Thb_tag_t):Phb_blob_t;cdecl;external;
function hb_face_reference_blob(face:Phb_face_t):Phb_blob_t;cdecl;external;
procedure hb_face_set_index(face:Phb_face_t; index:dword);cdecl;external;
(* Const before type ignored *)
function hb_face_get_index(face:Phb_face_t):dword;cdecl;external;
procedure hb_face_set_upem(face:Phb_face_t; upem:dword);cdecl;external;
(* Const before type ignored *)
function hb_face_get_upem(face:Phb_face_t):dword;cdecl;external;
procedure hb_face_set_glyph_count(face:Phb_face_t; glyph_count:dword);cdecl;external;
(* Const before type ignored *)
function hb_face_get_glyph_count(face:Phb_face_t):dword;cdecl;external;
(* Const before type ignored *)
{ IN/OUT  }
{ OUT  }function hb_face_get_table_tags(face:Phb_face_t; start_offset:dword; table_count:Pdword; table_tags:Phb_tag_t):dword;cdecl;external;
{
 * Character set.
  }
procedure hb_face_collect_unicodes(face:Phb_face_t; out:Phb_set_t);cdecl;external;
procedure hb_face_collect_nominal_glyph_mapping(face:Phb_face_t; mapping:Phb_map_t; unicodes:Phb_set_t);cdecl;external;
procedure hb_face_collect_variation_selectors(face:Phb_face_t; out:Phb_set_t);cdecl;external;
procedure hb_face_collect_variation_unicodes(face:Phb_face_t; variation_selector:Thb_codepoint_t; out:Phb_set_t);cdecl;external;
{
 * Builder face.
  }
function hb_face_builder_create:Phb_face_t;cdecl;external;
function hb_face_builder_add_table(face:Phb_face_t; tag:Thb_tag_t; blob:Phb_blob_t):Thb_bool_t;cdecl;external;
(* Const before type ignored *)
procedure hb_face_builder_sort_tables(face:Phb_face_t; tags:Phb_tag_t);cdecl;external;
{$endif}
{ HB_FACE_H  }

implementation


end.
