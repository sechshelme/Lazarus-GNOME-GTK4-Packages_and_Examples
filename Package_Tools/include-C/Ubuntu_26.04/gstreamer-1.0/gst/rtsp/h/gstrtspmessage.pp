
unit gstrtspmessage;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstrtspmessage.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstrtspmessage.h
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
PGArray  = ^GArray;
Pgchar  = ^gchar;
PGstBuffer  = ^GstBuffer;
PGString  = ^GString;
PGstRTSPAuthCredential  = ^GstRTSPAuthCredential;
PGstRTSPAuthParam  = ^GstRTSPAuthParam;
PGstRTSPMessage  = ^GstRTSPMessage;
PGstRTSPMethod  = ^GstRTSPMethod;
PGstRTSPMsgType  = ^GstRTSPMsgType;
PGstRTSPStatusCode  = ^GstRTSPStatusCode;
PGstRTSPVersion  = ^GstRTSPVersion;
Pguint  = ^guint;
Pguint8  = ^guint8;
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
{$ifndef __GST_RTSP_MESSAGE_H__}
{$define __GST_RTSP_MESSAGE_H__}
{$include <gst/gst.h>}
{$include <gst/rtsp/gstrtspdefs.h>}
{*
 * GstRTSPMsgType:
 * @GST_RTSP_MESSAGE_INVALID: invalid message type
 * @GST_RTSP_MESSAGE_REQUEST: RTSP request message
 * @GST_RTSP_MESSAGE_RESPONSE: RTSP response message
 * @GST_RTSP_MESSAGE_HTTP_REQUEST: HTTP request message.
 * @GST_RTSP_MESSAGE_HTTP_RESPONSE: HTTP response message.
 * @GST_RTSP_MESSAGE_DATA: data message
 *
 * The type of a message.
  }
type
  PGstRTSPMsgType = ^TGstRTSPMsgType;
  TGstRTSPMsgType =  Longint;
  Const
    GST_RTSP_MESSAGE_INVALID = 0;
    GST_RTSP_MESSAGE_REQUEST = 1;
    GST_RTSP_MESSAGE_RESPONSE = 2;
    GST_RTSP_MESSAGE_HTTP_REQUEST = 3;
    GST_RTSP_MESSAGE_HTTP_RESPONSE = 4;
    GST_RTSP_MESSAGE_DATA = 5;
;
type
{*
 * GstRTSPMessage:
 * @type: the message type
 *
 * An RTSP message containing request, response or data messages. Depending on
 * the @type, the appropriate structure may be accessed.
  }
{< private > }
  PGstRTSPMessage = ^TGstRTSPMessage;
  TGstRTSPMessage = record
      _type : TGstRTSPMsgType;
      type_data : record
          case longint of
            0 : ( request : record
                method : TGstRTSPMethod;
                uri : Pgchar;
                version : TGstRTSPVersion;
              end );
            1 : ( response : record
                code : TGstRTSPStatusCode;
                reason : Pgchar;
                version : TGstRTSPVersion;
              end );
            2 : ( data : record
                channel : Tguint8;
              end );
          end;
      hdr_fields : PGArray;
      body : Pguint8;
      body_size : Tguint;
      body_buffer : PGstBuffer;
      _gst_reserved : array[0..(GST_PADDING-1)-1] of Tgpointer;
    end;


function gst_rtsp_msg_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_RTSP_MESSAGE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_MESSAGE_CAST(object : longint) : PGstRTSPMessage;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_MESSAGE(object : longint) : longint;

