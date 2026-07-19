
unit gstrtspdefs;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstrtspdefs.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstrtspdefs.h
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
PGstRTSPAuthMethod  = ^GstRTSPAuthMethod;
PGstRTSPEvent  = ^GstRTSPEvent;
PGstRTSPFamily  = ^GstRTSPFamily;
PGstRTSPHeaderField  = ^GstRTSPHeaderField;
PGstRTSPMethod  = ^GstRTSPMethod;
PGstRTSPResult  = ^GstRTSPResult;
PGstRTSPState  = ^GstRTSPState;
PGstRTSPStatusCode  = ^GstRTSPStatusCode;
PGstRTSPVersion  = ^GstRTSPVersion;
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
{$ifndef __GST_RTSP_DEFS_H__}
{$define __GST_RTSP_DEFS_H__}
{$include <gst/gst.h>}
{$include <gst/rtsp/rtsp-prelude.h>}
{*
 * GST_RTSP_CHECK:
 * @stmt: a statement
 * @label: a label
 *
 * Macro that checks the return value of @stmt and jumps to @label when it does
 * not equal #GST_RTSP_OK.
  }
{*
 * GstRTSPResult:
 * @GST_RTSP_OK: no error
 * @GST_RTSP_OK_REDIRECT: no error, but redirected
 * @GST_RTSP_ERROR: some unspecified error occurred
 * @GST_RTSP_EINVAL: invalid arguments were provided to a function
 * @GST_RTSP_EINTR: an operation was canceled
 * @GST_RTSP_ENOMEM: no memory was available for the operation
 * @GST_RTSP_ERESOLV: a host resolve error occurred
 * @GST_RTSP_ENOTIMPL: function not implemented
 * @GST_RTSP_ESYS: a system error occurred, errno contains more details
 * @GST_RTSP_EPARSE: a parsing error occurred
 * @GST_RTSP_EWSASTART: windows networking could not start
 * @GST_RTSP_EWSAVERSION: windows networking stack has wrong version
 * @GST_RTSP_EEOF: end-of-file was reached
 * @GST_RTSP_ENET: a network problem occurred, h_errno contains more details
 * @GST_RTSP_ENOTIP: the host is not an IP host
 * @GST_RTSP_ETIMEOUT: a timeout occurred
 * @GST_RTSP_ETGET: the tunnel GET request has been performed
 * @GST_RTSP_ETPOST: the tunnel POST request has been performed
 * @GST_RTSP_ELAST: last error
 *
 * Result codes from the RTSP functions.
  }
{*
   * GST_RTSP_OK_REDIRECT:
   *
   * RTSP request is successful, but was redirected.
   *
   * Since: 1.24
    }
{ errors  }
type
  PGstRTSPResult = ^TGstRTSPResult;
  TGstRTSPResult =  Longint;
  Const
    GST_RTSP_OK = 0;
    GST_RTSP_OK_REDIRECT = 1;
    GST_RTSP_ERROR = -(1);
    GST_RTSP_EINVAL = -(2);
    GST_RTSP_EINTR = -(3);
    GST_RTSP_ENOMEM = -(4);
    GST_RTSP_ERESOLV = -(5);
    GST_RTSP_ENOTIMPL = -(6);
    GST_RTSP_ESYS = -(7);
    GST_RTSP_EPARSE = -(8);
    GST_RTSP_EWSASTART = -(9);
    GST_RTSP_EWSAVERSION = -(10);
    GST_RTSP_EEOF = -(11);
    GST_RTSP_ENET = -(12);
    GST_RTSP_ENOTIP = -(13);
    GST_RTSP_ETIMEOUT = -(14);
    GST_RTSP_ETGET = -(15);
    GST_RTSP_ETPOST = -(16);
    GST_RTSP_ELAST = -(17);
;
{*
 * GstRTSPEvent:
 * @GST_RTSP_EV_READ: connection is readable
 * @GST_RTSP_EV_WRITE: connection is writable
 *
 * The possible events for the connection.
  }
type
  PGstRTSPEvent = ^TGstRTSPEvent;
  TGstRTSPEvent =  Longint;
  Const
    GST_RTSP_EV_READ = 1 shl 0;
    GST_RTSP_EV_WRITE = 1 shl 1;
