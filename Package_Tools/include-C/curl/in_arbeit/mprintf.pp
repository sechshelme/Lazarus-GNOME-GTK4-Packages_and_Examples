
unit mprintf;
interface

{
  Automatically converted by H2Pas 1.0.0 from mprintf.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mprintf.h
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
PFILE  = ^FILE;
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
(* Const before type ignored *)

function curl_mprintf(format:Pchar; args:array of const):longint;cdecl;external;
function curl_mprintf(format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function curl_mfprintf(fd:PFILE; format:Pchar; args:array of const):longint;cdecl;external;
function curl_mfprintf(fd:PFILE; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function curl_msprintf(buffer:Pchar; format:Pchar; args:array of const):longint;cdecl;external;
function curl_msprintf(buffer:Pchar; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function curl_msnprintf(buffer:Pchar; maxlength:Tsize_t; format:Pchar; args:array of const):longint;cdecl;external;
function curl_msnprintf(buffer:Pchar; maxlength:Tsize_t; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function curl_mvprintf(format:Pchar; args:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
function curl_mvfprintf(fd:PFILE; format:Pchar; args:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
function curl_mvsprintf(buffer:Pchar; format:Pchar; args:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
function curl_mvsnprintf(buffer:Pchar; maxlength:Tsize_t; format:Pchar; args:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
function curl_maprintf(format:Pchar; args:array of const):Pchar;cdecl;external;
function curl_maprintf(format:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function curl_mvaprintf(format:Pchar; args:Tva_list):Pchar;cdecl;external;
{$undef CURL_TEMP_PRINTF}
{$endif}
{ CURLINC_MPRINTF_H  }

implementation


end.