{ memory management  }
function gst_rtsp_message_new(msg:PPGstRTSPMessage):TGstRTSPResult;cdecl;external;
function gst_rtsp_message_init(msg:PGstRTSPMessage):TGstRTSPResult;cdecl;external;
function gst_rtsp_message_unset(msg:PGstRTSPMessage):TGstRTSPResult;cdecl;external;
function gst_rtsp_message_free(msg:PGstRTSPMessage):TGstRTSPResult;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_message_copy(msg:PGstRTSPMessage; copy:PPGstRTSPMessage):TGstRTSPResult;cdecl;external;
function gst_rtsp_message_get_type(msg:PGstRTSPMessage):TGstRTSPMsgType;cdecl;external;
{ request  }
(* Const before type ignored *)
function gst_rtsp_message_new_request(msg:PPGstRTSPMessage; method:TGstRTSPMethod; uri:Pgchar):TGstRTSPResult;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_message_init_request(msg:PGstRTSPMessage; method:TGstRTSPMethod; uri:Pgchar):TGstRTSPResult;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_message_parse_request(msg:PGstRTSPMessage; method:PGstRTSPMethod; uri:PPgchar; version:PGstRTSPVersion):TGstRTSPResult;cdecl;external;
{ response  }
(* Const before type ignored *)
(* Const before type ignored *)
function gst_rtsp_message_new_response(msg:PPGstRTSPMessage; code:TGstRTSPStatusCode; reason:Pgchar; request:PGstRTSPMessage):TGstRTSPResult;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_rtsp_message_init_response(msg:PGstRTSPMessage; code:TGstRTSPStatusCode; reason:Pgchar; request:PGstRTSPMessage):TGstRTSPResult;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_message_parse_response(msg:PGstRTSPMessage; code:PGstRTSPStatusCode; reason:PPgchar; version:PGstRTSPVersion):TGstRTSPResult;cdecl;external;
{ data  }
function gst_rtsp_message_new_data(msg:PPGstRTSPMessage; channel:Tguint8):TGstRTSPResult;cdecl;external;
function gst_rtsp_message_init_data(msg:PGstRTSPMessage; channel:Tguint8):TGstRTSPResult;cdecl;external;
function gst_rtsp_message_parse_data(msg:PGstRTSPMessage; channel:Pguint8):TGstRTSPResult;cdecl;external;
{ headers  }
(* Const before type ignored *)
function gst_rtsp_message_add_header(msg:PGstRTSPMessage; field:TGstRTSPHeaderField; value:Pgchar):TGstRTSPResult;cdecl;external;
function gst_rtsp_message_take_header(msg:PGstRTSPMessage; field:TGstRTSPHeaderField; value:Pgchar):TGstRTSPResult;cdecl;external;
function gst_rtsp_message_remove_header(msg:PGstRTSPMessage; field:TGstRTSPHeaderField; indx:Tgint):TGstRTSPResult;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_message_get_header(msg:PGstRTSPMessage; field:TGstRTSPHeaderField; value:PPgchar; indx:Tgint):TGstRTSPResult;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_rtsp_message_add_header_by_name(msg:PGstRTSPMessage; header:Pgchar; value:Pgchar):TGstRTSPResult;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_message_take_header_by_name(msg:PGstRTSPMessage; header:Pgchar; value:Pgchar):TGstRTSPResult;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_message_remove_header_by_name(msg:PGstRTSPMessage; header:Pgchar; index:Tgint):TGstRTSPResult;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_message_get_header_by_name(msg:PGstRTSPMessage; header:Pgchar; value:PPgchar; index:Tgint):TGstRTSPResult;cdecl;external;
{ header serialization  }
(* Const before type ignored *)
function gst_rtsp_message_append_headers(msg:PGstRTSPMessage; str:PGString):TGstRTSPResult;cdecl;external;
{ handling the body  }
(* Const before type ignored *)
function gst_rtsp_message_set_body(msg:PGstRTSPMessage; data:Pguint8; size:Tguint):TGstRTSPResult;cdecl;external;
function gst_rtsp_message_take_body(msg:PGstRTSPMessage; data:Pguint8; size:Tguint):TGstRTSPResult;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_message_get_body(msg:PGstRTSPMessage; data:PPguint8; size:Pguint):TGstRTSPResult;cdecl;external;
function gst_rtsp_message_steal_body(msg:PGstRTSPMessage; data:PPguint8; size:Pguint):TGstRTSPResult;cdecl;external;
function gst_rtsp_message_set_body_buffer(msg:PGstRTSPMessage; buffer:PGstBuffer):TGstRTSPResult;cdecl;external;
function gst_rtsp_message_take_body_buffer(msg:PGstRTSPMessage; buffer:PGstBuffer):TGstRTSPResult;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_message_get_body_buffer(msg:PGstRTSPMessage; buffer:PPGstBuffer):TGstRTSPResult;cdecl;external;
function gst_rtsp_message_steal_body_buffer(msg:PGstRTSPMessage; buffer:PPGstBuffer):TGstRTSPResult;cdecl;external;
(* Const before type ignored *)
function gst_rtsp_message_has_body_buffer(msg:PGstRTSPMessage):Tgboolean;cdecl;external;
type
{*
 * GstRTSPAuthCredential:
 * @scheme: a #GstRTSPAuthMethod
 * @params: A NULL-terminated array of #GstRTSPAuthParam
 * @authorization: The authorization for the basic schem
 *
 * RTSP Authentication credentials
 *
 * Since: 1.12
  }
{ For Basic/Digest WWW-Authenticate and Digest
   * Authorization  }
{ NULL terminated  }
{ For Basic Authorization  }
  PGstRTSPAuthCredential = ^TGstRTSPAuthCredential;
  TGstRTSPAuthCredential = record
      scheme : TGstRTSPAuthMethod;
      params : ^PGstRTSPAuthParam;
      authorization : Pgchar;
    end;

