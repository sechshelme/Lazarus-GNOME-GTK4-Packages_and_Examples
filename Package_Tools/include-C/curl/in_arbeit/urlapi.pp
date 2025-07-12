
unit urlapi;
interface

{
  Automatically converted by H2Pas 1.0.0 from urlapi.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    urlapi.h
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
Pchar  = ^char;
PCURLU  = ^CURLU;
PCURLUcode  = ^CURLUcode;
PCURLUPart  = ^CURLUPart;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef CURLINC_URLAPI_H}
{$define CURLINC_URLAPI_H}
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
{$include "curl.h"}
{ C++ extern C conditionnal removed }
{ the error codes for the URL API  }
{ 1  }
{ 2  }
{ 3  }
{ 4  }
{ 5  }
{ 6  }
{ 7  }
{ 8  }
{ 9  }
{ 10  }
{ 11  }
{ 12  }
{ 13  }
{ 14  }
{ 15  }
{ 16  }
{ 17  }
{ 18  }
{ 19  }
{ 20  }
{ 21  }
{ 22  }
{ 23  }
{ 24  }
{ 25  }
{ 26  }
{ 27  }
{ 28  }
{ 29  }
{ 30  }
type
  PCURLUcode = ^TCURLUcode;
  TCURLUcode =  Longint;
  Const
    CURLUE_OK = 0;
    CURLUE_BAD_HANDLE = 1;
    CURLUE_BAD_PARTPOINTER = 2;
    CURLUE_MALFORMED_INPUT = 3;
    CURLUE_BAD_PORT_NUMBER = 4;
    CURLUE_UNSUPPORTED_SCHEME = 5;
    CURLUE_URLDECODE = 6;
    CURLUE_OUT_OF_MEMORY = 7;
    CURLUE_USER_NOT_ALLOWED = 8;
    CURLUE_UNKNOWN_PART = 9;
    CURLUE_NO_SCHEME = 10;
    CURLUE_NO_USER = 11;
    CURLUE_NO_PASSWORD = 12;
    CURLUE_NO_OPTIONS = 13;
    CURLUE_NO_HOST = 14;
    CURLUE_NO_PORT = 15;
    CURLUE_NO_QUERY = 16;
    CURLUE_NO_FRAGMENT = 17;
    CURLUE_NO_ZONEID = 18;
    CURLUE_BAD_FILE_URL = 19;
    CURLUE_BAD_FRAGMENT = 20;
    CURLUE_BAD_HOSTNAME = 21;
    CURLUE_BAD_IPV6 = 22;
    CURLUE_BAD_LOGIN = 23;
    CURLUE_BAD_PASSWORD = 24;
    CURLUE_BAD_PATH = 25;
    CURLUE_BAD_QUERY = 26;
    CURLUE_BAD_SCHEME = 27;
    CURLUE_BAD_SLASHES = 28;
    CURLUE_BAD_USER = 29;
    CURLUE_LACKS_IDN = 30;
    CURLUE_LAST = 31;
;
{ added in 7.65.0  }
type
  PCURLUPart = ^TCURLUPart;
  TCURLUPart =  Longint;
  Const
    CURLUPART_URL = 0;
    CURLUPART_SCHEME = 1;
    CURLUPART_USER = 2;
    CURLUPART_PASSWORD = 3;
    CURLUPART_OPTIONS = 4;
    CURLUPART_HOST = 5;
    CURLUPART_PORT = 6;
    CURLUPART_PATH = 7;
    CURLUPART_QUERY = 8;
    CURLUPART_FRAGMENT = 9;
    CURLUPART_ZONEID = 10;
;
{ return default port number  }
  CURLU_DEFAULT_PORT = 1 shl 0;  
{ act as if no port number was set,
                                           if the port number matches the
                                           default for the scheme  }
  CURLU_NO_DEFAULT_PORT = 1 shl 1;  
{ return default scheme if
                                           missing  }
  CURLU_DEFAULT_SCHEME = 1 shl 2;  
{ allow non-supported scheme  }
  CURLU_NON_SUPPORT_SCHEME = 1 shl 3;  
{ leave dot sequences  }
  CURLU_PATH_AS_IS = 1 shl 4;  
{ no user+password allowed  }
  CURLU_DISALLOW_USER = 1 shl 5;  
{ URL decode on get  }
  CURLU_URLDECODE = 1 shl 6;  
{ URL encode on set  }
  CURLU_URLENCODE = 1 shl 7;  
{ append a form style part  }
  CURLU_APPENDQUERY = 1 shl 8;  
{ legacy curl-style guessing  }
  CURLU_GUESS_SCHEME = 1 shl 9;  
{ Allow empty authority when the
                                           scheme is unknown.  }
  CURLU_NO_AUTHORITY = 1 shl 10;  
{ Allow spaces in the URL  }
  CURLU_ALLOW_SPACE = 1 shl 11;  
{ get the host name in punycode  }
  CURLU_PUNYCODE = 1 shl 12;  
{ punycode => IDN conversion  }
  CURLU_PUNY2IDN = 1 shl 13;  
type
  TCurl_URL = TCURLU;
{
 * curl_url() creates a new CURLU handle and returns a pointer to it.
 * Must be freed with curl_url_cleanup().
  }

function curl_url:PCURLU;cdecl;external;
{
 * curl_url_cleanup() frees the CURLU handle and related resources used for
 * the URL parsing. It will not free strings previously returned with the URL
 * API.
  }
procedure curl_url_cleanup(handle:PCURLU);cdecl;external;
{
 * curl_url_dup() duplicates a CURLU handle and returns a new copy. The new
 * handle must also be freed with curl_url_cleanup().
  }
(* Const before type ignored *)
function curl_url_dup(in:PCURLU):PCURLU;cdecl;external;
{
 * curl_url_get() extracts a specific part of the URL from a CURLU
 * handle. Returns error code. The returned pointer MUST be freed with
 * curl_free() afterwards.
  }
(* Const before type ignored *)
function curl_url_get(handle:PCURLU; what:TCURLUPart; part:PPchar; flags:dword):TCURLUcode;cdecl;external;
{
 * curl_url_set() sets a specific part of the URL in a CURLU handle. Returns
 * error code. The passed in string will be copied. Passing a NULL instead of
 * a part string, clears that part.
  }
(* Const before type ignored *)
function curl_url_set(handle:PCURLU; what:TCURLUPart; part:Pchar; flags:dword):TCURLUcode;cdecl;external;
{
 * curl_url_strerror() turns a CURLUcode value into the equivalent human
 * readable error string.  This is useful for printing meaningful error
 * messages.
  }
(* Const before type ignored *)
function curl_url_strerror(para1:TCURLUcode):Pchar;cdecl;external;
{$endif}
{ CURLINC_URLAPI_H  }

implementation


end.
