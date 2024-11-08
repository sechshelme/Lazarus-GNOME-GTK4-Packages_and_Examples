
unit gdk_pixbuf_loader;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdk_pixbuf_loader.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdk_pixbuf_loader.h
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
PGBytes  = ^GBytes;
PGdkPixbuf  = ^GdkPixbuf;
PGdkPixbufAnimation  = ^GdkPixbufAnimation;
PGdkPixbufFormat  = ^GdkPixbufFormat;
PGdkPixbufLoader  = ^GdkPixbufLoader;
PGdkPixbufLoaderClass  = ^GdkPixbufLoaderClass;
PGError  = ^GError;
Pguchar  = ^guchar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GdkPixbuf library - Progressive loader object
 *
 * Copyright (C) 1999 The Free Software Foundation
 *
 * Authors: Mark Crichton <crichton@gimp.org>
 *          Miguel de Icaza <miguel@gnu.org>
 *          Federico Mena-Quintero <federico@gimp.org>
 *          Jonathan Blandford <jrb@redhat.com>
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
{$ifndef GDK_PIXBUF_LOADER_H}
{$define GDK_PIXBUF_LOADER_H}
{$if defined(GDK_PIXBUF_DISABLE_SINGLE_INCLUDES) && !defined (GDK_PIXBUF_H_INSIDE) && !defined (GDK_PIXBUF_COMPILATION)}
{$error "Only <gdk-pixbuf/gdk-pixbuf.h> can be included directly."}
{$endif}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <gdk-pixbuf/gdk-pixbuf-core.h>}
{$include <gdk-pixbuf/gdk-pixbuf-animation.h>}
{$include <gdk-pixbuf/gdk-pixbuf-io.h>}

{ was #define dname def_expr }
function GDK_TYPE_PIXBUF_LOADER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_PIXBUF_LOADER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_PIXBUF_LOADER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_PIXBUF_LOADER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_PIXBUF_LOADER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_PIXBUF_LOADER_GET_CLASS(obj : longint) : longint;

type
{< private > }
  PGdkPixbufLoader = ^TGdkPixbufLoader;
  TGdkPixbufLoader = record
      parent_instance : TGObject;
      priv : Tgpointer;
    end;

{ Last known frame needs a redraw for x, y, width, height  }
  PGdkPixbufLoaderClass = ^TGdkPixbufLoaderClass;
  TGdkPixbufLoaderClass = record
      parent_class : TGObjectClass;
      size_prepared : procedure (loader:PGdkPixbufLoader; width:longint; height:longint);cdecl;
      area_prepared : procedure (loader:PGdkPixbufLoader);cdecl;
      area_updated : procedure (loader:PGdkPixbufLoader; x:longint; y:longint; width:longint; height:longint);cdecl;
      closed : procedure (loader:PGdkPixbufLoader);cdecl;
    end;


function gdk_pixbuf_loader_get_type:TGType;cdecl;external;
function gdk_pixbuf_loader_new:PGdkPixbufLoader;cdecl;external;
(* Const before type ignored *)
function gdk_pixbuf_loader_new_with_type(image_type:Pchar; error:PPGError):PGdkPixbufLoader;cdecl;external;
(* Const before type ignored *)
function gdk_pixbuf_loader_new_with_mime_type(mime_type:Pchar; error:PPGError):PGdkPixbufLoader;cdecl;external;
procedure gdk_pixbuf_loader_set_size(loader:PGdkPixbufLoader; width:longint; height:longint);cdecl;external;
(* Const before type ignored *)
function gdk_pixbuf_loader_write(loader:PGdkPixbufLoader; buf:Pguchar; count:Tgsize; error:PPGError):Tgboolean;cdecl;external;
function gdk_pixbuf_loader_write_bytes(loader:PGdkPixbufLoader; buffer:PGBytes; error:PPGError):Tgboolean;cdecl;external;
function gdk_pixbuf_loader_get_pixbuf(loader:PGdkPixbufLoader):PGdkPixbuf;cdecl;external;
function gdk_pixbuf_loader_get_animation(loader:PGdkPixbufLoader):PGdkPixbufAnimation;cdecl;external;
function gdk_pixbuf_loader_close(loader:PGdkPixbufLoader; error:PPGError):Tgboolean;cdecl;external;
function gdk_pixbuf_loader_get_format(loader:PGdkPixbufLoader):PGdkPixbufFormat;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function GDK_TYPE_PIXBUF_LOADER : longint; { return type might be wrong }
  begin
    GDK_TYPE_PIXBUF_LOADER:=gdk_pixbuf_loader_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_PIXBUF_LOADER(obj : longint) : longint;
begin
  GDK_PIXBUF_LOADER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GDK_TYPE_PIXBUF_LOADER,GdkPixbufLoader);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_PIXBUF_LOADER_CLASS(klass : longint) : longint;
begin
  GDK_PIXBUF_LOADER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GDK_TYPE_PIXBUF_LOADER,GdkPixbufLoaderClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_PIXBUF_LOADER(obj : longint) : longint;
begin
  GDK_IS_PIXBUF_LOADER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GDK_TYPE_PIXBUF_LOADER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_PIXBUF_LOADER_CLASS(klass : longint) : longint;
begin
  GDK_IS_PIXBUF_LOADER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GDK_TYPE_PIXBUF_LOADER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_PIXBUF_LOADER_GET_CLASS(obj : longint) : longint;
begin
  GDK_PIXBUF_LOADER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GDK_TYPE_PIXBUF_LOADER,GdkPixbufLoaderClass);
end;


end.
