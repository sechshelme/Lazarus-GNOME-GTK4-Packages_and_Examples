unit inet;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 1997-2024 Free Software Foundation, Inc.
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
{$ifndef _ARPA_INET_H}

const
  _ARPA_INET_H = 1;  
{$include <features.h>}
{$include <netinet/in.h>		/* To define `struct in_addr'.  */}
{ Type for length arguments in socket calls.   }
{$ifndef __socklen_t_defined}
type
  Psocklen_t = ^Tsocklen_t;
  Tsocklen_t = Tsocklen_t;
{$define __socklen_t_defined}
{$endif}
{ Convert Internet host address from numbers-and-dots notation in CP
   into binary data in network byte order.   }

function inet_addr(__cp:Pchar):Tin_addr_t;cdecl;external libc;
{ Return the local host address part of the Internet address in IN.   }
function inet_lnaof(__in:Tin_addr):Tin_addr_t;cdecl;external libc;
{ Make Internet host address in network byte order by combining the
   network number NET with the local address HOST.   }
function inet_makeaddr(__net:Tin_addr_t; __host:Tin_addr_t):Tin_addr;cdecl;external libc;
{ Return network number part of the Internet address IN.   }
function inet_netof(__in:Tin_addr):Tin_addr_t;cdecl;external libc;
{ Extract the network number in network byte order from the address
   in numbers-and-dots natation starting at CP.   }
function inet_network(__cp:Pchar):Tin_addr_t;cdecl;external libc;
{ Convert Internet number in IN to ASCII representation.  The return value
   is a pointer to an internal array containing the string.   }
function inet_ntoa(__in:Tin_addr):Pchar;cdecl;external libc;
{ Convert from presentation format of an Internet number in buffer
   starting at CP to the binary network format and store result for
   interface type AF in buffer starting at BUF.   }
function inet_pton(__af:longint; __cp:Pchar; __buf:pointer):longint;cdecl;external libc;
{ Convert a Internet address in binary network format for interface
   type AF in buffer starting at CP to presentation form and place
   result in buffer of length LEN astarting at BUF.   }
function inet_ntop(__af:longint; __cp:pointer; __buf:Pchar; __len:Tsocklen_t):Pchar;cdecl;external libc;
{ The following functions are not part of XNS 5.2.   }
{$ifdef __USE_MISC}
{ Convert Internet host address from numbers-and-dots notation in CP
   into binary data and store the result in the structure INP.   }
function inet_aton(__cp:Pchar; __inp:Pin_addr):longint;cdecl;external libc;
{ Format a network number NET into presentation format and place result
   in buffer starting at BUF with length of LEN bytes.   }
function inet_neta(__net:Tin_addr_t; __buf:Pchar; __len:Tsize_t):Pchar;cdecl;external libc;
{  __attribute_deprecated_msg__ ("Use inet_ntop instead"); }
{ Convert network number for interface type AF in buffer starting at
   CP to presentation format.  The result will specify BITS bits of
   the number.   }
function inet_net_ntop(__af:longint; __cp:pointer; __bits:longint; __buf:Pchar; __len:Tsize_t):Pchar;cdecl;external libc;
{ Convert network number for interface type AF from presentation in
   buffer starting at CP to network format and store result int
   buffer starting at BUF of size LEN.   }
function inet_net_pton(__af:longint; __cp:Pchar; __buf:pointer; __len:Tsize_t):longint;cdecl;external libc;
{ Convert ASCII representation in hexadecimal form of the Internet
   address to binary form and place result in buffer of length LEN
   starting at BUF.   }
function inet_nsap_addr(__cp:Pchar; __buf:Pbyte; __len:longint):dword;cdecl;external libc;
{ Convert internet address in binary form in LEN bytes starting at CP
   a presentation form and place result in BUF.   }
function inet_nsap_ntoa(__len:longint; __cp:Pbyte; __buf:Pchar):Pchar;cdecl;external libc;
{$endif}
{$endif}
{ arpa/inet.h  }

// === Konventiert am: 13-8-25 19:42:50 ===


implementation



end.
