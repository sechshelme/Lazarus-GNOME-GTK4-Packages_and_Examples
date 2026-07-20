unit rtsp_onvif_media_factory;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2017 Sebastian Dröge <sebastian@centricular.com>
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
{$ifndef __GST_RTSP_ONVIF_MEDIA_FACTORY_H__}
{$define __GST_RTSP_ONVIF_MEDIA_FACTORY_H__}
{$include <gst/gst.h>}
{$include "rtsp-media-factory.h"}
{$include "rtsp-onvif-media.h"}

{ was #define dname def_expr }
function GST_TYPE_RTSP_ONVIF_MEDIA_FACTORY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_ONVIF_MEDIA_FACTORY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_ONVIF_MEDIA_FACTORY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ONVIF_MEDIA_FACTORY_GET_CLASS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ONVIF_MEDIA_FACTORY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ONVIF_MEDIA_FACTORY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_ONVIF_MEDIA_FACTORY_CAST(obj : longint) : PGstRTSPOnvifMediaFactory;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_ONVIF_MEDIA_FACTORY_CLASS_CAST(klass : longint) : PGstRTSPOnvifMediaFactoryClass;

type
{*
 * GstRTSPOnvifMediaFactory:
 *
 * Since: 1.14
  }
{*
   * GstRTSPOnvifMediaFactoryClass::create_backchannel_stream:
   * @factory: a #GstRTSPOnvifMediaFactory
   * @media: a #GstRTSPOnvifMedia
   * @ctx: a #GstRTSPContext
   *
   * Called by the factory from #GstRTSPMediaFactoryClass::construct(). The default implementation
   * creates the * #GstRTSPStream for the backchannel receiver by calling
   * gst_rtsp_onvif_media_collect_backchannel (media). Implementations
   * that want to create the backchannel later should return TRUE here
   * and call gst_rtsp_onvif_media_collect_backchannel() later, but must
   * do so before the media finishes preparing.
   *
   * Returns: TRUE on success. FALSE on a fatal error.
   *
   * Since: 1.26
    }
{< private > }
  PGstRTSPOnvifMediaFactoryClass = ^TGstRTSPOnvifMediaFactoryClass;
  TGstRTSPOnvifMediaFactoryClass = record
      parent : TGstRTSPMediaFactoryClass;
      has_backchannel_support : function (factory:PGstRTSPOnvifMediaFactory):Tgboolean;cdecl;
      create_backchannel_stream : function (factory:PGstRTSPOnvifMediaFactory; media:PGstRTSPOnvifMedia; ctx:PGstRTSPContext):Tgboolean;cdecl;
      _gst_reserved : array[0..(GST_PADDING_LARGE-1)-1] of Tgpointer;
    end;

{< private > }
  PGstRTSPOnvifMediaFactory = ^TGstRTSPOnvifMediaFactory;
  TGstRTSPOnvifMediaFactory = record
      parent : TGstRTSPMediaFactory;
      priv : PGstRTSPOnvifMediaFactoryPrivate;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_rtsp_onvif_media_factory_get_type:TGType;cdecl;external libgstrtsp;
function gst_rtsp_onvif_media_factory_new:PGstRTSPMediaFactory;cdecl;external libgstrtsp;
procedure gst_rtsp_onvif_media_factory_set_backchannel_launch(factory:PGstRTSPOnvifMediaFactory; launch:Pgchar);cdecl;external libgstrtsp;
function gst_rtsp_onvif_media_factory_get_backchannel_launch(factory:PGstRTSPOnvifMediaFactory):Pgchar;cdecl;external libgstrtsp;
function gst_rtsp_onvif_media_factory_has_backchannel_support(factory:PGstRTSPOnvifMediaFactory):Tgboolean;cdecl;external libgstrtsp;
function gst_rtsp_onvif_media_factory_has_replay_support(factory:PGstRTSPOnvifMediaFactory):Tgboolean;cdecl;external libgstrtsp;
procedure gst_rtsp_onvif_media_factory_set_replay_support(factory:PGstRTSPOnvifMediaFactory; has_replay_support:Tgboolean);cdecl;external libgstrtsp;
procedure gst_rtsp_onvif_media_factory_set_backchannel_bandwidth(factory:PGstRTSPOnvifMediaFactory; bandwidth:Tguint);cdecl;external libgstrtsp;
function gst_rtsp_onvif_media_factory_get_backchannel_bandwidth(factory:PGstRTSPOnvifMediaFactory):Tguint;cdecl;external libgstrtsp;
function gst_rtsp_onvif_media_factory_requires_backchannel(factory:PGstRTSPMediaFactory; ctx:PGstRTSPContext):Tgboolean;cdecl;external libgstrtsp;
{$ifdef //////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           }
{////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           (GstRTSPOnvifMediaFactory, gst_object_unref) }
{$endif}
{$endif}
{ __GST_RTSP_ONVIF_MEDIA_FACTORY_H__  }

// === Konventiert am: 20-7-26 13:45:01 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_RTSP_ONVIF_MEDIA_FACTORY : longint; { return type might be wrong }
  begin
    GST_TYPE_RTSP_ONVIF_MEDIA_FACTORY:=gst_rtsp_onvif_media_factory_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_ONVIF_MEDIA_FACTORY(obj : longint) : longint;
begin
  GST_IS_RTSP_ONVIF_MEDIA_FACTORY:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_RTSP_ONVIF_MEDIA_FACTORY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_ONVIF_MEDIA_FACTORY_CLASS(klass : longint) : longint;
begin
  GST_IS_RTSP_ONVIF_MEDIA_FACTORY_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_RTSP_ONVIF_MEDIA_FACTORY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ONVIF_MEDIA_FACTORY_GET_CLASS(obj : longint) : longint;
begin
  GST_RTSP_ONVIF_MEDIA_FACTORY_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_RTSP_ONVIF_MEDIA_FACTORY,GstRTSPOnvifMediaFactoryClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ONVIF_MEDIA_FACTORY(obj : longint) : longint;
begin
  GST_RTSP_ONVIF_MEDIA_FACTORY:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_RTSP_ONVIF_MEDIA_FACTORY,GstRTSPOnvifMediaFactory);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_ONVIF_MEDIA_FACTORY_CLASS(klass : longint) : longint;
begin
  GST_RTSP_ONVIF_MEDIA_FACTORY_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_RTSP_ONVIF_MEDIA_FACTORY,GstRTSPOnvifMediaFactoryClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_ONVIF_MEDIA_FACTORY_CAST(obj : longint) : PGstRTSPOnvifMediaFactory;
begin
  GST_RTSP_ONVIF_MEDIA_FACTORY_CAST:=PGstRTSPOnvifMediaFactory(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_ONVIF_MEDIA_FACTORY_CLASS_CAST(klass : longint) : PGstRTSPOnvifMediaFactoryClass;
begin
  GST_RTSP_ONVIF_MEDIA_FACTORY_CLASS_CAST:=PGstRTSPOnvifMediaFactoryClass(klass);
end;


end.
