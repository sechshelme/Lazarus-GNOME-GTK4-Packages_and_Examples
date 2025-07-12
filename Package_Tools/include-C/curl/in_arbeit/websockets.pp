
unit websockets;
interface

{
  Automatically converted by H2Pas 1.0.0 from websockets.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    websockets.h
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
PCURL  = ^CURL;
Pcurl_ws_frame  = ^curl_ws_frame;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef CURLINC_WEBSOCKETS_H}
{$define CURLINC_WEBSOCKETS_H}
{**************************************************************************
 *                                  _   _ ____  _
 *  Project                     ___| | | |  _ \| |
 *                             / __| | | | |_) | |
 *                            | (__| |_| |  _ <| |___
 *                             \___|\___/|_| \_\_____|
 *
 * Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
 *
 * This software is licensed as described in the file COPYING, which
 * you should have received as part of this distribution. The terms
 * are also available at https://curl.se/docs/copyright.html.
 *
 * You may opt to use, copy, modify, merge, publish, distribute and/or sell
 * copies of the Software, and permit persons to whom the Software is
 * furnished to do so, under the terms of the COPYING file.
 *
 * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
 * KIND, either express or implied.
 *
 * SPDX-License-Identifier: curl
 *
 ************************************************************************** }
{ C++ extern C conditionnal removed }
{ zero  }
{ See the CURLWS_* defines  }
{ the offset of this data into the frame  }
{ number of pending bytes left of the payload  }
{ size of the current data chunk  }
type
  Pcurl_ws_frame = ^Tcurl_ws_frame;
  Tcurl_ws_frame = record
      age : longint;
      flags : longint;
      offset : Tcurl_off_t;
      bytesleft : Tcurl_off_t;
      len : Tsize_t;
    end;

{ flag bits  }

const
  CURLWS_TEXT = 1 shl 0;  
  CURLWS_BINARY = 1 shl 1;  
  CURLWS_CONT = 1 shl 2;  
  CURLWS_CLOSE = 1 shl 3;  
  CURLWS_PING = 1 shl 4;  
  CURLWS_OFFSET = 1 shl 5;  
{
 * NAME curl_ws_recv()
 *
 * DESCRIPTION
 *
 * Receives data from the websocket connection. Use after successful
 * curl_easy_perform() with CURLOPT_CONNECT_ONLY option.
  }
(* Const before type ignored *)

function curl_ws_recv(curl:PCURL; buffer:pointer; buflen:Tsize_t; recv:Psize_t; metap:PPcurl_ws_frame):TCURLcode;cdecl;external;
{ flags for curl_ws_send()  }
const
  CURLWS_PONG = 1 shl 6;  
{
 * NAME curl_ws_send()
 *
 * DESCRIPTION
 *
 * Sends data over the websocket connection. Use after successful
 * curl_easy_perform() with CURLOPT_CONNECT_ONLY option.
  }
(* Const before type ignored *)

function curl_ws_send(curl:PCURL; buffer:pointer; buflen:Tsize_t; sent:Psize_t; fragsize:Tcurl_off_t; 
           flags:dword):TCURLcode;cdecl;external;
{ bits for the CURLOPT_WS_OPTIONS bitmask:  }
const
  CURLWS_RAW_MODE = 1 shl 0;  
(* Const before type ignored *)

function curl_ws_meta(curl:PCURL):Pcurl_ws_frame;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ CURLINC_WEBSOCKETS_H  }

implementation


end.
