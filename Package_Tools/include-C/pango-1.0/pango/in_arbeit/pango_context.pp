
unit pango_context;
interface

{
  Automatically converted by H2Pas 1.0.0 from pango_context.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pango_context.h
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
Plongint  = ^longint;
PPangoContext  = ^PangoContext;
PPangoFont  = ^PangoFont;
PPangoFontDescription  = ^PangoFontDescription;
PPangoFontFamily  = ^PangoFontFamily;
PPangoFontMap  = ^PangoFontMap;
PPangoFontMetrics  = ^PangoFontMetrics;
PPangoFontset  = ^PangoFontset;
PPangoLanguage  = ^PangoLanguage;
PPangoMatrix  = ^PangoMatrix;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pango-context.h: Rendering contexts
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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$ifndef __PANGO_CONTEXT_H__}
{$define __PANGO_CONTEXT_H__}
{$include <pango/pango-types.h>}
{$include <pango/pango-font.h>}
{$include <pango/pango-fontmap.h>}
{$include <pango/pango-attributes.h>}
{$include <pango/pango-direction.h>}
type

{ was #define dname def_expr }
function PANGO_TYPE_CONTEXT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_CONTEXT(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_CONTEXT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_CONTEXT(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_CONTEXT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_CONTEXT_GET_CLASS(obj : longint) : longint;

function pango_context_get_type:TGType;cdecl;external;
function pango_context_new:PPangoContext;cdecl;external;
procedure pango_context_changed(context:PPangoContext);cdecl;external;
procedure pango_context_set_font_map(context:PPangoContext; font_map:PPangoFontMap);cdecl;external;
function pango_context_get_font_map(context:PPangoContext):PPangoFontMap;cdecl;external;
function pango_context_get_serial(context:PPangoContext):Tguint;cdecl;external;
procedure pango_context_list_families(context:PPangoContext; families:PPPPangoFontFamily; n_families:Plongint);cdecl;external;
(* Const before type ignored *)
function pango_context_load_font(context:PPangoContext; desc:PPangoFontDescription):PPangoFont;cdecl;external;
(* Const before type ignored *)
function pango_context_load_fontset(context:PPangoContext; desc:PPangoFontDescription; language:PPangoLanguage):PPangoFontset;cdecl;external;
(* Const before type ignored *)
function pango_context_get_metrics(context:PPangoContext; desc:PPangoFontDescription; language:PPangoLanguage):PPangoFontMetrics;cdecl;external;
(* Const before type ignored *)
procedure pango_context_set_font_description(context:PPangoContext; desc:PPangoFontDescription);cdecl;external;
function pango_context_get_font_description(context:PPangoContext):PPangoFontDescription;cdecl;external;
function pango_context_get_language(context:PPangoContext):PPangoLanguage;cdecl;external;
procedure pango_context_set_language(context:PPangoContext; language:PPangoLanguage);cdecl;external;
procedure pango_context_set_base_dir(context:PPangoContext; direction:TPangoDirection);cdecl;external;
function pango_context_get_base_dir(context:PPangoContext):TPangoDirection;cdecl;external;
procedure pango_context_set_base_gravity(context:PPangoContext; gravity:TPangoGravity);cdecl;external;
function pango_context_get_base_gravity(context:PPangoContext):TPangoGravity;cdecl;external;
function pango_context_get_gravity(context:PPangoContext):TPangoGravity;cdecl;external;
procedure pango_context_set_gravity_hint(context:PPangoContext; hint:TPangoGravityHint);cdecl;external;
function pango_context_get_gravity_hint(context:PPangoContext):TPangoGravityHint;cdecl;external;
(* Const before type ignored *)
procedure pango_context_set_matrix(context:PPangoContext; matrix:PPangoMatrix);cdecl;external;
(* Const before type ignored *)
function pango_context_get_matrix(context:PPangoContext):PPangoMatrix;cdecl;external;
procedure pango_context_set_round_glyph_positions(context:PPangoContext; round_positions:Tgboolean);cdecl;external;
function pango_context_get_round_glyph_positions(context:PPangoContext):Tgboolean;cdecl;external;
{$endif}
{ __PANGO_CONTEXT_H__  }

implementation

{ was #define dname def_expr }
function PANGO_TYPE_CONTEXT : longint; { return type might be wrong }
  begin
    PANGO_TYPE_CONTEXT:=pango_context_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_CONTEXT(object : longint) : longint;
begin
  PANGO_CONTEXT:=G_TYPE_CHECK_INSTANCE_CAST(object,PANGO_TYPE_CONTEXT,PangoContext);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_CONTEXT_CLASS(klass : longint) : longint;
begin
  PANGO_CONTEXT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,PANGO_TYPE_CONTEXT,PangoContextClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_CONTEXT(object : longint) : longint;
begin
  PANGO_IS_CONTEXT:=G_TYPE_CHECK_INSTANCE_TYPE(object,PANGO_TYPE_CONTEXT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_CONTEXT_CLASS(klass : longint) : longint;
begin
  PANGO_IS_CONTEXT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,PANGO_TYPE_CONTEXT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_CONTEXT_GET_CLASS(obj : longint) : longint;
begin
  PANGO_CONTEXT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,PANGO_TYPE_CONTEXT,PangoContextClass);
end;


end.
