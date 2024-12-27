
unit hb_ft;
interface

{
  Automatically converted by H2Pas 1.0.0 from hb_ft.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hb_ft.h
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
Phb_face_t  = ^hb_face_t;
Phb_font_t  = ^hb_font_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2009  Red Hat, Inc.
 * Copyright © 2015  Google, Inc.
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
{$ifndef HB_FT_H}
{$define HB_FT_H}
{$include "hb.h"}
{$include <ft2build.h>}
{$include FT_FREETYPE_H}
{
 * Note: FreeType is not thread-safe.
 * Hence, these functions are not either.
  }
{
 * hb-face from ft-face.
  }
{ This one creates a new hb-face for given ft-face.
 * When the returned hb-face is destroyed, the destroy
 * callback is called (if not NULL), with the ft-face passed
 * to it.
 *
 * The client is responsible to make sure that ft-face is
 * destroyed after hb-face is destroyed.
 *
 * Most often you don't want this function.  You should use either
 * hb_ft_face_create_cached(), or hb_ft_face_create_referenced().
 * In particular, if you are going to pass NULL as destroy, you
 * probably should use (the more recent) hb_ft_face_create_referenced()
 * instead.
  }

function hb_ft_face_create(ft_face:TFT_Face; destroy:Thb_destroy_func_t):Phb_face_t;cdecl;external;
{ This version is like hb_ft_face_create(), except that it caches
 * the hb-face using the generic pointer of the ft-face.  This means
 * that subsequent calls to this function with the same ft-face will
 * return the same hb-face (correctly referenced).
 *
 * Client is still responsible for making sure that ft-face is destroyed
 * after hb-face is.
  }
function hb_ft_face_create_cached(ft_face:TFT_Face):Phb_face_t;cdecl;external;
{ This version is like hb_ft_face_create(), except that it calls
 * FT_Reference_Face() on ft-face, as such keeping ft-face alive
 * as long as the hb-face is.
 *
 * This is the most convenient version to use.  Use it unless you have
 * very good reasons not to.
  }
function hb_ft_face_create_referenced(ft_face:TFT_Face):Phb_face_t;cdecl;external;
{
 * hb-font from ft-face.
  }
{
 * Note:
 *
 * Set face size on ft-face before creating hb-font from it.
 * Otherwise hb-ft would NOT pick up the font size correctly.
  }
{ See notes on hb_ft_face_create().  Same issues re lifecycle-management
 * apply here.  Use hb_ft_font_create_referenced() if you can.  }
function hb_ft_font_create(ft_face:TFT_Face; destroy:Thb_destroy_func_t):Phb_font_t;cdecl;external;
{ See notes on hb_ft_face_create_referenced() re lifecycle-management
 * issues.  }
function hb_ft_font_create_referenced(ft_face:TFT_Face):Phb_font_t;cdecl;external;
function hb_ft_font_get_face(font:Phb_font_t):TFT_Face;cdecl;external;
function hb_ft_font_lock_face(font:Phb_font_t):TFT_Face;cdecl;external;
procedure hb_ft_font_unlock_face(font:Phb_font_t);cdecl;external;
procedure hb_ft_font_set_load_flags(font:Phb_font_t; load_flags:longint);cdecl;external;
function hb_ft_font_get_load_flags(font:Phb_font_t):longint;cdecl;external;
{ Call when size or variations settings on underlying FT_Face changed,
 * and you want to update the hb_font_t from it.  }
procedure hb_ft_font_changed(font:Phb_font_t);cdecl;external;
{ Call when size or variations settings on underlying hb_font_t may have
 * changed, and you want to update the FT_Face from it.  This call is fast
 * if nothing changed on hb_font_t. Returns true if changed.  }
function hb_ft_hb_font_changed(font:Phb_font_t):Thb_bool_t;cdecl;external;
{ Makes an hb_font_t use FreeType internally to implement font functions.
 * Note: this internally creates an FT_Face.  Use it when you create your
 * hb_face_t using hb_face_create().  }
procedure hb_ft_font_set_funcs(font:Phb_font_t);cdecl;external;
{$endif}
{ HB_FT_H  }

implementation


end.
