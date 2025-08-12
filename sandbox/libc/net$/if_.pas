unit if_;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ net/if.h -- declarations for inquiring about network interfaces
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
{$ifndef _NET_IF_H}

const
  _NET_IF_H = 1;  
{$include <features.h>}
{$ifdef __USE_MISC}
{$include <sys/types.h>}
{$include <sys/socket.h>}
{$endif}
{ Length of interface name.   }

const
  IF_NAMESIZE = 16;  
{ 1, 2, ...  }
{ null terminated name: "eth0", ...  }
type
  Pif_nameindex = ^Tif_nameindex;
  Tif_nameindex = record
      if_index : dword;
      if_name : Pchar;
    end;

{$ifdef __USE_MISC}
{ Standard interface flags.  }
{ Interface is up.   }
{ Broadcast address valid.   }
{ Turn on debugging.   }
{ Is a loopback net.   }
{ Interface is point-to-point link.   }
{ Avoid use of trailers.   }
{ Resources allocated.   }
{ No address resolution protocol.   }
{ Receive all packets.   }
{ Not supported  }
{ Receive all multicast packets.   }
{ Master of a load balancer.   }
{ Slave of a load balancer.   }
{ Supports multicast.   }
{ Can set media type.   }
{ Auto media select active.   }
{ Dialup device with changing addresses.   }
  Tddddd =  Longint;
  Const
    IFF_UP = $1;
    IFF_BROADCAST = $2;
    IFF_DEBUG = $4;
    IFF_LOOPBACK = $8;
    IFF_POINTOPOINT = $10;
    IFF_NOTRAILERS = $20;
    IFF_RUNNING = $40;
    IFF_NOARP = $80;
    IFF_PROMISC = $100;
    IFF_ALLMULTI = $200;
    IFF_MASTER = $400;
    IFF_SLAVE = $800;
    IFF_MULTICAST = $1000;
    IFF_PORTSEL = $2000;
    IFF_AUTOMEDIA = $4000;
    IFF_DYNAMIC = $8000;

{ The ifaddr structure contains information about one address of an
   interface.  They are maintained by the different address families,
   are allocated and attached when an address is set, and are linked
   together so all addresses for an interface can be located.   }
{ Address of interface.   }
{ Back-pointer to interface.   }
{ Next address for interface.   }
type
  Pifaddr = ^Tifaddr;
  Tifaddr = record
      ifa_addr : Tsockaddr;
      ifa_ifu : record
          case longint of
            0 : ( ifu_broadaddr : Tsockaddr );
            1 : ( ifu_dstaddr : Tsockaddr );
          end;
      ifa_ifp : Piface;
      ifa_next : Pifaddr;
    end;

{ broadcast address	 }

const
  ifa_broadaddr = ifa_ifu.ifu_broadaddr;  
{ other end of link	 }
  ifa_dstaddr = ifa_ifu.ifu_dstaddr;  
{ Device mapping structure. I'd just gone off and designed a
   beautiful scheme using only loadable modules with arguments for
   driver options and along come the PCMCIA people 8)

   Ah well. The get() side of this is good for WDSETUP, and it'll be
   handy for debugging things. The set side is fine for now and being
   very small might be worth keeping for clean configuration.   }
{ 3 bytes spare  }
type
  Pifmap = ^Tifmap;
  Tifmap = record
      mem_start : dword;
      mem_end : dword;
      base_addr : word;
      irq : byte;
      dma : byte;
      port : byte;
    end;

{ Interface request structure used for socket ioctl's.  All interface
   ioctl's must have parameter definitions which begin with ifr_name.
   The remainder may be interface specific.   }

const
  IFHWADDRLEN = 6;  
  IFNAMSIZ = IF_NAMESIZE;  
{ Interface name, e.g. "en0".   }
{ Just fits the size  }
type
  Pifreq = ^Tifreq;
  Tifreq = record
      ifr_ifrn : record
          case longint of
            0 : ( ifrn_name : array[0..(IFNAMSIZ)-1] of char );
          end;
      ifr_ifru : record
          case longint of
            0 : ( ifru_addr : Tsockaddr );
            1 : ( ifru_dstaddr : Tsockaddr );
            2 : ( ifru_broadaddr : Tsockaddr );
            3 : ( ifru_netmask : Tsockaddr );
            4 : ( ifru_hwaddr : Tsockaddr );
            5 : ( ifru_flags : smallint );
            6 : ( ifru_ivalue : longint );
            7 : ( ifru_mtu : longint );
            8 : ( ifru_map : Tifmap );
            9 : ( ifru_slave : array[0..(IFNAMSIZ)-1] of char );
            10 : ( ifru_newname : array[0..(IFNAMSIZ)-1] of char );
            11 : ( ifru_data : Tcaddr_t );
          end;
    end;

