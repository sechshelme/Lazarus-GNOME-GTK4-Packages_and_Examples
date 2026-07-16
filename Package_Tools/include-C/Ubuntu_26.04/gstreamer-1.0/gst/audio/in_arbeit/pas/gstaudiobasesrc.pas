unit gstaudiobasesrc;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2005 Wim Taymans <wim@fluendo.com>
 *
 * gstaudiobasesrc.h:
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
{ a base class for audio sources.
  }
{$ifndef __GST_AUDIO_AUDIO_H__}
{$include <gst/audio/audio.h>}
{$endif}
{$ifndef __GST_AUDIO_BASE_SRC_H__}
{$define __GST_AUDIO_BASE_SRC_H__}
{$include <gst/gst.h>}
{$include <gst/base/gstpushsrc.h>}

{ was #define dname def_expr }
function GST_TYPE_AUDIO_BASE_SRC : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BASE_SRC(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_AUDIO_BASE_SRC_CAST(obj : longint) : PGstAudioBaseSrc;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BASE_SRC_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BASE_SRC_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_BASE_SRC(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_BASE_SRC_CLASS(klass : longint) : longint;

{*
 * GST_AUDIO_BASE_SRC_CLOCK:
 * @obj: a #GstAudioBaseSrc
 *
 * Get the #GstClock of @obj.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BASE_SRC_CLOCK(obj : longint) : longint;

{*
 * GST_AUDIO_BASE_SRC_PAD:
 * @obj: a #GstAudioBaseSrc
 *
 * Get the source #GstPad of @obj.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BASE_SRC_PAD(obj : longint) : longint;

type
{ FIXME 2.0: Should be "retimestamp" not "re-timestamp"  }
{*
 * GstAudioBaseSrcSlaveMethod:
 * @GST_AUDIO_BASE_SRC_SLAVE_RESAMPLE: Resample to match the master clock.
 * @GST_AUDIO_BASE_SRC_SLAVE_RE_TIMESTAMP: Retimestamp output buffers with master
 * clock time.
 * @GST_AUDIO_BASE_SRC_SLAVE_SKEW: Adjust capture pointer when master clock
 * drifts too much.
 * @GST_AUDIO_BASE_SRC_SLAVE_NONE: No adjustment is done.
 *
 * Different possible clock slaving algorithms when the internal audio clock was
 * not selected as the pipeline clock.
  }

  PGstAudioBaseSrcSlaveMethod = ^TGstAudioBaseSrcSlaveMethod;
  TGstAudioBaseSrcSlaveMethod =  Longint;
  Const
    GST_AUDIO_BASE_SRC_SLAVE_RESAMPLE = 0;
    GST_AUDIO_BASE_SRC_SLAVE_RE_TIMESTAMP = 1;
    GST_AUDIO_BASE_SRC_SLAVE_SKEW = 2;
    GST_AUDIO_BASE_SRC_SLAVE_NONE = 3;
;
  GST_AUDIO_BASE_SRC_SLAVE_RETIMESTAMP = GST_AUDIO_BASE_SRC_SLAVE_RE_TIMESTAMP;  
{*
 * GstAudioBaseSrc:
 *
 * Opaque #GstAudioBaseSrc.
  }
{< protected > }{ with LOCK  }
{ our ringbuffer  }
{ required buffer and latency  }
{ the next sample to write  }
{ clock  }
{< private > }
type
  PGstAudioBaseSrc = ^TGstAudioBaseSrc;
  TGstAudioBaseSrc = record
      element : TGstPushSrc;
      ringbuffer : PGstAudioRingBuffer;
      buffer_time : TGstClockTime;
      latency_time : TGstClockTime;
      next_sample : Tguint64;
      clock : PGstClock;
      priv : PGstAudioBaseSrcPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstAudioBaseSrcClass:
 * @parent_class: the parent class.
 * @create_ringbuffer: create and return a #GstAudioRingBuffer to read from.
 *
 * #GstAudioBaseSrc class. Override the vmethod to implement
 * functionality.
  }
{ subclass ringbuffer allocation  }
{< private > }
  PGstAudioBaseSrcClass = ^TGstAudioBaseSrcClass;
  TGstAudioBaseSrcClass = record
      parent_class : TGstPushSrcClass;
      create_ringbuffer : function (src:PGstAudioBaseSrc):PGstAudioRingBuffer;cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_audio_base_src_get_type:TGType;cdecl;external libgstaudio;
function gst_audio_base_src_create_ringbuffer(src:PGstAudioBaseSrc):PGstAudioRingBuffer;cdecl;external libgstaudio;
procedure gst_audio_base_src_set_provide_clock(src:PGstAudioBaseSrc; provide:Tgboolean);cdecl;external libgstaudio;
function gst_audio_base_src_get_provide_clock(src:PGstAudioBaseSrc):Tgboolean;cdecl;external libgstaudio;
procedure gst_audio_base_src_set_slave_method(src:PGstAudioBaseSrc; method:TGstAudioBaseSrcSlaveMethod);cdecl;external libgstaudio;
function gst_audio_base_src_get_slave_method(src:PGstAudioBaseSrc):TGstAudioBaseSrcSlaveMethod;cdecl;external libgstaudio;
{//////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC        (GstAudioBaseSrc, gst_object_unref) }
{$endif}
{ __GST_AUDIO_BASE_SRC_H__  }

// === Konventiert am: 16-7-26 15:18:00 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_AUDIO_BASE_SRC : longint; { return type might be wrong }
  begin
    GST_TYPE_AUDIO_BASE_SRC:=gst_audio_base_src_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BASE_SRC(obj : longint) : longint;
begin
  GST_AUDIO_BASE_SRC:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_AUDIO_BASE_SRC,GstAudioBaseSrc);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_AUDIO_BASE_SRC_CAST(obj : longint) : PGstAudioBaseSrc;
begin
  GST_AUDIO_BASE_SRC_CAST:=PGstAudioBaseSrc(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BASE_SRC_CLASS(klass : longint) : longint;
begin
  GST_AUDIO_BASE_SRC_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_AUDIO_BASE_SRC,GstAudioBaseSrcClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BASE_SRC_GET_CLASS(obj : longint) : longint;
begin
  GST_AUDIO_BASE_SRC_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_AUDIO_BASE_SRC,GstAudioBaseSrcClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_BASE_SRC(obj : longint) : longint;
begin
  GST_IS_AUDIO_BASE_SRC:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_AUDIO_BASE_SRC);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_BASE_SRC_CLASS(klass : longint) : longint;
begin
  GST_IS_AUDIO_BASE_SRC_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_AUDIO_BASE_SRC);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BASE_SRC_CLOCK(obj : longint) : longint;
begin
  GST_AUDIO_BASE_SRC_CLOCK:=(GST_AUDIO_BASE_SRC(obj))^.clock;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BASE_SRC_PAD(obj : longint) : longint;
begin
  GST_AUDIO_BASE_SRC_PAD:=(GST_BASE_SRC(obj))^.srcpad;
end;


end.
