
unit easy;
interface

{
  Automatically converted by H2Pas 1.0.0 from easy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    easy.h
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
Pcurl_blob  = ^curl_blob;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef CURLINC_EASY_H}
{$define CURLINC_EASY_H}
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
{ Flag bits in the curl_blob struct:  }
{ tell libcurl to copy the data  }

const
  CURL_BLOB_COPY = 1;  
{ tell libcurl to NOT copy the data  }
  CURL_BLOB_NOCOPY = 0;  
{ bit 0 is defined, the rest are reserved and should be
                         left zeroes  }
type
  Pcurl_blob = ^Tcurl_blob;
  Tcurl_blob = record
      data : pointer;
      len : Tsize_t;
      flags : dword;
    end;


function curl_easy_init:PCURL;cdecl;external;
function curl_easy_setopt(curl:PCURL; option:TCURLoption; args:array of const):TCURLcode;cdecl;external;
function curl_easy_setopt(curl:PCURL; option:TCURLoption):TCURLcode;cdecl;external;
function curl_easy_perform(curl:PCURL):TCURLcode;cdecl;external;
procedure curl_easy_cleanup(curl:PCURL);cdecl;external;
{
 * NAME curl_easy_getinfo()
 *
 * DESCRIPTION
 *
 * Request internal information from the curl session with this function.
 * The third argument MUST be pointing to the specific type of the used option
 * which is documented in each man page of the option. The data pointed to
 * will be filled in accordingly and can be relied upon only if the function
 * returns CURLE_OK. This function is intended to get used *AFTER* a performed
 * transfer, all results from this function are undefined until the transfer
 * is completed.
  }
function curl_easy_getinfo(curl:PCURL; info:TCURLINFO; args:array of const):TCURLcode;cdecl;external;
function curl_easy_getinfo(curl:PCURL; info:TCURLINFO):TCURLcode;cdecl;external;
{
 * NAME curl_easy_duphandle()
 *
 * DESCRIPTION
 *
 * Creates a new curl session handle with the same options set for the handle
 * passed in. Duplicating a handle could only be a matter of cloning data and
 * options, internal state info and things like persistent connections cannot
 * be transferred. It is useful in multithreaded applications when you can run
 * curl_easy_duphandle() for each new thread to avoid a series of identical
 * curl_easy_setopt() invokes in every thread.
  }
function curl_easy_duphandle(curl:PCURL):PCURL;cdecl;external;
{
 * NAME curl_easy_reset()
 *
 * DESCRIPTION
 *
 * Re-initializes a CURL handle to the default values. This puts back the
 * handle to the same state as it was in when it was just created.
 *
 * It does keep: live connections, the Session ID cache, the DNS cache and the
 * cookies.
  }
procedure curl_easy_reset(curl:PCURL);cdecl;external;
{
 * NAME curl_easy_recv()
 *
 * DESCRIPTION
 *
 * Receives data from the connected socket. Use after successful
 * curl_easy_perform() with CURLOPT_CONNECT_ONLY option.
  }
function curl_easy_recv(curl:PCURL; buffer:pointer; buflen:Tsize_t; n:Psize_t):TCURLcode;cdecl;external;
{
 * NAME curl_easy_send()
 *
 * DESCRIPTION
 *
 * Sends data over the connected socket. Use after successful
 * curl_easy_perform() with CURLOPT_CONNECT_ONLY option.
  }
(* Const before type ignored *)
function curl_easy_send(curl:PCURL; buffer:pointer; buflen:Tsize_t; n:Psize_t):TCURLcode;cdecl;external;
{
 * NAME curl_easy_upkeep()
 *
 * DESCRIPTION
 *
 * Performs connection upkeep for the given session handle.
  }
function curl_easy_upkeep(curl:PCURL):TCURLcode;cdecl;external;
{$endif}

implementation


end.
