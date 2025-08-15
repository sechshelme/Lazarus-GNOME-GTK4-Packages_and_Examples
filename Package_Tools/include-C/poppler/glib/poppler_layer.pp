
unit poppler_layer;
interface

{
  Automatically converted by H2Pas 1.0.0 from poppler_layer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    poppler_layer.h
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
Pgchar  = ^gchar;
PPopplerLayer  = ^PopplerLayer;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ poppler-layer.h: glib interface to poppler
 *
 * Copyright (C) 2008 Carlos Garcia Campos <carlosgc@gnome.org>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA 02110-1301, USA.
  }
{$ifndef __POPPLER_LAYER_H__}
{$define __POPPLER_LAYER_H__}
{$include <glib-object.h>}
{$include "poppler.h"}

{ was #define dname def_expr }
function POPPLER_TYPE_LAYER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_LAYER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_LAYER(obj : longint) : longint;

function poppler_layer_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function poppler_layer_get_title(layer:PPopplerLayer):Pgchar;cdecl;external;
function poppler_layer_is_visible(layer:PPopplerLayer):Tgboolean;cdecl;external;
procedure poppler_layer_show(layer:PPopplerLayer);cdecl;external;
procedure poppler_layer_hide(layer:PPopplerLayer);cdecl;external;
function poppler_layer_is_parent(layer:PPopplerLayer):Tgboolean;cdecl;external;
function poppler_layer_get_radio_button_group_id(layer:PPopplerLayer):Tgint;cdecl;external;
{$endif}
{ __POPPLER_LAYER_H__  }

implementation

{ was #define dname def_expr }
function POPPLER_TYPE_LAYER : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_LAYER:=poppler_layer_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_LAYER(obj : longint) : longint;
begin
  POPPLER_LAYER:=G_TYPE_CHECK_INSTANCE_CAST(obj,POPPLER_TYPE_LAYER,PopplerLayer);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_LAYER(obj : longint) : longint;
begin
  POPPLER_IS_LAYER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,POPPLER_TYPE_LAYER);
end;


end.
