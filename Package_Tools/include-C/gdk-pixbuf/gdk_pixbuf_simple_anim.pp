
unit gdk_pixbuf_simple_anim;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdk_pixbuf_simple_anim.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdk_pixbuf_simple_anim.h
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
PGdkPixbuf  = ^GdkPixbuf;
PGdkPixbufSimpleAnim  = ^GdkPixbufSimpleAnim;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{ GdkPixbuf library - Simple frame-based animations
 *
 * Copyright (C) 2004 Dom Lachowicz
 *
 * Authors: Dom Lachowicz <cinamod@hotmail.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef GDK_PIXBUF_SIMPLE_ANIM_H}
{$define GDK_PIXBUF_SIMPLE_ANIM_H}
{$if defined(GDK_PIXBUF_DISABLE_SINGLE_INCLUDES) && !defined (GDK_PIXBUF_H_INSIDE) && !defined (GDK_PIXBUF_COMPILATION)}
{$error "Only <gdk-pixbuf/gdk-pixbuf.h> can be included directly."}
{$endif}
{$include <gdk-pixbuf/gdk-pixbuf-animation.h>}
{*
 * GdkPixbufSimpleAnim:
 * 
 * An opaque struct representing a simple animation.
  }
type

{ was #define dname def_expr }
function GDK_TYPE_PIXBUF_SIMPLE_ANIM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_PIXBUF_SIMPLE_ANIM(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_PIXBUF_SIMPLE_ANIM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_PIXBUF_SIMPLE_ANIM(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_PIXBUF_SIMPLE_ANIM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_PIXBUF_SIMPLE_ANIM_GET_CLASS(obj : longint) : longint;

function gdk_pixbuf_simple_anim_get_type:TGType;cdecl;external;
function gdk_pixbuf_simple_anim_iter_get_type:TGType;cdecl;external;
function gdk_pixbuf_simple_anim_new(width:Tgint; height:Tgint; rate:Tgfloat):PGdkPixbufSimpleAnim;cdecl;external;
procedure gdk_pixbuf_simple_anim_add_frame(animation:PGdkPixbufSimpleAnim; pixbuf:PGdkPixbuf);cdecl;external;
procedure gdk_pixbuf_simple_anim_set_loop(animation:PGdkPixbufSimpleAnim; loop:Tgboolean);cdecl;external;
function gdk_pixbuf_simple_anim_get_loop(animation:PGdkPixbufSimpleAnim):Tgboolean;cdecl;external;
{$endif}
{ GDK_PIXBUF_SIMPLE_ANIM_H  }

implementation

{ was #define dname def_expr }
function GDK_TYPE_PIXBUF_SIMPLE_ANIM : longint; { return type might be wrong }
  begin
    GDK_TYPE_PIXBUF_SIMPLE_ANIM:=gdk_pixbuf_simple_anim_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_PIXBUF_SIMPLE_ANIM(object : longint) : longint;
begin
  GDK_PIXBUF_SIMPLE_ANIM:=G_TYPE_CHECK_INSTANCE_CAST(object,GDK_TYPE_PIXBUF_SIMPLE_ANIM,GdkPixbufSimpleAnim);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_PIXBUF_SIMPLE_ANIM_CLASS(klass : longint) : longint;
begin
  GDK_PIXBUF_SIMPLE_ANIM_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GDK_TYPE_PIXBUF_SIMPLE_ANIM,GdkPixbufSimpleAnimClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_PIXBUF_SIMPLE_ANIM(object : longint) : longint;
begin
  GDK_IS_PIXBUF_SIMPLE_ANIM:=G_TYPE_CHECK_INSTANCE_TYPE(object,GDK_TYPE_PIXBUF_SIMPLE_ANIM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_PIXBUF_SIMPLE_ANIM_CLASS(klass : longint) : longint;
begin
  GDK_IS_PIXBUF_SIMPLE_ANIM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GDK_TYPE_PIXBUF_SIMPLE_ANIM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_PIXBUF_SIMPLE_ANIM_GET_CLASS(obj : longint) : longint;
begin
  GDK_PIXBUF_SIMPLE_ANIM_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GDK_TYPE_PIXBUF_SIMPLE_ANIM,GdkPixbufSimpleAnimClass);
end;


end.
