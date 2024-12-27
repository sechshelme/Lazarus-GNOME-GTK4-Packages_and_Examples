
unit hb_ot_meta;
interface

{
  Automatically converted by H2Pas 1.0.0 from hb_ot_meta.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hb_ot_meta.h
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
Phb_ot_meta_tag_t  = ^hb_ot_meta_tag_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2019  Ebrahim Byagowi
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
  }
{$if !defined(HB_OT_H_IN) && !defined(HB_NO_SINGLE_HEADER_ERROR)}
{$error "Include <hb-ot.h> instead."}
{$endif}
{$ifndef HB_OT_META_H}
{$define HB_OT_META_H}
{$include "hb.h"}
{*
 * hb_ot_meta_tag_t:
 * @HB_OT_META_TAG_DESIGN_LANGUAGES: Design languages. Text, using only
 * Basic Latin (ASCII) characters. Indicates languages and/or scripts
 * for the user audiences that the font was primarily designed for.
 * @HB_OT_META_TAG_SUPPORTED_LANGUAGES: Supported languages. Text, using
 * only Basic Latin (ASCII) characters. Indicates languages and/or scripts
 * that the font is declared to be capable of supporting.
 *
 * Known metadata tags from https://docs.microsoft.com/en-us/typography/opentype/spec/meta
 *
 * Since: 2.6.0
 * }
{
   HB_OT_META_TAG_APPL		= HB_TAG ('a','p','p','l'),
   HB_OT_META_TAG_BILD		= HB_TAG ('b','i','l','d'),
 }
{< private > }
{< skip > }
type
  Phb_ot_meta_tag_t = ^Thb_ot_meta_tag_t;
  Thb_ot_meta_tag_t =  Longint;
  Const
    HB_OT_META_TAG_DESIGN_LANGUAGES = HB_TAG('d','l','n','g');
    HB_OT_META_TAG_SUPPORTED_LANGUAGES = HB_TAG('s','l','n','g');
    _HB_OT_META_TAG_MAX_VALUE = HB_TAG_MAX_SIGNED;
;
{ IN/OUT.  May be NULL.  }
{ OUT.     May be NULL.  }
function hb_ot_meta_get_entry_tags(face:Phb_face_t; start_offset:dword; entries_count:Pdword; entries:Phb_ot_meta_tag_t):dword;cdecl;external;
function hb_ot_meta_reference_entry(face:Phb_face_t; meta_tag:Thb_ot_meta_tag_t):Phb_blob_t;cdecl;external;
{$endif}
{ HB_OT_META_H  }

implementation


end.
