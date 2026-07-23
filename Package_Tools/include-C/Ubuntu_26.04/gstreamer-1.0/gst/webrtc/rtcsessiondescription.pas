unit rtcsessiondescription;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2017 Matthew Waters <matthew@centricular.com>
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
{$ifndef __GST_WEBRTC_SESSION_DESCRIPTION_H__}
{$define __GST_WEBRTC_SESSION_DESCRIPTION_H__}
{$include <gst/gst.h>}
{$include <gst/sdp/sdp.h>}
{$include <gst/webrtc/webrtc_fwd.h>}

function gst_webrtc_sdp_type_to_string(_type:TGstWebRTCSDPType):Pgchar;cdecl;external libgstwebrtc;
function gst_webrtc_session_description_get_type:TGType;cdecl;external libgstwebrtc;
{*
 * GstWebRTCSessionDescription:
 * @type: the #GstWebRTCSDPType of the description
 * @sdp: the #GstSDPMessage of the description
 *
 * See <https://www.w3.org/TR/webrtc/#rtcsessiondescription-class>
  }
type
  PGstWebRTCSessionDescription = ^TGstWebRTCSessionDescription;
  TGstWebRTCSessionDescription = record
      _type : TGstWebRTCSDPType;
      sdp : PGstSDPMessage;
    end;


function gst_webrtc_session_description_new(_type:TGstWebRTCSDPType; sdp:PGstSDPMessage):PGstWebRTCSessionDescription;cdecl;external libgstwebrtc;
function gst_webrtc_session_description_copy(src:PGstWebRTCSessionDescription):PGstWebRTCSessionDescription;cdecl;external libgstwebrtc;
procedure gst_webrtc_session_description_free(desc:PGstWebRTCSessionDescription);cdecl;external libgstwebrtc;
{//////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                (GstWebRTCSessionDescription, gst_webrtc_session_description_free) }
{$endif}
{ __GST_WEBRTC_PEERCONNECTION_H__  }

// === Konventiert am: 23-7-26 14:12:24 ===

function GST_TYPE_WEBRTC_SESSION_DESCRIPTION : TGType;

implementation

function GST_TYPE_WEBRTC_SESSION_DESCRIPTION : TGType;
  begin
    GST_TYPE_WEBRTC_SESSION_DESCRIPTION:=gst_webrtc_session_description_get_type;
  end;



end.