{ interface name 	 }

const
  ifr_name = ifr_ifrn.ifrn_name;  
{ MAC address 		 }
  ifr_hwaddr = ifr_ifru.ifru_hwaddr;  
{ address		 }
  ifr_addr = ifr_ifru.ifru_addr;  
{ other end of p-p lnk	 }
  ifr_dstaddr = ifr_ifru.ifru_dstaddr;  
{ broadcast address	 }
  ifr_broadaddr = ifr_ifru.ifru_broadaddr;  
{ interface net mask	 }
  ifr_netmask = ifr_ifru.ifru_netmask;  
{ flags		 }
  ifr_flags = ifr_ifru.ifru_flags;  
{ metric		 }
  ifr_metric = ifr_ifru.ifru_ivalue;  
{ mtu			 }
  ifr_mtu = ifr_ifru.ifru_mtu;  
{ device map		 }
  ifr_map = ifr_ifru.ifru_map;  
{ slave device		 }
  ifr_slave = ifr_ifru.ifru_slave;  
{ for use by interface	 }
  ifr_data = ifr_ifru.ifru_data;  
{ interface index       }
  ifr_ifindex = ifr_ifru.ifru_ivalue;  
{ link bandwidth	 }
  ifr_bandwidth = ifr_ifru.ifru_ivalue;  
{ queue length		 }
  ifr_qlen = ifr_ifru.ifru_ivalue;  
{ New name		 }
  ifr_newname = ifr_ifru.ifru_newname;  

{ was #define dname def_expr }
function _IOT_ifreq : longint; { return type might be wrong }

{ was #define dname def_expr }
function _IOT_ifreq_short : longint; { return type might be wrong }

{ was #define dname def_expr }
function _IOT_ifreq_int : longint; { return type might be wrong }

{ Structure used in SIOCGIFCONF request.  Used to retrieve interface
   configuration for machine (useful for programs which must know all
   networks accessible).   }
{ Size of buffer.   }
type
  Pifconf = ^Tifconf;
  Tifconf = record
      ifc_len : longint;
      ifc_ifcu : record
          case longint of
            0 : ( ifcu_buf : Tcaddr_t );
            1 : ( ifcu_req : Pifreq );
          end;
    end;

{ Buffer address.   }

const
  ifc_buf = ifc_ifcu.ifcu_buf;  
{ Array of structures.   }
  ifc_req = ifc_ifcu.ifcu_req;  
{# define _IOT_ifconf _IOT(_IOTS(struct ifconf),1,0,0,0,0) /* not right */ }
{$endif}
{ Misc.   }
{ Convert an interface name to an index, and vice versa.   }

function if_nametoindex(__ifname:Pchar):dword;cdecl;external libc;
function if_indextoname(__ifindex:dword; __ifname:array[0..(IF_NAMESIZE)-1] of char):Pchar;cdecl;external libc;
{ Return a list of all interfaces and their indices.   }
function if_nameindex:Pif_nameindex;cdecl;external libc;
{ Free the data returned from if_nameindex.   }
procedure if_freenameindex(__ptr:Pif_nameindex);cdecl;external libc;
{$endif}
{ net/if.h  }

// === Konventiert am: 12-8-25 17:05:47 ===


implementation


{ was #define dname def_expr }
function _IOT_ifreq : longint; { return type might be wrong }
  begin
    _IOT_ifreq:=_IOT(_IOTS(char),IFNAMSIZ,_IOTS(char),16,0,0);
  end;

{ was #define dname def_expr }
function _IOT_ifreq_short : longint; { return type might be wrong }
  begin
    _IOT_ifreq_short:=_IOT(_IOTS(char),IFNAMSIZ,_IOTS(smallint),1,0,0);
  end;

{ was #define dname def_expr }
function _IOT_ifreq_int : longint; { return type might be wrong }
  begin
    _IOT_ifreq_int:=_IOT(_IOTS(char),IFNAMSIZ,_IOTS(longint),1,0,0);
  end;


end.
