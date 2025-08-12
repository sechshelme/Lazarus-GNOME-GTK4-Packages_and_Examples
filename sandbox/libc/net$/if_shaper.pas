unit if_shaper;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 1998-2024 Free Software Foundation, Inc.
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
{$ifndef _NET_IF_SHAPER_H}

const
  _NET_IF_SHAPER_H = 1;  
{$include <sys/types.h>}
{$include <stdint.h>}
{$include <net/if.h>}
{$include <sys/ioctl.h>}

const
  SHAPER_QLEN = 10;  
{
 *	This is a bit speed dependent (read it shouldn't be a constant!)
 *
 *	5 is about right for 28.8 upwards. Below that double for every
 *	halving of speed or so. - ie about 20 for 9600 baud.
  }
  SHAPER_LATENCY = 5*HZ;  
  SHAPER_MAXSLIP = 2;  
{ Good for >128K then  }
  SHAPER_BURST = HZ/50;  
  SHAPER_SET_DEV = $0001;  
  SHAPER_SET_SPEED = $0002;  
  SHAPER_GET_DEV = $0003;  
  SHAPER_GET_SPEED = $0004;  
type
  Pshaperconf = ^Tshaperconf;
  Tshaperconf = record
      ss_cmd : Tuint16_t;
      ss_u : record
          case longint of
            0 : ( ssu_name : array[0..13] of char );
            1 : ( ssu_speed : Tuint32_t );
          end;
    end;

{$endif}
{ net/if_shaper.h  }

// === Konventiert am: 12-8-25 17:05:57 ===


implementation



end.
