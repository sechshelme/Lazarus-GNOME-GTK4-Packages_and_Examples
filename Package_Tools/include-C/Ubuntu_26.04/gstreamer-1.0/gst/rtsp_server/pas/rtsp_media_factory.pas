unit rtsp_media_factory;

interface

uses
  fp_glib2, fp_gst;

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
{$include <gst/rtsp/gstrtspurl.h>}
{$include "rtsp-media.h"}
{$include "rtsp-permissions.h"}
{$include "rtsp-address-pool.h"}
{$ifndef __GST_RTSP_MEDIA_FACTORY_H__}
{$define __GST_RTSP_MEDIA_FACTORY_H__}
{ types for the media factory  }

{ was #define dname def_expr }
function GST_TYPE_RTSP_MEDIA_FACTORY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_MEDIA_FACTORY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_MEDIA_FACTORY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_MEDIA_FACTORY_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_MEDIA_FACTORY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_MEDIA_FACTORY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_MEDIA_FACTORY_CAST(obj : longint) : PGstRTSPMediaFactory;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_MEDIA_FACTORY_CLASS_CAST(klass : longint) : PGstRTSPMediaFactoryClass;

type
{*
 * GstRTSPMediaFactory:
 *
 * The definition and logic for constructing the pipeline for a media. The media
 * can contain multiple streams like audio and video.
  }
{< private > }
  PGstRTSPMediaFactory = ^TGstRTSPMediaFactory;
  TGstRTSPMediaFactory = record
      parent : TGObject;
      priv : PGstRTSPMediaFactoryPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstRTSPMediaFactoryClass:
 * @gen_key: convert @url to a key for caching shared #GstRTSPMedia objects.
 *       The default implementation of this function will use the complete URL
 *       including the query parameters to return a key.
 * @create_element: Construct and return a #GstElement that is a #GstBin containing
 *       the elements to use for streaming the media. The bin should contain
 *       payloaders pay\%d for each stream. The default implementation of this
 *       function returns the bin created from the launch parameter.
 * @construct: the vmethod that will be called when the factory has to create the
 *       #GstRTSPMedia for @url. The default implementation of this
 *       function calls create_element to retrieve an element and then looks for
 *       pay\%d to create the streams.
 * @create_pipeline: create a new pipeline or re-use an existing one and
 *       add the #GstRTSPMedia's element created by @construct to the pipeline.
 * @configure: configure the media created with @construct. The default
 *       implementation will configure the 'shared' property of the media.
 * @media_constructed: signal emitted when a media was constructed
 * @media_configure: signal emitted when a media should be configured
 *
 * The #GstRTSPMediaFactory class structure.
  }
{ signals  }
{< private > }
  PGstRTSPMediaFactoryClass = ^TGstRTSPMediaFactoryClass;
  TGstRTSPMediaFactoryClass = record
      parent_class : TGObjectClass;
      gen_key : function (factory:PGstRTSPMediaFactory; url:PGstRTSPUrl):Pgchar;cdecl;
      create_element : function (factory:PGstRTSPMediaFactory; url:PGstRTSPUrl):PGstElement;cdecl;
      construct : function (factory:PGstRTSPMediaFactory; url:PGstRTSPUrl):PGstRTSPMedia;cdecl;
      create_pipeline : function (factory:PGstRTSPMediaFactory; media:PGstRTSPMedia):PGstElement;cdecl;
      configure : procedure (factory:PGstRTSPMediaFactory; media:PGstRTSPMedia);cdecl;
      media_constructed : procedure (factory:PGstRTSPMediaFactory; media:PGstRTSPMedia);cdecl;
      media_configure : procedure (factory:PGstRTSPMediaFactory; media:PGstRTSPMedia);cdecl;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;


