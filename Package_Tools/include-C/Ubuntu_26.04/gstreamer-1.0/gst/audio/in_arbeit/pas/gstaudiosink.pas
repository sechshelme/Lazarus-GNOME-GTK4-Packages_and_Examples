unit gstaudiosink;

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
 * gstaudiosink.h:
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
{$ifndef __GST_AUDIO_SINK_H__}
{$define __GST_AUDIO_SINK_H__}
{$include <gst/gst.h>}
{$include <gst/audio/gstaudiobasesink.h>}

{ was #define dname def_expr }
function GST_TYPE_AUDIO_SINK : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_SINK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_SINK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_SINK_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_SINK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_SINK_CLASS(klass : longint) : longint;

type
{*
 * GstAudioSink:
 *
 * Opaque #GstAudioSink.
  }
{< private > }{ with LOCK  }
{< private > }
  PGstAudioSink = ^TGstAudioSink;
  TGstAudioSink = record
      element : TGstAudioBaseSink;
      thread : PGThread;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstAudioSinkClass:
 * @parent_class: the parent class structure.
 * @open: Open the device. No configuration needs to be done at this point.
 *        This function is also used to check if the device is available.
 * @prepare: Prepare the device to operate with the specified parameters.
 * @unprepare: Undo operations done in prepare.
 * @close: Close the device.
 * @write: Write data to the device.
 *         This vmethod is allowed to block until all the data is written.
 *         If such is the case then it is expected that pause, stop and
 *         reset will unblock the write when called.
 * @delay: Return how many frames are still in the device. Participates in
 *         computing the time for audio clocks and drives the synchronisation.
 * @reset: Returns as quickly as possible from a write and flush any pending
 *         samples from the device.
 *         This vmethod is deprecated. Please provide pause and stop instead.
 * @pause: Pause the device and unblock write as fast as possible.
 *         For retro compatibility, the audio sink will fallback
 *         to calling reset if this vmethod is not provided. Since: 1.18
 * @resume: Resume the device. Since: 1.18
 * @stop: Stop the device and unblock write as fast as possible.
 *        Pending samples are flushed from the device.
 *        For retro compatibility, the audio sink will fallback
 *        to calling reset if this vmethod is not provided. Since: 1.18
 * @extension: class extension structure. Since: 1.18
  }
{ vtable  }
{ open the device with given specs  }
{ prepare resources and state to operate with the given specs  }
{ undo anything that was done in prepare()  }
{ close the device  }
{*
   * GstAudioSinkClass::write:
   * @data: (type guint8) (array length=length): the sample data
   *
   * Write samples to the device.
    }
{ get number of frames queued in the device  }
{ deprecated: reset the audio device, unblock from a write  }
{ pause the audio device, unblock from a write  }
{ resume the audio device  }
{ stop the audio device, unblock from a write  }
  PGstAudioSinkClass = ^TGstAudioSinkClass;
  TGstAudioSinkClass = record
      parent_class : TGstAudioBaseSinkClass;
      open : function (sink:PGstAudioSink):Tgboolean;cdecl;
      prepare : function (sink:PGstAudioSink; spec:PGstAudioRingBufferSpec):Tgboolean;cdecl;
      unprepare : function (sink:PGstAudioSink):Tgboolean;cdecl;
      close : function (sink:PGstAudioSink):Tgboolean;cdecl;
      write : function (sink:PGstAudioSink; data:Tgpointer; length:Tguint):Tgint;cdecl;
      delay : function (sink:PGstAudioSink):Tguint;cdecl;
      reset : procedure (sink:PGstAudioSink);cdecl;
      pause : procedure (sink:PGstAudioSink);cdecl;
      resume : procedure (sink:PGstAudioSink);cdecl;
      stop : procedure (sink:PGstAudioSink);cdecl;
      extension : PGstAudioSinkClassExtension;
    end;

{*
 * GstAudioSinkClassExtension:
 * @clear-all: Clear the device. Since: 1.18
  }
{ clear the audio device  }
{ no padding needed   }
  PGstAudioSinkClassExtension = ^TGstAudioSinkClassExtension;
  TGstAudioSinkClassExtension = record
      clear_all : procedure (sink:PGstAudioSink);cdecl;
    end;


function gst_audio_sink_get_type:TGType;cdecl;external libgstaudio;
{//////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC        (GstAudioSink, gst_object_unref) }
{$endif}
{ __GST_AUDIO_SINK_H__  }

// === Konventiert am: 16-7-26 15:25:18 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_AUDIO_SINK : longint; { return type might be wrong }
  begin
    GST_TYPE_AUDIO_SINK:=gst_audio_sink_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_SINK(obj : longint) : longint;
begin
  GST_AUDIO_SINK:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_AUDIO_SINK,GstAudioSink);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_SINK_CLASS(klass : longint) : longint;
begin
  GST_AUDIO_SINK_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_AUDIO_SINK,GstAudioSinkClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_SINK_GET_CLASS(obj : longint) : longint;
begin
  GST_AUDIO_SINK_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_AUDIO_SINK,GstAudioSinkClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_SINK(obj : longint) : longint;
begin
  GST_IS_AUDIO_SINK:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_AUDIO_SINK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_SINK_CLASS(klass : longint) : longint;
begin
  GST_IS_AUDIO_SINK_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_AUDIO_SINK);
end;


end.
