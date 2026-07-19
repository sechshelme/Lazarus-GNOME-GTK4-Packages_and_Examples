
unit gstrtsptransport;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstrtsptransport.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstrtsptransport.h
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
PGstRTSPLowerTrans  = ^GstRTSPLowerTrans;
PGstRTSPProfile  = ^GstRTSPProfile;
PGstRTSPRange  = ^GstRTSPRange;
PGstRTSPTransMode  = ^GstRTSPTransMode;
PGstRTSPTransport  = ^GstRTSPTransport;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) <2005,2006> Wim Taymans <wim@fluendo.com>
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
{
 * Unless otherwise indicated, Source Code is licensed under MIT license.
 * See further explanation attached in License Statement (distributed in the file
 * LICENSE).
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
 * of the Software, and to permit persons to whom the Software is furnished to do
 * so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
  }
{$ifndef __GST_RTSP_TRANSPORT_H__}
{$define __GST_RTSP_TRANSPORT_H__}
{$include <gst/gstconfig.h>}
{$include <gst/rtsp/gstrtspdefs.h>}
{$include <gst/rtsp/gstrtsp-enumtypes.h>}
{*
 * GstRTSPTransMode:
 * @GST_RTSP_TRANS_UNKNOWN: invalid tansport mode
 * @GST_RTSP_TRANS_RTP: transfer RTP data
 * @GST_RTSP_TRANS_RDT: transfer RDT (RealMedia) data
 *
 * The transfer mode to use.
  }
type
  PGstRTSPTransMode = ^TGstRTSPTransMode;
  TGstRTSPTransMode =  Longint;
  Const
    GST_RTSP_TRANS_UNKNOWN = 0;
    GST_RTSP_TRANS_RTP = 1 shl 0;
    GST_RTSP_TRANS_RDT = 1 shl 1;
;
{*
 * GstRTSPProfile:
 * @GST_RTSP_PROFILE_UNKNOWN: invalid profile
 * @GST_RTSP_PROFILE_AVP: the Audio/Visual profile (RFC 3551)
 * @GST_RTSP_PROFILE_SAVP: the secure Audio/Visual profile (RFC 3711)
 * @GST_RTSP_PROFILE_AVPF: the Audio/Visual profile with feedback (RFC 4585)
 * @GST_RTSP_PROFILE_SAVPF: the secure Audio/Visual profile with feedback (RFC 5124)
 *
 * The transfer profile to use.
  }
{ FIXME 2.0: This should probably be an enum, not flags and maybe be replaced
 * by GstRTPTransport  }
type
  PGstRTSPProfile = ^TGstRTSPProfile;
  TGstRTSPProfile =  Longint;
  Const
    GST_RTSP_PROFILE_UNKNOWN = 0;
    GST_RTSP_PROFILE_AVP = 1 shl 0;
    GST_RTSP_PROFILE_SAVP = 1 shl 1;
    GST_RTSP_PROFILE_AVPF = 1 shl 2;
    GST_RTSP_PROFILE_SAVPF = 1 shl 3;
;
{*
 * GstRTSPLowerTrans:
 * @GST_RTSP_LOWER_TRANS_UNKNOWN: invalid transport flag
 * @GST_RTSP_LOWER_TRANS_UDP: stream data over UDP
 * @GST_RTSP_LOWER_TRANS_UDP_MCAST: stream data over UDP multicast
 * @GST_RTSP_LOWER_TRANS_TCP: stream data over TCP
 * @GST_RTSP_LOWER_TRANS_HTTP: stream data tunneled over HTTP.
 * @GST_RTSP_LOWER_TRANS_TLS: encrypt TCP and HTTP with TLS
 *
 * The different transport methods.
  }
type
  PGstRTSPLowerTrans = ^TGstRTSPLowerTrans;
  TGstRTSPLowerTrans =  Longint;
  Const
    GST_RTSP_LOWER_TRANS_UNKNOWN = 0;
    GST_RTSP_LOWER_TRANS_UDP = 1 shl 0;
    GST_RTSP_LOWER_TRANS_UDP_MCAST = 1 shl 1;
    GST_RTSP_LOWER_TRANS_TCP = 1 shl 2;
    GST_RTSP_LOWER_TRANS_HTTP = 1 shl 4;
    GST_RTSP_LOWER_TRANS_TLS = 1 shl 5;
;
type
{*
 * GstRTSPRange:
 * @min: minimum value of the range
 * @max: maximum value of the range
 *
 * A type to specify a range.
  }
  PGstRTSPRange = ^TGstRTSPRange;
  TGstRTSPRange = record
      min : Tgint;
      max : Tgint;
    end;

{*
 * GstRTSPTransport:
 * @trans: the transport mode
 * @profile: the tansport profile
 * @lower_transport: the lower transport
 * @destination: the destination ip/hostname
 * @source: the source ip/hostname
 * @layers: the number of layers
 * @mode_play: if play mode was selected
 * @mode_record: if record mode was selected
 * @append: is append mode was selected
 * @interleaved: the interleave range
 * @ttl: the time to live for multicast UDP
 * @port: the port pair for multicast sessions
 * @client_port: the client port pair for receiving data. For TCP
 *   based transports, applications can use this field to store the
 *   sender and receiver ports of the client.
 * @server_port: the server port pair for receiving data. For TCP
 *   based transports, applications can use this field to store the
 *   sender and receiver ports of the server.
 * @ssrc: the ssrc that the sender/receiver will use
 *
 * A structure holding the RTSP transport values.
  }
{ multicast specific  }
{ UDP/TCP specific  }
{ RTP specific  }
{< private > }
  PGstRTSPTransport = ^TGstRTSPTransport;
  TGstRTSPTransport = record
      trans : TGstRTSPTransMode;
      profile : TGstRTSPProfile;
      lower_transport : TGstRTSPLowerTrans;
      destination : Pgchar;
      source : Pgchar;
      layers : Tguint;
      mode_play : Tgboolean;
      mode_record : Tgboolean;
      append : Tgboolean;
      interleaved : TGstRTSPRange;
      ttl : Tguint;
      port : TGstRTSPRange;
      client_port : TGstRTSPRange;
      server_port : TGstRTSPRange;
      ssrc : Tguint;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_rtsp_transport_new(transport:PPGstRTSPTransport):TGstRTSPResult;cdecl;external;
function gst_rtsp_transport_init(transport:PGstRTSPTransport):TGstRTSPResult;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_transport_parse(str:Pgchar; transport:PGstRTSPTransport):TGstRTSPResult;cdecl;external;
function gst_rtsp_transport_as_text(transport:PGstRTSPTransport):Pgchar;cdecl;external;
{GST_RTSP_DEPRECATED_FOR(gst_rtsp_transport_get_media_type) }
(* Const before type ignored *)
function gst_rtsp_transport_get_mime(trans:TGstRTSPTransMode; mime:PPgchar):TGstRTSPResult;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_transport_get_manager(trans:TGstRTSPTransMode; manager:PPgchar; option:Tguint):TGstRTSPResult;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_transport_get_media_type(transport:PGstRTSPTransport; media_type:PPgchar):TGstRTSPResult;cdecl;external;
function gst_rtsp_transport_free(transport:PGstRTSPTransport):TGstRTSPResult;cdecl;external;
{$endif}
{ __GST_RTSP_TRANSPORT_H__  }

implementation


end.
