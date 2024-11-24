
unit pango_fontset;
interface

{
  Automatically converted by H2Pas 1.0.0 from pango_fontset.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pango_fontset.h
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
PPangoFont  = ^PangoFont;
PPangoFontMetrics  = ^PangoFontMetrics;
PPangoFontset  = ^PangoFontset;
PPangoFontsetClass  = ^PangoFontsetClass;
PPangoLanguage  = ^PangoLanguage;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pango-fontset.h: Font set handling
 *
 * Copyright (C) 2001 Red Hat Software
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
{$ifndef __PANGO_FONTSET_H__}
{$define __PANGO_FONTSET_H__}
{$include <pango/pango-coverage.h>}
{$include <pango/pango-types.h>}
{$include <glib-object.h>}
{
 * PangoFontset
  }

{ was #define dname def_expr }
function PANGO_TYPE_FONTSET : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_FONTSET(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_FONTSET_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_FONTSET(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_FONTSET_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_FONTSET_GET_CLASS(obj : longint) : longint;

function pango_fontset_get_type:TGType;cdecl;external;
type
{*
 * PangoFontsetForeachFunc:
 * @fontset: a `PangoFontset`
 * @font: a font from @fontset
 * @user_data: callback data
 *
 * Callback used when enumerating fonts in a fontset.
 *
 * See [method@Pango.Fontset.foreach].
 *
 * Returns: if %TRUE, stop iteration and return immediately.
 *
 * Since: 1.4
  }

  TPangoFontsetForeachFunc = function (fontset:PPangoFontset; font:PPangoFont; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * PangoFontset:
 *
 * A `PangoFontset` represents a set of `PangoFont` to use when rendering text.
 *
 * A `PangoFontset` is the result of resolving a `PangoFontDescription`
 * against a particular `PangoContext`. It has operations for finding the
 * component font for a particular Unicode character, and for finding a
 * composite set of metrics for the entire fontset.
  }
  PPangoFontset = ^TPangoFontset;
  TPangoFontset = record
      parent_instance : TGObject;cdecl;
    end;

{*
 * PangoFontsetClass:
 * @parent_class: parent `GObjectClass`
 * @get_font: a function to get the font in the fontset that contains the
 *   best glyph for the given Unicode character; see [method@Pango.Fontset.get_font]
 * @get_metrics: a function to get overall metric information for the fonts
 *   in the fontset; see [method@Pango.Fontset.get_metrics]
 * @get_language: a function to get the language of the fontset.
 * @foreach: a function to loop over the fonts in the fontset. See
 *   [method@Pango.Fontset.foreach]
 *
 * The `PangoFontsetClass` structure holds the virtual functions for
 * a particular `PangoFontset` implementation.
  }
{< public > }
{< private > }
{ Padding for future expansion  }
  PPangoFontsetClass = ^TPangoFontsetClass;
  TPangoFontsetClass = record
      parent_class : TGObjectClass;
      get_font : function (fontset:PPangoFontset; wc:Tguint):PPangoFont;cdecl;
      get_metrics : function (fontset:PPangoFontset):PPangoFontMetrics;cdecl;
      get_language : function (fontset:PPangoFontset):PPangoLanguage;cdecl;
      foreach : procedure (fontset:PPangoFontset; func:TPangoFontsetForeachFunc; data:Tgpointer);cdecl;
      _pango_reserved1 : procedure ;cdecl;
      _pango_reserved2 : procedure ;cdecl;
      _pango_reserved3 : procedure ;cdecl;
      _pango_reserved4 : procedure ;cdecl;
    end;


function pango_fontset_get_font(fontset:PPangoFontset; wc:Tguint):PPangoFont;cdecl;external;
function pango_fontset_get_metrics(fontset:PPangoFontset):PPangoFontMetrics;cdecl;external;
procedure pango_fontset_foreach(fontset:PPangoFontset; func:TPangoFontsetForeachFunc; data:Tgpointer);cdecl;external;
{$endif}
{ __PANGO_FONTSET_H__  }

implementation

{ was #define dname def_expr }
function PANGO_TYPE_FONTSET : longint; { return type might be wrong }
  begin
    PANGO_TYPE_FONTSET:=pango_fontset_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_FONTSET(object : longint) : longint;
begin
  PANGO_FONTSET:=G_TYPE_CHECK_INSTANCE_CAST(object,PANGO_TYPE_FONTSET,PangoFontset);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_FONTSET_CLASS(klass : longint) : longint;
begin
  PANGO_FONTSET_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,PANGO_TYPE_FONTSET,PangoFontsetClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_FONTSET(object : longint) : longint;
begin
  PANGO_IS_FONTSET:=G_TYPE_CHECK_INSTANCE_TYPE(object,PANGO_TYPE_FONTSET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_FONTSET_CLASS(klass : longint) : longint;
begin
  PANGO_IS_FONTSET_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,PANGO_TYPE_FONTSET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_FONTSET_GET_CLASS(obj : longint) : longint;
begin
  PANGO_FONTSET_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,PANGO_TYPE_FONTSET,PangoFontsetClass);
end;


end.
