unit in;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 1991-2024 Free Software Foundation, Inc.
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
{$ifndef	_NETINET_IN_H}

const
  _NETINET_IN_H = 1;  
{$include <features.h>}
{$include <bits/stdint-uintn.h>}
{$include <sys/socket.h>}
{$include <bits/types.h>}
{ Internet address.   }
type
  Pin_addr_t = ^Tin_addr_t;
  Tin_addr_t = Tuint32_t;
  Pin_addr = ^Tin_addr;
  Tin_addr = record
      s_addr : Tin_addr_t;
    end;

{ Get system-specific definitions.   }
{$include <bits/in.h>}
{ Standard well-defined IP protocols.   }
{ Dummy protocol for TCP.   }
{ Internet Control Message Protocol.   }
{ Internet Group Management Protocol.  }
{ IPIP tunnels (older KA9Q tunnels use 94).   }
{ Transmission Control Protocol.   }
{ Exterior Gateway Protocol.   }
{ PUP protocol.   }
{ User Datagram Protocol.   }
{ XNS IDP protocol.   }
{ SO Transport Protocol Class 4.   }
{ Datagram Congestion Control Protocol.   }
{ IPv6 header.   }
{ Reservation Protocol.   }
{ General Routing Encapsulation.   }
{ encapsulating security payload.   }
{ authentication header.   }
{ Multicast Transport Protocol.   }
{ IP option pseudo header for BEET.   }
{ Encapsulation Header.   }
{ Protocol Independent Multicast.   }
{ Compression Header Protocol.   }
{ Layer 2 Tunnelling Protocol.   }
{ Stream Control Transmission Protocol.   }
{ UDP-Lite protocol.   }
{ MPLS in IP.   }
{ Ethernet-within-IPv6 Encapsulation.   }
{ Raw IP packets.   }
{ Multipath TCP connection.   }
type
  Txxxxxxxxxxx =  Longint;
  Const
    IPPROTO_IP = 0;
    IPPROTO_ICMP = 1;
    IPPROTO_IGMP = 2;
    IPPROTO_IPIP = 4;
    IPPROTO_TCP = 6;
    IPPROTO_EGP = 8;
    IPPROTO_PUP = 12;
    IPPROTO_UDP = 17;
    IPPROTO_IDP = 22;
    IPPROTO_TP = 29;
    IPPROTO_DCCP = 33;
    IPPROTO_IPV6 = 41;
    IPPROTO_RSVP = 46;
    IPPROTO_GRE = 47;
    IPPROTO_ESP = 50;
    IPPROTO_AH = 51;
    IPPROTO_MTP = 92;
    IPPROTO_BEETPH = 94;
    IPPROTO_ENCAP = 98;
    IPPROTO_PIM = 103;
    IPPROTO_COMP = 108;
    IPPROTO_L2TP = 115;
    IPPROTO_SCTP = 132;
    IPPROTO_UDPLITE = 136;
    IPPROTO_MPLS = 137;
    IPPROTO_ETHERNET = 143;
    IPPROTO_RAW = 255;
    IPPROTO_MPTCP = 262;
    IPPROTO_MAX = 263;

{ If __USE_KERNEL_IPV6_DEFS is 1 then the user has included the kernel
   network headers first and we should use those ABI-identical definitions
   instead of our own, otherwise 0.   }
{$if !__USE_KERNEL_IPV6_DEFS}
{ IPv6 Hop-by-Hop options.   }
{ IPv6 routing header.   }
{ IPv6 fragmentation header.   }
{ ICMPv6.   }
{ IPv6 no next header.   }
{ IPv6 destination options.   }
{ IPv6 mobility header.   }
type
  Txxxxxxxxx =  Longint;
  Const
    IPPROTO_HOPOPTS = 0;
    IPPROTO_ROUTING = 43;
    IPPROTO_FRAGMENT = 44;
    IPPROTO_ICMPV6 = 58;
    IPPROTO_NONE = 59;
    IPPROTO_DSTOPTS = 60;
    IPPROTO_MH = 135;

