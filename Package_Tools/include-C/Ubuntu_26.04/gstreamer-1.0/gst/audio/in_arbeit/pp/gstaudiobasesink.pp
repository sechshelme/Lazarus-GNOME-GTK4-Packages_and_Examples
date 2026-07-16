
unit gstaudiobasesink;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstaudiobasesink.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstaudiobasesink.h
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
PGstAudioBaseSink  = ^GstAudioBaseSink;
PGstAudioBaseSinkClass  = ^GstAudioBaseSinkClass;
PGstAudioBaseSinkDiscontReason  = ^GstAudioBaseSinkDiscontReason;
PGstAudioBaseSinkPrivate  = ^GstAudioBaseSinkPrivate;
PGstAudioBaseSinkSlaveMethod  = ^GstAudioBaseSinkSlaveMethod;
PGstAudioRingBuffer  = ^GstAudioRingBuffer;
PGstBuffer  = ^GstBuffer;
PGstClock  = ^GstClock;
PGstClockTimeDiff  = ^GstClockTimeDiff;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2005 Wim Taymans <wim@fluendo.com>
 *
 * gstaudiobasesink.h:
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
{ a base class for audio sinks.
 *
 * It uses a ringbuffer to schedule playback of samples. This makes
 * it very easy to drop or insert samples to align incoming
 * buffers to the exact playback timestamp.
 *
 * Subclasses must provide a ringbuffer pointing to either DMA
 * memory or regular memory. A subclass should also call a callback
 * function when it has played N segments in the buffer. The subclass
 * is free to use a thread to signal this callback, use EIO or any
 * other mechanism.
 *
 * The base class is able to operate in push or pull mode. The chain
 * mode will queue the samples in the ringbuffer as much as possible.
 * The available space is calculated in the callback function.
 *
 * The pull mode will pull_range() a new buffer of N samples with a
 * configurable latency. This allows for high-end real time
 * audio processing pipelines driven by the audiosink. The callback
 * function will be used to perform a pull_range() on the sinkpad.
 * The thread scheduling the callback can be a real-time thread.
 *
 * Subclasses must implement a GstAudioRingBuffer in addition to overriding
 * the methods in GstBaseSink and this class.
  }
{$ifndef __GST_AUDIO_AUDIO_H__}
{$include <gst/audio/audio.h>}
{$endif}
{$ifndef __GST_AUDIO_BASE_SINK_H__}
{$define __GST_AUDIO_BASE_SINK_H__}
{$include <gst/base/gstbasesink.h>}

