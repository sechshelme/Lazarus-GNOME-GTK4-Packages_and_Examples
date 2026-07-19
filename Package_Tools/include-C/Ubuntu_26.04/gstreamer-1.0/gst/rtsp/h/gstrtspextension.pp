
unit gstrtspextension;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstrtspextension.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstrtspextension.h
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
PGstCaps  = ^GstCaps;
PGstRTSPExtension  = ^GstRTSPExtension;
PGstRTSPExtensionInterface  = ^GstRTSPExtensionInterface;
PGstRTSPMessage  = ^GstRTSPMessage;
PGstRTSPUrl  = ^GstRTSPUrl;
PGstSDPMedia  = ^GstSDPMedia;
PGstSDPMessage  = ^GstSDPMessage;
PGstStructure  = ^GstStructure;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer RTSP Extension
 * Copyright (C) 2007 Wim Taymans <wim@fluendo.com>
 *
 * gstrtspextension.h: RTSP Extension interface.
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
{$ifndef __GST_RTSP_EXTENSION_H__}
{$define __GST_RTSP_EXTENSION_H__}
{$include <gst/gst.h>}
{$include <gst/sdp/gstsdpmessage.h>}
{$include <gst/rtsp/gstrtsptransport.h>}
{$include <gst/rtsp/gstrtspmessage.h>}
{$include <gst/rtsp/gstrtspurl.h>}

{ was #define dname def_expr }
function GST_TYPE_RTSP_EXTENSION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_EXTENSION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_EXTENSION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_EXTENSION_GET_INTERFACE(inst : longint) : longint;

{*
 * GstRTSPExtensionInterface:
 *
 * An interface representing RTSP extensions.
  }
type
{ vfunctions  }
{ signals  }
{ ABI: more vfunctions added later  }
{< private > }
  PGstRTSPExtensionInterface = ^TGstRTSPExtensionInterface;
  TGstRTSPExtensionInterface = record
      parent : TGTypeInterface;
      detect_server : function (ext:PGstRTSPExtension; resp:PGstRTSPMessage):Tgboolean;cdecl;
      before_send : function (ext:PGstRTSPExtension; req:PGstRTSPMessage):TGstRTSPResult;cdecl;
      after_send : function (ext:PGstRTSPExtension; req:PGstRTSPMessage; resp:PGstRTSPMessage):TGstRTSPResult;cdecl;
      parse_sdp : function (ext:PGstRTSPExtension; sdp:PGstSDPMessage; s:PGstStructure):TGstRTSPResult;cdecl;
      setup_media : function (ext:PGstRTSPExtension; media:PGstSDPMedia):TGstRTSPResult;cdecl;
      configure_stream : function (ext:PGstRTSPExtension; caps:PGstCaps):Tgboolean;cdecl;
      get_transports : function (ext:PGstRTSPExtension; protocols:TGstRTSPLowerTrans; transport:PPgchar):TGstRTSPResult;cdecl;
      stream_select : function (ext:PGstRTSPExtension; url:PGstRTSPUrl):TGstRTSPResult;cdecl;
      send : function (ext:PGstRTSPExtension; req:PGstRTSPMessage; resp:PGstRTSPMessage):TGstRTSPResult;cdecl;
      receive_request : function (ext:PGstRTSPExtension; req:PGstRTSPMessage):TGstRTSPResult;cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_rtsp_extension_get_type:TGType;cdecl;external;
{ invoke vfunction on interface  }
function gst_rtsp_extension_detect_server(ext:PGstRTSPExtension; resp:PGstRTSPMessage):Tgboolean;cdecl;external;
function gst_rtsp_extension_before_send(ext:PGstRTSPExtension; req:PGstRTSPMessage):TGstRTSPResult;cdecl;external;
function gst_rtsp_extension_after_send(ext:PGstRTSPExtension; req:PGstRTSPMessage; resp:PGstRTSPMessage):TGstRTSPResult;cdecl;external;
function gst_rtsp_extension_parse_sdp(ext:PGstRTSPExtension; sdp:PGstSDPMessage; s:PGstStructure):TGstRTSPResult;cdecl;external;
function gst_rtsp_extension_setup_media(ext:PGstRTSPExtension; media:PGstSDPMedia):TGstRTSPResult;cdecl;external;
function gst_rtsp_extension_configure_stream(ext:PGstRTSPExtension; caps:PGstCaps):Tgboolean;cdecl;external;
function gst_rtsp_extension_get_transports(ext:PGstRTSPExtension; protocols:TGstRTSPLowerTrans; transport:PPgchar):TGstRTSPResult;cdecl;external;
function gst_rtsp_extension_stream_select(ext:PGstRTSPExtension; url:PGstRTSPUrl):TGstRTSPResult;cdecl;external;
function gst_rtsp_extension_receive_request(ext:PGstRTSPExtension; req:PGstRTSPMessage):TGstRTSPResult;cdecl;external;
{ signal emission  }
function gst_rtsp_extension_send(ext:PGstRTSPExtension; req:PGstRTSPMessage; resp:PGstRTSPMessage):TGstRTSPResult;cdecl;external;
{$endif}
{ __GST_RTSP_EXTENSION_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_RTSP_EXTENSION : longint; { return type might be wrong }
  begin
    GST_TYPE_RTSP_EXTENSION:=gst_rtsp_extension_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_EXTENSION(obj : longint) : longint;
begin
  GST_RTSP_EXTENSION:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_RTSP_EXTENSION,GstRTSPExtension);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_RTSP_EXTENSION(obj : longint) : longint;
begin
  GST_IS_RTSP_EXTENSION:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_RTSP_EXTENSION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_EXTENSION_GET_INTERFACE(inst : longint) : longint;
begin
  GST_RTSP_EXTENSION_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(inst,GST_TYPE_RTSP_EXTENSION,GstRTSPExtensionInterface);
end;


end.