{$endif}
{ !__USE_KERNEL_IPV6_DEFS  }
{ Type to represent a port.   }
type
  Pin_port_t = ^Tin_port_t;
  Tin_port_t = Tuint16_t;
{ Standard well-known ports.   }
{ Echo service.   }
{ Discard transmissions service.   }
{ System status service.   }
{ Time of day service.   }
{ Network status service.   }
{ File Transfer Protocol.   }
{ Telnet protocol.   }
{ Simple Mail Transfer Protocol.   }
{ Timeserver service.   }
{ Domain Name Service.   }
{ Internet Whois service.   }
{ Trivial File Transfer Protocol.   }
{ Finger service.   }
{ SUPDUP protocol.   }
{ execd service.   }
{ rlogind service.   }
{ UDP ports.   }
{ Ports less than this value are reserved for privileged processes.   }
{ Ports greater this value are reserved for (non-privileged) servers.   }
  Txxxxxx =  Longint;
  Const
    IPPORT_ECHO = 7;
    IPPORT_DISCARD = 9;
    IPPORT_SYSTAT = 11;
    IPPORT_DAYTIME = 13;
    IPPORT_NETSTAT = 15;
    IPPORT_FTP = 21;
    IPPORT_TELNET = 23;
    IPPORT_SMTP = 25;
    IPPORT_TIMESERVER = 37;
    IPPORT_NAMESERVER = 42;
    IPPORT_WHOIS = 43;
    IPPORT_MTP = 57;
    IPPORT_TFTP = 69;
    IPPORT_RJE = 77;
    IPPORT_FINGER = 79;
    IPPORT_TTYLINK = 87;
    IPPORT_SUPDUP = 95;
    IPPORT_EXECSERVER = 512;
    IPPORT_LOGINSERVER = 513;
    IPPORT_CMDSERVER = 514;
    IPPORT_EFSSERVER = 520;
    IPPORT_BIFFUDP = 512;
    IPPORT_WHOSERVER = 513;
    IPPORT_ROUTESERVER = 520;
    IPPORT_RESERVED = 1024;
    IPPORT_USERRESERVED = 5000;

{ Definitions of the bits in an Internet address integer.

   On subnets, host and network parts are found according to
   the subnet mask, not these masks.   }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function IN_CLASSA(a : longint) : longint;

const
  IN_CLASSA_NET = $ff000000;  
  IN_CLASSA_NSHIFT = 24;  
  IN_CLASSA_HOST = $ffffffff and ( not (IN_CLASSA_NET));  
  IN_CLASSA_MAX = 128;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function IN_CLASSB(a : longint) : longint;

const
  IN_CLASSB_NET = $ffff0000;  
  IN_CLASSB_NSHIFT = 16;  
  IN_CLASSB_HOST = $ffffffff and ( not (IN_CLASSB_NET));  
  IN_CLASSB_MAX = 65536;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function IN_CLASSC(a : longint) : longint;

