
unit gstrtspurl;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstrtspurl.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstrtspurl.h
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
PGstRTSPUrl  = ^GstRTSPUrl;
Pguint16  = ^guint16;
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
{$ifndef __GST_RTSP_URL_H__}
{$define __GST_RTSP_URL_H__}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <gst/rtsp/gstrtspdefs.h>}
{$include <gst/rtsp/gstrtsptransport.h>}
{*
 * GST_RTSP_DEFAULT_PORT:
 *
 * The default RTSP port to connect to.
  }

const
  GST_RTSP_DEFAULT_PORT = 554;  

{ was #define dname def_expr }
function GST_TYPE_RTSP_URL : longint; { return type might be wrong }

type
{*
 * GstRTSPUrl:
 * @transports: the transports allowed
 * @family: the family
 * @user: the user
 * @passwd: the password
 * @host: the host
 * @port: the port
 * @abspath: the absolute path
 * @query: additional query parameters
 *
 * This structure contains the result of a parsed RTSP URL
  }
  PGstRTSPUrl = ^TGstRTSPUrl;
  TGstRTSPUrl = record
      transports : TGstRTSPLowerTrans;
      family : TGstRTSPFamily;
      user : Pgchar;
      passwd : Pgchar;
      host : Pgchar;
      port : Tguint16;
      abspath : Pgchar;
      query : Pgchar;
    end;


function gst_rtsp_url_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_url_parse(urlstr:Pgchar; url:PPGstRTSPUrl):TGstRTSPResult;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_url_copy(url:PGstRTSPUrl):PGstRTSPUrl;cdecl;external;
procedure gst_rtsp_url_free(url:PGstRTSPUrl);cdecl;external;
(* Const before type ignored *)
function gst_rtsp_url_get_request_uri(url:PGstRTSPUrl):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_rtsp_url_get_request_uri_with_control(url:PGstRTSPUrl; control_path:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_url_decode_path_components(url:PGstRTSPUrl):^Pgchar;cdecl;external;
function gst_rtsp_url_set_port(url:PGstRTSPUrl; port:Tguint16):TGstRTSPResult;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_url_get_port(url:PGstRTSPUrl; port:Pguint16):TGstRTSPResult;cdecl;external;
{//////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC          (GstRTSPUrl, gst_rtsp_url_free) }
{$endif}
{ __GST_RTSP_URL_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_RTSP_URL : longint; { return type might be wrong }
  begin
    GST_TYPE_RTSP_URL:=gst_rtsp_url_get_type;
  end;


end.
