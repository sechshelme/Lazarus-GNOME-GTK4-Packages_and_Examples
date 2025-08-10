unit ether;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Functions for storing Ethernet addresses in ASCII and mapping to hostnames.
   Copyright (C) 1996-2024 Free Software Foundation, Inc.
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
{$ifndef _NETINET_ETHER_H}

const
  _NETINET_ETHER_H = 1;  
{$include <features.h>}
{ Get definition of `struct ether_addr'.   }
{$include <netinet/if_ether.h>}
{$ifdef __USE_MISC}
{ Convert 48 bit Ethernet ADDRess to ASCII.   }

function ether_ntoa(__addr:Pether_addr):Pchar;cdecl;external libc;
function ether_ntoa_r(__addr:Pether_addr; __buf:Pchar):Pchar;cdecl;external libc;
{ Convert ASCII string S to 48 bit Ethernet address.   }
function ether_aton(__asc:Pchar):Pether_addr;cdecl;external libc;
function ether_aton_r(__asc:Pchar; __addr:Pether_addr):Pether_addr;cdecl;external libc;
{ Map 48 bit Ethernet number ADDR to HOSTNAME.   }
function ether_ntohost(__hostname:Pchar; __addr:Pether_addr):longint;cdecl;external libc;
{ Map HOSTNAME to 48 bit Ethernet address.   }
function ether_hostton(__hostname:Pchar; __addr:Pether_addr):longint;cdecl;external libc;
{ Scan LINE and set ADDR and HOSTNAME.   }
function ether_line(__line:Pchar; __addr:Pether_addr; __hostname:Pchar):longint;cdecl;external libc;
{$endif}
{ Use misc.   }
{$endif}
{ netinet/ether.h  }

// === Konventiert am: 10-8-25 17:27:56 ===


implementation



end.
