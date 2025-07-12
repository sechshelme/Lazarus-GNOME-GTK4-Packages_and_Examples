
unit options;
interface

{
  Automatically converted by H2Pas 1.0.0 from options.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    options.h
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
Pcurl_easyoption  = ^curl_easyoption;
Pcurl_easytype  = ^curl_easytype;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef CURLINC_OPTIONS_H}
{$define CURLINC_OPTIONS_H}
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
{ long (a range of values)  }
{      (a defined set or bitmask)  }
{ curl_off_t (a range of values)  }
{ pointer (void *)  }
{         (char * to null-terminated buffer)  }
{         (struct curl_slist *)  }
{         (void * passed as-is to a callback)  }
{ blob (struct curl_blob *)  }
{ function pointer  }
type
  Pcurl_easytype = ^Tcurl_easytype;
  Tcurl_easytype =  Longint;
  Const
    CURLOT_LONG = 0;
    CURLOT_VALUES = 1;
    CURLOT_OFF_T = 2;
    CURLOT_OBJECT = 3;
    CURLOT_STRING = 4;
    CURLOT_SLIST = 5;
    CURLOT_CBPTR = 6;
    CURLOT_BLOB = 7;
    CURLOT_FUNCTION = 8;
;
{ Flag bits  }
{ "alias" means it is provided for old programs to remain functional,
   we prefer another name  }
  CURLOT_FLAG_ALIAS = 1 shl 0;  
{ The CURLOPTTYPE_* id ranges can still be used to figure out what type/size
   to use for curl_easy_setopt() for the given id  }
(* Const before type ignored *)
type
  Pcurl_easyoption = ^Tcurl_easyoption;
  Tcurl_easyoption = record
      name : Pchar;
      id : TCURLoption;
      _type : Tcurl_easytype;
      flags : dword;
    end;

(* Const before type ignored *)
(* Const before type ignored *)

function curl_easy_option_by_name(name:Pchar):Pcurl_easyoption;cdecl;external;
(* Const before type ignored *)
function curl_easy_option_by_id(id:TCURLoption):Pcurl_easyoption;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function curl_easy_option_next(prev:Pcurl_easyoption):Pcurl_easyoption;cdecl;external;
{$endif}
{ CURLINC_OPTIONS_H  }

implementation


end.
