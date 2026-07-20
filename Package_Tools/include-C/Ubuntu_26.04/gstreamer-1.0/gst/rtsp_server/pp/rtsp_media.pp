
unit rtsp_media;
interface

{
  Automatically converted by H2Pas 1.0.0 from rtsp_media.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rtsp_media
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
Pgchar  = ^gchar;
Pgdouble  = ^gdouble;
Pgint64  = ^gint64;
PGPtrArray  = ^GPtrArray;
PGstClock  = ^GstClock;
PGstElement  = ^GstElement;
PGstMessage  = ^GstMessage;
PGstNetTimeProvider  = ^GstNetTimeProvider;
PGstPad  = ^GstPad;
PGstPipeline  = ^GstPipeline;
PGstRTSPAddressPool  = ^GstRTSPAddressPool;
PGstRTSPMedia  = ^GstRTSPMedia;
PGstRTSPMediaClass  = ^GstRTSPMediaClass;
PGstRTSPMediaPrivate  = ^GstRTSPMediaPrivate;
PGstRTSPMediaStatus  = ^GstRTSPMediaStatus;
PGstRTSPPermissions  = ^GstRTSPPermissions;
PGstRTSPPublishClockMode  = ^GstRTSPPublishClockMode;
PGstRTSPStream  = ^GstRTSPStream;
PGstRTSPSuspendMode  = ^GstRTSPSuspendMode;
PGstRTSPThread  = ^GstRTSPThread;
PGstRTSPTimeRange  = ^GstRTSPTimeRange;
PGstRTSPTransportMode  = ^GstRTSPTransportMode;
PGstSDPInfo  = ^GstSDPInfo;
PGstSDPMessage  = ^GstSDPMessage;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2008 Wim Taymans <wim.taymans at gmail.com>
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
{$include <gst/gst.h>}
{$include <gst/rtsp/rtsp.h>}
{$include <gst/net/gstnet.h>}
{$ifndef __GST_RTSP_MEDIA_H__}
{$define __GST_RTSP_MEDIA_H__}
{$include "rtsp-server-prelude.h"}
{ types for the media  }

{ was #define dname def_expr }
function GST_TYPE_RTSP_MEDIA : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_MEDIA(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_MEDIA_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_MEDIA_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_MEDIA(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_MEDIA_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_MEDIA_CAST(obj : longint) : PGstRTSPMedia;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_MEDIA_CLASS_CAST(klass : longint) : PGstRTSPMediaClass;

type
{*
 * GstRTSPMediaStatus:
 * @GST_RTSP_MEDIA_STATUS_UNPREPARED: media pipeline not prerolled
 * @GST_RTSP_MEDIA_STATUS_UNPREPARING: media pipeline is busy doing a clean
 *                                     shutdown.
 * @GST_RTSP_MEDIA_STATUS_PREPARING: media pipeline is prerolling
 * @GST_RTSP_MEDIA_STATUS_PREPARED: media pipeline is prerolled
 * @GST_RTSP_MEDIA_STATUS_SUSPENDED: media is suspended
 * @GST_RTSP_MEDIA_STATUS_ERROR: media pipeline is in error
 *
 * The state of the media pipeline.
  }

  PGstRTSPMediaStatus = ^TGstRTSPMediaStatus;
  TGstRTSPMediaStatus =  Longint;
  Const
    GST_RTSP_MEDIA_STATUS_UNPREPARED = 0;
    GST_RTSP_MEDIA_STATUS_UNPREPARING = 1;
    GST_RTSP_MEDIA_STATUS_PREPARING = 2;
    GST_RTSP_MEDIA_STATUS_PREPARED = 3;
    GST_RTSP_MEDIA_STATUS_SUSPENDED = 4;
    GST_RTSP_MEDIA_STATUS_ERROR = 5;
;
{*
 * GstRTSPSuspendMode:
 * @GST_RTSP_SUSPEND_MODE_NONE: Media is not suspended
 * @GST_RTSP_SUSPEND_MODE_PAUSE: Media is PAUSED in suspend
 * @GST_RTSP_SUSPEND_MODE_RESET: The media is set to NULL when suspended
 *
 * The suspend mode of the media pipeline. A media pipeline is suspended right
 * after creating the SDP and when the client performs a PAUSED request.
  }
type
  PGstRTSPSuspendMode = ^TGstRTSPSuspendMode;
  TGstRTSPSuspendMode =  Longint;
  Const
    GST_RTSP_SUSPEND_MODE_NONE = 0;
    GST_RTSP_SUSPEND_MODE_PAUSE = 1;
    GST_RTSP_SUSPEND_MODE_RESET = 2;
;
{*
 * GstRTSPTransportMode:
 * @GST_RTSP_TRANSPORT_MODE_PLAY: Transport supports PLAY mode
 * @GST_RTSP_TRANSPORT_MODE_RECORD: Transport supports RECORD mode
 *
 * The supported modes of the media.
  }
type
  PGstRTSPTransportMode = ^TGstRTSPTransportMode;
  TGstRTSPTransportMode =  Longint;
  Const
    GST_RTSP_TRANSPORT_MODE_PLAY = 1;
    GST_RTSP_TRANSPORT_MODE_RECORD = 2;
;
{*
 * GstRTSPPublishClockMode:
 * @GST_RTSP_PUBLISH_CLOCK_MODE_NONE: Publish nothing
 * @GST_RTSP_PUBLISH_CLOCK_MODE_CLOCK: Publish the clock but not the offset
 * @GST_RTSP_PUBLISH_CLOCK_MODE_CLOCK_AND_OFFSET: Publish the clock and offset
 *
 * Whether the clock and possibly RTP/clock offset should be published according to RFC7273.
  }
type
  PGstRTSPPublishClockMode = ^TGstRTSPPublishClockMode;
  TGstRTSPPublishClockMode =  Longint;
  Const
    GST_RTSP_PUBLISH_CLOCK_MODE_NONE = 0;
    GST_RTSP_PUBLISH_CLOCK_MODE_CLOCK = 1;
    GST_RTSP_PUBLISH_CLOCK_MODE_CLOCK_AND_OFFSET = 2;
;

{ was #define dname def_expr }
function GST_TYPE_RTSP_TRANSPORT_MODE : longint; { return type might be wrong }

function gst_rtsp_transport_mode_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_RTSP_SUSPEND_MODE : longint; { return type might be wrong }

function gst_rtsp_suspend_mode_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_RTSP_PUBLISH_CLOCK_MODE : longint; { return type might be wrong }

function gst_rtsp_publish_clock_mode_get_type:TGType;cdecl;external;
{$include "rtsp-stream.h"}
{$include "rtsp-thread-pool.h"}
{$include "rtsp-permissions.h"}
{$include "rtsp-address-pool.h"}
{$include "rtsp-sdp.h"}
{*
 * GstRTSPMedia:
 *
 * A class that contains the GStreamer element along with a list of
 * #GstRTSPStream objects that can produce data.
 *
 * This object is usually created from a #GstRTSPMediaFactory.
  }
{< private > }
type
  PGstRTSPMedia = ^TGstRTSPMedia;
  TGstRTSPMedia = record
      parent : TGObject;
      priv : PGstRTSPMediaPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstRTSPMediaClass:
 * @handle_message: handle a message
 * @prepare: the default implementation adds all elements and sets the
 *           pipeline's state to GST_STATE_PAUSED (or GST_STATE_PLAYING
 *           in case of NO_PREROLL elements).
 * @unprepare: the default implementation sets the pipeline's state
 *             to GST_STATE_NULL and removes all elements.
 * @suspend: the default implementation sets the pipeline's state to
 *           GST_STATE_NULL GST_STATE_PAUSED depending on the selected
 *           suspend mode.
 * @unsuspend: the default implementation reverts the suspend operation.
 *             The pipeline will be prerolled again if it's state was
 *             set to GST_STATE_NULL in suspend.
 * @convert_range: convert a range to the given unit
 * @query_position: query the current position in the pipeline
 * @query_stop: query when playback will stop
 *
 * The RTSP media class
  }
{ vmethods  }
{ signals  }
{< private > }
  PGstRTSPMediaClass = ^TGstRTSPMediaClass;
  TGstRTSPMediaClass = record
      parent_class : TGObjectClass;
      handle_message : function (media:PGstRTSPMedia; message:PGstMessage):Tgboolean;cdecl;
      prepare : function (media:PGstRTSPMedia; thread:PGstRTSPThread):Tgboolean;cdecl;
      unprepare : function (media:PGstRTSPMedia):Tgboolean;cdecl;
      suspend : function (media:PGstRTSPMedia):Tgboolean;cdecl;
      unsuspend : function (media:PGstRTSPMedia):Tgboolean;cdecl;
      convert_range : function (media:PGstRTSPMedia; range:PGstRTSPTimeRange; unit:TGstRTSPRangeUnit):Tgboolean;cdecl;
      query_position : function (media:PGstRTSPMedia; position:Pgint64):Tgboolean;cdecl;
      query_stop : function (media:PGstRTSPMedia; stop:Pgint64):Tgboolean;cdecl;
      create_rtpbin : function (media:PGstRTSPMedia):PGstElement;cdecl;
      setup_rtpbin : function (media:PGstRTSPMedia; rtpbin:PGstElement):Tgboolean;cdecl;
      setup_sdp : function (media:PGstRTSPMedia; sdp:PGstSDPMessage; info:PGstSDPInfo):Tgboolean;cdecl;
      new_stream : procedure (media:PGstRTSPMedia; stream:PGstRTSPStream);cdecl;
      removed_stream : procedure (media:PGstRTSPMedia; stream:PGstRTSPStream);cdecl;
      prepared : procedure (media:PGstRTSPMedia);cdecl;
      unprepared : procedure (media:PGstRTSPMedia);cdecl;
      target_state : procedure (media:PGstRTSPMedia; state:TGstState);cdecl;
      new_state : procedure (media:PGstRTSPMedia; state:TGstState);cdecl;
      handle_sdp : function (media:PGstRTSPMedia; sdp:PGstSDPMessage):Tgboolean;cdecl;
      _gst_reserved : array[0..(GST_PADDING_LARGE-1)-1] of Tgpointer;
    end;


function gst_rtsp_media_get_type:TGType;cdecl;external;
{ creating the media  }
function gst_rtsp_media_new(element:PGstElement):PGstRTSPMedia;cdecl;external;
function gst_rtsp_media_get_element(media:PGstRTSPMedia):PGstElement;cdecl;external;
procedure gst_rtsp_media_take_pipeline(media:PGstRTSPMedia; pipeline:PGstPipeline);cdecl;external;
function gst_rtsp_media_get_status(media:PGstRTSPMedia):TGstRTSPMediaStatus;cdecl;external;
procedure gst_rtsp_media_set_permissions(media:PGstRTSPMedia; permissions:PGstRTSPPermissions);cdecl;external;
function gst_rtsp_media_get_permissions(media:PGstRTSPMedia):PGstRTSPPermissions;cdecl;external;
procedure gst_rtsp_media_set_shared(media:PGstRTSPMedia; shared:Tgboolean);cdecl;external;
function gst_rtsp_media_is_shared(media:PGstRTSPMedia):Tgboolean;cdecl;external;
function gst_rtsp_media_can_be_shared(media:PGstRTSPMedia):Tgboolean;cdecl;external;
procedure gst_rtsp_media_set_stop_on_disconnect(media:PGstRTSPMedia; stop_on_disconnect:Tgboolean);cdecl;external;
function gst_rtsp_media_is_stop_on_disconnect(media:PGstRTSPMedia):Tgboolean;cdecl;external;
procedure gst_rtsp_media_set_transport_mode(media:PGstRTSPMedia; mode:TGstRTSPTransportMode);cdecl;external;
function gst_rtsp_media_get_transport_mode(media:PGstRTSPMedia):TGstRTSPTransportMode;cdecl;external;
procedure gst_rtsp_media_set_reusable(media:PGstRTSPMedia; reusable:Tgboolean);cdecl;external;
function gst_rtsp_media_is_reusable(media:PGstRTSPMedia):Tgboolean;cdecl;external;
procedure gst_rtsp_media_set_profiles(media:PGstRTSPMedia; profiles:TGstRTSPProfile);cdecl;external;
function gst_rtsp_media_get_profiles(media:PGstRTSPMedia):TGstRTSPProfile;cdecl;external;
procedure gst_rtsp_media_set_protocols(media:PGstRTSPMedia; protocols:TGstRTSPLowerTrans);cdecl;external;
function gst_rtsp_media_get_protocols(media:PGstRTSPMedia):TGstRTSPLowerTrans;cdecl;external;
procedure gst_rtsp_media_set_eos_shutdown(media:PGstRTSPMedia; eos_shutdown:Tgboolean);cdecl;external;
function gst_rtsp_media_is_eos_shutdown(media:PGstRTSPMedia):Tgboolean;cdecl;external;
procedure gst_rtsp_media_set_address_pool(media:PGstRTSPMedia; pool:PGstRTSPAddressPool);cdecl;external;
function gst_rtsp_media_get_address_pool(media:PGstRTSPMedia):PGstRTSPAddressPool;cdecl;external;
(* Const before type ignored *)
procedure gst_rtsp_media_set_multicast_iface(media:PGstRTSPMedia; multicast_iface:Pgchar);cdecl;external;
function gst_rtsp_media_get_multicast_iface(media:PGstRTSPMedia):Pgchar;cdecl;external;
procedure gst_rtsp_media_set_buffer_size(media:PGstRTSPMedia; size:Tguint);cdecl;external;
function gst_rtsp_media_get_buffer_size(media:PGstRTSPMedia):Tguint;cdecl;external;
procedure gst_rtsp_media_set_ensure_keyunit_on_start(media:PGstRTSPMedia; ensure_keyunit_on_start:Tgboolean);cdecl;external;
function gst_rtsp_media_get_ensure_keyunit_on_start(media:PGstRTSPMedia):Tgboolean;cdecl;external;
procedure gst_rtsp_media_set_ensure_keyunit_on_start_timeout(media:PGstRTSPMedia; timeout:Tguint);cdecl;external;
function gst_rtsp_media_get_ensure_keyunit_on_start_timeout(media:PGstRTSPMedia):Tguint;cdecl;external;
procedure gst_rtsp_media_set_retransmission_time(media:PGstRTSPMedia; time:TGstClockTime);cdecl;external;
function gst_rtsp_media_get_retransmission_time(media:PGstRTSPMedia):TGstClockTime;cdecl;external;
procedure gst_rtsp_media_set_do_retransmission(media:PGstRTSPMedia; do_retransmission:Tgboolean);cdecl;external;
function gst_rtsp_media_get_do_retransmission(media:PGstRTSPMedia):Tgboolean;cdecl;external;
procedure gst_rtsp_media_set_latency(media:PGstRTSPMedia; latency:Tguint);cdecl;external;
function gst_rtsp_media_get_latency(media:PGstRTSPMedia):Tguint;cdecl;external;
procedure gst_rtsp_media_use_time_provider(media:PGstRTSPMedia; time_provider:Tgboolean);cdecl;external;
function gst_rtsp_media_is_time_provider(media:PGstRTSPMedia):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_media_get_time_provider(media:PGstRTSPMedia; address:Pgchar; port:Tguint16):PGstNetTimeProvider;cdecl;external;
procedure gst_rtsp_media_set_clock(media:PGstRTSPMedia; clock:PGstClock);cdecl;external;
procedure gst_rtsp_media_set_publish_clock_mode(media:PGstRTSPMedia; mode:TGstRTSPPublishClockMode);cdecl;external;
function gst_rtsp_media_get_publish_clock_mode(media:PGstRTSPMedia):TGstRTSPPublishClockMode;cdecl;external;
function gst_rtsp_media_set_max_mcast_ttl(media:PGstRTSPMedia; ttl:Tguint):Tgboolean;cdecl;external;
function gst_rtsp_media_get_max_mcast_ttl(media:PGstRTSPMedia):Tguint;cdecl;external;
procedure gst_rtsp_media_set_bind_mcast_address(media:PGstRTSPMedia; bind_mcast_addr:Tgboolean);cdecl;external;
function gst_rtsp_media_is_bind_mcast_address(media:PGstRTSPMedia):Tgboolean;cdecl;external;
procedure gst_rtsp_media_set_dscp_qos(media:PGstRTSPMedia; dscp_qos:Tgint);cdecl;external;
function gst_rtsp_media_get_dscp_qos(media:PGstRTSPMedia):Tgint;cdecl;external;
{ prepare the media for playback  }
function gst_rtsp_media_prepare(media:PGstRTSPMedia; thread:PGstRTSPThread):Tgboolean;cdecl;external;
function gst_rtsp_media_unprepare(media:PGstRTSPMedia):Tgboolean;cdecl;external;
procedure gst_rtsp_media_set_suspend_mode(media:PGstRTSPMedia; mode:TGstRTSPSuspendMode);cdecl;external;
function gst_rtsp_media_get_suspend_mode(media:PGstRTSPMedia):TGstRTSPSuspendMode;cdecl;external;
function gst_rtsp_media_suspend(media:PGstRTSPMedia):Tgboolean;cdecl;external;
function gst_rtsp_media_unsuspend(media:PGstRTSPMedia):Tgboolean;cdecl;external;
function gst_rtsp_media_setup_sdp(media:PGstRTSPMedia; sdp:PGstSDPMessage; info:PGstSDPInfo):Tgboolean;cdecl;external;
function gst_rtsp_media_handle_sdp(media:PGstRTSPMedia; sdp:PGstSDPMessage):Tgboolean;cdecl;external;
{ creating streams  }
procedure gst_rtsp_media_collect_streams(media:PGstRTSPMedia);cdecl;external;
function gst_rtsp_media_create_stream(media:PGstRTSPMedia; payloader:PGstElement; pad:PGstPad):PGstRTSPStream;cdecl;external;
{ dealing with the media  }
procedure gst_rtsp_media_lock(media:PGstRTSPMedia);cdecl;external;
procedure gst_rtsp_media_unlock(media:PGstRTSPMedia);cdecl;external;
function gst_rtsp_media_get_clock(media:PGstRTSPMedia):PGstClock;cdecl;external;
function gst_rtsp_media_get_base_time(media:PGstRTSPMedia):TGstClockTime;cdecl;external;
function gst_rtsp_media_n_streams(media:PGstRTSPMedia):Tguint;cdecl;external;
function gst_rtsp_media_get_stream(media:PGstRTSPMedia; idx:Tguint):PGstRTSPStream;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_media_find_stream(media:PGstRTSPMedia; control:Pgchar):PGstRTSPStream;cdecl;external;
function gst_rtsp_media_seek(media:PGstRTSPMedia; range:PGstRTSPTimeRange):Tgboolean;cdecl;external;
function gst_rtsp_media_seek_full(media:PGstRTSPMedia; range:PGstRTSPTimeRange; flags:TGstSeekFlags):Tgboolean;cdecl;external;
function gst_rtsp_media_seek_trickmode(media:PGstRTSPMedia; range:PGstRTSPTimeRange; flags:TGstSeekFlags; rate:Tgdouble; trickmode_interval:TGstClockTime):Tgboolean;cdecl;external;
function gst_rtsp_media_seekable(media:PGstRTSPMedia):TGstClockTimeDiff;cdecl;external;
function gst_rtsp_media_get_range_string(media:PGstRTSPMedia; play:Tgboolean; unit:TGstRTSPRangeUnit):Pgchar;cdecl;external;
function gst_rtsp_media_get_rates(media:PGstRTSPMedia; rate:Pgdouble; applied_rate:Pgdouble):Tgboolean;cdecl;external;
function gst_rtsp_media_set_state(media:PGstRTSPMedia; state:TGstState; transports:PGPtrArray):Tgboolean;cdecl;external;
procedure gst_rtsp_media_set_pipeline_state(media:PGstRTSPMedia; state:TGstState);cdecl;external;
function gst_rtsp_media_complete_pipeline(media:PGstRTSPMedia; transports:PGPtrArray):Tgboolean;cdecl;external;
function gst_rtsp_media_is_receive_only(media:PGstRTSPMedia):Tgboolean;cdecl;external;
function gst_rtsp_media_has_completed_sender(media:PGstRTSPMedia):Tgboolean;cdecl;external;
procedure gst_rtsp_media_set_rate_control(media:PGstRTSPMedia; enabled:Tgboolean);cdecl;external;
function gst_rtsp_media_get_rate_control(media:PGstRTSPMedia):Tgboolean;cdecl;external;
{$ifdef //////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           }
{////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           (GstRTSPMedia, gst_object_unref) }
{$endif}
{$endif}
{ __GST_RTSP_MEDIA_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_RTSP_MEDIA : longint; { return type might be wrong }
  begin
    GST_TYPE_RTSP_MEDIA:=gst_rtsp_media_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_MEDIA(obj : longint) : longint;
begin
  GST_IS_RTSP_MEDIA:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_RTSP_MEDIA);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_MEDIA_CLASS(klass : longint) : longint;
begin
  GST_IS_RTSP_MEDIA_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_RTSP_MEDIA);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_MEDIA_GET_CLASS(obj : longint) : longint;
begin
  GST_RTSP_MEDIA_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_RTSP_MEDIA,GstRTSPMediaClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_MEDIA(obj : longint) : longint;
begin
  GST_RTSP_MEDIA:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_RTSP_MEDIA,GstRTSPMedia);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_MEDIA_CLASS(klass : longint) : longint;
begin
  GST_RTSP_MEDIA_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_RTSP_MEDIA,GstRTSPMediaClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_MEDIA_CAST(obj : longint) : PGstRTSPMedia;
begin
  GST_RTSP_MEDIA_CAST:=PGstRTSPMedia(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_MEDIA_CLASS_CAST(klass : longint) : PGstRTSPMediaClass;
begin
  GST_RTSP_MEDIA_CLASS_CAST:=PGstRTSPMediaClass(klass);
end;

{ was #define dname def_expr }
function GST_TYPE_RTSP_TRANSPORT_MODE : longint; { return type might be wrong }
  begin
    GST_TYPE_RTSP_TRANSPORT_MODE:=gst_rtsp_transport_mode_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_RTSP_SUSPEND_MODE : longint; { return type might be wrong }
  begin
    GST_TYPE_RTSP_SUSPEND_MODE:=gst_rtsp_suspend_mode_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_RTSP_PUBLISH_CLOCK_MODE : longint; { return type might be wrong }
  begin
    GST_TYPE_RTSP_PUBLISH_CLOCK_MODE:=gst_rtsp_publish_clock_mode_get_type;
  end;


end.