;
{*
 * GstRTSPFamily:
 * @GST_RTSP_FAM_NONE: unknown network family
 * @GST_RTSP_FAM_INET: internet
 * @GST_RTSP_FAM_INET6: internet V6
 *
 * The possible network families.
  }
type
  PGstRTSPFamily = ^TGstRTSPFamily;
  TGstRTSPFamily =  Longint;
  Const
    GST_RTSP_FAM_NONE = 0;
    GST_RTSP_FAM_INET = 1;
    GST_RTSP_FAM_INET6 = 2;
;
{*
 * GstRTSPState:
 * @GST_RTSP_STATE_INVALID: invalid state
 * @GST_RTSP_STATE_INIT: initializing
 * @GST_RTSP_STATE_READY: ready for operation
 * @GST_RTSP_STATE_SEEKING: seeking in progress
 * @GST_RTSP_STATE_PLAYING: playing
 * @GST_RTSP_STATE_RECORDING: recording
 *
 * The different RTSP states.
  }
type
  PGstRTSPState = ^TGstRTSPState;
  TGstRTSPState =  Longint;
  Const
    GST_RTSP_STATE_INVALID = 0;
    GST_RTSP_STATE_INIT = 1;
    GST_RTSP_STATE_READY = 2;
    GST_RTSP_STATE_SEEKING = 3;
    GST_RTSP_STATE_PLAYING = 4;
    GST_RTSP_STATE_RECORDING = 5;
;
{*
 * GstRTSPVersion:
 * @GST_RTSP_VERSION_INVALID: unknown/invalid version
 * @GST_RTSP_VERSION_1_0: version 1.0
 * @GST_RTSP_VERSION_1_1: version 1.1.
 * @GST_RTSP_VERSION_2_0: version 2.0.
 *
 * The supported RTSP versions.
  }
type
  PGstRTSPVersion = ^TGstRTSPVersion;
  TGstRTSPVersion =  Longint;
  Const
    GST_RTSP_VERSION_INVALID = $00;
    GST_RTSP_VERSION_1_0 = $10;
    GST_RTSP_VERSION_1_1 = $11;
    GST_RTSP_VERSION_2_0 = $20;
;
{*
 * GstRTSPMethod:
 * @GST_RTSP_INVALID: invalid method
 * @GST_RTSP_DESCRIBE: the DESCRIBE method
 * @GST_RTSP_ANNOUNCE: the ANNOUNCE method
 * @GST_RTSP_GET_PARAMETER: the GET_PARAMETER method
 * @GST_RTSP_OPTIONS: the OPTIONS method
 * @GST_RTSP_PAUSE: the PAUSE method
 * @GST_RTSP_PLAY: the PLAY method
 * @GST_RTSP_RECORD: the RECORD method
 * @GST_RTSP_REDIRECT: the REDIRECT method
 * @GST_RTSP_SETUP: the SETUP method
 * @GST_RTSP_SET_PARAMETER: the SET_PARAMETER method
 * @GST_RTSP_TEARDOWN: the TEARDOWN method
 * @GST_RTSP_GET: the GET method (HTTP).
 * @GST_RTSP_POST: the POST method (HTTP).
 *
 * The different supported RTSP methods.
  }
type
  PGstRTSPMethod = ^TGstRTSPMethod;
  TGstRTSPMethod =  Longint;
  Const
    GST_RTSP_INVALID = 0;
    GST_RTSP_DESCRIBE = 1 shl 0;
    GST_RTSP_ANNOUNCE = 1 shl 1;
    GST_RTSP_GET_PARAMETER = 1 shl 2;
    GST_RTSP_OPTIONS = 1 shl 3;
    GST_RTSP_PAUSE = 1 shl 4;
    GST_RTSP_PLAY = 1 shl 5;
    GST_RTSP_RECORD = 1 shl 6;
    GST_RTSP_REDIRECT = 1 shl 7;
    GST_RTSP_SETUP = 1 shl 8;
    GST_RTSP_SET_PARAMETER = 1 shl 9;
    GST_RTSP_TEARDOWN = 1 shl 10;
    GST_RTSP_GET = 1 shl 11;
    GST_RTSP_POST = 1 shl 12;
