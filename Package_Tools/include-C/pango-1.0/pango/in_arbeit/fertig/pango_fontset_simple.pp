
unit pango_fontset_simple;
interface

{
  Automatically converted by H2Pas 1.0.0 from pango_fontset_simple.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pango_fontset_simple.h
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
PPangoFontsetSimple  = ^PangoFontsetSimple;
PPangoLanguage  = ^PangoLanguage;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pango-fontset-simple.h: Font set handling
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
{$ifndef __PANGO_FONTSET_SIMPLE_H__}
{$define __PANGO_FONTSET_SIMPLE_H__}
{$include <pango/pango-coverage.h>}
{$include <pango/pango-types.h>}
{$include <pango/pango-fontset.h>}
{$include <glib-object.h>}
{*
 * PangoFontsetSimple:
 *
 * `PangoFontsetSimple` is a implementation of the abstract
 * `PangoFontset` base class as an array of fonts.
 *
 * When creating a `PangoFontsetSimple`, you have to provide
 * the array of fonts that make up the fontset.
  }

{ was #define dname def_expr }
function PANGO_TYPE_FONTSET_SIMPLE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_FONTSET_SIMPLE(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_FONTSET_SIMPLE(object : longint) : longint;

type

function pango_fontset_simple_get_type:TGType;cdecl;external;
function pango_fontset_simple_new(language:PPangoLanguage):PPangoFontsetSimple;cdecl;external;
procedure pango_fontset_simple_append(fontset:PPangoFontsetSimple; font:PPangoFont);cdecl;external;
function pango_fontset_simple_size(fontset:PPangoFontsetSimple):longint;cdecl;external;
{$endif}
{ __PANGO_FONTSET_SIMPLE_H__  }

implementation

{ was #define dname def_expr }
function PANGO_TYPE_FONTSET_SIMPLE : longint; { return type might be wrong }
  begin
    PANGO_TYPE_FONTSET_SIMPLE:=pango_fontset_simple_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_FONTSET_SIMPLE(object : longint) : longint;
begin
  PANGO_FONTSET_SIMPLE:=G_TYPE_CHECK_INSTANCE_CAST(object,PANGO_TYPE_FONTSET_SIMPLE,PangoFontsetSimple);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_FONTSET_SIMPLE(object : longint) : longint;
begin
  PANGO_IS_FONTSET_SIMPLE:=G_TYPE_CHECK_INSTANCE_TYPE(object,PANGO_TYPE_FONTSET_SIMPLE);
end;


end.
