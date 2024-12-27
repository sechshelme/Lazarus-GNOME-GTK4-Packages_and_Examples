
unit hb_subset_repacker;
interface

{
  Automatically converted by H2Pas 1.0.0 from hb_subset_repacker.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hb_subset_repacker.h
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
Phb_blob_t  = ^hb_blob_t;
Phb_link_t  = ^hb_link_t;
Phb_object_t  = ^hb_object_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2022  Google, Inc.
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
  }
{$ifndef HB_SUBSET_REPACKER_H}
{$define HB_SUBSET_REPACKER_H}
{$include "hb.h"}
{$ifdef HB_EXPERIMENTAL_API}
{
 * struct hb_link_t
 * width:    offsetSize in bytes
 * position: position of the offset field in bytes
 * from beginning of subtable
 * objidx:   index of subtable
  }
type
  Phb_link_t = ^Thb_link_t;
  Thb_link_t = record
      width : dword;
      position : dword;
      objidx : dword;
    end;

{
 * struct hb_object_t
 * head:    start of object data
 * tail:    end of object data
 * num_real_links:    num of offset field in the object
 * real_links:        pointer to array of offset info
 * num_virtual_links: num of objects that must be packed
 * after current object in the final serialized order
 * virtual_links:     array of virtual link info
  }
  Phb_object_t = ^Thb_object_t;
  Thb_object_t = record
      head : Pchar;
      tail : Pchar;
      num_real_links : dword;
      real_links : Phb_link_t;
      num_virtual_links : dword;
      virtual_links : Phb_link_t;
    end;


function hb_subset_repack_or_fail(table_tag:Thb_tag_t; hb_objects:Phb_object_t; num_hb_objs:dword):Phb_blob_t;cdecl;external;
{$endif}
{$endif}
{ HB_SUBSET_REPACKER_H  }

implementation


end.
