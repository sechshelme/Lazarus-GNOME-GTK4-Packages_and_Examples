unit gdkpaintable;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2018 Benjamin Otte
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
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Benjamin Otte <otte@gnome.org>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdktypes.h>}

{G_DECLARE_INTERFACE (GdkPaintable, gdk_paintable, GDK, PAINTABLE, GObject) }
{*
 * GdkPaintableFlags:
 * @GDK_PAINTABLE_STATIC_SIZE: The size is immutable.
 *   The [signal@Gdk.Paintable::invalidate-size] signal will never be
 *   emitted.
 * @GDK_PAINTABLE_STATIC_CONTENTS: The content is immutable.
 *   The [signal@Gdk.Paintable::invalidate-contents] signal will never be
 *   emitted.
 *
 * Flags about a paintable object.
 *
 * Implementations use these for optimizations such as caching.
  }
{< prefix=GDK_PAINTABLE > }
type
  PGdkPaintableFlags = ^TGdkPaintableFlags;
  TGdkPaintableFlags =  Longint;
  Const
    GDK_PAINTABLE_STATIC_SIZE = 1 shl 0;
    GDK_PAINTABLE_STATIC_CONTENTS = 1 shl 1;
;
{*
 * GdkPaintableInterface:
 * @snapshot: Snapshot the paintable. The given @width and @height are
 *   guaranteed to be larger than 0.0. The resulting snapshot must modify
 *   only the area in the rectangle from (0,0) to (width, height).
 *   This is the only function that must be implemented for this interface.
 * @get_current_image: return a `GdkPaintable` that does not change over
 *   time. This means the `GDK_PAINTABLE_STATIC_SIZE` and
 *   `GDK_PAINTABLE_STATIC_CONTENTS` flag are set.
 * @get_flags: Get the flags for this instance. See [flags@Gdk.PaintableFlags]
 *   for details.
 * @get_intrinsic_width: The preferred width for this object to be
 *   snapshot at or 0 if none. This is purely a hint. The object must still
 *   be able to render at any size.
 * @get_intrinsic_height: The preferred height for this object to be
 *   snapshot at or 0 if none. This is purely a hint. The object must still
 *   be able to render at any size.
 * @get_intrinsic_aspect_ratio: The preferred aspect ratio for this object
 *   or 0 if none. If both [vfunc@Gdk.Paintable.get_intrinsic_width]
 *   and [vfunc@Gdk.Paintable.get_intrinsic_height] return non-zero
 *   values, this function should return the aspect ratio computed from those.
 *
 * The list of functions that can be implemented for the `GdkPaintable`
 * interface.
 *
 * Note that apart from the [vfunc@Gdk.Paintable.snapshot] function,
 * no virtual function of this interface is mandatory to implement, though it
 * is a good idea to implement [vfunc@Gdk.Paintable.get_current_image]
 * for non-static paintables and [vfunc@Gdk.Paintable.get_flags] if the
 * image is not dynamic as the default implementation returns no flags and
 * that will make the implementation likely quite slow.
  }
{< private > }
{< public > }
{ draw to 0,0 with the given width and height  }
{ get the current contents in an immutable form (optional)  }
{ get flags for potential optimizations (optional)  }
{ preferred width of paintable or 0 if it has no width (optional)  }
{ preferred height of paintable or 0 if it has no height (optional)  }
{ aspect ratio (width / height) of paintable or 0 if it has no aspect ratio (optional)  }
type
  PGdkPaintableInterface = ^TGdkPaintableInterface;
  TGdkPaintableInterface = record
      g_iface : TGTypeInterface;
      snapshot : procedure (paintable:PGdkPaintable; snapshot:PGdkSnapshot; width:Tdouble; height:Tdouble);cdecl;
      get_current_image : function (paintable:PGdkPaintable):PGdkPaintable;cdecl;
      get_flags : function (paintable:PGdkPaintable):TGdkPaintableFlags;cdecl;
      get_intrinsic_width : function (paintable:PGdkPaintable):longint;cdecl;
      get_intrinsic_height : function (paintable:PGdkPaintable):longint;cdecl;
      get_intrinsic_aspect_ratio : function (paintable:PGdkPaintable):Tdouble;cdecl;
    end;


procedure gdk_paintable_snapshot(paintable:PGdkPaintable; snapshot:PGdkSnapshot; width:Tdouble; height:Tdouble);cdecl;external libgtk4;
function gdk_paintable_get_current_image(paintable:PGdkPaintable):PGdkPaintable;cdecl;external libgtk4;
function gdk_paintable_get_flags(paintable:PGdkPaintable):TGdkPaintableFlags;cdecl;external libgtk4;
function gdk_paintable_get_intrinsic_width(paintable:PGdkPaintable):longint;cdecl;external libgtk4;
function gdk_paintable_get_intrinsic_height(paintable:PGdkPaintable):longint;cdecl;external libgtk4;
function gdk_paintable_get_intrinsic_aspect_ratio(paintable:PGdkPaintable):Tdouble;cdecl;external libgtk4;
procedure gdk_paintable_compute_concrete_size(paintable:PGdkPaintable; specified_width:Tdouble; specified_height:Tdouble; default_width:Tdouble; default_height:Tdouble; 
            concrete_width:Pdouble; concrete_height:Pdouble);cdecl;external libgtk4;
{ for implementations only  }
procedure gdk_paintable_invalidate_contents(paintable:PGdkPaintable);cdecl;external libgtk4;
procedure gdk_paintable_invalidate_size(paintable:PGdkPaintable);cdecl;external libgtk4;
function gdk_paintable_new_empty(intrinsic_width:longint; intrinsic_height:longint):PGdkPaintable;cdecl;external libgtk4;

// === Konventiert am: 2-7-26 19:23:40 ===

function GDK_TYPE_PAINTABLE: TGType;
function GDK_PAINTABLE(obj: Pointer): PGdkPaintable;
function GDK_IS_PAINTABLE(obj: Pointer): Tgboolean;
function GDK_PAINTABLE_GET_IFACE(obj: Pointer): PGdkPaintableInterface;

implementation

function GDK_TYPE_PAINTABLE: TGType;
begin
  Result := gdk_paintable_get_type;
end;

function GDK_PAINTABLE(obj: Pointer): PGdkPaintable;
begin
  Result := PGdkPaintable(g_type_check_instance_cast(obj, GDK_TYPE_PAINTABLE));
end;

function GDK_IS_PAINTABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_PAINTABLE);
end;

function GDK_PAINTABLE_GET_IFACE(obj: Pointer): PGdkPaintableInterface;
begin
  Result := g_type_interface_peek(obj, GDK_TYPE_PAINTABLE);
end;

type 
  TGdkPaintable = record
  end;
  PGdkPaintable = ^TGdkPaintable;

  TGdkPaintableInterface = record
  end;
  PGdkPaintableInterface = ^TGdkPaintableInterface;

function gdk_paintable_get_type: TGType; cdecl; external libgxxxxxxx;



end.
