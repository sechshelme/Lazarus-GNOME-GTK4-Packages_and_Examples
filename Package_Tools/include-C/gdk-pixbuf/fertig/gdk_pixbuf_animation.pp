
unit gdk_pixbuf_animation;
interface

{
  Automatically converted by H2Pas 0.99.16 from gdk_pixbuf_animation.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdk_pixbuf_animation.h
}

Type
PGAsyncResult = ^TGAsyncResult;
PGCancellable = ^TGCancellable;
PGdkPixbuf = ^TGdkPixbuf;
PGdkPixbufAnimation = ^TGdkPixbufAnimation;
PGdkPixbufAnimationClass = ^TGdkPixbufAnimationClass;
PGdkPixbufAnimationIter = ^TGdkPixbufAnimationIter;
PGdkPixbufAnimationIterClass = ^TGdkPixbufAnimationIterClass;
PGError = ^TGError;
PGInputStream = ^TGInputStream;
PGTimeVal = ^TGTimeVal;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{ GdkPixbuf library - Animation support
 *
 * Copyright (C) 1999 The Free Software Foundation
 *
 * Authors: Mark Crichton <crichton@gimp.org>
 *          Miguel de Icaza <miguel@gnu.org>
 *          Federico Mena-Quintero <federico@gimp.org>
 *          Havoc Pennington <hp@redhat.com>
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
{$ifndef GDK_PIXBUF_ANIMATION_H}
{$define GDK_PIXBUF_ANIMATION_H}
{$if defined(GDK_PIXBUF_DISABLE_SINGLE_INCLUDES) && !defined (GDK_PIXBUF_H_INSIDE) && !defined (GDK_PIXBUF_COMPILATION)}
{$error "Only <gdk-pixbuf/gdk-pixbuf.h> can be included directly."}
{$endif}
{$include <glib-object.h>}
{$include <gdk-pixbuf/gdk-pixbuf-core.h>}
{ Animation support  }
type

{ was #define dname def_expr }
function GDK_TYPE_PIXBUF_ANIMATION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_PIXBUF_ANIMATION(_object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_PIXBUF_ANIMATION_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_PIXBUF_ANIMATION(_object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_PIXBUF_ANIMATION_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_PIXBUF_ANIMATION_GET_CLASS(obj : longint) : longint;

{ was #define dname def_expr }
function GDK_TYPE_PIXBUF_ANIMATION_ITER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_PIXBUF_ANIMATION_ITER(_object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_PIXBUF_ANIMATION_ITER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_PIXBUF_ANIMATION_ITER(_object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_PIXBUF_ANIMATION_ITER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_PIXBUF_ANIMATION_ITER_GET_CLASS(obj : longint) : longint;

function gdk_pixbuf_animation_get_type:TGType;cdecl;external;
{$ifdef G_OS_WIN32}
{ API/ABI compat, see gdk-pixbuf-core.h for details  }
(* Const before declarator ignored *)
function gdk_pixbuf_animation_new_from_file_utf8(filename:Pansichar; error:PPGError):PGdkPixbufAnimation;cdecl;external;
{$endif}
(* Const before declarator ignored *)
function gdk_pixbuf_animation_new_from_file(filename:Pansichar; error:PPGError):PGdkPixbufAnimation;cdecl;external;
function gdk_pixbuf_animation_new_from_stream(stream:PGInputStream; cancellable:PGCancellable; error:PPGError):PGdkPixbufAnimation;cdecl;external;
procedure gdk_pixbuf_animation_new_from_stream_async(stream:PGInputStream; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gdk_pixbuf_animation_new_from_stream_finish(async_result:PGAsyncResult; error:PPGError):PGdkPixbufAnimation;cdecl;external;
(* Const before declarator ignored *)
function gdk_pixbuf_animation_new_from_resource(resource_path:Pansichar; error:PPGError):PGdkPixbufAnimation;cdecl;external;
{$ifndef GDK_PIXBUF_DISABLE_DEPRECATED}
function gdk_pixbuf_animation_ref(animation:PGdkPixbufAnimation):PGdkPixbufAnimation;cdecl;external;
procedure gdk_pixbuf_animation_unref(animation:PGdkPixbufAnimation);cdecl;external;
{$endif}
function gdk_pixbuf_animation_get_width(animation:PGdkPixbufAnimation):longint;cdecl;external;
function gdk_pixbuf_animation_get_height(animation:PGdkPixbufAnimation):longint;cdecl;external;
function gdk_pixbuf_animation_is_static_image(animation:PGdkPixbufAnimation):Tgboolean;cdecl;external;
function gdk_pixbuf_animation_get_static_image(animation:PGdkPixbufAnimation):PGdkPixbuf;cdecl;external;
(* Const before declarator ignored *)
function gdk_pixbuf_animation_get_iter(animation:PGdkPixbufAnimation; start_time:PGTimeVal):PGdkPixbufAnimationIter;cdecl;external;
function gdk_pixbuf_animation_iter_get_type:TGType;cdecl;external;
function gdk_pixbuf_animation_iter_get_delay_time(iter:PGdkPixbufAnimationIter):longint;cdecl;external;
function gdk_pixbuf_animation_iter_get_pixbuf(iter:PGdkPixbufAnimationIter):PGdkPixbuf;cdecl;external;
function gdk_pixbuf_animation_iter_on_currently_loading_frame(iter:PGdkPixbufAnimationIter):Tgboolean;cdecl;external;
(* Const before declarator ignored *)
function gdk_pixbuf_animation_iter_advance(iter:PGdkPixbufAnimationIter; current_time:PGTimeVal):Tgboolean;cdecl;external;
{$ifdef GDK_PIXBUF_ENABLE_BACKEND}
{*
 * GdkPixbufAnimationClass:
 * @parent_class: the parent class
 * @is_static_image: returns whether the given animation is just a static image.
 * @get_static_image: returns a static image representing the given animation.
 * @get_size: fills @width and @height with the frame size of the animation.
 * @get_iter: returns an iterator for the given animation.
 * 
 * Modules supporting animations must derive a type from 
 * #GdkPixbufAnimation, providing suitable implementations of the 
 * virtual functions.
  }
type
{ Private part of the GdkPixbufAnimation structure  }
  PGdkPixbufAnimation = ^TGdkPixbufAnimation;
  TGdkPixbufAnimation = record
      parent_instance : TGObject;
    end;

{< public > }
(* Const before declarator ignored *)
  PGdkPixbufAnimationClass = ^TGdkPixbufAnimationClass;
  TGdkPixbufAnimationClass = record
      parent_class : TGObjectClass;
      is_static_image : function (animation:PGdkPixbufAnimation):Tgboolean;cdecl;
      get_static_image : function (animation:PGdkPixbufAnimation):PGdkPixbuf;cdecl;
      get_size : procedure (animation:PGdkPixbufAnimation; width:Plongint; height:Plongint);cdecl;
      get_iter : function (animation:PGdkPixbufAnimation; start_time:PGTimeVal):PGdkPixbufAnimationIter;cdecl;
    end;

{*
 * GdkPixbufAnimationIterClass:
 * @parent_class: the parent class
 * @get_delay_time: returns the time in milliseconds that the current frame 
 *  should be shown.
 * @get_pixbuf: returns the current frame.
 * @on_currently_loading_frame: returns whether the current frame of @iter is 
 *  being loaded.
 * @advance: advances the iterator to @current_time, possibly changing the 
 *  current frame.
 * 
 * Modules supporting animations must derive a type from 
 * #GdkPixbufAnimationIter, providing suitable implementations of the 
 * virtual functions.
  }
  PGdkPixbufAnimationIter = ^TGdkPixbufAnimationIter;
  TGdkPixbufAnimationIter = record
      parent_instance : TGObject;
    end;

{< public > }
(* Const before declarator ignored *)
  PGdkPixbufAnimationIterClass = ^TGdkPixbufAnimationIterClass;
  TGdkPixbufAnimationIterClass = record
      parent_class : TGObjectClass;
      get_delay_time : function (iter:PGdkPixbufAnimationIter):longint;cdecl;
      get_pixbuf : function (iter:PGdkPixbufAnimationIter):PGdkPixbuf;cdecl;
      on_currently_loading_frame : function (iter:PGdkPixbufAnimationIter):Tgboolean;cdecl;
      advance : function (iter:PGdkPixbufAnimationIter; current_time:PGTimeVal):Tgboolean;cdecl;
    end;


function gdk_pixbuf_non_anim_get_type:TGType;cdecl;external;
function gdk_pixbuf_non_anim_new(pixbuf:PGdkPixbuf):PGdkPixbufAnimation;cdecl;external;
{$endif}
{ GDK_PIXBUF_ENABLE_BACKEND  }
{$endif}
{ GDK_PIXBUF_ANIMATION_H  }

implementation

{ was #define dname def_expr }
function GDK_TYPE_PIXBUF_ANIMATION : longint; { return type might be wrong }
  begin
    GDK_TYPE_PIXBUF_ANIMATION:=gdk_pixbuf_animation_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_PIXBUF_ANIMATION(_object : longint) : longint;
begin
  GDK_PIXBUF_ANIMATION:=G_TYPE_CHECK_INSTANCE_CAST(_object,GDK_TYPE_PIXBUF_ANIMATION,GdkPixbufAnimation);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_PIXBUF_ANIMATION_CLASS(klass : longint) : longint;
begin
  GDK_PIXBUF_ANIMATION_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GDK_TYPE_PIXBUF_ANIMATION,GdkPixbufAnimationClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_PIXBUF_ANIMATION(_object : longint) : longint;
begin
  GDK_IS_PIXBUF_ANIMATION:=G_TYPE_CHECK_INSTANCE_TYPE(_object,GDK_TYPE_PIXBUF_ANIMATION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_PIXBUF_ANIMATION_CLASS(klass : longint) : longint;
begin
  GDK_IS_PIXBUF_ANIMATION_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GDK_TYPE_PIXBUF_ANIMATION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_PIXBUF_ANIMATION_GET_CLASS(obj : longint) : longint;
begin
  GDK_PIXBUF_ANIMATION_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GDK_TYPE_PIXBUF_ANIMATION,GdkPixbufAnimationClass);
end;

{ was #define dname def_expr }
function GDK_TYPE_PIXBUF_ANIMATION_ITER : longint; { return type might be wrong }
  begin
    GDK_TYPE_PIXBUF_ANIMATION_ITER:=gdk_pixbuf_animation_iter_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_PIXBUF_ANIMATION_ITER(_object : longint) : longint;
begin
  GDK_PIXBUF_ANIMATION_ITER:=G_TYPE_CHECK_INSTANCE_CAST(_object,GDK_TYPE_PIXBUF_ANIMATION_ITER,GdkPixbufAnimationIter);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_PIXBUF_ANIMATION_ITER_CLASS(klass : longint) : longint;
begin
  GDK_PIXBUF_ANIMATION_ITER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GDK_TYPE_PIXBUF_ANIMATION_ITER,GdkPixbufAnimationIterClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_PIXBUF_ANIMATION_ITER(_object : longint) : longint;
begin
  GDK_IS_PIXBUF_ANIMATION_ITER:=G_TYPE_CHECK_INSTANCE_TYPE(_object,GDK_TYPE_PIXBUF_ANIMATION_ITER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_PIXBUF_ANIMATION_ITER_CLASS(klass : longint) : longint;
begin
  GDK_IS_PIXBUF_ANIMATION_ITER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GDK_TYPE_PIXBUF_ANIMATION_ITER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_PIXBUF_ANIMATION_ITER_GET_CLASS(obj : longint) : longint;
begin
  GDK_PIXBUF_ANIMATION_ITER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GDK_TYPE_PIXBUF_ANIMATION_ITER,GdkPixbufAnimationIterClass);
end;


end.
