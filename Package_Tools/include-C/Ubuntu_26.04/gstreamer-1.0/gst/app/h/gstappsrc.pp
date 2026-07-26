
unit gstappsrc;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstappsrc.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstappsrc.h
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
PGstAppLeakyType  = ^GstAppLeakyType;
PGstAppSrc  = ^GstAppSrc;
PGstAppSrcCallbacks  = ^GstAppSrcCallbacks;
PGstAppSrcClass  = ^GstAppSrcClass;
PGstAppSrcPrivate  = ^GstAppSrcPrivate;
PGstAppSrcSimpleCallbacks  = ^GstAppSrcSimpleCallbacks;
PGstAppStreamType  = ^GstAppStreamType;
PGstBuffer  = ^GstBuffer;
PGstBufferList  = ^GstBufferList;
PGstCaps  = ^GstCaps;
PGstSample  = ^GstSample;
Pguint64  = ^guint64;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2007 David Schleef <ds@schleef.org>
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
{$ifndef _GST_APP_SRC_H_}
{$define _GST_APP_SRC_H_}
{$include <gst/gst.h>}
{$include <gst/base/gstpushsrc.h>}
{$include <gst/app/app-prelude.h>}
{$include <gst/app/app-enumtypes.h>}

{ was #define dname def_expr }
function GST_TYPE_APP_SRC : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_APP_SRC(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_APP_SRC_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_APP_SRC(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_APP_SRC_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_APP_SRC_CAST(obj : longint) : PGstAppSrc;

type
{ FIXME 2.0: Make the instance/class struct private  }
{*
 * GstAppSrcCallbacks: (skip)
 * @need_data: Called when the appsrc needs more data. A buffer or EOS should be
 *    pushed to appsrc from this thread or another thread. @length is just a hint
 *    and when it is set to -1, any number of bytes can be pushed into @appsrc.
 * @enough_data: Called when appsrc has enough data. It is recommended that the
 *    application stops calling push-buffer until the need_data callback is
 *    emitted again to avoid excessive buffer queueing.
 * @seek_data: Called when a seek should be performed to the offset.
 *    The next push-buffer should produce buffers from the new @offset.
 *    This callback is only called for seekable stream types.
 *
 * A set of callbacks that can be installed on the appsrc with
 * gst_app_src_set_callbacks().
  }
{< private > }

  PGstAppSrcCallbacks = ^TGstAppSrcCallbacks;
  TGstAppSrcCallbacks = record
      need_data : procedure (src:PGstAppSrc; length:Tguint; user_data:Tgpointer);cdecl;
      enough_data : procedure (src:PGstAppSrc; user_data:Tgpointer);cdecl;
      seek_data : function (src:PGstAppSrc; offset:Tguint64; user_data:Tgpointer):Tgboolean;cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;
{*
 * GstAppSrcSimpleCallbacks:
 *
 * A set of callbacks that can be installed on the appsink with
 * gst_app_sink_set_simple_callbacks().
 *
 * Unlike GstAppSrcCallbacks this can also be used from bindings.
 *
 * Since: 1.28
  }
{*
 * GstAppStreamType:
 * @GST_APP_STREAM_TYPE_STREAM: No seeking is supported in the stream, such as a
 * live stream.
 * @GST_APP_STREAM_TYPE_SEEKABLE: The stream is seekable but seeking might not
 * be very fast, such as data from a webserver.
 * @GST_APP_STREAM_TYPE_RANDOM_ACCESS: The stream is seekable and seeking is fast,
 * such as in a local file.
 *
 * The stream type.
  }

  PGstAppStreamType = ^TGstAppStreamType;
  TGstAppStreamType =  Longint;
  Const
    GST_APP_STREAM_TYPE_STREAM = 0;
    GST_APP_STREAM_TYPE_SEEKABLE = 1;
    GST_APP_STREAM_TYPE_RANDOM_ACCESS = 2;
;
{*
 * GstAppLeakyType:
 * @GST_APP_LEAKY_TYPE_NONE: Not Leaky
 * @GST_APP_LEAKY_TYPE_UPSTREAM: Leaky on upstream (new buffers)
 * @GST_APP_LEAKY_TYPE_DOWNSTREAM: Leaky on downstream (old buffers)
 *
 * Buffer dropping scheme to avoid the element's internal queue to block when
 * full.
 *
 * Since: 1.20
  }
type
  PGstAppLeakyType = ^TGstAppLeakyType;
  TGstAppLeakyType =  Longint;
  Const
    GST_APP_LEAKY_TYPE_NONE = 0;
    GST_APP_LEAKY_TYPE_UPSTREAM = 1;
    GST_APP_LEAKY_TYPE_DOWNSTREAM = 2;
;
{< private > }
{< private > }
type
  PGstAppSrc = ^TGstAppSrc;
  TGstAppSrc = record
      basesrc : TGstBaseSrc;
      priv : PGstAppSrcPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{ signals  }
{ actions  }
{< private > }
  PGstAppSrcClass = ^TGstAppSrcClass;
  TGstAppSrcClass = record
      basesrc_class : TGstBaseSrcClass;
      need_data : procedure (appsrc:PGstAppSrc; length:Tguint);cdecl;
      enough_data : procedure (appsrc:PGstAppSrc);cdecl;
      seek_data : function (appsrc:PGstAppSrc; offset:Tguint64):Tgboolean;cdecl;
      push_buffer : function (appsrc:PGstAppSrc; buffer:PGstBuffer):TGstFlowReturn;cdecl;
      end_of_stream : function (appsrc:PGstAppSrc):TGstFlowReturn;cdecl;
      push_sample : function (appsrc:PGstAppSrc; sample:PGstSample):TGstFlowReturn;cdecl;
      push_buffer_list : function (appsrc:PGstAppSrc; buffer_list:PGstBufferList):TGstFlowReturn;cdecl;
      _gst_reserved : array[0..(GST_PADDING-2)-1] of Tgpointer;
    end;


function gst_app_src_get_type:TGType;cdecl;external;
(* Const before type ignored *)
procedure gst_app_src_set_caps(appsrc:PGstAppSrc; caps:PGstCaps);cdecl;external;
function gst_app_src_get_caps(appsrc:PGstAppSrc):PGstCaps;cdecl;external;
procedure gst_app_src_set_size(appsrc:PGstAppSrc; size:Tgint64);cdecl;external;
function gst_app_src_get_size(appsrc:PGstAppSrc):Tgint64;cdecl;external;
procedure gst_app_src_set_duration(appsrc:PGstAppSrc; duration:TGstClockTime);cdecl;external;
function gst_app_src_get_duration(appsrc:PGstAppSrc):TGstClockTime;cdecl;external;
procedure gst_app_src_set_stream_type(appsrc:PGstAppSrc; _type:TGstAppStreamType);cdecl;external;
function gst_app_src_get_stream_type(appsrc:PGstAppSrc):TGstAppStreamType;cdecl;external;
procedure gst_app_src_set_max_bytes(appsrc:PGstAppSrc; max:Tguint64);cdecl;external;
function gst_app_src_get_max_bytes(appsrc:PGstAppSrc):Tguint64;cdecl;external;
function gst_app_src_get_current_level_bytes(appsrc:PGstAppSrc):Tguint64;cdecl;external;
procedure gst_app_src_set_max_buffers(appsrc:PGstAppSrc; max:Tguint64);cdecl;external;
function gst_app_src_get_max_buffers(appsrc:PGstAppSrc):Tguint64;cdecl;external;
function gst_app_src_get_current_level_buffers(appsrc:PGstAppSrc):Tguint64;cdecl;external;
procedure gst_app_src_set_max_time(appsrc:PGstAppSrc; max:TGstClockTime);cdecl;external;
function gst_app_src_get_max_time(appsrc:PGstAppSrc):TGstClockTime;cdecl;external;
function gst_app_src_get_current_level_time(appsrc:PGstAppSrc):TGstClockTime;cdecl;external;
procedure gst_app_src_set_leaky_type(appsrc:PGstAppSrc; leaky:TGstAppLeakyType);cdecl;external;
function gst_app_src_get_leaky_type(appsrc:PGstAppSrc):TGstAppLeakyType;cdecl;external;
procedure gst_app_src_set_latency(appsrc:PGstAppSrc; min:Tguint64; max:Tguint64);cdecl;external;
procedure gst_app_src_get_latency(appsrc:PGstAppSrc; min:Pguint64; max:Pguint64);cdecl;external;
procedure gst_app_src_set_emit_signals(appsrc:PGstAppSrc; emit:Tgboolean);cdecl;external;
function gst_app_src_get_emit_signals(appsrc:PGstAppSrc):Tgboolean;cdecl;external;
function gst_app_src_push_buffer(appsrc:PGstAppSrc; buffer:PGstBuffer):TGstFlowReturn;cdecl;external;
function gst_app_src_push_buffer_list(appsrc:PGstAppSrc; buffer_list:PGstBufferList):TGstFlowReturn;cdecl;external;
function gst_app_src_end_of_stream(appsrc:PGstAppSrc):TGstFlowReturn;cdecl;external;
function gst_app_src_push_sample(appsrc:PGstAppSrc; sample:PGstSample):TGstFlowReturn;cdecl;external;
procedure gst_app_src_set_callbacks(appsrc:PGstAppSrc; callbacks:PGstAppSrcCallbacks; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
procedure gst_app_src_set_simple_callbacks(appsrc:PGstAppSrc; cb:PGstAppSrcSimpleCallbacks);cdecl;external;
{*
 * gst_app_src_simple_callbacks_get_type:
 *
 * Since: 1.28
  }
function gst_app_src_simple_callbacks_get_type:TGType;cdecl;external;
{*
 * GST_TYPE_APP_SRC_SIMPLE_CALLBACKS:
 *
 * Since: 1.28
  }
{ was #define dname def_expr }
function GST_TYPE_APP_SRC_SIMPLE_CALLBACKS : longint; { return type might be wrong }

function gst_app_src_simple_callbacks_new:PGstAppSrcSimpleCallbacks;cdecl;external;
function gst_app_src_simple_callbacks_ref(cb:PGstAppSrcSimpleCallbacks):PGstAppSrcSimpleCallbacks;cdecl;external;
procedure gst_app_src_simple_callbacks_unref(cb:PGstAppSrcSimpleCallbacks);cdecl;external;
{*
 * GstAppSrcNeedDataCallback:
 * @appsrc: a #GstAppSrc
 * @length: Length hint
 * @user_data: callback user data
 *
 * Called when the appsrc needs more data. A buffer or EOS should be pushed to
 * appsrc from this thread or another thread. @length is just a hint and when it
 * is set to -1, any number of bytes can be pushed into @appsrc.
 *
 * Since: 1.28
  }
type

  TGstAppSrcNeedDataCallback = procedure (appsrc:PGstAppSrc; length:Tguint; user_data:Tgpointer);cdecl;

procedure gst_app_src_simple_callbacks_set_need_data(cb:PGstAppSrcSimpleCallbacks; need_data_cb:TGstAppSrcNeedDataCallback; user_data:Tgpointer; destroy_notify:TGDestroyNotify);cdecl;external;
{*
 * GstAppSrcEnoughDataCallback:
 * @appsrc: a #GstAppSrc
 * @user_data: callback user data
 *
 * Called when appsrc has enough data. It is recommended that the application
 * stops calling push-buffer until the need_data callback is emitted again to
 * avoid excessive buffer queueing.
 *
 * Since: 1.28
  }
type

  TGstAppSrcEnoughDataCallback = procedure (appsrc:PGstAppSrc; user_data:Tgpointer);cdecl;

procedure gst_app_src_simple_callbacks_set_enough_data(cb:PGstAppSrcSimpleCallbacks; enough_data_cb:TGstAppSrcEnoughDataCallback; user_data:Tgpointer; destroy_notify:TGDestroyNotify);cdecl;external;
{*
 * GstAppSrcSeekDataCallback:
 * @appsrc: a #GstAppSrc
 * @offset: Offset to seek to.
 * @user_data: callback user data
 *
 * Called when a seek should be performed to the offset. The next push-buffer
 * should produce buffers from the new @offset. This callback is only called for
 * seekable stream types.
 *
 * Returns: %TRUE if the seek was successful.
 *
 * Since: 1.28
  }
type

  TGstAppSrcSeekDataCallback = function (appsrc:PGstAppSrc; offset:Tguint64; user_data:Tgpointer):Tgboolean;cdecl;

procedure gst_app_src_simple_callbacks_set_seek_data(cb:PGstAppSrcSimpleCallbacks; seek_data_cb:TGstAppSrcSeekDataCallback; user_data:Tgpointer; destroy_notify:TGDestroyNotify);cdecl;external;
{//////////////////////////////////////////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                                  (GstAppSrc, gst_object_unref) }
{//////////////////////////////////////////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                                  (GstAppSrcSimpleCallbacks, gst_app_src_simple_callbacks_unref) }
{$endif}

implementation

{ was #define dname def_expr }
function GST_TYPE_APP_SRC : longint; { return type might be wrong }
  begin
    GST_TYPE_APP_SRC:=gst_app_src_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_APP_SRC(obj : longint) : longint;
begin
  GST_APP_SRC:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_APP_SRC,GstAppSrc);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_APP_SRC_CLASS(klass : longint) : longint;
begin
  GST_APP_SRC_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_APP_SRC,GstAppSrcClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_APP_SRC(obj : longint) : longint;
begin
  GST_IS_APP_SRC:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_APP_SRC);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_APP_SRC_CLASS(klass : longint) : longint;
begin
  GST_IS_APP_SRC_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_APP_SRC);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_APP_SRC_CAST(obj : longint) : PGstAppSrc;
begin
  GST_APP_SRC_CAST:=PGstAppSrc(obj);
end;

{ was #define dname def_expr }
function GST_TYPE_APP_SRC_SIMPLE_CALLBACKS : longint; { return type might be wrong }
  begin
    GST_TYPE_APP_SRC_SIMPLE_CALLBACKS:=gst_app_src_simple_callbacks_get_type;
  end;


end.
