
unit gemblem;
interface

{
  Automatically converted by H2Pas 1.0.0 from gemblem.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gemblem.h
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
PGEmblem  = ^GEmblem;
PGIcon  = ^GIcon;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2008 Clemens N. Buss <cebuzz@gmail.com>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
  }
{$ifndef __G_EMBLEM_H__}
{$define __G_EMBLEM_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gioenums.h>}

{ was #define dname def_expr }
function G_TYPE_EMBLEM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_EMBLEM(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_EMBLEM_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_EMBLEM(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_EMBLEM_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_EMBLEM_GET_CLASS(o : longint) : longint;

type

function g_emblem_get_type:TGType;cdecl;external;
function g_emblem_new(icon:PGIcon):PGEmblem;cdecl;external;
function g_emblem_new_with_origin(icon:PGIcon; origin:TGEmblemOrigin):PGEmblem;cdecl;external;
function g_emblem_get_icon(emblem:PGEmblem):PGIcon;cdecl;external;
function g_emblem_get_origin(emblem:PGEmblem):TGEmblemOrigin;cdecl;external;
{$endif}
{ __G_EMBLEM_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_EMBLEM : longint; { return type might be wrong }
  begin
    G_TYPE_EMBLEM:=g_emblem_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_EMBLEM(o : longint) : longint;
begin
  G_EMBLEM:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_EMBLEM,GEmblem);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_EMBLEM_CLASS(k : longint) : longint;
begin
  G_EMBLEM_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_EMBLEM,GEmblemClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_EMBLEM(o : longint) : longint;
begin
  G_IS_EMBLEM:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_EMBLEM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_EMBLEM_CLASS(k : longint) : longint;
begin
  G_IS_EMBLEM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_EMBLEM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_EMBLEM_GET_CLASS(o : longint) : longint;
begin
  G_EMBLEM_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_EMBLEM,GEmblemClass);
end;


end.
