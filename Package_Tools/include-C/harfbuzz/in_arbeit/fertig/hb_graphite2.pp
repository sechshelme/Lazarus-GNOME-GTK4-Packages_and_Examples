
unit hb_graphite2;
interface

{
  Automatically converted by H2Pas 1.0.0 from hb_graphite2.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hb_graphite2.h
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
Pgr_face  = ^gr_face;
Pgr_font  = ^gr_font;
Phb_face_t  = ^hb_face_t;
Phb_font_t  = ^hb_font_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2011  Martin Hosken
 * Copyright © 2011  SIL International
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
{$ifndef HB_GRAPHITE2_H}
{$define HB_GRAPHITE2_H}
{$include "hb.h"}
{$include <graphite2/Font.h>}
{*
 * HB_GRAPHITE2_TAG_SILF:
 *
 * The #hb_tag_t tag for the `Silf` table, which holds Graphite
 * features. 
 *
 * For more information, see http://graphite.sil.org/
 *
 * }

{ was #define dname def_expr }
function HB_GRAPHITE2_TAG_SILF : longint; { return type might be wrong }

function hb_graphite2_face_get_gr_face(face:Phb_face_t):Pgr_face;cdecl;external;
{$ifndef HB_DISABLE_DEPRECATED}

function hb_graphite2_font_get_gr_font(font:Phb_font_t):Pgr_font;cdecl;external;
{$endif}
{$endif}
{ HB_GRAPHITE2_H  }

implementation

{ was #define dname def_expr }
function HB_GRAPHITE2_TAG_SILF : longint; { return type might be wrong }
  begin
    HB_GRAPHITE2_TAG_SILF:=HB_TAG('S','i','l','f');
  end;


end.
