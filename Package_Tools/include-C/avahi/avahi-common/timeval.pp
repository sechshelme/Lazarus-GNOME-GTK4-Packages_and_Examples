
unit timeval;
interface

{
  Automatically converted by H2Pas 1.0.0 from timeval.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    timeval.h
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
PAvahiUsec  = ^AvahiUsec;
Ptimeval  = ^timeval;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef footimevalhfoo}
{$define footimevalhfoo}
{**
  This file is part of avahi.

  avahi is free software; you can redistribute it and/or modify it
  under the terms of the GNU Lesser General Public License as
  published by the Free Software Foundation; either version 2.1 of the
  License, or (at your option) any later version.

  avahi is distributed in the hope that it will be useful, but WITHOUT
  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
  or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General
  Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with avahi; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
  USA.
** }
{* \file timeval.h Functions to facilitate timeval handling  }
{$include <inttypes.h>}
{$include <sys/time.h>}
{$include <avahi-common/cdecl.h>}
{* A numeric data type for storing microsecond values. (signed 64bit integer)  }
type
  PAvahiUsec = ^TAvahiUsec;
  TAvahiUsec = Tint64_t;
{* Compare two timeval structures and return a negative value when a < b, 0 when a == b and a positive value otherwise  }
(* Const before type ignored *)
(* Const before type ignored *)

function avahi_timeval_compare(a:Ptimeval; b:Ptimeval):longint;cdecl;external;
{* Calculate the difference between two timeval structures as microsecond value  }
(* Const before type ignored *)
(* Const before type ignored *)
function avahi_timeval_diff(a:Ptimeval; b:Ptimeval):TAvahiUsec;cdecl;external;
{* Add a number of microseconds to the specified timeval structure and return it. *a is modified.  }
function avahi_timeval_add(a:Ptimeval; usec:TAvahiUsec):Ptimeval;cdecl;external;
{* Return the difference between the current time and *a. Positive if *a was earlier  }
(* Const before type ignored *)
function avahi_age(a:Ptimeval):TAvahiUsec;cdecl;external;
{* Fill *tv with the current time plus "ms" milliseconds plus an
 * extra jitter of "j" milliseconds. Pass 0 for j if you don't want
 * the jitter  }
function avahi_elapse_time(tv:Ptimeval; ms:dword; j:dword):Ptimeval;cdecl;external;
{$endif}

implementation


end.
