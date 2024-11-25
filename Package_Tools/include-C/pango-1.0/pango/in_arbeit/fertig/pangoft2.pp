
unit pangoft2;
interface

{
  Automatically converted by H2Pas 1.0.0 from pangoft2.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pangoft2.h
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
PFT_Bitmap  = ^FT_Bitmap;
PPangoContext  = ^PangoContext;
PPangoCoverage  = ^PangoCoverage;
PPangoFont  = ^PangoFont;
PPangoFontMap  = ^PangoFontMap;
PPangoFT2FontMap  = ^PangoFT2FontMap;
PPangoGlyphString  = ^PangoGlyphString;
PPangoLanguage  = ^PangoLanguage;
PPangoLayout  = ^PangoLayout;
PPangoLayoutLine  = ^PangoLayoutLine;
PPangoMatrix  = ^PangoMatrix;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pangoft2.h:
 *
 * Copyright (C) 1999 Red Hat Software
 * Copyright (C) 2000 Tor Lillqvist
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
{$ifndef __PANGOFT2_H__}
{$define __PANGOFT2_H__}
{$include <fontconfig/fontconfig.h>}
{$include <ft2build.h>}
{$include FT_FREETYPE_H}
{$include <pango/pangofc-fontmap.h>}
{$include <pango/pango-layout.h>}
{$include <pango/pangofc-font.h>}

{ was #define dname def_expr }
function PANGO_TYPE_FT2_FONT_MAP : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_FT2_FONT_MAP(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_FT2_IS_FONT_MAP(object : longint) : longint;

{$ifndef __GI_SCANNER__}
{$ifndef PANGO_DISABLE_DEPRECATED}
{*
 * PANGO_RENDER_TYPE_FT2: (skip)
 *
 * A string constant that was used to identify shape engines that work
 * with the FreeType backend. See %PANGO_RENDER_TYPE_FC for the replacement.
  }

const
  PANGO_RENDER_TYPE_FT2 = 'PangoRenderFT2';  
{$endif}
{$endif}
{ __GI_SCANNER__  }
type
{*
 * PangoFT2SubstituteFunc:
 * @pattern: the FcPattern to tweak.
 * @data: user data.
 *
 * Function type for doing final config tweaking on prepared FcPatterns.
  }

  TPangoFT2SubstituteFunc = procedure (pattern:PFcPattern; data:Tgpointer);cdecl;
{ Calls for applications  }

procedure pango_ft2_render(bitmap:PFT_Bitmap; font:PPangoFont; glyphs:PPangoGlyphString; x:Tgint; y:Tgint);cdecl;external;
(* Const before type ignored *)
procedure pango_ft2_render_transformed(bitmap:PFT_Bitmap; matrix:PPangoMatrix; font:PPangoFont; glyphs:PPangoGlyphString; x:longint; 
            y:longint);cdecl;external;
procedure pango_ft2_render_layout_line(bitmap:PFT_Bitmap; line:PPangoLayoutLine; x:longint; y:longint);cdecl;external;
procedure pango_ft2_render_layout_line_subpixel(bitmap:PFT_Bitmap; line:PPangoLayoutLine; x:longint; y:longint);cdecl;external;
procedure pango_ft2_render_layout(bitmap:PFT_Bitmap; layout:PPangoLayout; x:longint; y:longint);cdecl;external;
procedure pango_ft2_render_layout_subpixel(bitmap:PFT_Bitmap; layout:PPangoLayout; x:longint; y:longint);cdecl;external;
function pango_ft2_font_map_get_type:TGType;cdecl;external;
function pango_ft2_font_map_new:PPangoFontMap;cdecl;external;
procedure pango_ft2_font_map_set_resolution(fontmap:PPangoFT2FontMap; dpi_x:Tdouble; dpi_y:Tdouble);cdecl;external;
{$ifndef PANGO_DISABLE_DEPRECATED}

procedure pango_ft2_font_map_set_default_substitute(fontmap:PPangoFT2FontMap; func:TPangoFT2SubstituteFunc; data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
procedure pango_ft2_font_map_substitute_changed(fontmap:PPangoFT2FontMap);cdecl;external;
function pango_ft2_font_map_create_context(fontmap:PPangoFT2FontMap):PPangoContext;cdecl;external;
{$endif}
{ API for rendering modules
  }
{$ifndef PANGO_DISABLE_DEPRECATED}

function pango_ft2_get_context(dpi_x:Tdouble; dpi_y:Tdouble):PPangoContext;cdecl;external;
function pango_ft2_font_map_for_display:PPangoFontMap;cdecl;external;
procedure pango_ft2_shutdown_display;cdecl;external;
function pango_ft2_get_unknown_glyph(font:PPangoFont):TPangoGlyph;cdecl;external;
function pango_ft2_font_get_kerning(font:PPangoFont; left:TPangoGlyph; right:TPangoGlyph):longint;cdecl;external;
function pango_ft2_font_get_face(font:PPangoFont):TFT_Face;cdecl;external;
function pango_ft2_font_get_coverage(font:PPangoFont; language:PPangoLanguage):PPangoCoverage;cdecl;external;
{$endif}
{ PANGO_DISABLE_DEPRECATED  }
{$endif}
{ __PANGOFT2_H__  }

implementation

{ was #define dname def_expr }
function PANGO_TYPE_FT2_FONT_MAP : longint; { return type might be wrong }
  begin
    PANGO_TYPE_FT2_FONT_MAP:=pango_ft2_font_map_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_FT2_FONT_MAP(object : longint) : longint;
begin
  PANGO_FT2_FONT_MAP:=G_TYPE_CHECK_INSTANCE_CAST(object,PANGO_TYPE_FT2_FONT_MAP,PangoFT2FontMap);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_FT2_IS_FONT_MAP(object : longint) : longint;
begin
  PANGO_FT2_IS_FONT_MAP:=G_TYPE_CHECK_INSTANCE_TYPE(object,PANGO_TYPE_FT2_FONT_MAP);
end;


end.
