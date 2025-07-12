
unit stdcheaders;
interface

{
  Automatically converted by H2Pas 1.0.0 from stdcheaders.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    stdcheaders.h
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


{$ifndef CURLINC_STDCHEADERS_H}
{$define CURLINC_STDCHEADERS_H}
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
{$include <sys/types.h>}

function fread(para1:pointer; para2:Tsize_t; para3:Tsize_t; para4:PFILE):Tsize_t;cdecl;external;
(* Const before type ignored *)
function fwrite(para1:pointer; para2:Tsize_t; para3:Tsize_t; para4:PFILE):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function strcasecmp(para1:Pchar; para2:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function strncasecmp(para1:Pchar; para2:Pchar; para3:Tsize_t):longint;cdecl;external;
{$endif}
{ CURLINC_STDCHEADERS_H  }

implementation


end.
