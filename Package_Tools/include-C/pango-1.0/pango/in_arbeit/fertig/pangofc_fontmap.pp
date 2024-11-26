
unit pangofc_fontmap;
interface

{
  Automatically converted by H2Pas 1.0.0 from pangofc_fontmap.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pangofc_fontmap.h
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
PFcConfig  = ^FcConfig;
PFcPattern  = ^FcPattern;
Phb_face_t  = ^hb_face_t;
PPangoContext  = ^PangoContext;
PPangoFcDecoder  = ^PangoFcDecoder;
PPangoFcDecoderFindFunc  = ^PangoFcDecoderFindFunc;
PPangoFcFont  = ^PangoFcFont;
PPangoFcFontMap  = ^PangoFcFontMap;
PPangoFontDescription  = ^PangoFontDescription;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pangofc-fontmap.h: Base fontmap type for fontconfig-based backends
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
{$ifndef __PANGO_FC_FONT_MAP_H__}
{$define __PANGO_FC_FONT_MAP_H__}
{$include <pango/pango.h>}
{$include <fontconfig/fontconfig.h>}
{$include <pango/pangofc-decoder.h>}
{$include <pango/pangofc-font.h>}
{$include <hb.h>}
{
 * PangoFcFontMap
  }

{ was #define dname def_expr }
function PANGO_TYPE_FC_FONT_MAP : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_FC_FONT_MAP(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_FC_FONT_MAP(object : longint) : longint;

type

function pango_fc_font_map_get_type:TGType;cdecl;external;
procedure pango_fc_font_map_cache_clear(fcfontmap:PPangoFcFontMap);cdecl;external;
procedure pango_fc_font_map_config_changed(fcfontmap:PPangoFcFontMap);cdecl;external;
procedure pango_fc_font_map_set_config(fcfontmap:PPangoFcFontMap; fcconfig:PFcConfig);cdecl;external;
function pango_fc_font_map_get_config(fcfontmap:PPangoFcFontMap):PFcConfig;cdecl;external;
{*
 * PangoFcDecoderFindFunc:
 * @pattern: a fully resolved `FcPattern` specifying the font on the system
 * @user_data: user data passed to
 *   [method@PangoFc.FontMap.add_decoder_find_func]
 *
 * Callback function passed to [method@PangoFc.FontMap.add_decoder_find_func].
 *
 * Return value: a new reference to a custom decoder for this pattern,
 *  or %NULL if the default decoder handling should be used.
 * }
type
  PPangoFcDecoderFindFunc = ^TPangoFcDecoderFindFunc;
  TPangoFcDecoderFindFunc = function (pattern:PFcPattern; user_data:Tgpointer):PPangoFcDecoder;cdecl;

procedure pango_fc_font_map_add_decoder_find_func(fcfontmap:PPangoFcFontMap; findfunc:TPangoFcDecoderFindFunc; user_data:Tgpointer; dnotify:TGDestroyNotify);cdecl;external;
function pango_fc_font_map_find_decoder(fcfontmap:PPangoFcFontMap; pattern:PFcPattern):PPangoFcDecoder;cdecl;external;
function pango_fc_font_description_from_pattern(pattern:PFcPattern; include_size:Tgboolean):PPangoFontDescription;cdecl;external;
{$ifndef PANGO_DISABLE_DEPRECATED}

function pango_fc_font_map_create_context(fcfontmap:PPangoFcFontMap):PPangoContext;cdecl;external;
{$endif}

procedure pango_fc_font_map_shutdown(fcfontmap:PPangoFcFontMap);cdecl;external;
function pango_fc_font_map_get_hb_face(fcfontmap:PPangoFcFontMap; fcfont:PPangoFcFont):Phb_face_t;cdecl;external;
{*
 * PangoFcSubstituteFunc:
 * @pattern: the FcPattern to tweak.
 * @data: user data.
 *
 * Function type for doing final config tweaking on prepared `FcPattern`s.
  }
type

  TPangoFcSubstituteFunc = procedure (pattern:PFcPattern; data:Tgpointer);cdecl;
{*
 * pango_fc_font_map_set_default_substitute:
 * @fontmap: a `PangoFcFontMap`
 * @func: function to call to to do final config tweaking on `FcPattern` objects
 * @data: data to pass to @func
 * @notify: function to call when @data is no longer used
 *
 * Sets a function that will be called to do final configuration
 * substitution on a `FcPattern` before it is used to load
 * the font.
 *
 * This function can be used to do things like set
 * hinting and antialiasing options.
 *
 * Since: 1.48
  }

procedure pango_fc_font_map_set_default_substitute(fontmap:PPangoFcFontMap; func:TPangoFcSubstituteFunc; data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
{*
 * pango_fc_font_map_substitute_changed:
 * @fontmap: a `PangoFcFontMap`
 *
 * Call this function any time the results of the default
 * substitution function set with
 * [method@PangoFc.FontMap.set_default_substitute] change.
 *
 * That is, if your substitution function will return different
 * results for the same input pattern, you must call this function.
 *
 * Since: 1.48
  }
procedure pango_fc_font_map_substitute_changed(fontmap:PPangoFcFontMap);cdecl;external;
{*
 * PANGO_FC_GRAVITY:
 *
 * Fontconfig property that Pango sets on any
 * fontconfig pattern it passes to fontconfig
 * if a `PangoGravity` other than %PANGO_GRAVITY_SOUTH
 * is desired.
 *
 * The property will have a `PangoGravity` value as a string,
 * like "east". This can be used to write fontconfig configuration
 * rules to choose different fonts for horizontal and vertical
 * writing directions.
 *
 * Since: 1.20
  }
const
  PANGO_FC_GRAVITY = 'pangogravity';  
{*
 * PANGO_FC_VERSION:
 *
 * Fontconfig property that Pango sets on any
 * fontconfig pattern it passes to fontconfig.
 *
 * The property will have an integer value equal to what
 * [func@Pango.version] returns. This can be used to write
 * fontconfig configuration rules that only affect certain
 * pango versions (or only pango-using applications, or only
 * non-pango-using applications).
 *
 * Since: 1.20
  }
  PANGO_FC_VERSION = 'pangoversion';  
{*
 * PANGO_FC_PRGNAME:
 *
 * Fontconfig property that Pango sets on any
 * fontconfig pattern it passes to fontconfig.
 *
 * The property will have a string equal to what
 * g_get_prgname() returns. This can be used to write
 * fontconfig configuration rules that only affect
 * certain applications.
 *
 * This is equivalent to FC_PRGNAME in versions of
 * fontconfig that have that.
 *
 * Since: 1.24
  }
  PANGO_FC_PRGNAME = 'prgname';  
{*
 * PANGO_FC_FONT_FEATURES:
 *
 * Fontconfig property that Pango reads from font
 * patterns to populate list of OpenType features
 * to be enabled for the font by default.
 *
 * The property will have a number of string elements,
 * each of which is the OpenType feature tag of one feature
 * to enable.
 *
 * This is equivalent to FC_FONT_FEATURES in versions of
 * fontconfig that have that.
 *
 * Since: 1.34
  }
  PANGO_FC_FONT_FEATURES = 'fontfeatures';  
{*
 * PANGO_FC_FONT_VARIATIONS:
 *
 * Fontconfig property that Pango reads from font
 * patterns to populate list of OpenType font variations
 * to be used for a font.
 *
 * The property will have a string elements, each of which
 * a comma-separated list of OpenType axis setting of the
 * form AXIS=VALUE.
 *
 * This is equivalent to FC_FONT_VARIATIONS in versions of
 * fontconfig that have that.
  }
  PANGO_FC_FONT_VARIATIONS = 'fontvariations';  
{$endif}
{ __PANGO_FC_FONT_MAP_H__  }

implementation

{ was #define dname def_expr }
function PANGO_TYPE_FC_FONT_MAP : longint; { return type might be wrong }
  begin
    PANGO_TYPE_FC_FONT_MAP:=pango_fc_font_map_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_FC_FONT_MAP(object : longint) : longint;
begin
  PANGO_FC_FONT_MAP:=G_TYPE_CHECK_INSTANCE_CAST(object,PANGO_TYPE_FC_FONT_MAP,PangoFcFontMap);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_FC_FONT_MAP(object : longint) : longint;
begin
  PANGO_IS_FC_FONT_MAP:=G_TYPE_CHECK_INSTANCE_TYPE(object,PANGO_TYPE_FC_FONT_MAP);
end;


end.
