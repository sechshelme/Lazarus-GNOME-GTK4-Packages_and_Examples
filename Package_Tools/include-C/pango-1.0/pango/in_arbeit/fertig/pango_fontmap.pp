
unit pango_fontmap;
interface

{
  Automatically converted by H2Pas 1.0.0 from pango_fontmap.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pango_fontmap.h
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
Plongint  = ^longint;
PPangoContext  = ^PangoContext;
PPangoFont  = ^PangoFont;
PPangoFontDescription  = ^PangoFontDescription;
PPangoFontFace  = ^PangoFontFace;
PPangoFontFamily  = ^PangoFontFamily;
PPangoFontMap  = ^PangoFontMap;
PPangoFontMapClass  = ^PangoFontMapClass;
PPangoFontset  = ^PangoFontset;
PPangoLanguage  = ^PangoLanguage;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pango-font.h: Font handling
 *
 * Copyright (C) 2000 Red Hat Software
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
{$ifndef __PANGO_FONTMAP_H__}
{$define __PANGO_FONTMAP_H__}
{$include <pango/pango-types.h>}
{$include <pango/pango-font.h>}
{$include <pango/pango-fontset.h>}

{ was #define dname def_expr }
function PANGO_TYPE_FONT_MAP : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_FONT_MAP(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_FONT_MAP_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_FONT_MAP(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_FONT_MAP_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_FONT_MAP_GET_CLASS(obj : longint) : longint;

type
{*
 * PangoFontMap:
 *
 * A `PangoFontMap` represents the set of fonts available for a
 * particular rendering system.
 *
 * This is a virtual object with implementations being specific to
 * particular rendering systems.
  }
  PPangoFontMap = ^TPangoFontMap;
  TPangoFontMap = record
      parent_instance : TGObject;
    end;

{*
 * PangoFontMapClass:
 * @parent_class: parent `GObjectClass`
 * @load_font: a function to load a font with a given description. See
 * pango_font_map_load_font().
 * @list_families: A function to list available font families. See
 * pango_font_map_list_families().
 * @load_fontset: a function to load a fontset with a given given description
 * suitable for a particular language. See pango_font_map_load_fontset().
 * @shape_engine_type: the type of rendering-system-dependent engines that
 * can handle fonts of this fonts loaded with this fontmap.
 * @get_serial: a function to get the serial number of the fontmap.
 * See pango_font_map_get_serial().
 * @changed: See pango_font_map_changed()
 *
 * The `PangoFontMapClass` structure holds the virtual functions for
 * a particular `PangoFontMap` implementation.
  }
{< public > }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
  PPangoFontMapClass = ^TPangoFontMapClass;
  TPangoFontMapClass = record
      parent_class : TGObjectClass;
      load_font : function (fontmap:PPangoFontMap; context:PPangoContext; desc:PPangoFontDescription):PPangoFont;cdecl;
      list_families : procedure (fontmap:PPangoFontMap; families:PPPPangoFontFamily; n_families:Plongint);cdecl;
      load_fontset : function (fontmap:PPangoFontMap; context:PPangoContext; desc:PPangoFontDescription; language:PPangoLanguage):PPangoFontset;cdecl;
      shape_engine_type : Pchar;
      get_serial : function (fontmap:PPangoFontMap):Tguint;cdecl;
      changed : procedure (fontmap:PPangoFontMap);cdecl;
      get_family : function (fontmap:PPangoFontMap; name:Pchar):PPangoFontFamily;cdecl;
      get_face : function (fontmap:PPangoFontMap; font:PPangoFont):PPangoFontFace;cdecl;
    end;


function pango_font_map_get_type:TGType;cdecl;external;
function pango_font_map_create_context(fontmap:PPangoFontMap):PPangoContext;cdecl;external;
(* Const before type ignored *)
function pango_font_map_load_font(fontmap:PPangoFontMap; context:PPangoContext; desc:PPangoFontDescription):PPangoFont;cdecl;external;
(* Const before type ignored *)
function pango_font_map_load_fontset(fontmap:PPangoFontMap; context:PPangoContext; desc:PPangoFontDescription; language:PPangoLanguage):PPangoFontset;cdecl;external;
procedure pango_font_map_list_families(fontmap:PPangoFontMap; families:PPPPangoFontFamily; n_families:Plongint);cdecl;external;
function pango_font_map_get_serial(fontmap:PPangoFontMap):Tguint;cdecl;external;
procedure pango_font_map_changed(fontmap:PPangoFontMap);cdecl;external;
(* Const before type ignored *)
function pango_font_map_get_family(fontmap:PPangoFontMap; name:Pchar):PPangoFontFamily;cdecl;external;
(* Const before type ignored *)
function pango_font_map_reload_font(fontmap:PPangoFontMap; font:PPangoFont; scale:Tdouble; context:PPangoContext; variations:Pchar):PPangoFont;cdecl;external;
{$endif}
{ __PANGO_FONTMAP_H__  }

implementation

{ was #define dname def_expr }
function PANGO_TYPE_FONT_MAP : longint; { return type might be wrong }
  begin
    PANGO_TYPE_FONT_MAP:=pango_font_map_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_FONT_MAP(object : longint) : longint;
begin
  PANGO_FONT_MAP:=G_TYPE_CHECK_INSTANCE_CAST(object,PANGO_TYPE_FONT_MAP,PangoFontMap);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_FONT_MAP_CLASS(klass : longint) : longint;
begin
  PANGO_FONT_MAP_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,PANGO_TYPE_FONT_MAP,PangoFontMapClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_FONT_MAP(object : longint) : longint;
begin
  PANGO_IS_FONT_MAP:=G_TYPE_CHECK_INSTANCE_TYPE(object,PANGO_TYPE_FONT_MAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_FONT_MAP_CLASS(klass : longint) : longint;
begin
  PANGO_IS_FONT_MAP_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,PANGO_TYPE_FONT_MAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_FONT_MAP_GET_CLASS(obj : longint) : longint;
begin
  PANGO_FONT_MAP_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,PANGO_TYPE_FONT_MAP,PangoFontMapClass);
end;


end.
