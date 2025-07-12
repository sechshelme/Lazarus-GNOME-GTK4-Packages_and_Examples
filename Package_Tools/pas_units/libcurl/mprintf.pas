unit mprintf;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef CURLINC_MPRINTF_H}
{$define CURLINC_MPRINTF_H}
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
{$include <stdarg.h>}
{$include <stdio.h> /* needed for FILE */}
{$include "curl.h"  /* for extern */}
{ C++ extern C conditionnal removed }

function curl_mprintf(format:Pchar; args:array of const):longint;cdecl;external libcurl;
function curl_mprintf(format:Pchar):longint;cdecl;external libcurl;
function curl_mfprintf(fd:PFILE; format:Pchar; args:array of const):longint;cdecl;external libcurl;
function curl_mfprintf(fd:PFILE; format:Pchar):longint;cdecl;external libcurl;
function curl_msprintf(buffer:Pchar; format:Pchar; args:array of const):longint;cdecl;external libcurl;
function curl_msprintf(buffer:Pchar; format:Pchar):longint;cdecl;external libcurl;
function curl_msnprintf(buffer:Pchar; maxlength:Tsize_t; format:Pchar; args:array of const):longint;cdecl;external libcurl;
function curl_msnprintf(buffer:Pchar; maxlength:Tsize_t; format:Pchar):longint;cdecl;external libcurl;
function curl_mvprintf(format:Pchar; args:Tva_list):longint;cdecl;external libcurl;
function curl_mvfprintf(fd:PFILE; format:Pchar; args:Tva_list):longint;cdecl;external libcurl;
function curl_mvsprintf(buffer:Pchar; format:Pchar; args:Tva_list):longint;cdecl;external libcurl;
function curl_mvsnprintf(buffer:Pchar; maxlength:Tsize_t; format:Pchar; args:Tva_list):longint;cdecl;external libcurl;
function curl_maprintf(format:Pchar; args:array of const):Pchar;cdecl;external libcurl;
function curl_maprintf(format:Pchar):Pchar;cdecl;external libcurl;
function curl_mvaprintf(format:Pchar; args:Tva_list):Pchar;cdecl;external libcurl;
{$undef CURL_TEMP_PRINTF}
{$endif}
{ CURLINC_MPRINTF_H  }

// === Konventiert am: 12-7-25 13:50:06 ===


implementation



end.
