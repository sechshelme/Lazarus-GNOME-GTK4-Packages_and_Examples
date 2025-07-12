unit header;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef CURLINC_HEADER_H}
{$define CURLINC_HEADER_H}
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
{ this might not use the same case  }
{ number of headers using this name   }
{ ... of this instance, 0 or higher  }
{ see bits below  }
{ handle privately used by libcurl  }
type
  Pcurl_header = ^Tcurl_header;
  Tcurl_header = record
      name : Pchar;
      value : Pchar;
      amount : Tsize_t;
      index : Tsize_t;
      origin : dword;
      anchor : pointer;
    end;

{ 'origin' bits  }
{ plain server header  }

const
  CURLH_HEADER = 1 shl 0;  
{ trailers  }
  CURLH_TRAILER = 1 shl 1;  
{ CONNECT headers  }
  CURLH_CONNECT = 1 shl 2;  
{ 1xx headers  }
  CURLH_1XX = 1 shl 3;  
{ pseudo headers  }
  CURLH_PSEUDO = 1 shl 4;  
{ header exists but not with this index  }
{ no such header exists  }
{ no headers at all exist (yet)  }
{ no request with this number was used  }
{ out of memory while processing  }
{ a function argument was not okay  }
{ if API was disabled in the build  }
type
  PCURLHcode = ^TCURLHcode;
  TCURLHcode =  Longint;
  Const
    CURLHE_OK = 0;
    CURLHE_BADINDEX = 1;
    CURLHE_MISSING = 2;
    CURLHE_NOHEADERS = 3;
    CURLHE_NOREQUEST = 4;
    CURLHE_OUT_OF_MEMORY = 5;
    CURLHE_BAD_ARGUMENT = 6;
    CURLHE_NOT_BUILT_IN = 7;
;

function curl_easy_header(easy:PCURL; name:Pchar; index:Tsize_t; origin:dword; request:longint; 
           hout:PPcurl_header):TCURLHcode;cdecl;external libcurl;
function curl_easy_nextheader(easy:PCURL; origin:dword; request:longint; prev:Pcurl_header):Pcurl_header;cdecl;external libcurl;
{$endif}
{ CURLINC_HEADER_H  }

// === Konventiert am: 12-7-25 13:50:03 ===


implementation



end.
