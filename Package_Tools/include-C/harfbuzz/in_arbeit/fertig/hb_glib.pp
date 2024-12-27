
unit hb_glib;
interface

{
  Automatically converted by H2Pas 1.0.0 from hb_glib.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hb_glib.h
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
PGBytes  = ^GBytes;
Phb_blob_t  = ^hb_blob_t;
Phb_unicode_funcs_t  = ^hb_unicode_funcs_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2009  Red Hat, Inc.
 * Copyright © 2011  Google, Inc.
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
 * Google Author(s): Behdad Esfahbod
  }
{$ifndef HB_GLIB_H}
{$define HB_GLIB_H}
{$include "hb.h"}
{$include <glib.h>}

function hb_glib_script_to_script(script:TGUnicodeScript):Thb_script_t;cdecl;external;
function hb_glib_script_from_script(script:Thb_script_t):TGUnicodeScript;cdecl;external;
function hb_glib_get_unicode_funcs:Phb_unicode_funcs_t;cdecl;external;
{$if GLIB_CHECK_VERSION(2,31,10)}

function hb_glib_blob_create(gbytes:PGBytes):Phb_blob_t;cdecl;external;
{$endif}
{$endif}
{ HB_GLIB_H  }

implementation


end.
