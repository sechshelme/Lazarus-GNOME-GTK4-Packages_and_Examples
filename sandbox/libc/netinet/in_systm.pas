unit in_systm;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ System specific type definitions for networking code.
   Copyright (C) 1997-2024 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <https://www.gnu.org/licenses/>.   }
{$ifndef _NETINET_IN_SYSTM_H}

const
  _NETINET_IN_SYSTM_H = 1;  
{$include <sys/types.h>}
{$include <stdint.h>}
{
 * Network order versions of various data types. Unfortunately, BSD
 * assumes specific sizes for shorts (16 bit) and longs (32 bit) which
 * don't hold in general. As a consequence, the network order versions
 * may not reflect the actual size of the native data types.
  }
type
  Pn_short = ^Tn_short;
  Tn_short = Tuint16_t;
{ short as received from the net  }

  Pn_long = ^Tn_long;
  Tn_long = Tuint32_t;
{ long as received from the net   }

  Pn_time = ^Tn_time;
  Tn_time = Tuint32_t;
{ ms since 00:00 GMT, byte rev    }
{$endif}
{ netinet/in_systm.h  }

// === Konventiert am: 10-8-25 17:28:15 ===


implementation



end.
