
unit time_util;
interface

{
  Automatically converted by H2Pas 1.0.0 from time_util.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    time_util.h
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
Psuseconds_t  = ^suseconds_t;
Ptimespec  = ^timespec;
Ptimeutil_rest_t  = ^timeutil_rest_t;
Ptimeval  = ^timeval;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 2013-2016, The Regents of The University of Michigan.
All rights reserved.
This software was developed in the APRIL Robotics Lab under the
direction of Edwin Olson, ebolson@umich.edu. This software may be
available under alternative licensing terms; contact the address above.
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
The views and conclusions contained in the software and documentation are those
of the authors and should not be interpreted as representing official policies,
either expressed or implied, of the Regents of The University of Michigan.
 }
(** unsupported pragma#pragma once*)
{$include <stdbool.h>}
{$include <stdint.h>}
{$include <time.h>}
{$ifdef _WIN32}
{$include <windows.h>}
type
  Psuseconds_t = ^Tsuseconds_t;
  Tsuseconds_t = int64;
{$endif}
type
  Ttimeutil_rest = Ttimeutil_rest_t;

function timeutil_rest_create:Ptimeutil_rest_t;cdecl;external;
procedure timeutil_rest_destroy(rest:Ptimeutil_rest_t);cdecl;external;
function utime_now:Tint64_t;cdecl;external;
{ blacklist-ignore }
function utime_get_seconds(v:Tint64_t):Tint64_t;cdecl;external;
function utime_get_useconds(v:Tint64_t):Tint64_t;cdecl;external;
procedure utime_to_timeval(v:Tint64_t; tv:Ptimeval);cdecl;external;
procedure utime_to_timespec(v:Tint64_t; ts:Ptimespec);cdecl;external;
function timeutil_usleep(useconds:Tint64_t):Tint32_t;cdecl;external;
function timeutil_sleep(seconds:dword):Tuint32_t;cdecl;external;
function timeutil_sleep_hz(rest:Ptimeutil_rest_t; hz:Tdouble):Tint32_t;cdecl;external;
procedure timeutil_timer_reset(rest:Ptimeutil_rest_t);cdecl;external;
procedure timeutil_timer_start(rest:Ptimeutil_rest_t);cdecl;external;
procedure timeutil_timer_stop(rest:Ptimeutil_rest_t);cdecl;external;
function timeutil_timer_timeout(rest:Ptimeutil_rest_t; timeout_s:Tdouble):Tbool;cdecl;external;
function time_util_hhmmss_ss_to_utime(time:Tdouble):Tint64_t;cdecl;external;
function timeutil_ms_to_us(ms:Tint32_t):Tint64_t;cdecl;external;
{ C++ end of extern C conditionnal removed }

implementation


end.