;
{*
 * GstRTSPAuthMethod:
 * @GST_RTSP_AUTH_NONE: no authentication
 * @GST_RTSP_AUTH_BASIC: basic authentication
 * @GST_RTSP_AUTH_DIGEST: digest authentication
 *
 * Authentication methods, ordered by strength
  }
type
  PGstRTSPAuthMethod = ^TGstRTSPAuthMethod;
  TGstRTSPAuthMethod =  Longint;
  Const
    GST_RTSP_AUTH_NONE = $00;
    GST_RTSP_AUTH_BASIC = $01;
    GST_RTSP_AUTH_DIGEST = $02;
;
{*
 * GST_RTSP_AUTH_MAX:
 *
 * Strongest available authentication method
  }
  GST_RTSP_AUTH_MAX = GST_RTSP_AUTH_DIGEST;  
{*
 * GstRTSPHeaderField:
 *
 * Enumeration of rtsp header fields
  }
{
   * R = Request
   * r = response
   * g = general
   * e = entity
    }
{ Accept               R      opt.      entity  }
{ Accept-Encoding      R      opt.      entity  }
{ Accept-Language      R      opt.      all  }
{ Allow                r      opt.      all  }
{ Authorization        R      opt.      all  }
{ Bandwidth            R      opt.      all  }
{ Blocksize            R      opt.      all but OPTIONS, TEARDOWN  }
{ Cache-Control        g      opt.      SETUP  }
{ Conference           R      opt.      SETUP  }
{ Connection           g      req.      all  }
{ Content-Base         e      opt.      entity  }
{ Content-Encoding     e      req.      SET_PARAMETER, DESCRIBE, ANNOUNCE  }
{ Content-Language     e      req.      DESCRIBE, ANNOUNCE  }
{ Content-Length       e      req.      SET_PARAMETER, ANNOUNCE, entity  }
{ Content-Location     e      opt.      entity  }
{ Content-Type         e      req.      SET_PARAMETER, ANNOUNCE, entity  }
{ CSeq                 g      req.      all  }
{ Date                 g      opt.      all  }
{ Expires              e      opt.      DESCRIBE, ANNOUNCE  }
{ From                 R      opt.      all  }
{ If-Modified-Since    R      opt.      DESCRIBE, SETUP  }
{ Last-Modified        e      opt.      entity  }
{ Proxy-Authenticate  }
{ Proxy-Require        R      req.      all  }
{ Public               r      opt.      all  }
{ Range                Rr     opt.      PLAY, PAUSE, RECORD  }
{ Referrer              R      opt.      all  }
{ Require              R      req.      all  }
{ Retry-After          r      opt.      all  }
{ RTP-Info             r      req.      PLAY  }
{ Scale                Rr     opt.      PLAY, RECORD  }
{ Session              Rr     req.      all but SETUP, OPTIONS  }
{ Server               r      opt.      all  }
{ Speed                Rr     opt.      PLAY  }
{ Transport            Rr     req.      SETUP  }
{ Unsupported          r      req.      all  }
{ User-Agent           R      opt.      all  }
{ Via                  g      opt.      all  }
{ WWW-Authenticate     r      opt.      all  }
{ Real extensions  }
{ ClientChallenge  }
{ RealChallenge1  }
{ RealChallenge2  }
{ RealChallenge3  }
{ Subscribe  }
{ Alert  }
{ ClientID  }
{ CompanyID  }
{ GUID  }
{ RegionData  }
{ SupportsMaximumASMBandwidth  }
{ Language  }
{ PlayerStarttime  }
{ Location  }
{ ETag  }
{ If-Match  }
{ WM extensions [MS-RTSP]  }
{ Accept-Charset  }
{ Supported  }
{ Vary  }
{ X-Accelerate-Streaming  }
{ X-Accept-Authentication  }
{ X-Accept-Proxy-Authentication  }
{ X-Broadcast-Id  }
{ X-Burst-Streaming  }
{ X-Notice  }
{ X-Player-Lag-Time  }
{ X-Playlist  }
{ X-Playlist-Change-Notice  }
{ X-Playlist-Gen-Id  }
{ X-Playlist-Seek-Id  }
{ X-Proxy-Client-Agent  }
{ X-Proxy-Client-Verb  }
{ X-Receding-PlaylistChange  }
{ X-RTP-Info  }
{ X-StartupProfile  }
{ Timestamp  }
{ Authentication-Info  }
{ Host  }
{ Pragma  }
{ X-Server-IP-Address  }
{ x-sessioncookie  }
{ RTCP-Interval  }
{ Since: 1.4  }
{ KeyMgmt  }
{ Since: 1.14  }
{ Pipelined-Requests Rr     opt.      SETUP  }
{ Media-Properties   Rr     opt.      SETUP  }
{ Seek-Type          Rr     opt.      PLAY  }
{ Accept-Ranges      Rr     opt.      SETUP, GET_PARAMETER  }
{ Onvif extensions  }
{ Frames             Rr     opt.      PLAY  }
{ Rate-control       Rr     opt.      PLAY  }
type
  PGstRTSPHeaderField = ^TGstRTSPHeaderField;
  TGstRTSPHeaderField =  Longint;
  Const
    GST_RTSP_HDR_INVALID = 0;
    GST_RTSP_HDR_ACCEPT = 1;
    GST_RTSP_HDR_ACCEPT_ENCODING = 2;
    GST_RTSP_HDR_ACCEPT_LANGUAGE = 3;
    GST_RTSP_HDR_ALLOW = 4;
    GST_RTSP_HDR_AUTHORIZATION = 5;
    GST_RTSP_HDR_BANDWIDTH = 6;
    GST_RTSP_HDR_BLOCKSIZE = 7;
    GST_RTSP_HDR_CACHE_CONTROL = 8;
    GST_RTSP_HDR_CONFERENCE = 9;
    GST_RTSP_HDR_CONNECTION = 10;
    GST_RTSP_HDR_CONTENT_BASE = 11;
    GST_RTSP_HDR_CONTENT_ENCODING = 12;
    GST_RTSP_HDR_CONTENT_LANGUAGE = 13;
    GST_RTSP_HDR_CONTENT_LENGTH = 14;
    GST_RTSP_HDR_CONTENT_LOCATION = 15;
    GST_RTSP_HDR_CONTENT_TYPE = 16;
    GST_RTSP_HDR_CSEQ = 17;
    GST_RTSP_HDR_DATE = 18;
    GST_RTSP_HDR_EXPIRES = 19;
    GST_RTSP_HDR_FROM = 20;
    GST_RTSP_HDR_IF_MODIFIED_SINCE = 21;
    GST_RTSP_HDR_LAST_MODIFIED = 22;
    GST_RTSP_HDR_PROXY_AUTHENTICATE = 23;
    GST_RTSP_HDR_PROXY_REQUIRE = 24;
    GST_RTSP_HDR_PUBLIC = 25;
    GST_RTSP_HDR_RANGE = 26;
    GST_RTSP_HDR_REFERER = 27;
    GST_RTSP_HDR_REQUIRE = 28;
    GST_RTSP_HDR_RETRY_AFTER = 29;
    GST_RTSP_HDR_RTP_INFO = 30;
    GST_RTSP_HDR_SCALE = 31;
    GST_RTSP_HDR_SESSION = 32;
    GST_RTSP_HDR_SERVER = 33;
    GST_RTSP_HDR_SPEED = 34;
    GST_RTSP_HDR_TRANSPORT = 35;
    GST_RTSP_HDR_UNSUPPORTED = 36;
    GST_RTSP_HDR_USER_AGENT = 37;
    GST_RTSP_HDR_VIA = 38;
    GST_RTSP_HDR_WWW_AUTHENTICATE = 39;
    GST_RTSP_HDR_CLIENT_CHALLENGE = 40;
    GST_RTSP_HDR_REAL_CHALLENGE1 = 41;
    GST_RTSP_HDR_REAL_CHALLENGE2 = 42;
    GST_RTSP_HDR_REAL_CHALLENGE3 = 43;
    GST_RTSP_HDR_SUBSCRIBE = 44;
    GST_RTSP_HDR_ALERT = 45;
    GST_RTSP_HDR_CLIENT_ID = 46;
    GST_RTSP_HDR_COMPANY_ID = 47;
    GST_RTSP_HDR_GUID = 48;
    GST_RTSP_HDR_REGION_DATA = 49;
    GST_RTSP_HDR_MAX_ASM_WIDTH = 50;
    GST_RTSP_HDR_LANGUAGE = 51;
    GST_RTSP_HDR_PLAYER_START_TIME = 52;
    GST_RTSP_HDR_LOCATION = 53;
    GST_RTSP_HDR_ETAG = 54;
    GST_RTSP_HDR_IF_MATCH = 55;
    GST_RTSP_HDR_ACCEPT_CHARSET = 56;
    GST_RTSP_HDR_SUPPORTED = 57;
    GST_RTSP_HDR_VARY = 58;
    GST_RTSP_HDR_X_ACCELERATE_STREAMING = 59;
    GST_RTSP_HDR_X_ACCEPT_AUTHENT = 60;
    GST_RTSP_HDR_X_ACCEPT_PROXY_AUTHENT = 61;
    GST_RTSP_HDR_X_BROADCAST_ID = 62;
    GST_RTSP_HDR_X_BURST_STREAMING = 63;
    GST_RTSP_HDR_X_NOTICE = 64;
    GST_RTSP_HDR_X_PLAYER_LAG_TIME = 65;
    GST_RTSP_HDR_X_PLAYLIST = 66;
    GST_RTSP_HDR_X_PLAYLIST_CHANGE_NOTICE = 67;
    GST_RTSP_HDR_X_PLAYLIST_GEN_ID = 68;
    GST_RTSP_HDR_X_PLAYLIST_SEEK_ID = 69;
    GST_RTSP_HDR_X_PROXY_CLIENT_AGENT = 70;
    GST_RTSP_HDR_X_PROXY_CLIENT_VERB = 71;
    GST_RTSP_HDR_X_RECEDING_PLAYLISTCHANGE = 72;
    GST_RTSP_HDR_X_RTP_INFO = 73;
    GST_RTSP_HDR_X_STARTUPPROFILE = 74;
    GST_RTSP_HDR_TIMESTAMP = 75;
    GST_RTSP_HDR_AUTHENTICATION_INFO = 76;
    GST_RTSP_HDR_HOST = 77;
    GST_RTSP_HDR_PRAGMA = 78;
    GST_RTSP_HDR_X_SERVER_IP_ADDRESS = 79;
    GST_RTSP_HDR_X_SESSIONCOOKIE = 80;
    GST_RTSP_HDR_RTCP_INTERVAL = 81;
    GST_RTSP_HDR_KEYMGMT = 82;
    GST_RTSP_HDR_PIPELINED_REQUESTS = 83;
    GST_RTSP_HDR_MEDIA_PROPERTIES = 84;
    GST_RTSP_HDR_SEEK_STYLE = 85;
    GST_RTSP_HDR_ACCEPT_RANGES = 86;
    GST_RTSP_HDR_FRAMES = 87;
    GST_RTSP_HDR_RATE_CONTROL = 88;
    GST_RTSP_HDR_LAST = 89;
