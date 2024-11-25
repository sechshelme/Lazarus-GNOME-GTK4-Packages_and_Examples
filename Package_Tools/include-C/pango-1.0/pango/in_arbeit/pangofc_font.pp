
unit pangofc_font;
interface

{
  Automatically converted by H2Pas 1.0.0 from pangofc_font.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pangofc_font.h
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
PFcPattern  = ^FcPattern;
PGSList  = ^GSList;
PPangoFcFont  = ^PangoFcFont;
PPangoFontDescription  = ^PangoFontDescription;
PPangoFontMap  = ^PangoFontMap;
PPangoGlyphString  = ^PangoGlyphString;
PPangoLanguage  = ^PangoLanguage;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pangofc-font.h: Base fontmap type for fontconfig-based backends
 *
 * Copyright (C) 2003 Red Hat Software
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$ifndef __PANGO_FC_FONT_H__}
{$define __PANGO_FC_FONT_H__}
{$include <pango/pango-glyph.h>}
{$include <pango/pango-font.h>}
{$include <pango/pango-glyph.h>}
{ FreeType has undefined macros in its header  }
{$ifdef PANGO_COMPILATION}
(** unsupported pragma#pragma GCC diagnostic push*)
(** unsupported pragma#pragma GCC diagnostic ignored "-Wundef"*)
{$endif}
{$include <ft2build.h>}
{$include FT_FREETYPE_H}
{$include <fontconfig/fontconfig.h>}
{$ifdef PANGO_COMPILATION}
(** unsupported pragma#pragma GCC diagnostic pop*)
{$endif}

{ was #define dname def_expr }
function PANGO_TYPE_FC_FONT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_FC_FONT(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_FC_FONT(object : longint) : longint;

type
{$ifndef PANGO_DISABLE_DEPRECATED}
{*
 * PangoFcFont:
 *
 * `PangoFcFont` is a base class for font implementations
 * using the Fontconfig and FreeType libraries.
 *
 * It is used in onjunction with [class@PangoFc.FontMap].
 * When deriving from this class, you need to implement all
 * of its virtual functions other than shutdown() along with
 * the get_glyph_extents() virtual function from `PangoFont`.
  }
{ fully resolved pattern  }
{ associated map  }
{ used internally  }
{ unused  }
type
  PPangoFcFont = ^TPangoFcFont;
  TPangoFcFont = record
      parent_instance : TPangoFont;
      font_pattern : PFcPattern;
      fontmap : PPangoFontMap;
      priv : Tgpointer;
      matrix : TPangoMatrix;
      description : PPangoFontDescription;
      metrics_by_lang : PGSList;
      flag0 : word;
    end;


const
  bm_TPangoFcFont_is_hinted = $1;
  bp_TPangoFcFont_is_hinted = 0;
  bm_TPangoFcFont_is_transformed = $2;
  bp_TPangoFcFont_is_transformed = 1;

function is_hinted(var a : TPangoFcFont) : Tguint;
procedure set_is_hinted(var a : TPangoFcFont; __is_hinted : Tguint);
function is_transformed(var a : TPangoFcFont) : Tguint;
procedure set_is_transformed(var a : TPangoFcFont; __is_transformed : Tguint);
{$endif}
{ PANGO_DISABLE_DEPRECATED  }

function pango_fc_font_get_type:TGType;cdecl;external;
function pango_fc_font_has_char(font:PPangoFcFont; wc:Tgunichar):Tgboolean;cdecl;external;
function pango_fc_font_get_glyph(font:PPangoFcFont; wc:Tgunichar):Tguint;cdecl;external;
function pango_fc_font_get_languages(font:PPangoFcFont):^PPangoLanguage;cdecl;external;
function pango_fc_font_get_pattern(font:PPangoFcFont):PFcPattern;cdecl;external;
function pango_fc_font_get_unknown_glyph(font:PPangoFcFont; wc:Tgunichar):TPangoGlyph;cdecl;external;
procedure pango_fc_font_kern_glyphs(font:PPangoFcFont; glyphs:PPangoGlyphString);cdecl;external;
function pango_fc_font_lock_face(font:PPangoFcFont):TFT_Face;cdecl;external;
procedure pango_fc_font_unlock_face(font:PPangoFcFont);cdecl;external;
{$endif}
{ __PANGO_FC_FONT_H__  }

implementation

{ was #define dname def_expr }
function PANGO_TYPE_FC_FONT : longint; { return type might be wrong }
  begin
    PANGO_TYPE_FC_FONT:=pango_fc_font_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_FC_FONT(object : longint) : longint;
begin
  PANGO_FC_FONT:=G_TYPE_CHECK_INSTANCE_CAST(object,PANGO_TYPE_FC_FONT,PangoFcFont);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_FC_FONT(object : longint) : longint;
begin
  PANGO_IS_FC_FONT:=G_TYPE_CHECK_INSTANCE_TYPE(object,PANGO_TYPE_FC_FONT);
end;

function is_hinted(var a : TPangoFcFont) : Tguint;
begin
  is_hinted:=(a.flag0 and bm_TPangoFcFont_is_hinted) shr bp_TPangoFcFont_is_hinted;
end;

procedure set_is_hinted(var a : TPangoFcFont; __is_hinted : Tguint);
begin
  a.flag0:=a.flag0 or ((__is_hinted shl bp_TPangoFcFont_is_hinted) and bm_TPangoFcFont_is_hinted);
end;

function is_transformed(var a : TPangoFcFont) : Tguint;
begin
  is_transformed:=(a.flag0 and bm_TPangoFcFont_is_transformed) shr bp_TPangoFcFont_is_transformed;
end;

procedure set_is_transformed(var a : TPangoFcFont; __is_transformed : Tguint);
begin
  a.flag0:=a.flag0 or ((__is_transformed shl bp_TPangoFcFont_is_transformed) and bm_TPangoFcFont_is_transformed);
end;


end.
