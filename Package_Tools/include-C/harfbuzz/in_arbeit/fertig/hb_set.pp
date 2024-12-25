
unit hb_set;
interface

{
  Automatically converted by H2Pas 1.0.0 from hb_set.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hb_set.h
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
Phb_set_t  = ^hb_set_t;
Phb_user_data_key_t  = ^hb_user_data_key_t;
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
{$ifndef HB_SET_H}
{$define HB_SET_H}
{$include "hb-common.h"}
{*
 * HB_SET_VALUE_INVALID:
 *
 * Unset #hb_set_t value.
 *
 * Since: 0.9.21
  }

const
  HB_SET_VALUE_INVALID = HB_CODEPOINT_INVALID;  
{*
 * hb_set_t:
 *
 * Data type for holding a set of integers. #hb_set_t's are
 * used to gather and contain glyph IDs, Unicode code
 * points, and various other collections of discrete 
 * values.
 *
 * }
type

function hb_set_create:Phb_set_t;cdecl;external;
function hb_set_get_empty:Phb_set_t;cdecl;external;
function hb_set_reference(set:Phb_set_t):Phb_set_t;cdecl;external;
procedure hb_set_destroy(set:Phb_set_t);cdecl;external;
function hb_set_set_user_data(set:Phb_set_t; key:Phb_user_data_key_t; data:pointer; destroy:Thb_destroy_func_t; replace:Thb_bool_t):Thb_bool_t;cdecl;external;
(* Const before type ignored *)
function hb_set_get_user_data(set:Phb_set_t; key:Phb_user_data_key_t):pointer;cdecl;external;
{ Returns false if allocation has failed before  }
(* Const before type ignored *)
function hb_set_allocation_successful(set:Phb_set_t):Thb_bool_t;cdecl;external;
(* Const before type ignored *)
function hb_set_copy(set:Phb_set_t):Phb_set_t;cdecl;external;
procedure hb_set_clear(set:Phb_set_t);cdecl;external;
(* Const before type ignored *)
function hb_set_is_empty(set:Phb_set_t):Thb_bool_t;cdecl;external;
procedure hb_set_invert(set:Phb_set_t);cdecl;external;
(* Const before type ignored *)
function hb_set_is_inverted(set:Phb_set_t):Thb_bool_t;cdecl;external;
(* Const before type ignored *)
function hb_set_has(set:Phb_set_t; codepoint:Thb_codepoint_t):Thb_bool_t;cdecl;external;
procedure hb_set_add(set:Phb_set_t; codepoint:Thb_codepoint_t);cdecl;external;
procedure hb_set_add_range(set:Phb_set_t; first:Thb_codepoint_t; last:Thb_codepoint_t);cdecl;external;
(* Const before type ignored *)
procedure hb_set_add_sorted_array(set:Phb_set_t; sorted_codepoints:Phb_codepoint_t; num_codepoints:dword);cdecl;external;
procedure hb_set_del(set:Phb_set_t; codepoint:Thb_codepoint_t);cdecl;external;
procedure hb_set_del_range(set:Phb_set_t; first:Thb_codepoint_t; last:Thb_codepoint_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function hb_set_is_equal(set:Phb_set_t; other:Phb_set_t):Thb_bool_t;cdecl;external;
(* Const before type ignored *)
function hb_set_hash(set:Phb_set_t):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function hb_set_is_subset(set:Phb_set_t; larger_set:Phb_set_t):Thb_bool_t;cdecl;external;
(* Const before type ignored *)
procedure hb_set_set(set:Phb_set_t; other:Phb_set_t);cdecl;external;
(* Const before type ignored *)
procedure hb_set_union(set:Phb_set_t; other:Phb_set_t);cdecl;external;
(* Const before type ignored *)
procedure hb_set_intersect(set:Phb_set_t; other:Phb_set_t);cdecl;external;
(* Const before type ignored *)
procedure hb_set_subtract(set:Phb_set_t; other:Phb_set_t);cdecl;external;
(* Const before type ignored *)
procedure hb_set_symmetric_difference(set:Phb_set_t; other:Phb_set_t);cdecl;external;
(* Const before type ignored *)
function hb_set_get_population(set:Phb_set_t):dword;cdecl;external;
{ Returns HB_SET_VALUE_INVALID if set empty.  }
(* Const before type ignored *)
function hb_set_get_min(set:Phb_set_t):Thb_codepoint_t;cdecl;external;
{ Returns HB_SET_VALUE_INVALID if set empty.  }
(* Const before type ignored *)
function hb_set_get_max(set:Phb_set_t):Thb_codepoint_t;cdecl;external;
{ Pass HB_SET_VALUE_INVALID in to get started.  }
(* Const before type ignored *)
function hb_set_next(set:Phb_set_t; codepoint:Phb_codepoint_t):Thb_bool_t;cdecl;external;
{ Pass HB_SET_VALUE_INVALID in to get started.  }
(* Const before type ignored *)
function hb_set_previous(set:Phb_set_t; codepoint:Phb_codepoint_t):Thb_bool_t;cdecl;external;
{ Pass HB_SET_VALUE_INVALID for first and last to get started.  }
(* Const before type ignored *)
function hb_set_next_range(set:Phb_set_t; first:Phb_codepoint_t; last:Phb_codepoint_t):Thb_bool_t;cdecl;external;
{ Pass HB_SET_VALUE_INVALID for first and last to get started.  }
(* Const before type ignored *)
function hb_set_previous_range(set:Phb_set_t; first:Phb_codepoint_t; last:Phb_codepoint_t):Thb_bool_t;cdecl;external;
{ Pass HB_SET_VALUE_INVALID in to get started.  }
(* Const before type ignored *)
function hb_set_next_many(set:Phb_set_t; codepoint:Thb_codepoint_t; out:Phb_codepoint_t; size:dword):dword;cdecl;external;
{$endif}
{ HB_SET_H  }

implementation


end.