;
{*
 * GstRTSPStatusCode:
 *
 * Enumeration of rtsp status codes
  }
{*
   * GST_RTSP_STS_REDIRECT_TEMPORARILY:
   *
   * RTSP request is temporarily redirected
   *
   * Since: 1.24
    }
{*
   * GST_RTSP_STS_REDIRECT_PERMANENTLY:
   *
   * RTSP request is permanently redirected
   *
   * Since: 1.24
    }
{ since 1.4  }
type
  PGstRTSPStatusCode = ^TGstRTSPStatusCode;
  TGstRTSPStatusCode =  Longint;
  Const
    GST_RTSP_STS_INVALID = 0;
    GST_RTSP_STS_CONTINUE = 100;
    GST_RTSP_STS_OK = 200;
    GST_RTSP_STS_CREATED = 201;
    GST_RTSP_STS_LOW_ON_STORAGE = 250;
    GST_RTSP_STS_MULTIPLE_CHOICES = 300;
    GST_RTSP_STS_MOVED_PERMANENTLY = 301;
    GST_RTSP_STS_MOVE_TEMPORARILY = 302;
    GST_RTSP_STS_SEE_OTHER = 303;
    GST_RTSP_STS_NOT_MODIFIED = 304;
    GST_RTSP_STS_USE_PROXY = 305;
    GST_RTSP_STS_REDIRECT_TEMPORARILY = 307;
    GST_RTSP_STS_REDIRECT_PERMANENTLY = 308;
    GST_RTSP_STS_BAD_REQUEST = 400;
    GST_RTSP_STS_UNAUTHORIZED = 401;
    GST_RTSP_STS_PAYMENT_REQUIRED = 402;
    GST_RTSP_STS_FORBIDDEN = 403;
    GST_RTSP_STS_NOT_FOUND = 404;
    GST_RTSP_STS_METHOD_NOT_ALLOWED = 405;
    GST_RTSP_STS_NOT_ACCEPTABLE = 406;
    GST_RTSP_STS_PROXY_AUTH_REQUIRED = 407;
    GST_RTSP_STS_REQUEST_TIMEOUT = 408;
    GST_RTSP_STS_GONE = 410;
    GST_RTSP_STS_LENGTH_REQUIRED = 411;
    GST_RTSP_STS_PRECONDITION_FAILED = 412;
    GST_RTSP_STS_REQUEST_ENTITY_TOO_LARGE = 413;
    GST_RTSP_STS_REQUEST_URI_TOO_LARGE = 414;
    GST_RTSP_STS_UNSUPPORTED_MEDIA_TYPE = 415;
    GST_RTSP_STS_PARAMETER_NOT_UNDERSTOOD = 451;
    GST_RTSP_STS_CONFERENCE_NOT_FOUND = 452;
    GST_RTSP_STS_NOT_ENOUGH_BANDWIDTH = 453;
    GST_RTSP_STS_SESSION_NOT_FOUND = 454;
    GST_RTSP_STS_METHOD_NOT_VALID_IN_THIS_STATE = 455;
    GST_RTSP_STS_HEADER_FIELD_NOT_VALID_FOR_RESOURCE = 456;
    GST_RTSP_STS_INVALID_RANGE = 457;
    GST_RTSP_STS_PARAMETER_IS_READONLY = 458;
    GST_RTSP_STS_AGGREGATE_OPERATION_NOT_ALLOWED = 459;
    GST_RTSP_STS_ONLY_AGGREGATE_OPERATION_ALLOWED = 460;
    GST_RTSP_STS_UNSUPPORTED_TRANSPORT = 461;
    GST_RTSP_STS_DESTINATION_UNREACHABLE = 462;
    GST_RTSP_STS_KEY_MANAGEMENT_FAILURE = 463;
    GST_RTSP_STS_INTERNAL_SERVER_ERROR = 500;
    GST_RTSP_STS_NOT_IMPLEMENTED = 501;
    GST_RTSP_STS_BAD_GATEWAY = 502;
    GST_RTSP_STS_SERVICE_UNAVAILABLE = 503;
    GST_RTSP_STS_GATEWAY_TIMEOUT = 504;
    GST_RTSP_STS_RTSP_VERSION_NOT_SUPPORTED = 505;
    GST_RTSP_STS_OPTION_NOT_SUPPORTED = 551;
;

function gst_rtsp_strresult(result:TGstRTSPResult):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_method_as_text(method:TGstRTSPMethod):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_version_as_text(version:TGstRTSPVersion):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_header_as_text(field:TGstRTSPHeaderField):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_status_as_text(code:TGstRTSPStatusCode):Pgchar;cdecl;external;
function gst_rtsp_options_as_text(options:TGstRTSPMethod):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_options_from_text(options:Pgchar):TGstRTSPMethod;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_find_header_field(header:Pgchar):TGstRTSPHeaderField;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_find_method(method:Pgchar):TGstRTSPMethod;cdecl;external;
function gst_rtsp_header_allow_multiple(field:TGstRTSPHeaderField):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gst_rtsp_generate_digest_auth_response(algorithm:Pgchar; method:Pgchar; realm:Pgchar; username:Pgchar; password:Pgchar; 
           uri:Pgchar; nonce:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gst_rtsp_generate_digest_auth_response_from_md5(algorithm:Pgchar; method:Pgchar; md5:Pgchar; uri:Pgchar; nonce:Pgchar):Pgchar;cdecl;external;
{$endif}
{ __GST_RTSP_DEFS_H__  }

implementation


end.
