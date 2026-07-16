unit gstaudiosrc;

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
 * gstaudiosrc.h:
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
{$ifndef __GST_AUDIO_SRC_H__}
{$define __GST_AUDIO_SRC_H__}
{$include <gst/gst.h>}
{$include <gst/audio/gstaudiobasesrc.h>}

{ was #define dname def_expr }
function GST_TYPE_AUDIO_SRC : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_SRC(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_SRC_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_SRC_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_SRC(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_SRC_CLASS(klass : longint) : longint;

type
{*
 * GstAudioSrc:
 *
 * Base class for simple audio sources.
  }
{< private > }{ with LOCK  }
{< private > }
  PGstAudioSrc = ^TGstAudioSrc;
  TGstAudioSrc = record
      element : TGstAudioBaseSrc;
      thread : PGThread;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstAudioSrcClass:
 * @parent_class: the parent class.
 * @open: open the device with the specified caps
 * @prepare: configure device with format
 * @unprepare: undo the configuration
 * @close: close the device
 * @read: read samples from the audio device
 * @delay: the number of frames queued in the device
 * @reset: unblock a read to the device and reset.
 *
 * #GstAudioSrc class. Override the vmethod to implement
 * functionality.
  }
{ vtable  }
{ open the device with given specs  }
{ prepare resources and state to operate with the given specs  }
{ undo anything that was done in prepare()  }
{ close the device  }
{*
   * GstAudioSrcClass::read:
   * @data: (type guint8) (array length=length): the sample data
   * @timestamp: (out): a #GstClockTime
   *
   * Read samples from the device.
    }
{ get number of frames queued in the device  }
{ reset the audio device, unblock from a write  }
{< private > }
  PGstAudioSrcClass = ^TGstAudioSrcClass;
  TGstAudioSrcClass = record
      parent_class : TGstAudioBaseSrcClass;
      open : function (src:PGstAudioSrc):Tgboolean;cdecl;
      prepare : function (src:PGstAudioSrc; spec:PGstAudioRingBufferSpec):Tgboolean;cdecl;
      unprepare : function (src:PGstAudioSrc):Tgboolean;cdecl;
      close : function (src:PGstAudioSrc):Tgboolean;cdecl;
      read : function (src:PGstAudioSrc; data:Tgpointer; length:Tguint; timestamp:PGstClockTime):Tguint;cdecl;
      delay : function (src:PGstAudioSrc):Tguint;cdecl;
      reset : procedure (src:PGstAudioSrc);cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_audio_src_get_type:TGType;cdecl;external libgstaudio;
{//////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC        (GstAudioSrc, gst_object_unref) }
{$endif}
{ __GST_AUDIO_SRC_H__  }

// === Konventiert am: 16-7-26 15:25:25 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_AUDIO_SRC : longint; { return type might be wrong }
  begin
    GST_TYPE_AUDIO_SRC:=gst_audio_src_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_SRC(obj : longint) : longint;
begin
  GST_AUDIO_SRC:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_AUDIO_SRC,GstAudioSrc);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_SRC_CLASS(klass : longint) : longint;
begin
  GST_AUDIO_SRC_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_AUDIO_SRC,GstAudioSrcClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_AUDIO_SRC_GET_CLASS(obj : longint) : longint;
begin
  GST_AUDIO_SRC_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_AUDIO_SRC,GstAudioSrcClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_SRC(obj : longint) : longint;
begin
  GST_IS_AUDIO_SRC:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_AUDIO_SRC);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_AUDIO_SRC_CLASS(klass : longint) : longint;
begin
  GST_IS_AUDIO_SRC_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_AUDIO_SRC);
end;


end.
