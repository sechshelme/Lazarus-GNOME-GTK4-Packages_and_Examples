unit gdk_pixbuf_animation2;

interface

uses
  glib280;

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

function gdk_pixbuf_animation_get_type:TGType;cdecl;external libgdk_pixbuf2;
{$ifdef G_OS_WIN32}
{ API/ABI compat, see gdk-pixbuf-core.h for details  }
function gdk_pixbuf_animation_new_from_file_utf8(filename:Pansichar; error:PPGError):PGdkPixbufAnimation;cdecl;external libgdk_pixbuf2;
{$endif}
function gdk_pixbuf_animation_new_from_file(filename:Pansichar; error:PPGError):PGdkPixbufAnimation;cdecl;external libgdk_pixbuf2;
function gdk_pixbuf_animation_new_from_stream(stream:PGInputStream; cancellable:PGCancellable; error:PPGError):PGdkPixbufAnimation;cdecl;external libgdk_pixbuf2;
procedure gdk_pixbuf_animation_new_from_stream_async(stream:PGInputStream; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libgdk_pixbuf2;
function gdk_pixbuf_animation_new_from_stream_finish(async_result:PGAsyncResult; error:PPGError):PGdkPixbufAnimation;cdecl;external libgdk_pixbuf2;
function gdk_pixbuf_animation_new_from_resource(resource_path:Pansichar; error:PPGError):PGdkPixbufAnimation;cdecl;external libgdk_pixbuf2;
{$ifndef GDK_PIXBUF_DISABLE_DEPRECATED}
function gdk_pixbuf_animation_ref(animation:PGdkPixbufAnimation):PGdkPixbufAnimation;cdecl;external libgdk_pixbuf2;
procedure gdk_pixbuf_animation_unref(animation:PGdkPixbufAnimation);cdecl;external libgdk_pixbuf2;
{$endif}
function gdk_pixbuf_animation_get_width(animation:PGdkPixbufAnimation):longint;cdecl;external libgdk_pixbuf2;
function gdk_pixbuf_animation_get_height(animation:PGdkPixbufAnimation):longint;cdecl;external libgdk_pixbuf2;
function gdk_pixbuf_animation_is_static_image(animation:PGdkPixbufAnimation):Tgboolean;cdecl;external libgdk_pixbuf2;
function gdk_pixbuf_animation_get_static_image(animation:PGdkPixbufAnimation):PGdkPixbuf;cdecl;external libgdk_pixbuf2;
function gdk_pixbuf_animation_get_iter(animation:PGdkPixbufAnimation; start_time:PGTimeVal):PGdkPixbufAnimationIter;cdecl;external libgdk_pixbuf2;
function gdk_pixbuf_animation_iter_get_type:TGType;cdecl;external libgdk_pixbuf2;
function gdk_pixbuf_animation_iter_get_delay_time(iter:PGdkPixbufAnimationIter):longint;cdecl;external libgdk_pixbuf2;
function gdk_pixbuf_animation_iter_get_pixbuf(iter:PGdkPixbufAnimationIter):PGdkPixbuf;cdecl;external libgdk_pixbuf2;
function gdk_pixbuf_animation_iter_on_currently_loading_frame(iter:PGdkPixbufAnimationIter):Tgboolean;cdecl;external libgdk_pixbuf2;
function gdk_pixbuf_animation_iter_advance(iter:PGdkPixbufAnimationIter; current_time:PGTimeVal):Tgboolean;cdecl;external libgdk_pixbuf2;
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
  PGdkPixbufAnimationIterClass = ^TGdkPixbufAnimationIterClass;
  TGdkPixbufAnimationIterClass = record
      parent_class : TGObjectClass;
      get_delay_time : function (iter:PGdkPixbufAnimationIter):longint;cdecl;
      get_pixbuf : function (iter:PGdkPixbufAnimationIter):PGdkPixbuf;cdecl;
      on_currently_loading_frame : function (iter:PGdkPixbufAnimationIter):Tgboolean;cdecl;
      advance : function (iter:PGdkPixbufAnimationIter; current_time:PGTimeVal):Tgboolean;cdecl;
    end;


function gdk_pixbuf_non_anim_get_type:TGType;cdecl;external libgdk_pixbuf2;
function gdk_pixbuf_non_anim_new(pixbuf:PGdkPixbuf):PGdkPixbufAnimation;cdecl;external libgdk_pixbuf2;
{$endif}
{ GDK_PIXBUF_ENABLE_BACKEND  }
{$endif}
{ GDK_PIXBUF_ANIMATION_H  }

// === Konventiert am: 7-11-24 19:27:26 ===

function GDK_TYPE_PIXBUF_ANIMATION_ITER : TGType;
function GDK_PIXBUF_ANIMATION_ITER(obj : Pointer) : PGdkPixbufAnimationIter;
function GDK_PIXBUF_ANIMATION_ITER_CLASS(klass : Pointer) : PGdkPixbufAnimationIterClass;
function GDK_IS_PIXBUF_ANIMATION_ITER(obj : Pointer) : Tgboolean;
function GDK_IS_PIXBUF_ANIMATION_ITER_CLASS(klass : Pointer) : Tgboolean;
function GDK_PIXBUF_ANIMATION_ITER_GET_CLASS(obj : Pointer) : PGdkPixbufAnimationIterClass;

implementation

function GDK_TYPE_PIXBUF_ANIMATION_ITER : TGType;
  begin
    GDK_TYPE_PIXBUF_ANIMATION_ITER:=gdk_pixbuf_animation_iter_get_type;
  end;

function GDK_PIXBUF_ANIMATION_ITER(obj : Pointer) : PGdkPixbufAnimationIter;
begin
  Result := PGdkPixbufAnimationIter(g_type_check_instance_cast(obj, GDK_TYPE_PIXBUF_ANIMATION_ITER));
end;

function GDK_PIXBUF_ANIMATION_ITER_CLASS(klass : Pointer) : PGdkPixbufAnimationIterClass;
begin
  Result := PGdkPixbufAnimationIterClass(g_type_check_class_cast(klass, GDK_TYPE_PIXBUF_ANIMATION_ITER));
end;

function GDK_IS_PIXBUF_ANIMATION_ITER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GDK_TYPE_PIXBUF_ANIMATION_ITER);
end;

function GDK_IS_PIXBUF_ANIMATION_ITER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GDK_TYPE_PIXBUF_ANIMATION_ITER);
end;

function GDK_PIXBUF_ANIMATION_ITER_GET_CLASS(obj : Pointer) : PGdkPixbufAnimationIterClass;
begin
  Result := PGdkPixbufAnimationIterClass(PGTypeInstance(obj)^.g_class);
end;



end.
