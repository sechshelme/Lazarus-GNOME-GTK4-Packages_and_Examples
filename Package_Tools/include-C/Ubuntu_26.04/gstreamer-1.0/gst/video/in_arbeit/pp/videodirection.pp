
unit videodirection;
interface

{
  Automatically converted by H2Pas 1.0.0 from videodirection.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    videodirection.h
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
PGstVideoDirectionInterface  = ^GstVideoDirectionInterface;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2016 Igalia <calvaris@igalia.com>
 *
 * videodirection.h: video rotation and flipping interface
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
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_VIDEO_DIRECTION_H__}
{$define __GST_VIDEO_DIRECTION_H__}
{$include <gst/gst.h>}
{$include <gst/video/video-prelude.h>}

{ was #define dname def_expr }
function GST_TYPE_VIDEO_DIRECTION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_DIRECTION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_DIRECTION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_DIRECTION_GET_INTERFACE(inst : longint) : longint;

{*
 * GstVideoDirection:
 *
 * Opaque #GstVideoDirection data structure.
 *
 * Since: 1.10
  }
type
{*
 * GstVideoDirectionInterface:
 * @iface: parent interface type.
 *
 * #GstVideoDirectionInterface interface.
 *
 * Since: 1.10
  }
  PGstVideoDirectionInterface = ^TGstVideoDirectionInterface;
  TGstVideoDirectionInterface = record
      iface : TGTypeInterface;
    end;


function gst_video_direction_get_type:TGType;cdecl;external;
{$endif}
{ __GST_VIDEO_DIRECTION_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_VIDEO_DIRECTION : longint; { return type might be wrong }
  begin
    GST_TYPE_VIDEO_DIRECTION:=gst_video_direction_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_DIRECTION(obj : longint) : longint;
begin
  GST_VIDEO_DIRECTION:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_VIDEO_DIRECTION,GstVideoDirection);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_VIDEO_DIRECTION(obj : longint) : longint;
begin
  GST_IS_VIDEO_DIRECTION:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_VIDEO_DIRECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_VIDEO_DIRECTION_GET_INTERFACE(inst : longint) : longint;
begin
  GST_VIDEO_DIRECTION_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(inst,GST_TYPE_VIDEO_DIRECTION,GstVideoDirectionInterface);
end;


end.