{*
 * GstRTSPAuthParam:
 * @name: The name of the parameter
 * @value: The value of the parameter
 *
 * RTSP Authentication parameter
 *
 * Since: 1.12
  }
  PGstRTSPAuthParam = ^TGstRTSPAuthParam;
  TGstRTSPAuthParam = record
      name : Pgchar;
      value : Pgchar;
    end;


function gst_rtsp_auth_param_copy(param:PGstRTSPAuthParam):PGstRTSPAuthParam;cdecl;external;
procedure gst_rtsp_auth_param_free(param:PGstRTSPAuthParam);cdecl;external;
function gst_rtsp_message_parse_auth_credentials(msg:PGstRTSPMessage; field:TGstRTSPHeaderField):^PGstRTSPAuthCredential;cdecl;external;
procedure gst_rtsp_auth_credentials_free(credentials:PPGstRTSPAuthCredential);cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_RTSP_AUTH_CREDENTIAL : longint; { return type might be wrong }

function gst_rtsp_auth_credential_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_RTSP_AUTH_PARAM : longint; { return type might be wrong }

function gst_rtsp_auth_param_get_type:TGType;cdecl;external;
{ debug  }
function gst_rtsp_message_dump(msg:PGstRTSPMessage):TGstRTSPResult;cdecl;external;
{$endif}
{ __GST_RTSP_MESSAGE_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_RTSP_MESSAGE : longint; { return type might be wrong }
  begin
    GST_TYPE_RTSP_MESSAGE:=gst_rtsp_msg_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_RTSP_MESSAGE_CAST(object : longint) : PGstRTSPMessage;
begin
  GST_RTSP_MESSAGE_CAST:=PGstRTSPMessage(object);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_RTSP_MESSAGE(object : longint) : longint;
begin
  GST_RTSP_MESSAGE:=GST_RTSP_MESSAGE_CAST(object);
end;

{ was #define dname def_expr }
function GST_TYPE_RTSP_AUTH_CREDENTIAL : longint; { return type might be wrong }
  begin
    GST_TYPE_RTSP_AUTH_CREDENTIAL:=gst_rtsp_auth_credential_get_type;
  end;

{ was #define dname def_expr }
function GST_TYPE_RTSP_AUTH_PARAM : longint; { return type might be wrong }
  begin
    GST_TYPE_RTSP_AUTH_PARAM:=gst_rtsp_auth_param_get_type;
  end;


end.
