unit rtsp_sdp;

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
{$include <gst/sdp/gstsdpmessage.h>}
{$include "rtsp-media.h"}
{$ifndef __GST_RTSP_SDP_H__}
{$define __GST_RTSP_SDP_H__}
type
  PGstSDPInfo = ^TGstSDPInfo;
  TGstSDPInfo = record
      is_ipv6 : Tgboolean;
      server_ip : Pgchar;
    end;
{ creating SDP  }

function gst_rtsp_sdp_from_media(sdp:PGstSDPMessage; info:PGstSDPInfo; media:PGstRTSPMedia):Tgboolean;cdecl;external libgstrtsp;
function gst_rtsp_sdp_from_stream(sdp:PGstSDPMessage; info:PGstSDPInfo; stream:PGstRTSPStream):Tgboolean;cdecl;external libgstrtsp;
function gst_rtsp_sdp_make_media(sdp:PGstSDPMessage; info:PGstSDPInfo; stream:PGstRTSPStream; caps:PGstCaps; profile:TGstRTSPProfile):Tgboolean;cdecl;external libgstrtsp;
{$endif}
{ __GST_RTSP_SDP_H__  }

// === Konventiert am: 20-7-26 13:46:28 ===


implementation



end.