const
  IN_CLASSC_NET = $ffffff00;  
  IN_CLASSC_NSHIFT = 8;  
  IN_CLASSC_HOST = $ffffffff and ( not (IN_CLASSC_NET));  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function IN_CLASSD(a : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IN_MULTICAST(a : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IN_EXPERIMENTAL(a : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IN_BADCLASS(a : longint) : longint;

{ Address to accept any incoming messages.   }
{ was #define dname def_expr }
function INADDR_ANY : Tin_addr_t;  

{ Address to send to all hosts.   }
{ was #define dname def_expr }
function INADDR_BROADCAST : Tin_addr_t;  

{ Address indicating an error return.   }
{ was #define dname def_expr }
function INADDR_NONE : Tin_addr_t;  

{ Dummy address for source of ICMPv6 errors converted to IPv4 (RFC
   7600).   }
{ was #define dname def_expr }
function INADDR_DUMMY : Tin_addr_t;  

{ Network number for local host loopback.   }
const
  IN_LOOPBACKNET = 127;  
{ Address to loopback in software to local host.   }
{$ifndef INADDR_LOOPBACK}
{ Inet 127.0.0.1.   }

{ was #define dname def_expr }
function INADDR_LOOPBACK : Tin_addr_t;  

{$endif}
{ Defines for Multicast INADDR.   }
{ 224.0.0.0  }

{ was #define dname def_expr }
function INADDR_UNSPEC_GROUP : Tin_addr_t;  

{ 224.0.0.1  }
{ was #define dname def_expr }
function INADDR_ALLHOSTS_GROUP : Tin_addr_t;  

{ 224.0.0.2  }
{ was #define dname def_expr }
function INADDR_ALLRTRS_GROUP : Tin_addr_t;  

{ 224.0.0.106  }
{ was #define dname def_expr }
function INADDR_ALLSNOOPERS_GROUP : Tin_addr_t;  

{ 224.0.0.255  }
{ was #define dname def_expr }
function INADDR_MAX_LOCAL_GROUP : Tin_addr_t;  

{$if !__USE_KERNEL_IPV6_DEFS}
{ IPv6 address  }
type
  Pin6_addr = ^Tin6_addr;
  Tin6_addr = record
      __in6_u : record
          case longint of
            0 : ( __u6_addr8 : array[0..15] of Tuint8_t );
            1 : ( __u6_addr16 : array[0..7] of Tuint16_t );
            2 : ( __u6_addr32 : array[0..3] of Tuint32_t );
          end;
    end;

{$endif}
{ !__USE_KERNEL_IPV6_DEFS  }
  var
    in6addr_any : Tin6_addr;cvar;external libc;
{ ::  }
    in6addr_loopback : Tin6_addr;cvar;external libc;
{ ::1  }
{#define IN6ADDR_ANY_INIT    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0    }
{#define IN6ADDR_LOOPBACK_INIT    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1    }

const
  INET_ADDRSTRLEN = 16;  
  INET6_ADDRSTRLEN = 46;  
{ Structure describing an Internet socket address.   }
{ xxxxxxxxxxxx
struct sockaddr_in
  
    __SOCKADDR_COMMON (sin_);
    in_port_t sin_port;			
    struct in_addr sin_addr;	

    unsigned char sin_zero[sizeof (struct sockaddr)
			   - __SOCKADDR_COMMON_SIZE
			   - sizeof (in_port_t)
			   - sizeof (struct in_addr)];
  ;
 }
{ xxxxxxxxxxxxxxxxx
struct sockaddr_in6
  
    __SOCKADDR_COMMON (sin6_);
    in_port_t sin6_port;	
    uint32_t sin6_flowinfo;	
    struct in6_addr sin6_addr;	
    uint32_t sin6_scope_id;
  ;
 }
{$endif}
{ !__USE_KERNEL_IPV6_DEFS  }
{$ifdef __USE_MISC}
{ IPv4 multicast request.   }
{ IP multicast address of group.   }
{ Local IP address of interface.   }
type
  Pip_mreq = ^Tip_mreq;
  Tip_mreq = record
      imr_multiaddr : Tin_addr;
      imr_interface : Tin_addr;
    end;

{ IPv4 multicast request with interface index.   }
{ IP multicast address of group.   }
{ Local IP address of interface.   }
{ Interface index.   }
  Pip_mreqn = ^Tip_mreqn;
  Tip_mreqn = record
      imr_multiaddr : Tin_addr;
      imr_address : Tin_addr;
      imr_ifindex : longint;
    end;

{ IP multicast address of group.   }
{ IP address of interface.   }
{ IP address of source.   }
  Pip_mreq_source = ^Tip_mreq_source;
  Tip_mreq_source = record
      imr_multiaddr : Tin_addr;
      imr_interface : Tin_addr;
      imr_sourceaddr : Tin_addr;
    end;

{$endif}
{$if !__USE_KERNEL_IPV6_DEFS}
{ Likewise, for IPv6.   }
{ IPv6 multicast address of group  }
{ local interface  }
type
  Pipv6_mreq = ^Tipv6_mreq;
  Tipv6_mreq = record
      ipv6mr_multiaddr : Tin6_addr;
      ipv6mr_interface : dword;
    end;

{$endif}
{ !__USE_KERNEL_IPV6_DEFS  }
{$ifdef __USE_MISC}
{ Multicast group request.   }
{ Interface index.   }
{ Group address.   }
type
  Pgroup_req = ^Tgroup_req;
  Tgroup_req = record
      gr_interface : Tuint32_t;
      gr_group : Tsockaddr_storage;
    end;

{ Interface index.   }
{ Group address.   }
{ Source address.   }
  Pgroup_source_req = ^Tgroup_source_req;
  Tgroup_source_req = record
      gsr_interface : Tuint32_t;
      gsr_group : Tsockaddr_storage;
      gsr_source : Tsockaddr_storage;
    end;

{ Full-state filter operations.   }
{ IP multicast address of group.   }
{ Local IP address of interface.   }
{ Filter mode.   }
{ Number of source addresses.   }
{ Source addresses.   }
  Pip_msfilter = ^Tip_msfilter;
  Tip_msfilter = record
      imsf_multiaddr : Tin_addr;
      imsf_interface : Tin_addr;
      imsf_fmode : Tuint32_t;
      imsf_numsrc : Tuint32_t;
      imsf_slist : array[0..0] of Tin_addr;
    end;

{  xxxxxxxxxxxxxx #define IP_MSFILTER_SIZE(numsrc) (sizeof (struct ip_msfilter) 				  - sizeof (struct in_addr)		      				  + (numsrc) * sizeof (struct in_addr)) }
{ Interface index.   }
{ Group address.   }
{ Filter mode.   }
{ Number of source addresses.   }
{ Source addresses.   }
  Pgroup_filter = ^Tgroup_filter;
  Tgroup_filter = record
      gf_interface : Tuint32_t;
      gf_group : Tsockaddr_storage;
      gf_fmode : Tuint32_t;
      gf_numsrc : Tuint32_t;
      gf_slist : array[0..0] of Tsockaddr_storage;
    end;

{ xxxxxxxxxxxx #define GROUP_FILTER_SIZE(numsrc) (sizeof (struct group_filter) 				   - sizeof (struct sockaddr_storage)  ((numsrc)				      				      * sizeof (struct sockaddr_storage))) }
{$endif}
{ Functions to convert between host and network byte order.

   Please note that these functions normally take `unsigned long int' or
   `unsigned short int' values as arguments and also return them.  But
   this was a short-sighted decision since on different systems the types
   may have different representations but the values are always the same.   }

function ntohl(__netlong:Tuint32_t):Tuint32_t;cdecl;external libc;
function ntohs(__netshort:Tuint16_t):Tuint16_t;cdecl;external libc;
function htonl(__hostlong:Tuint32_t):Tuint32_t;cdecl;external libc;
function htons(__hostshort:Tuint16_t):Tuint16_t;cdecl;external libc;
{$include <endian.h>}
{ Get machine dependent optimized versions of byte swapping functions.   }
{$include <bits/byteswap.h>}
{$include <bits/uintn-identity.h>}
{$ifdef __OPTIMIZE__}
{ We can optimize calls to the conversion functions.  Either nothing has
   to be done or we are using directly the byte-swapping functions which
   often can be inlined.   }
{$if __BYTE_ORDER == __BIG_ENDIAN}
{ The host byte order is the same as network byte order,
   so these functions are all just identity.   }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ntohl(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ntohs(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function htonl(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function htons(x : longint) : longint;

{$else}
{$if __BYTE_ORDER == __LITTLE_ENDIAN}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ntohl(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ntohs(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function htonl(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function htons(x : longint) : longint;

{$endif}
{$endif}
{$endif}
{
#ifdef __GNUC__
# define IN6_IS_ADDR_UNSPECIFIED(a) \
  (__extension__							      \
   ( const struct in6_addr *__a = (const struct in6_addr *) (a);	      \
      __a->__in6_u.__u6_addr32[0] == 0					      \
      && __a->__in6_u.__u6_addr32[1] == 0				      \
      && __a->__in6_u.__u6_addr32[2] == 0				      \
      && __a->__in6_u.__u6_addr32[3] == 0; ))

# define IN6_IS_ADDR_LOOPBACK(a) \
  (__extension__							      \
   ( const struct in6_addr *__a = (const struct in6_addr *) (a);	      \
      __a->__in6_u.__u6_addr32[0] == 0					      \
      && __a->__in6_u.__u6_addr32[1] == 0				      \
      && __a->__in6_u.__u6_addr32[2] == 0				      \
      && __a->__in6_u.__u6_addr32[3] == htonl (1); ))

# define IN6_IS_ADDR_LINKLOCAL(a) \
  (__extension__							      \
   ( const struct in6_addr *__a = (const struct in6_addr *) (a);	      \
      (__a->__in6_u.__u6_addr32[0] & htonl (0xffc00000)) == htonl (0xfe800000); ))

# define IN6_IS_ADDR_SITELOCAL(a) \
  (__extension__							      \
   ( const struct in6_addr *__a = (const struct in6_addr *) (a);	      \
      (__a->__in6_u.__u6_addr32[0] & htonl (0xffc00000)) == htonl (0xfec00000); ))

# define IN6_IS_ADDR_V4MAPPED(a) \
  (__extension__							      \
   ( const struct in6_addr *__a = (const struct in6_addr *) (a);	      \
      __a->__in6_u.__u6_addr32[0] == 0					      \
      && __a->__in6_u.__u6_addr32[1] == 0				      \
      && __a->__in6_u.__u6_addr32[2] == htonl (0xffff); ))

# define IN6_IS_ADDR_V4COMPAT(a) \
  (__extension__							      \
   ( const struct in6_addr *__a = (const struct in6_addr *) (a);	      \
      __a->__in6_u.__u6_addr32[0] == 0					      \
      && __a->__in6_u.__u6_addr32[1] == 0				      \
      && __a->__in6_u.__u6_addr32[2] == 0				      \
      && ntohl (__a->__in6_u.__u6_addr32[3]) > 1; ))

# define IN6_ARE_ADDR_EQUAL(a,b) \
  (__extension__							      \
   ( const struct in6_addr *__a = (const struct in6_addr *) (a);	      \
      const struct in6_addr *__b = (const struct in6_addr *) (b);	      \
      __a->__in6_u.__u6_addr32[0] == __b->__in6_u.__u6_addr32[0]	      \
      && __a->__in6_u.__u6_addr32[1] == __b->__in6_u.__u6_addr32[1]	      \
      && __a->__in6_u.__u6_addr32[2] == __b->__in6_u.__u6_addr32[2]	      \
      && __a->__in6_u.__u6_addr32[3] == __b->__in6_u.__u6_addr32[3]; ))
#else
# define IN6_IS_ADDR_UNSPECIFIED(a) \
	(((const uint32_t *) (a))[0] == 0				      \
	 && ((const uint32_t *) (a))[1] == 0				      \
	 && ((const uint32_t *) (a))[2] == 0				      \
	 && ((const uint32_t *) (a))[3] == 0)

# define IN6_IS_ADDR_LOOPBACK(a) \
	(((const uint32_t *) (a))[0] == 0				      \
	 && ((const uint32_t *) (a))[1] == 0				      \
	 && ((const uint32_t *) (a))[2] == 0				      \
	 && ((const uint32_t *) (a))[3] == htonl (1))

# define IN6_IS_ADDR_LINKLOCAL(a) \
	((((const uint32_t *) (a))[0] & htonl (0xffc00000))		      \
	 == htonl (0xfe800000))

# define IN6_IS_ADDR_SITELOCAL(a) \
	((((const uint32_t *) (a))[0] & htonl (0xffc00000))		      \
	 == htonl (0xfec00000))

# define IN6_IS_ADDR_V4MAPPED(a) \
	((((const uint32_t *) (a))[0] == 0)				      \
	 && (((const uint32_t *) (a))[1] == 0)				      \
	 && (((const uint32_t *) (a))[2] == htonl (0xffff)))

# define IN6_IS_ADDR_V4COMPAT(a) \
	((((const uint32_t *) (a))[0] == 0)				      \
	 && (((const uint32_t *) (a))[1] == 0)				      \
	 && (((const uint32_t *) (a))[2] == 0)				      \
	 && (ntohl (((const uint32_t *) (a))[3]) > 1))

# define IN6_ARE_ADDR_EQUAL(a,b) \
	((((const uint32_t *) (a))[0] == ((const uint32_t *) (b))[0])	      \
	 && (((const uint32_t *) (a))[1] == ((const uint32_t *) (b))[1])      \
	 && (((const uint32_t *) (a))[2] == ((const uint32_t *) (b))[2])      \
	 && (((const uint32_t *) (a))[3] == ((const uint32_t *) (b))[3]))
#endif
 }
{ #define IN6_IS_ADDR_MULTICAST(a) (((const uint8_t *) (a))[0] == 0xff) }
{$ifdef __USE_MISC}
{ Bind socket to a privileged IP port.   }

function bindresvport(__sockfd:longint; __sock_in:Psockaddr_in):longint;cdecl;external libc;
{ The IPv6 version of this function.   }
function bindresvport6(__sockfd:longint; __sock_in:Psockaddr_in6):longint;cdecl;external libc;
{$endif}
{ xxxxxxxxxxxx
#define IN6_IS_ADDR_MC_NODELOCAL(a) \
	(IN6_IS_ADDR_MULTICAST(a)					      \
	 && ((((const uint8_t *) (a))[1] & 0xf) == 0x1))

#define IN6_IS_ADDR_MC_LINKLOCAL(a) \
	(IN6_IS_ADDR_MULTICAST(a)					      \
	 && ((((const uint8_t *) (a))[1] & 0xf) == 0x2))

#define IN6_IS_ADDR_MC_SITELOCAL(a) \
	(IN6_IS_ADDR_MULTICAST(a)					      \
	 && ((((const uint8_t *) (a))[1] & 0xf) == 0x5))

#define IN6_IS_ADDR_MC_ORGLOCAL(a) \
	(IN6_IS_ADDR_MULTICAST(a)					      \
	 && ((((const uint8_t *) (a))[1] & 0xf) == 0x8))

#define IN6_IS_ADDR_MC_GLOBAL(a) \
	(IN6_IS_ADDR_MULTICAST(a)					      \
	 && ((((const uint8_t *) (a))[1] & 0xf) == 0xe))
 }
{$ifdef __USE_GNU}
type
  Pcmsghdr = ^Tcmsghdr;
  Tcmsghdr = record
      {undefined structure}
    end;

{ Forward declaration.   }
{$if !__USE_KERNEL_IPV6_DEFS}
{ IPv6 packet information.   }
{ src/dst IPv6 address  }
{ send/recv interface index  }
type
  Pin6_pktinfo = ^Tin6_pktinfo;
  Tin6_pktinfo = record
      ipi6_addr : Tin6_addr;
      ipi6_ifindex : dword;
    end;

{ IPv6 MTU information.   }
{ dst address including zone ID  }
{ path MTU in host byte order  }
  Pip6_mtuinfo = ^Tip6_mtuinfo;
  Tip6_mtuinfo = record
      ip6m_addr : Tsockaddr_in6;
      ip6m_mtu : Tuint32_t;
    end;

{$endif}
{ !__USE_KERNEL_IPV6_DEFS  }
{ Obsolete hop-by-hop and Destination Options Processing (RFC 2292).   }
{__attribute_deprecated__ }
function inet6_option_space(__nbytes:longint):longint;cdecl;external libc;
{__attribute_deprecated__ }function inet6_option_init(__bp:pointer; __cmsgp:PPcmsghdr; __type:longint):longint;cdecl;external libc;
{__attribute_deprecated__ }function inet6_option_append(__cmsg:Pcmsghdr; __typep:Puint8_t; __multx:longint; __plusy:longint):longint;cdecl;external libc;
{__attribute_deprecated__ }function inet6_option_alloc(__cmsg:Pcmsghdr; __datalen:longint; __multx:longint; __plusy:longint):Puint8_t;cdecl;external libc;
{__attribute_deprecated__ }function inet6_option_next(__cmsg:Pcmsghdr; __tptrp:PPuint8_t):longint;cdecl;external libc;
{__attribute_deprecated__ }function inet6_option_find(__cmsg:Pcmsghdr; __tptrp:PPuint8_t; __type:longint):longint;cdecl;external libc;
{ Hop-by-Hop and Destination Options Processing (RFC 3542).   }
function inet6_opt_init(__extbuf:pointer; __extlen:Tsocklen_t):longint;cdecl;external libc;
function inet6_opt_append(__extbuf:pointer; __extlen:Tsocklen_t; __offset:longint; __type:Tuint8_t; __len:Tsocklen_t; 
           __align:Tuint8_t; __databufp:Ppointer):longint;cdecl;external libc;
function inet6_opt_finish(__extbuf:pointer; __extlen:Tsocklen_t; __offset:longint):longint;cdecl;external libc;
function inet6_opt_set_val(__databuf:pointer; __offset:longint; __val:pointer; __vallen:Tsocklen_t):longint;cdecl;external libc;
function inet6_opt_next(__extbuf:pointer; __extlen:Tsocklen_t; __offset:longint; __typep:Puint8_t; __lenp:Psocklen_t; 
           __databufp:Ppointer):longint;cdecl;external libc;
function inet6_opt_find(__extbuf:pointer; __extlen:Tsocklen_t; __offset:longint; __type:Tuint8_t; __lenp:Psocklen_t; 
           __databufp:Ppointer):longint;cdecl;external libc;
function inet6_opt_get_val(__databuf:pointer; __offset:longint; __val:pointer; __vallen:Tsocklen_t):longint;cdecl;external libc;
{ Routing Header Option (RFC 3542).   }
function inet6_rth_space(__type:longint; __segments:longint):Tsocklen_t;cdecl;external libc;
function inet6_rth_init(__bp:pointer; __bp_len:Tsocklen_t; __type:longint; __segments:longint):pointer;cdecl;external libc;
function inet6_rth_add(__bp:pointer; __addr:Pin6_addr):longint;cdecl;external libc;
function inet6_rth_reverse(__in:pointer; __out:pointer):longint;cdecl;external libc;
function inet6_rth_segments(__bp:pointer):longint;cdecl;external libc;
function inet6_rth_getaddr(__bp:pointer; __index:longint):Pin6_addr;cdecl;external libc;
{ Multicast source filter support.   }
{ Get IPv4 source filter.   }
function getipv4sourcefilter(__s:longint; __interface_addr:Tin_addr; __group:Tin_addr; __fmode:Puint32_t; __numsrc:Puint32_t; 
           __slist:Pin_addr):longint;cdecl;external libc;
{ Set IPv4 source filter.   }
function setipv4sourcefilter(__s:longint; __interface_addr:Tin_addr; __group:Tin_addr; __fmode:Tuint32_t; __numsrc:Tuint32_t; 
           __slist:Pin_addr):longint;cdecl;external libc;
{ Get source filter.   }
function getsourcefilter(__s:longint; __interface_addr:Tuint32_t; __group:Psockaddr; __grouplen:Tsocklen_t; __fmode:Puint32_t; 
           __numsrc:Puint32_t; __slist:Psockaddr_storage):longint;cdecl;external libc;
{ Set source filter.   }
function setsourcefilter(__s:longint; __interface_addr:Tuint32_t; __group:Psockaddr; __grouplen:Tsocklen_t; __fmode:Tuint32_t; 
           __numsrc:Tuint32_t; __slist:Psockaddr_storage):longint;cdecl;external libc;
{$endif}
{ use GNU  }
{$endif}
{ netinet/in.h  }

// === Konventiert am: 11-8-25 15:44:03 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IN_CLASSA(a : longint) : longint;
begin
  IN_CLASSA:=((Tin_addr_t(a)) and $80000000)=0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IN_CLASSB(a : longint) : longint;
begin
  IN_CLASSB:=((Tin_addr_t(a)) and $c0000000)=$80000000;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IN_CLASSC(a : longint) : longint;
begin
  IN_CLASSC:=((Tin_addr_t(a)) and $e0000000)=$c0000000;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IN_CLASSD(a : longint) : longint;
begin
  IN_CLASSD:=((Tin_addr_t(a)) and $f0000000)=$e0000000;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IN_MULTICAST(a : longint) : longint;
begin
  IN_MULTICAST:=IN_CLASSD(a);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IN_EXPERIMENTAL(a : longint) : longint;
begin
  IN_EXPERIMENTAL:=((Tin_addr_t(a)) and $e0000000)=$e0000000;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IN_BADCLASS(a : longint) : longint;
begin
  IN_BADCLASS:=((Tin_addr_t(a)) and $f0000000)=$f0000000;
end;

{ was #define dname def_expr }
function INADDR_ANY : Tin_addr_t;
  begin
    INADDR_ANY:=Tin_addr_t($00000000);
  end;

{ was #define dname def_expr }
function INADDR_BROADCAST : Tin_addr_t;
  begin
    INADDR_BROADCAST:=Tin_addr_t($ffffffff);
  end;

{ was #define dname def_expr }
function INADDR_NONE : Tin_addr_t;
  begin
    INADDR_NONE:=Tin_addr_t($ffffffff);
  end;

{ was #define dname def_expr }
function INADDR_DUMMY : Tin_addr_t;
  begin
    INADDR_DUMMY:=Tin_addr_t($c0000008);
  end;

{ was #define dname def_expr }
function INADDR_LOOPBACK : Tin_addr_t;
  begin
    INADDR_LOOPBACK:=Tin_addr_t($7f000001);
  end;

{ was #define dname def_expr }
function INADDR_UNSPEC_GROUP : Tin_addr_t;
  begin
    INADDR_UNSPEC_GROUP:=Tin_addr_t($e0000000);
  end;

{ was #define dname def_expr }
function INADDR_ALLHOSTS_GROUP : Tin_addr_t;
  begin
    INADDR_ALLHOSTS_GROUP:=Tin_addr_t($e0000001);
  end;

{ was #define dname def_expr }
function INADDR_ALLRTRS_GROUP : Tin_addr_t;
  begin
    INADDR_ALLRTRS_GROUP:=Tin_addr_t($e0000002);
  end;

{ was #define dname def_expr }
function INADDR_ALLSNOOPERS_GROUP : Tin_addr_t;
  begin
    INADDR_ALLSNOOPERS_GROUP:=Tin_addr_t($e000006a);
  end;

{ was #define dname def_expr }
function INADDR_MAX_LOCAL_GROUP : Tin_addr_t;
  begin
    INADDR_MAX_LOCAL_GROUP:=Tin_addr_t($e00000ff);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ntohl(x : longint) : longint;
begin
  ntohl:=__uint32_identity(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ntohs(x : longint) : longint;
begin
  ntohs:=__uint16_identity(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function htonl(x : longint) : longint;
begin
  htonl:=__uint32_identity(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function htons(x : longint) : longint;
begin
  htons:=__uint16_identity(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ntohl(x : longint) : longint;
begin
  ntohl:=__bswap_32(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ntohs(x : longint) : longint;
begin
  ntohs:=__bswap_16(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function htonl(x : longint) : longint;
begin
  htonl:=__bswap_32(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function htons(x : longint) : longint;
begin
  htons:=__bswap_16(x);
end;


end.