{ was #define dname def_expr }
function GST_TYPE_AUDIO_BASE_SINK : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BASE_SINK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_AUDIO_BASE_SINK_CAST(obj : longint) : PGstAudioBaseSink;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BASE_SINK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BASE_SINK_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_BASE_SINK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_BASE_SINK_CLASS(klass : longint) : longint;

{*
 * GST_AUDIO_BASE_SINK_CLOCK:
 * @obj: a #GstAudioBaseSink
 *
 * Get the #GstClock of @obj.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BASE_SINK_CLOCK(obj : longint) : longint;

{*
 * GST_AUDIO_BASE_SINK_PAD:
 * @obj: a #GstAudioBaseSink
 *
 * Get the sink #GstPad of @obj.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BASE_SINK_PAD(obj : longint) : longint;

{*
 * GstAudioBaseSinkSlaveMethod:
 * @GST_AUDIO_BASE_SINK_SLAVE_RESAMPLE: Resample to match the master clock
 * @GST_AUDIO_BASE_SINK_SLAVE_SKEW: Adjust playout pointer when master clock
 * drifts too much.
 * @GST_AUDIO_BASE_SINK_SLAVE_NONE: No adjustment is done.
 * @GST_AUDIO_BASE_SINK_SLAVE_CUSTOM: Use custom clock slaving algorithm (Since: 1.6)
 *
 * Different possible clock slaving algorithms used when the internal audio
 * clock is not selected as the pipeline master clock.
  }
type
  PGstAudioBaseSinkSlaveMethod = ^TGstAudioBaseSinkSlaveMethod;
  TGstAudioBaseSinkSlaveMethod =  Longint;
  Const
    GST_AUDIO_BASE_SINK_SLAVE_RESAMPLE = 0;
    GST_AUDIO_BASE_SINK_SLAVE_SKEW = 1;
    GST_AUDIO_BASE_SINK_SLAVE_NONE = 2;
    GST_AUDIO_BASE_SINK_SLAVE_CUSTOM = 3;
;
type
{*
 * GstAudioBaseSinkDiscontReason:
 * @GST_AUDIO_BASE_SINK_DISCONT_REASON_NO_DISCONT: No discontinuity occurred
 * @GST_AUDIO_BASE_SINK_DISCONT_REASON_NEW_CAPS: New caps are set, causing renegotiotion
 * @GST_AUDIO_BASE_SINK_DISCONT_REASON_FLUSH: Samples have been flushed
 * @GST_AUDIO_BASE_SINK_DISCONT_REASON_SYNC_LATENCY: Sink was synchronized to the estimated latency (occurs during initialization)
 * @GST_AUDIO_BASE_SINK_DISCONT_REASON_ALIGNMENT: Aligning buffers failed because the timestamps are too discontinuous
 * @GST_AUDIO_BASE_SINK_DISCONT_REASON_DEVICE_FAILURE: Audio output device experienced and recovered from an error but introduced latency in the process (see also gst_audio_base_sink_report_device_failure())
 *
 * Different possible reasons for discontinuities. This enum is useful for the custom
 * slave method.
 *
 * Since: 1.6
  }

  PGstAudioBaseSinkDiscontReason = ^TGstAudioBaseSinkDiscontReason;
  TGstAudioBaseSinkDiscontReason =  Longint;
  Const
    GST_AUDIO_BASE_SINK_DISCONT_REASON_NO_DISCONT = 0;
    GST_AUDIO_BASE_SINK_DISCONT_REASON_NEW_CAPS = 1;
    GST_AUDIO_BASE_SINK_DISCONT_REASON_FLUSH = 2;
    GST_AUDIO_BASE_SINK_DISCONT_REASON_SYNC_LATENCY = 3;
    GST_AUDIO_BASE_SINK_DISCONT_REASON_ALIGNMENT = 4;
    GST_AUDIO_BASE_SINK_DISCONT_REASON_DEVICE_FAILURE = 5;
;
{*
 * GstAudioBaseSinkCustomSlavingCallback:
 * @sink: a #GstAudioBaseSink
 * @etime: external clock time
 * @itime: internal clock time
 * @requested_skew: skew amount requested by the callback
 * @discont_reason: reason for discontinuity (if any)
 * @user_data: user data
 *
 * This function is set with gst_audio_base_sink_set_custom_slaving_callback()
 * and is called during playback. It receives the current time of external and
 * internal clocks, which the callback can then use to apply any custom
 * slaving/synchronization schemes.
 *
 * The external clock is the sink's element clock, the internal one is the
 * internal audio clock. The internal audio clock's calibration is applied to
 * the timestamps before they are passed to the callback. The difference between
 * etime and itime is the skew; how much internal and external clock lie apart
 * from each other. A skew of 0 means both clocks are perfectly in sync.
 * itime > etime means the external clock is going slower, while itime < etime
 * means it is going faster than the internal clock. etime and itime are always
 * valid timestamps, except for when a discontinuity happens.
 *
 * requested_skew is an output value the callback can write to. It informs the
 * sink of whether or not it should move the playout pointer, and if so, by how
 * much. This pointer is only NULL if a discontinuity occurs; otherwise, it is
 * safe to write to *requested_skew. The default skew is 0.
 *
 * The sink may experience discontinuities. If one happens, discont is TRUE,
 * itime, etime are set to GST_CLOCK_TIME_NONE, and requested_skew is NULL.
 * This makes it possible to reset custom clock slaving algorithms when a
 * discontinuity happens.
 *
 * Since: 1.6
  }
type

  TGstAudioBaseSinkCustomSlavingCallback = procedure (sink:PGstAudioBaseSink; etime:TGstClockTime; itime:TGstClockTime; requested_skew:PGstClockTimeDiff; discont_reason:TGstAudioBaseSinkDiscontReason; 
                user_data:Tgpointer);cdecl;
{*
 * GstAudioBaseSink:
 *
 * Opaque #GstAudioBaseSink.
  }
{< protected > }{ with LOCK  }
{ our ringbuffer  }
{ required buffer and latency in microseconds  }
{ the next sample to write  }
{ clock  }
{ with g_atomic_; currently rendering eos  }
{< private > }
  PGstAudioBaseSink = ^TGstAudioBaseSink;
  TGstAudioBaseSink = record
      element : TGstBaseSink;cdecl;
      ringbuffer : PGstAudioRingBuffer;
      buffer_time : Tguint64;
      latency_time : Tguint64;
      next_sample : Tguint64;
      provided_clock : PGstClock;
      eos_rendering : Tgboolean;
      priv : PGstAudioBaseSinkPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstAudioBaseSinkClass:
 * @parent_class: the parent class.
 * @create_ringbuffer: create and return a #GstAudioRingBuffer to write to.
 * @payload: payload data in a format suitable to write to the sink. If no
 *           payloading is required, returns a reffed copy of the original
 *           buffer, else returns the payloaded buffer with all other metadata
 *           copied.
 *
 * #GstAudioBaseSink class. Override the vmethod to implement
 * functionality.
  }
{ subclass ringbuffer allocation  }
{ subclass payloader  }
{< private > }
  PGstAudioBaseSinkClass = ^TGstAudioBaseSinkClass;
  TGstAudioBaseSinkClass = record
      parent_class : TGstBaseSinkClass;
      create_ringbuffer : function (sink:PGstAudioBaseSink):PGstAudioRingBuffer;cdecl;
      payload : function (sink:PGstAudioBaseSink; buffer:PGstBuffer):PGstBuffer;cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_audio_base_sink_get_type:TGType;cdecl;external;
function gst_audio_base_sink_create_ringbuffer(sink:PGstAudioBaseSink):PGstAudioRingBuffer;cdecl;external;
procedure gst_audio_base_sink_set_provide_clock(sink:PGstAudioBaseSink; provide:Tgboolean);cdecl;external;
function gst_audio_base_sink_get_provide_clock(sink:PGstAudioBaseSink):Tgboolean;cdecl;external;
procedure gst_audio_base_sink_set_slave_method(sink:PGstAudioBaseSink; method:TGstAudioBaseSinkSlaveMethod);cdecl;external;
function gst_audio_base_sink_get_slave_method(sink:PGstAudioBaseSink):TGstAudioBaseSinkSlaveMethod;cdecl;external;
procedure gst_audio_base_sink_set_drift_tolerance(sink:PGstAudioBaseSink; drift_tolerance:Tgint64);cdecl;external;
function gst_audio_base_sink_get_drift_tolerance(sink:PGstAudioBaseSink):Tgint64;cdecl;external;
procedure gst_audio_base_sink_set_alignment_threshold(sink:PGstAudioBaseSink; alignment_threshold:TGstClockTime);cdecl;external;
function gst_audio_base_sink_get_alignment_threshold(sink:PGstAudioBaseSink):TGstClockTime;cdecl;external;
procedure gst_audio_base_sink_set_discont_wait(sink:PGstAudioBaseSink; discont_wait:TGstClockTime);cdecl;external;
function gst_audio_base_sink_get_discont_wait(sink:PGstAudioBaseSink):TGstClockTime;cdecl;external;
procedure gst_audio_base_sink_set_custom_slaving_callback(sink:PGstAudioBaseSink; callback:TGstAudioBaseSinkCustomSlavingCallback; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
procedure gst_audio_base_sink_report_device_failure(sink:PGstAudioBaseSink);cdecl;external;
{//////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC        (GstAudioBaseSink, gst_object_unref) }
{$endif}
{ __GST_AUDIO_BASE_SINK_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_AUDIO_BASE_SINK : longint; { return type might be wrong }
  begin
    GST_TYPE_AUDIO_BASE_SINK:=gst_audio_base_sink_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BASE_SINK(obj : longint) : longint;
begin
  GST_AUDIO_BASE_SINK:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_AUDIO_BASE_SINK,GstAudioBaseSink);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_AUDIO_BASE_SINK_CAST(obj : longint) : PGstAudioBaseSink;
begin
  GST_AUDIO_BASE_SINK_CAST:=PGstAudioBaseSink(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BASE_SINK_CLASS(klass : longint) : longint;
begin
  GST_AUDIO_BASE_SINK_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_AUDIO_BASE_SINK,GstAudioBaseSinkClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BASE_SINK_GET_CLASS(obj : longint) : longint;
begin
  GST_AUDIO_BASE_SINK_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_AUDIO_BASE_SINK,GstAudioBaseSinkClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_BASE_SINK(obj : longint) : longint;
begin
  GST_IS_AUDIO_BASE_SINK:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_AUDIO_BASE_SINK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_BASE_SINK_CLASS(klass : longint) : longint;
begin
  GST_IS_AUDIO_BASE_SINK_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_AUDIO_BASE_SINK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BASE_SINK_CLOCK(obj : longint) : longint;
begin
  GST_AUDIO_BASE_SINK_CLOCK:=(GST_AUDIO_BASE_SINK(obj))^.clock;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_BASE_SINK_PAD(obj : longint) : longint;
begin
  GST_AUDIO_BASE_SINK_PAD:=(GST_BASE_SINK(obj))^.sinkpad;
end;


end.
