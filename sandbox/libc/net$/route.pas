unit route;

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
{ Based on the 4.4BSD and Linux version of this file.   }
{$ifndef _NET_ROUTE_H}

const
  _NET_ROUTE_H = 1;  
{$include <features.h>}
{$include <sys/socket.h>}
{$include <sys/types.h>}
{$include <netinet/in.h>}
{$include <bits/wordsize.h>}
{ This structure gets passed by the SIOCADDRT and SIOCDELRT calls.  }
{ Target address.   }
{ Gateway addr (RTF_GATEWAY).   }
{ Target network mask (IP).   }
{$if __WORDSIZE == 64}
{$else}
{$endif}
{ +1 for binary compatibility!   }
{ Forcing the device at add.   }
{ Per route MTU/Window.   }
{ Window clamping.   }
{ Initial RTT.   }
type
  Prtentry = ^Trtentry;
  Trtentry = record
      rt_pad1 : dword;
      rt_dst : Tsockaddr;
      rt_gateway : Tsockaddr;
      rt_genmask : Tsockaddr;
      rt_flags : word;
      rt_pad2 : smallint;
      rt_pad3 : dword;
      rt_tos : byte;
      rt_class : byte;
      rt_pad4 : array[0..2] of smallint;
      rt_pad4 : smallint;
      rt_metric : smallint;
      rt_dev : Pchar;
      rt_mtu : dword;
      rt_window : dword;
      rt_irtt : word;
    end;

{ Compatibility hack.   }

const
  rt_mss = rt_mtu;  
type
  Pin6_rtmsg = ^Tin6_rtmsg;
  Tin6_rtmsg = record
      rtmsg_dst : Tin6_addr;
      rtmsg_src : Tin6_addr;
      rtmsg_gateway : Tin6_addr;
      rtmsg_type : Tuint32_t;
      rtmsg_dst_len : Tuint16_t;
      rtmsg_src_len : Tuint16_t;
      rtmsg_metric : Tuint32_t;
      rtmsg_info : dword;
      rtmsg_flags : Tuint32_t;
      rtmsg_ifindex : longint;
    end;

{ Route usable.   }

const
  RTF_UP = $0001;  
{ Destination is a gateway.   }
  RTF_GATEWAY = $0002;  
{ Host entry (net otherwise).   }
  RTF_HOST = $0004;  
{ Reinstate route after timeout.   }
  RTF_REINSTATE = $0008;  
{ Created dyn. (by redirect).   }
  RTF_DYNAMIC = $0010;  
{ Modified dyn. (by redirect).   }
  RTF_MODIFIED = $0020;  
{ Specific MTU for this route.   }
  RTF_MTU = $0040;  
{ Compatibility.   }
  RTF_MSS = RTF_MTU;  
{ Per route window clamping.   }
  RTF_WINDOW = $0080;  
{ Initial round trip time.   }
  RTF_IRTT = $0100;  
{ Reject route.   }
  RTF_REJECT = $0200;  
{ Manually injected route.   }
  RTF_STATIC = $0400;  
{ External resolver.   }
  RTF_XRESOLVE = $0800;  
{ Forwarding inhibited.   }
  RTF_NOFORWARD = $1000;  
{ Go to next class.   }
  RTF_THROW = $2000;  
{ Do not send packets with DF.   }
  RTF_NOPMTUDISC = $4000;  
{ for IPv6  }
{ default - learned via ND	 }
  RTF_DEFAULT = $00010000;  
{ fallback, no routers on link	 }
  RTF_ALLONLINK = $00020000;  
{ addrconf route - RA		 }
  RTF_ADDRCONF = $00040000;  
{ link specific - device match	 }
  RTF_LINKRT = $00100000;  
{ route with no nexthop	 }
  RTF_NONEXTHOP = $00200000;  
{ cache entry			 }
  RTF_CACHE = $01000000;  
{ flow significant route	 }
  RTF_FLOW = $02000000;  
{ policy route			 }
  RTF_POLICY = $04000000;  
  RTCF_VALVE = $00200000;  
  RTCF_MASQ = $00400000;  
  RTCF_NAT = $00800000;  
  RTCF_DOREDIRECT = $01000000;  
  RTCF_LOG = $02000000;  
  RTCF_DIRECTSRC = $04000000;  
  RTF_LOCAL = $80000000;  
  RTF_INTERFACE = $40000000;  
  RTF_MULTICAST = $20000000;  
  RTF_BROADCAST = $10000000;  
  RTF_NAT = $08000000;  
  RTF_ADDRCLASSMASK = $F8000000;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function RT_ADDRCLASS(flags : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function RT_TOS(tos : longint) : Ttos;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function RT_LOCALADDR(flags : longint) : longint;

const
  RT_CLASS_UNSPEC = 0;  
  RT_CLASS_DEFAULT = 253;  
  RT_CLASS_MAIN = 254;  
  RT_CLASS_LOCAL = 255;  
  RT_CLASS_MAX = 255;  
  RTMSG_ACK = NLMSG_ACK;  
  RTMSG_OVERRUN = NLMSG_OVERRUN;  
  RTMSG_NEWDEVICE = $11;  
  RTMSG_DELDEVICE = $12;  
  RTMSG_NEWROUTE = $21;  
  RTMSG_DELROUTE = $22;  
  RTMSG_NEWRULE = $31;  
  RTMSG_DELRULE = $32;  
  RTMSG_CONTROL = $40;  
{ Address Resolution failed.   }
  RTMSG_AR_FAILED = $51;  
{$endif}
{ net/route.h  }

// === Konventiert am: 12-8-25 17:05:59 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function RT_ADDRCLASS(flags : longint) : longint;
begin
  RT_ADDRCLASS:=(Tuint32_t(flags)) shr 23;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function RT_TOS(tos : longint) : Ttos;
begin
  RT_TOS:=Ttos(@(IPTOS_TOS_MASK));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function RT_LOCALADDR(flags : longint) : longint;
begin
  RT_LOCALADDR:=(flags and RTF_ADDRCLASSMASK)=(RTF_LOCAL or RTF_INTERFACE);
end;


end.