function gst_rtsp_media_factory_get_type:TGType;cdecl;external libgstrtsp;
{ creating the factory  }
function gst_rtsp_media_factory_new:PGstRTSPMediaFactory;cdecl;external libgstrtsp;
{ configuring the factory  }
procedure gst_rtsp_media_factory_set_launch(factory:PGstRTSPMediaFactory; launch:Pgchar);cdecl;external libgstrtsp;
function gst_rtsp_media_factory_get_launch(factory:PGstRTSPMediaFactory):Pgchar;cdecl;external libgstrtsp;
procedure gst_rtsp_media_factory_set_permissions(factory:PGstRTSPMediaFactory; permissions:PGstRTSPPermissions);cdecl;external libgstrtsp;
function gst_rtsp_media_factory_get_permissions(factory:PGstRTSPMediaFactory):PGstRTSPPermissions;cdecl;external libgstrtsp;
procedure gst_rtsp_media_factory_add_role(factory:PGstRTSPMediaFactory; role:Pgchar; fieldname:Pgchar; args:array of const);cdecl;external libgstrtsp;
procedure gst_rtsp_media_factory_add_role(factory:PGstRTSPMediaFactory; role:Pgchar; fieldname:Pgchar);cdecl;external libgstrtsp;
procedure gst_rtsp_media_factory_add_role_from_structure(factory:PGstRTSPMediaFactory; structure:PGstStructure);cdecl;external libgstrtsp;
procedure gst_rtsp_media_factory_set_shared(factory:PGstRTSPMediaFactory; shared:Tgboolean);cdecl;external libgstrtsp;
function gst_rtsp_media_factory_is_shared(factory:PGstRTSPMediaFactory):Tgboolean;cdecl;external libgstrtsp;
procedure gst_rtsp_media_factory_set_stop_on_disconnect(factory:PGstRTSPMediaFactory; stop_on_disconnect:Tgboolean);cdecl;external libgstrtsp;
function gst_rtsp_media_factory_is_stop_on_disonnect(factory:PGstRTSPMediaFactory):Tgboolean;cdecl;external libgstrtsp;
procedure gst_rtsp_media_factory_set_suspend_mode(factory:PGstRTSPMediaFactory; mode:TGstRTSPSuspendMode);cdecl;external libgstrtsp;
function gst_rtsp_media_factory_get_suspend_mode(factory:PGstRTSPMediaFactory):TGstRTSPSuspendMode;cdecl;external libgstrtsp;
procedure gst_rtsp_media_factory_set_eos_shutdown(factory:PGstRTSPMediaFactory; eos_shutdown:Tgboolean);cdecl;external libgstrtsp;
function gst_rtsp_media_factory_is_eos_shutdown(factory:PGstRTSPMediaFactory):Tgboolean;cdecl;external libgstrtsp;
procedure gst_rtsp_media_factory_set_profiles(factory:PGstRTSPMediaFactory; profiles:TGstRTSPProfile);cdecl;external libgstrtsp;
function gst_rtsp_media_factory_get_profiles(factory:PGstRTSPMediaFactory):TGstRTSPProfile;cdecl;external libgstrtsp;
procedure gst_rtsp_media_factory_set_protocols(factory:PGstRTSPMediaFactory; protocols:TGstRTSPLowerTrans);cdecl;external libgstrtsp;
function gst_rtsp_media_factory_get_protocols(factory:PGstRTSPMediaFactory):TGstRTSPLowerTrans;cdecl;external libgstrtsp;
procedure gst_rtsp_media_factory_set_address_pool(factory:PGstRTSPMediaFactory; pool:PGstRTSPAddressPool);cdecl;external libgstrtsp;
function gst_rtsp_media_factory_get_address_pool(factory:PGstRTSPMediaFactory):PGstRTSPAddressPool;cdecl;external libgstrtsp;
procedure gst_rtsp_media_factory_set_multicast_iface(factory:PGstRTSPMediaFactory; multicast_iface:Pgchar);cdecl;external libgstrtsp;
function gst_rtsp_media_factory_get_multicast_iface(factory:PGstRTSPMediaFactory):Pgchar;cdecl;external libgstrtsp;
procedure gst_rtsp_media_factory_set_buffer_size(factory:PGstRTSPMediaFactory; size:Tguint);cdecl;external libgstrtsp;
function gst_rtsp_media_factory_get_buffer_size(factory:PGstRTSPMediaFactory):Tguint;cdecl;external libgstrtsp;
procedure gst_rtsp_media_factory_set_ensure_keyunit_on_start(factory:PGstRTSPMediaFactory; ensure_keyunit_on_start:Tgboolean);cdecl;external libgstrtsp;
function gst_rtsp_media_factory_get_ensure_keyunit_on_start(factory:PGstRTSPMediaFactory):Tgboolean;cdecl;external libgstrtsp;
procedure gst_rtsp_media_factory_set_ensure_keyunit_on_start_timeout(factory:PGstRTSPMediaFactory; timeout:Tguint);cdecl;external libgstrtsp;
function gst_rtsp_media_factory_get_ensure_keyunit_on_start_timeout(factory:PGstRTSPMediaFactory):Tguint;cdecl;external libgstrtsp;
procedure gst_rtsp_media_factory_set_retransmission_time(factory:PGstRTSPMediaFactory; time:TGstClockTime);cdecl;external libgstrtsp;
function gst_rtsp_media_factory_get_retransmission_time(factory:PGstRTSPMediaFactory):TGstClockTime;cdecl;external libgstrtsp;
procedure gst_rtsp_media_factory_set_do_retransmission(factory:PGstRTSPMediaFactory; do_retransmission:Tgboolean);cdecl;external libgstrtsp;
function gst_rtsp_media_factory_get_do_retransmission(factory:PGstRTSPMediaFactory):Tgboolean;cdecl;external libgstrtsp;
procedure gst_rtsp_media_factory_set_latency(factory:PGstRTSPMediaFactory; latency:Tguint);cdecl;external libgstrtsp;
function gst_rtsp_media_factory_get_latency(factory:PGstRTSPMediaFactory):Tguint;cdecl;external libgstrtsp;
procedure gst_rtsp_media_factory_set_transport_mode(factory:PGstRTSPMediaFactory; mode:TGstRTSPTransportMode);cdecl;external libgstrtsp;
function gst_rtsp_media_factory_get_transport_mode(factory:PGstRTSPMediaFactory):TGstRTSPTransportMode;cdecl;external libgstrtsp;
procedure gst_rtsp_media_factory_set_media_gtype(factory:PGstRTSPMediaFactory; media_gtype:TGType);cdecl;external libgstrtsp;
function gst_rtsp_media_factory_get_media_gtype(factory:PGstRTSPMediaFactory):TGType;cdecl;external libgstrtsp;
procedure gst_rtsp_media_factory_set_clock(factory:PGstRTSPMediaFactory; clock:PGstClock);cdecl;external libgstrtsp;
function gst_rtsp_media_factory_get_clock(factory:PGstRTSPMediaFactory):PGstClock;cdecl;external libgstrtsp;
procedure gst_rtsp_media_factory_set_publish_clock_mode(factory:PGstRTSPMediaFactory; mode:TGstRTSPPublishClockMode);cdecl;external libgstrtsp;
function gst_rtsp_media_factory_get_publish_clock_mode(factory:PGstRTSPMediaFactory):TGstRTSPPublishClockMode;cdecl;external libgstrtsp;
function gst_rtsp_media_factory_set_max_mcast_ttl(factory:PGstRTSPMediaFactory; ttl:Tguint):Tgboolean;cdecl;external libgstrtsp;
function gst_rtsp_media_factory_get_max_mcast_ttl(factory:PGstRTSPMediaFactory):Tguint;cdecl;external libgstrtsp;
procedure gst_rtsp_media_factory_set_bind_mcast_address(factory:PGstRTSPMediaFactory; bind_mcast_addr:Tgboolean);cdecl;external libgstrtsp;
function gst_rtsp_media_factory_is_bind_mcast_address(factory:PGstRTSPMediaFactory):Tgboolean;cdecl;external libgstrtsp;
procedure gst_rtsp_media_factory_set_dscp_qos(factory:PGstRTSPMediaFactory; dscp_qos:Tgint);cdecl;external libgstrtsp;
function gst_rtsp_media_factory_get_dscp_qos(factory:PGstRTSPMediaFactory):Tgint;cdecl;external libgstrtsp;
procedure gst_rtsp_media_factory_set_enable_rtcp(factory:PGstRTSPMediaFactory; enable:Tgboolean);cdecl;external libgstrtsp;
function gst_rtsp_media_factory_is_enable_rtcp(factory:PGstRTSPMediaFactory):Tgboolean;cdecl;external libgstrtsp;
{ creating the media from the factory and a url  }
function gst_rtsp_media_factory_construct(factory:PGstRTSPMediaFactory; url:PGstRTSPUrl):PGstRTSPMedia;cdecl;external libgstrtsp;
function gst_rtsp_media_factory_create_element(factory:PGstRTSPMediaFactory; url:PGstRTSPUrl):PGstElement;cdecl;external libgstrtsp;
{$ifdef //////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           }
{////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           (GstRTSPMediaFactory, gst_object_unref) }
{$endif}
{$endif}
{ __GST_RTSP_MEDIA_FACTORY_H__  }

// === Konventiert am: 20-7-26 13:45:31 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_RTSP_MEDIA_FACTORY : longint; { return type might be wrong }
  begin
    GST_TYPE_RTSP_MEDIA_FACTORY:=gst_rtsp_media_factory_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_MEDIA_FACTORY(obj : longint) : longint;
begin
  GST_IS_RTSP_MEDIA_FACTORY:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_RTSP_MEDIA_FACTORY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_MEDIA_FACTORY_CLASS(klass : longint) : longint;
begin
  GST_IS_RTSP_MEDIA_FACTORY_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_RTSP_MEDIA_FACTORY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_MEDIA_FACTORY_GET_CLASS(obj : longint) : longint;
begin
  GST_RTSP_MEDIA_FACTORY_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_RTSP_MEDIA_FACTORY,GstRTSPMediaFactoryClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_MEDIA_FACTORY(obj : longint) : longint;
begin
  GST_RTSP_MEDIA_FACTORY:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_RTSP_MEDIA_FACTORY,GstRTSPMediaFactory);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_MEDIA_FACTORY_CLASS(klass : longint) : longint;
begin
  GST_RTSP_MEDIA_FACTORY_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_RTSP_MEDIA_FACTORY,GstRTSPMediaFactoryClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_MEDIA_FACTORY_CAST(obj : longint) : PGstRTSPMediaFactory;
begin
  GST_RTSP_MEDIA_FACTORY_CAST:=PGstRTSPMediaFactory(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_MEDIA_FACTORY_CLASS_CAST(klass : longint) : PGstRTSPMediaFactoryClass;
begin
  GST_RTSP_MEDIA_FACTORY_CLASS_CAST:=PGstRTSPMediaFactoryClass(klass);
end;


end.
