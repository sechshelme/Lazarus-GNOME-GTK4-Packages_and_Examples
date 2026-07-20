
unit rtsp_sdp;
interface

{
  Automatically converted by H2Pas 1.0.0 from rtsp_sdp.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rtsp_sdp.h
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
PGstRTSPMedia  = ^GstRTSPMedia;
PGstRTSPStream  = ^GstRTSPStream;
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
{$include <gst/sdp/gstsdpmessage.h>}
{$include "rtsp-media.h"}
{$ifndef __GST_RTSP_SDP_H__}
{$define __GST_RTSP_SDP_H__}
(* Const before type ignored *)
type
  PGstSDPInfo = ^TGstSDPInfo;
  TGstSDPInfo = record
      is_ipv6 : Tgboolean;
      server_ip : Pgchar;
    end;
{ creating SDP  }

function gst_rtsp_sdp_from_media(sdp:PGstSDPMessage; info:PGstSDPInfo; media:PGstRTSPMedia):Tgboolean;cdecl;external;
function gst_rtsp_sdp_from_stream(sdp:PGstSDPMessage; info:PGstSDPInfo; stream:PGstRTSPStream):Tgboolean;cdecl;external;
function gst_rtsp_sdp_make_media(sdp:PGstSDPMessage; info:PGstSDPInfo; stream:PGstRTSPStream; caps:PGstCaps; profile:TGstRTSPProfile):Tgboolean;cdecl;external;
{$endif}
{ __GST_RTSP_SDP_H__  }

implementation


end.
