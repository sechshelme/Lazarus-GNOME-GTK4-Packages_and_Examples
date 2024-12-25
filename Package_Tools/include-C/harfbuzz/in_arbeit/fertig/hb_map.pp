
unit hb_map;
interface

{
  Automatically converted by H2Pas 1.0.0 from hb_map.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hb_map.h
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
Phb_codepoint_t  = ^hb_codepoint_t;
Phb_map_t  = ^hb_map_t;
Phb_set_t  = ^hb_set_t;
Phb_user_data_key_t  = ^hb_user_data_key_t;
Plongint  = ^longint;
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
{$if !defined(HB_H_IN) && !defined(HB_NO_SINGLE_HEADER_ERROR)}
{$error "Include <hb.h> instead."}
{$endif}
{$ifndef HB_MAP_H}
{$define HB_MAP_H}
{$include "hb-common.h"}
{$include "hb-set.h"}
{*
 * HB_MAP_VALUE_INVALID:
 *
 * Unset #hb_map_t value.
 *
 * Since: 1.7.7
  }

const
  HB_MAP_VALUE_INVALID = HB_CODEPOINT_INVALID;  
{*
 * hb_map_t:
 *
 * Data type for holding integer-to-integer hash maps.
 *
 * }
type

function hb_map_create:Phb_map_t;cdecl;external;
function hb_map_get_empty:Phb_map_t;cdecl;external;
function hb_map_reference(map:Phb_map_t):Phb_map_t;cdecl;external;
procedure hb_map_destroy(map:Phb_map_t);cdecl;external;
function hb_map_set_user_data(map:Phb_map_t; key:Phb_user_data_key_t; data:pointer; destroy:Thb_destroy_func_t; replace:Thb_bool_t):Thb_bool_t;cdecl;external;
(* Const before type ignored *)
function hb_map_get_user_data(map:Phb_map_t; key:Phb_user_data_key_t):pointer;cdecl;external;
{ Returns false if allocation has failed before  }
(* Const before type ignored *)
function hb_map_allocation_successful(map:Phb_map_t):Thb_bool_t;cdecl;external;
(* Const before type ignored *)
function hb_map_copy(map:Phb_map_t):Phb_map_t;cdecl;external;
procedure hb_map_clear(map:Phb_map_t);cdecl;external;
(* Const before type ignored *)
function hb_map_is_empty(map:Phb_map_t):Thb_bool_t;cdecl;external;
(* Const before type ignored *)
function hb_map_get_population(map:Phb_map_t):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function hb_map_is_equal(map:Phb_map_t; other:Phb_map_t):Thb_bool_t;cdecl;external;
(* Const before type ignored *)
function hb_map_hash(map:Phb_map_t):dword;cdecl;external;
procedure hb_map_set(map:Phb_map_t; key:Thb_codepoint_t; value:Thb_codepoint_t);cdecl;external;
(* Const before type ignored *)
function hb_map_get(map:Phb_map_t; key:Thb_codepoint_t):Thb_codepoint_t;cdecl;external;
procedure hb_map_del(map:Phb_map_t; key:Thb_codepoint_t);cdecl;external;
(* Const before type ignored *)
function hb_map_has(map:Phb_map_t; key:Thb_codepoint_t):Thb_bool_t;cdecl;external;
(* Const before type ignored *)
procedure hb_map_update(map:Phb_map_t; other:Phb_map_t);cdecl;external;
{ Pass -1 in for idx to get started.  }
(* Const before type ignored *)
function hb_map_next(map:Phb_map_t; idx:Plongint; key:Phb_codepoint_t; value:Phb_codepoint_t):Thb_bool_t;cdecl;external;
(* Const before type ignored *)
procedure hb_map_keys(map:Phb_map_t; keys:Phb_set_t);cdecl;external;
(* Const before type ignored *)
procedure hb_map_values(map:Phb_map_t; values:Phb_set_t);cdecl;external;
{$endif}
{ HB_MAP_H  }

implementation


end.
