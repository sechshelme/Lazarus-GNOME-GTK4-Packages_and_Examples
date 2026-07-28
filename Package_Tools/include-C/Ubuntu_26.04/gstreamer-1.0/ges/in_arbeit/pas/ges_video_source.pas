unit ges_video_source;

interface

uses
  fp_glib2, fp_gst, ges_enums;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) 2009 Edward Hervey <edward.hervey@collabora.co.uk>
 *               2009 Nokia Corporation
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
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}
{$include <gst/gst.h>}
{$include <ges/ges-types.h>}
{$include <ges/ges-track-element.h>}
{$include <ges/ges-source.h>}

{GES_DECLARE_TYPE(VideoSource, video_source, VIDEO_SOURCE); }
{*
 * GESVideoSource:
 *
 * Base class for video sources
  }
{< private > }
{ Padding for API extension  }
type
  PGESVideoSource = ^TGESVideoSource;
  TGESVideoSource = record
      parent : TGESSource;
      priv : PGESVideoSourcePrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESVideoSourceClass:
 * @create_source: method to return the GstElement to put in the source topbin.
 * Other elements will be queued, like a videoscale.
 * In the case of a VideoUriSource, for example, the subclass will return a decodebin,
 * and we will append a videoscale.
  }
{< private > }
{< public > }
{*
   * GESVideoSource::create_element:
   * @object: The #GESTrackElement
   *
   * Returns: (transfer floating): the #GstElement that the underlying nleobject
   * controls.
   *
   * Deprecated: 1.20: Use #GESSourceClass::create_element instead.
    }
{< private > }
{ Padding for API extension  }
  PGESVideoSourceClass = ^TGESVideoSourceClass;
  TGESVideoSourceClass = record
      parent_class : TGESSourceClass;
      create_source : function (object:PGESTrackElement):PGstElement;cdecl;
      ABI : record
          case longint of
            0 : ( _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer );
            1 : ( abi : record
                disable_scale_in_compositor : Tgboolean;
                needs_converters : function (self:PGESVideoSource):Tgboolean;cdecl;
                get_natural_size : function (self:PGESVideoSource; width:Pgint; height:Pgint):Tgboolean;cdecl;
                create_filters : function (self:PGESVideoSource; filters:PGPtrArray; needs_converters:Tgboolean):Tgboolean;cdecl;
              end );
          end;
    end;


function ges_video_source_get_natural_size(self:PGESVideoSource; width:Pgint; height:Pgint):Tgboolean;cdecl;external libges;

// === Konventiert am: 28-7-26 13:21:33 ===

function GES_TYPE_VIDEO_SOURCE: TGType;
function GES_VIDEO_SOURCE(obj: Pointer): PGESVideoSource;
function GES_IS_VIDEO_SOURCE(obj: Pointer): Tgboolean;
function GES_VIDEO_SOURCE_CLASS(klass: Pointer): PGESVideoSourceClass;
function GES_IS_VIDEO_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GES_VIDEO_SOURCE_GET_CLASS(obj: Pointer): PGESVideoSourceClass;

implementation

function GES_TYPE_VIDEO_SOURCE: TGType;
begin
  Result := ges_video_source_get_type;
end;

function GES_VIDEO_SOURCE(obj: Pointer): PGESVideoSource;
begin
  Result := PGESVideoSource(g_type_check_instance_cast(obj, GES_TYPE_VIDEO_SOURCE));
end;

function GES_IS_VIDEO_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_VIDEO_SOURCE);
end;

function GES_VIDEO_SOURCE_CLASS(klass: Pointer): PGESVideoSourceClass;
begin
  Result := PGESVideoSourceClass(g_type_check_class_cast(klass, GES_TYPE_VIDEO_SOURCE));
end;

function GES_IS_VIDEO_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_VIDEO_SOURCE);
end;

function GES_VIDEO_SOURCE_GET_CLASS(obj: Pointer): PGESVideoSourceClass;
begin
  Result := PGESVideoSourceClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESVideoSourcePrivate = type Pointer

function ges_video_source_get_type: TGType; cdecl; external libgxxxxxxx;



end.
