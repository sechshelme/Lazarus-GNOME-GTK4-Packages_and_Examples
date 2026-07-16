unit gstplanaraudioadapter;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2018 Collabora Ltd.
 *   @author George Kiagiadakis <george.kiagiadakis@collabora.com>
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
{$ifndef __GST_PLANAR_AUDIO_ADAPTER_H__}
{$define __GST_PLANAR_AUDIO_ADAPTER_H__}
{$include <gst/gst.h>}
{$include <gst/audio/audio-info.h>}
{$include <gst/audio/audio-bad-prelude.h>}

{ was #define dname def_expr }
function GST_TYPE_PLANAR_AUDIO_ADAPTER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLANAR_AUDIO_ADAPTER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLANAR_AUDIO_ADAPTER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLANAR_AUDIO_ADAPTER_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLANAR_AUDIO_ADAPTER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLANAR_AUDIO_ADAPTER_CLASS(klass : longint) : longint;

{*
 * GstPlanarAudioAdapter:
 *
 * The opaque #GstPlanarAudioAdapter data structure.
  }
type

function gst_planar_audio_adapter_get_type:TGType;cdecl;external libgstaudio;
function gst_planar_audio_adapter_new:PGstPlanarAudioAdapter;cdecl;external libgstaudio;
procedure gst_planar_audio_adapter_configure(adapter:PGstPlanarAudioAdapter; info:PGstAudioInfo);cdecl;external libgstaudio;
procedure gst_planar_audio_adapter_clear(adapter:PGstPlanarAudioAdapter);cdecl;external libgstaudio;
procedure gst_planar_audio_adapter_push(adapter:PGstPlanarAudioAdapter; buf:PGstBuffer);cdecl;external libgstaudio;
procedure gst_planar_audio_adapter_flush(adapter:PGstPlanarAudioAdapter; to_flush:Tgsize);cdecl;external libgstaudio;
function gst_planar_audio_adapter_get_buffer(adapter:PGstPlanarAudioAdapter; nsamples:Tgsize; flags:TGstMapFlags):PGstBuffer;cdecl;external libgstaudio;
function gst_planar_audio_adapter_take_buffer(adapter:PGstPlanarAudioAdapter; nsamples:Tgsize; flags:TGstMapFlags):PGstBuffer;cdecl;external libgstaudio;
function gst_planar_audio_adapter_available(adapter:PGstPlanarAudioAdapter):Tgsize;cdecl;external libgstaudio;
function gst_planar_audio_adapter_distance_from_discont(adapter:PGstPlanarAudioAdapter):Tguint64;cdecl;external libgstaudio;
function gst_planar_audio_adapter_offset_at_discont(adapter:PGstPlanarAudioAdapter):Tguint64;cdecl;external libgstaudio;
function gst_planar_audio_adapter_pts_at_discont(adapter:PGstPlanarAudioAdapter):TGstClockTime;cdecl;external libgstaudio;
function gst_planar_audio_adapter_dts_at_discont(adapter:PGstPlanarAudioAdapter):TGstClockTime;cdecl;external libgstaudio;
function gst_planar_audio_adapter_prev_offset(adapter:PGstPlanarAudioAdapter; distance:Pguint64):Tguint64;cdecl;external libgstaudio;
function gst_planar_audio_adapter_prev_pts(adapter:PGstPlanarAudioAdapter; distance:Pguint64):TGstClockTime;cdecl;external libgstaudio;
function gst_planar_audio_adapter_prev_dts(adapter:PGstPlanarAudioAdapter; distance:Pguint64):TGstClockTime;cdecl;external libgstaudio;
{//////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC        (GstPlanarAudioAdapter, gst_object_unref) }
{$endif}
{ __GST_PLANAR_AUDIO_ADAPTER_H__  }

// === Konventiert am: 16-7-26 15:25:58 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_PLANAR_AUDIO_ADAPTER : longint; { return type might be wrong }
  begin
    GST_TYPE_PLANAR_AUDIO_ADAPTER:=gst_planar_audio_adapter_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLANAR_AUDIO_ADAPTER(obj : longint) : longint;
begin
  GST_PLANAR_AUDIO_ADAPTER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_PLANAR_AUDIO_ADAPTER,GstPlanarAudioAdapter);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLANAR_AUDIO_ADAPTER_CLASS(klass : longint) : longint;
begin
  GST_PLANAR_AUDIO_ADAPTER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_PLANAR_AUDIO_ADAPTER,GstPlanarAudioAdapterClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PLANAR_AUDIO_ADAPTER_GET_CLASS(obj : longint) : longint;
begin
  GST_PLANAR_AUDIO_ADAPTER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_PLANAR_AUDIO_ADAPTER,GstPlanarAudioAdapterClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLANAR_AUDIO_ADAPTER(obj : longint) : longint;
begin
  GST_IS_PLANAR_AUDIO_ADAPTER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_PLANAR_AUDIO_ADAPTER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PLANAR_AUDIO_ADAPTER_CLASS(klass : longint) : longint;
begin
  GST_IS_PLANAR_AUDIO_ADAPTER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_PLANAR_AUDIO_ADAPTER);
end;


end.
