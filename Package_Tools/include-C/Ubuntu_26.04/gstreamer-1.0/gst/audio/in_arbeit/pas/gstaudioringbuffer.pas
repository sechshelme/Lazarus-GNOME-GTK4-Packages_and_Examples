unit gstaudioringbuffer;

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
 * gstaudioringbuffer.h:
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
{$ifndef __GST_AUDIO_AUDIO_H__}
{$include <gst/audio/audio.h>}
{$endif}
{$ifndef __GST_AUDIO_RING_BUFFER_H__}
{$define __GST_AUDIO_RING_BUFFER_H__}
{$include <gst/audio/gstdsdformat.h>}

{ was #define dname def_expr }
function GST_TYPE_AUDIO_RING_BUFFER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_AUDIO_RING_BUFFER_CAST(obj : longint) : PGstAudioRingBuffer;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_RING_BUFFER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_RING_BUFFER_CLASS(klass : longint) : longint;

type
{*
 * GstAudioRingBufferCallback:
 * @rbuf: a #GstAudioRingBuffer
 * @data: (array length=len): target to fill
 * @len: amount to fill
 * @user_data: user data
 *
 * This function is set with gst_audio_ring_buffer_set_callback() and is
 * called to fill the memory at @data with @len bytes of samples.
  }

  TGstAudioRingBufferCallback = procedure (rbuf:PGstAudioRingBuffer; data:Pguint8; len:Tguint; user_data:Tgpointer);cdecl;
{*
 * GstAudioRingBufferState:
 * @GST_AUDIO_RING_BUFFER_STATE_STOPPED: The ringbuffer is stopped
 * @GST_AUDIO_RING_BUFFER_STATE_PAUSED: The ringbuffer is paused
 * @GST_AUDIO_RING_BUFFER_STATE_STARTED: The ringbuffer is started
 * @GST_AUDIO_RING_BUFFER_STATE_ERROR: The ringbuffer has encountered an
 *     error after it has been started, e.g. because the device was
 *     disconnected (Since: 1.2)
 *
 * The state of the ringbuffer.
  }

  PGstAudioRingBufferState = ^TGstAudioRingBufferState;
  TGstAudioRingBufferState =  Longint;
  Const
    GST_AUDIO_RING_BUFFER_STATE_STOPPED = 0;
    GST_AUDIO_RING_BUFFER_STATE_PAUSED = 1;
    GST_AUDIO_RING_BUFFER_STATE_STARTED = 2;
    GST_AUDIO_RING_BUFFER_STATE_ERROR = 3;
;
{*
 * GstAudioRingBufferFormatType:
 * @GST_AUDIO_RING_BUFFER_FORMAT_TYPE_RAW: samples in linear or float
 * @GST_AUDIO_RING_BUFFER_FORMAT_TYPE_MU_LAW: samples in mulaw
 * @GST_AUDIO_RING_BUFFER_FORMAT_TYPE_A_LAW: samples in alaw
 * @GST_AUDIO_RING_BUFFER_FORMAT_TYPE_IMA_ADPCM: samples in ima adpcm
 * @GST_AUDIO_RING_BUFFER_FORMAT_TYPE_MPEG: samples in mpeg audio (but not AAC) format
 * @GST_AUDIO_RING_BUFFER_FORMAT_TYPE_GSM: samples in gsm format
 * @GST_AUDIO_RING_BUFFER_FORMAT_TYPE_IEC958: samples in IEC958 frames (e.g. AC3)
 * @GST_AUDIO_RING_BUFFER_FORMAT_TYPE_AC3: samples in AC3 format
 * @GST_AUDIO_RING_BUFFER_FORMAT_TYPE_EAC3: samples in EAC3 format
 * @GST_AUDIO_RING_BUFFER_FORMAT_TYPE_DTS: samples in DTS format
 * @GST_AUDIO_RING_BUFFER_FORMAT_TYPE_MPEG2_AAC: samples in MPEG-2 AAC ADTS format
 * @GST_AUDIO_RING_BUFFER_FORMAT_TYPE_MPEG4_AAC: samples in MPEG-4 AAC ADTS format
 * @GST_AUDIO_RING_BUFFER_FORMAT_TYPE_MPEG2_AAC_RAW: samples in MPEG-2 AAC raw format (Since: 1.12)
 * @GST_AUDIO_RING_BUFFER_FORMAT_TYPE_MPEG4_AAC_RAW: samples in MPEG-4 AAC raw format (Since: 1.12)
 * @GST_AUDIO_RING_BUFFER_FORMAT_TYPE_FLAC: samples in FLAC format (Since: 1.12)
 * @GST_AUDIO_RING_BUFFER_FORMAT_TYPE_DSD: samples in DSD format (Since: 1.24)
 *
 * The format of the samples in the ringbuffer.
  }
type
  PGstAudioRingBufferFormatType = ^TGstAudioRingBufferFormatType;
  TGstAudioRingBufferFormatType =  Longint;
  Const
    GST_AUDIO_RING_BUFFER_FORMAT_TYPE_RAW = 0;
    GST_AUDIO_RING_BUFFER_FORMAT_TYPE_MU_LAW = 1;
    GST_AUDIO_RING_BUFFER_FORMAT_TYPE_A_LAW = 2;
    GST_AUDIO_RING_BUFFER_FORMAT_TYPE_IMA_ADPCM = 3;
    GST_AUDIO_RING_BUFFER_FORMAT_TYPE_MPEG = 4;
    GST_AUDIO_RING_BUFFER_FORMAT_TYPE_GSM = 5;
    GST_AUDIO_RING_BUFFER_FORMAT_TYPE_IEC958 = 6;
    GST_AUDIO_RING_BUFFER_FORMAT_TYPE_AC3 = 7;
    GST_AUDIO_RING_BUFFER_FORMAT_TYPE_EAC3 = 8;
    GST_AUDIO_RING_BUFFER_FORMAT_TYPE_DTS = 9;
    GST_AUDIO_RING_BUFFER_FORMAT_TYPE_MPEG2_AAC = 10;
    GST_AUDIO_RING_BUFFER_FORMAT_TYPE_MPEG4_AAC = 11;
    GST_AUDIO_RING_BUFFER_FORMAT_TYPE_MPEG2_AAC_RAW = 12;
    GST_AUDIO_RING_BUFFER_FORMAT_TYPE_MPEG4_AAC_RAW = 13;
    GST_AUDIO_RING_BUFFER_FORMAT_TYPE_FLAC = 14;
    GST_AUDIO_RING_BUFFER_FORMAT_TYPE_DSD = 15;
;
{*
 * GstAudioRingBufferSpec:
 * @caps: The caps that generated the Spec.
 * @type: the sample type
 * @info: the #GstAudioInfo
 * @latency_time: the latency in microseconds
 * @buffer_time: the total buffer size in microseconds
 * @segsize: the size of one segment in bytes
 * @segtotal: the total number of segments
 * @seglatency: number of segments queued in the lower level device,
 *  defaults to segtotal
 * @dsd_format: the #GstDsdFormat (Since: 1.24)
 *
 * The structure containing the format specification of the ringbuffer.
 *
 * When @type is GST_AUDIO_RING_BUFFER_FORMAT_TYPE_DSD, the @dsd_format
 * is valid (otherwise it is unused). Also, when DSD is the sample type,
 * only the rate, channels, position, and bpf fields in @info are populated.
  }
{< public > }
{ in  }
{ the caps of the buffer  }
{ in/out  }
{ the required/actual latency time, this is the
				 * actual the size of one segment and the
				 * minimum possible latency we can achieve.  }
{ the required/actual time of the buffer, this is
				 * the total size of the buffer and maximum
				 * latency we can compensate for.  }
{ size of one buffer segment in bytes, this value
				 * should be chosen to match latency_time as
				 * well as possible.  }
{ total number of segments, this value is the
				 * number of segments of @segsize and should be
				 * chosen so that it matches buffer_time as
				 * close as possible.  }
{ ABI added 0.10.20  }
{ number of segments queued in the lower
				 * level device, defaults to segtotal.  }
{ Union preserves padded struct size for backwards compat
   * Consumer code should use the accessor macros for fields  }
{ < skip >  }
{< private > }
type
  PGstAudioRingBufferSpec = ^TGstAudioRingBufferSpec;
  TGstAudioRingBufferSpec = record
      caps : PGstCaps;
      _type : TGstAudioRingBufferFormatType;
      info : TGstAudioInfo;
      latency_time : Tguint64;
      buffer_time : Tguint64;
      segsize : Tgint;
      segtotal : Tgint;
      seglatency : Tgint;
      ABI : record
          case longint of
            0 : ( abi : record
                dsd_format : TGstDsdFormat;
              end );
            1 : ( _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer );
          end;
    end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_AUDIO_RING_BUFFER_SPEC_FORMAT_TYPE(spec : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER_SPEC_INFO(spec : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER_SPEC_LATENCY_TIME(spec : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER_SPEC_BUFFER_TIME(spec : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER_SPEC_SEGSIZE(spec : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER_SPEC_SEGTOTAL(spec : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER_SPEC_SEGLATENCY(spec : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER_SPEC_DSD_FORMAT(spec : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER_GET_COND(buf : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER_WAIT(buf : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER_SIGNAL(buf : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER_BROADCAST(buf : longint) : longint;

{*
 * GstAudioRingBuffer:
 * @cond: used to signal start/stop/pause/resume actions
 * @open: boolean indicating that the ringbuffer is open
 * @acquired: boolean indicating that the ringbuffer is acquired
 * @memory: data in the ringbuffer
 * @size: size of data in the ringbuffer
 * @spec: format and layout of the ringbuffer data
 * @samples_per_seg: number of samples in one segment
 * @empty_seg: pointer to memory holding one segment of silence samples
 * @state: state of the buffer
 * @segdone: readpointer in the ringbuffer
 * @segbase: segment corresponding to segment 0 (unused)
 * @waiting: is a reader or writer waiting for a free segment
 *
 * The ringbuffer base class structure.
  }
{< public > }{ with LOCK  }
{< private > }
{< public > }{ with LOCK  }
{< public > }{ ATOMIC  }
{< private > }
{ gst[channel_reorder_map[i]] = device[i]  }
{ ATOMIC  }
{< private > }
type
  PGstAudioRingBuffer = ^TGstAudioRingBuffer;
  TGstAudioRingBuffer = record
      object : TGstObject;
      cond : TGCond;
      open : Tgboolean;
      acquired : Tgboolean;
      memory : Pguint8;
      size : Tgsize;
      timestamps : PGstClockTime;
      spec : TGstAudioRingBufferSpec;
      samples_per_seg : Tgint;
      empty_seg : Pguint8;
      state : Tgint;
      segdone : Tgint;
      segbase : Tgint;
      waiting : Tgint;
      callback : TGstAudioRingBufferCallback;
      cb_data : Tgpointer;
      need_reorder : Tgboolean;
      channel_reorder_map : array[0..63] of Tgint;
      flushing : Tgboolean;
      may_start : Tgint;
      active : Tgboolean;
      cb_data_notify : TGDestroyNotify;
      priv : PGstAudioRingBufferPrivate;
      _gst_reserved : array[0..(GST_PADDING-2)-1] of Tgpointer;
    end;

{*
 * GstAudioRingBufferClass:
 * @parent_class: parent class
 * @open_device:  open the device, don't set any params or allocate anything
 * @acquire: allocate the resources for the ringbuffer using the given spec
 * @release: free resources of the ringbuffer
 * @close_device: close the device
 * @start: start processing of samples
 * @pause: pause processing of samples
 * @resume: resume processing of samples after pause
 * @stop: stop processing of samples
 * @delay: get number of frames queued in device
 * @activate: activate the thread that starts pulling and monitoring the
 * consumed segments in the device.
 * @commit: write samples into the ringbuffer
 * @clear_all: Optional.
 *             Clear the entire ringbuffer.
 *             Subclasses should chain up to the parent implementation to
 *             invoke the default handler.
 *
 * The vmethods that subclasses can override to implement the ringbuffer.
  }
{< public > }
{ ABI added  }
{< private > }
  PGstAudioRingBufferClass = ^TGstAudioRingBufferClass;
  TGstAudioRingBufferClass = record
      parent_class : TGstObjectClass;
      open_device : function (buf:PGstAudioRingBuffer):Tgboolean;cdecl;
      acquire : function (buf:PGstAudioRingBuffer; spec:PGstAudioRingBufferSpec):Tgboolean;cdecl;
      release : function (buf:PGstAudioRingBuffer):Tgboolean;cdecl;
      close_device : function (buf:PGstAudioRingBuffer):Tgboolean;cdecl;
      start : function (buf:PGstAudioRingBuffer):Tgboolean;cdecl;
      pause : function (buf:PGstAudioRingBuffer):Tgboolean;cdecl;
      resume : function (buf:PGstAudioRingBuffer):Tgboolean;cdecl;
      stop : function (buf:PGstAudioRingBuffer):Tgboolean;cdecl;
      delay : function (buf:PGstAudioRingBuffer):Tguint;cdecl;
      activate : function (buf:PGstAudioRingBuffer; active:Tgboolean):Tgboolean;cdecl;
      commit : function (buf:PGstAudioRingBuffer; sample:Pguint64; data:Pguint8; in_samples:Tgint; out_samples:Tgint; 
                   accum:Pgint):Tguint;cdecl;
      clear_all : procedure (buf:PGstAudioRingBuffer);cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_audio_ring_buffer_get_type:TGType;cdecl;external libgstaudio;
{ callback stuff  }
procedure gst_audio_ring_buffer_set_callback(buf:PGstAudioRingBuffer; cb:TGstAudioRingBufferCallback; user_data:Tgpointer);cdecl;external libgstaudio;
procedure gst_audio_ring_buffer_set_callback_full(buf:PGstAudioRingBuffer; cb:TGstAudioRingBufferCallback; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external libgstaudio;
function gst_audio_ring_buffer_parse_caps(spec:PGstAudioRingBufferSpec; caps:PGstCaps):Tgboolean;cdecl;external libgstaudio;
procedure gst_audio_ring_buffer_debug_spec_caps(spec:PGstAudioRingBufferSpec);cdecl;external libgstaudio;
procedure gst_audio_ring_buffer_debug_spec_buff(spec:PGstAudioRingBufferSpec);cdecl;external libgstaudio;
function gst_audio_ring_buffer_convert(buf:PGstAudioRingBuffer; src_fmt:TGstFormat; src_val:Tgint64; dest_fmt:TGstFormat; dest_val:Pgint64):Tgboolean;cdecl;external libgstaudio;
{ device state  }
function gst_audio_ring_buffer_open_device(buf:PGstAudioRingBuffer):Tgboolean;cdecl;external libgstaudio;
function gst_audio_ring_buffer_close_device(buf:PGstAudioRingBuffer):Tgboolean;cdecl;external libgstaudio;
function gst_audio_ring_buffer_device_is_open(buf:PGstAudioRingBuffer):Tgboolean;cdecl;external libgstaudio;
{ allocate resources  }
function gst_audio_ring_buffer_acquire(buf:PGstAudioRingBuffer; spec:PGstAudioRingBufferSpec):Tgboolean;cdecl;external libgstaudio;
function gst_audio_ring_buffer_release(buf:PGstAudioRingBuffer):Tgboolean;cdecl;external libgstaudio;
function gst_audio_ring_buffer_is_acquired(buf:PGstAudioRingBuffer):Tgboolean;cdecl;external libgstaudio;
{ set the device channel positions  }
procedure gst_audio_ring_buffer_set_channel_positions(buf:PGstAudioRingBuffer; position:PGstAudioChannelPosition);cdecl;external libgstaudio;
{ activating  }
function gst_audio_ring_buffer_activate(buf:PGstAudioRingBuffer; active:Tgboolean):Tgboolean;cdecl;external libgstaudio;
function gst_audio_ring_buffer_is_active(buf:PGstAudioRingBuffer):Tgboolean;cdecl;external libgstaudio;
{ flushing  }
procedure gst_audio_ring_buffer_set_flushing(buf:PGstAudioRingBuffer; flushing:Tgboolean);cdecl;external libgstaudio;
function gst_audio_ring_buffer_is_flushing(buf:PGstAudioRingBuffer):Tgboolean;cdecl;external libgstaudio;
{ playback/pause  }
function gst_audio_ring_buffer_start(buf:PGstAudioRingBuffer):Tgboolean;cdecl;external libgstaudio;
function gst_audio_ring_buffer_pause(buf:PGstAudioRingBuffer):Tgboolean;cdecl;external libgstaudio;
function gst_audio_ring_buffer_stop(buf:PGstAudioRingBuffer):Tgboolean;cdecl;external libgstaudio;
procedure gst_audio_ring_buffer_set_errored(buf:PGstAudioRingBuffer);cdecl;external libgstaudio;
{ get status  }
function gst_audio_ring_buffer_delay(buf:PGstAudioRingBuffer):Tguint;cdecl;external libgstaudio;
function gst_audio_ring_buffer_samples_done(buf:PGstAudioRingBuffer):Tguint64;cdecl;external libgstaudio;
procedure gst_audio_ring_buffer_set_sample(buf:PGstAudioRingBuffer; sample:Tguint64);cdecl;external libgstaudio;
{ clear all segments  }
procedure gst_audio_ring_buffer_clear_all(buf:PGstAudioRingBuffer);cdecl;external libgstaudio;
{ commit samples  }
function gst_audio_ring_buffer_commit(buf:PGstAudioRingBuffer; sample:Pguint64; data:Pguint8; in_samples:Tgint; out_samples:Tgint; 
           accum:Pgint):Tguint;cdecl;external libgstaudio;
{ read samples  }
function gst_audio_ring_buffer_read(buf:PGstAudioRingBuffer; sample:Tguint64; data:Pguint8; len:Tguint; timestamp:PGstClockTime):Tguint;cdecl;external libgstaudio;
{ Set timestamp on buffer  }
procedure gst_audio_ring_buffer_set_timestamp(buf:PGstAudioRingBuffer; readseg:Tgint; timestamp:TGstClockTime);cdecl;external libgstaudio;
{ mostly protected  }
{ not yet implemented
gboolean        gst_audio_ring_buffer_prepare_write   (GstAudioRingBuffer *buf, gint *segment, guint8 **writeptr, gint *len);
 }
function gst_audio_ring_buffer_prepare_read(buf:PGstAudioRingBuffer; segment:Pgint; readptr:PPguint8; len:Pgint):Tgboolean;cdecl;external libgstaudio;
procedure gst_audio_ring_buffer_clear(buf:PGstAudioRingBuffer; segment:Tgint);cdecl;external libgstaudio;
procedure gst_audio_ring_buffer_advance(buf:PGstAudioRingBuffer; advance:Tguint);cdecl;external libgstaudio;
procedure gst_audio_ring_buffer_may_start(buf:PGstAudioRingBuffer; allowed:Tgboolean);cdecl;external libgstaudio;
procedure gst_audio_ring_buffer_set_segdone(buf:PGstAudioRingBuffer; segdone:Tguint64);cdecl;external libgstaudio;
function gst_audio_ring_buffer_get_segdone(buf:PGstAudioRingBuffer):Tguint64;cdecl;external libgstaudio;
function gst_audio_ring_buffer_get_segbase(buf:PGstAudioRingBuffer):Tguint64;cdecl;external libgstaudio;
{//////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC        (GstAudioRingBuffer, gst_object_unref) }
{$endif}
{ __GST_AUDIO_RING_BUFFER_H__  }

// === Konventiert am: 16-7-26 15:24:57 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_AUDIO_RING_BUFFER : longint; { return type might be wrong }
  begin
    GST_TYPE_AUDIO_RING_BUFFER:=gst_audio_ring_buffer_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER(obj : longint) : longint;
begin
  GST_AUDIO_RING_BUFFER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_AUDIO_RING_BUFFER,GstAudioRingBuffer);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER_CLASS(klass : longint) : longint;
begin
  GST_AUDIO_RING_BUFFER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_AUDIO_RING_BUFFER,GstAudioRingBufferClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER_GET_CLASS(obj : longint) : longint;
begin
  GST_AUDIO_RING_BUFFER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_AUDIO_RING_BUFFER,GstAudioRingBufferClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_AUDIO_RING_BUFFER_CAST(obj : longint) : PGstAudioRingBuffer;
begin
  GST_AUDIO_RING_BUFFER_CAST:=PGstAudioRingBuffer(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_RING_BUFFER(obj : longint) : longint;
begin
  GST_IS_AUDIO_RING_BUFFER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_AUDIO_RING_BUFFER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_RING_BUFFER_CLASS(klass : longint) : longint;
begin
  GST_IS_AUDIO_RING_BUFFER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_AUDIO_RING_BUFFER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER_SPEC_FORMAT_TYPE(spec : longint) : longint;
begin
  GST_AUDIO_RING_BUFFER_SPEC_FORMAT_TYPE:=spec^._type;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER_SPEC_INFO(spec : longint) : longint;
begin
  GST_AUDIO_RING_BUFFER_SPEC_INFO:=spec^.info;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER_SPEC_LATENCY_TIME(spec : longint) : longint;
begin
  GST_AUDIO_RING_BUFFER_SPEC_LATENCY_TIME:=spec^.latency_time;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER_SPEC_BUFFER_TIME(spec : longint) : longint;
begin
  GST_AUDIO_RING_BUFFER_SPEC_BUFFER_TIME:=spec^.buffer_time;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER_SPEC_SEGSIZE(spec : longint) : longint;
begin
  GST_AUDIO_RING_BUFFER_SPEC_SEGSIZE:=spec^.segsize;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER_SPEC_SEGTOTAL(spec : longint) : longint;
begin
  GST_AUDIO_RING_BUFFER_SPEC_SEGTOTAL:=spec^.segtotal;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER_SPEC_SEGLATENCY(spec : longint) : longint;
begin
  GST_AUDIO_RING_BUFFER_SPEC_SEGLATENCY:=spec^.seglatency;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER_SPEC_DSD_FORMAT(spec : longint) : longint;
begin
  GST_AUDIO_RING_BUFFER_SPEC_DSD_FORMAT:=spec^.(ABI.(abi.dsd_format));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER_GET_COND(buf : longint) : longint;
begin
  GST_AUDIO_RING_BUFFER_GET_COND:=@((PGstAudioRingBuffer(buf))^.cond);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER_WAIT(buf : longint) : longint;
begin
  GST_AUDIO_RING_BUFFER_WAIT:=g_cond_wait(GST_AUDIO_RING_BUFFER_GET_COND(buf),GST_OBJECT_GET_LOCK(buf));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER_SIGNAL(buf : longint) : longint;
begin
  GST_AUDIO_RING_BUFFER_SIGNAL:=g_cond_signal(GST_AUDIO_RING_BUFFER_GET_COND(buf));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_RING_BUFFER_BROADCAST(buf : longint) : longint;
begin
  GST_AUDIO_RING_BUFFER_BROADCAST:=g_cond_broadcast(GST_AUDIO_RING_BUFFER_GET_COND(buf));
end;


end.
