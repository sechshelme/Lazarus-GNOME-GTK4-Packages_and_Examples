unit if_arp;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Definitions for Address Resolution Protocol.
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
{ Based on the 4.4BSD and Linux version of this file.   }
{$ifndef _NET_IF_ARP_H}

const
  _NET_IF_ARP_H = 1;  
{$include <sys/types.h>}
{$include <sys/socket.h>}
{$include <stdint.h>}
{ Some internals from deep down in the kernel.   }

const
  MAX_ADDR_LEN = 7;  
{ This structure defines an ethernet arp header.   }
{ ARP protocol opcodes.  }
{ ARP request.   }
  ARPOP_REQUEST = 1;  
{ ARP reply.   }
  ARPOP_REPLY = 2;  
{ RARP request.   }
  ARPOP_RREQUEST = 3;  
{ RARP reply.   }
  ARPOP_RREPLY = 4;  
{ InARP request.   }
  ARPOP_InREQUEST = 8;  
{ InARP reply.   }
  ARPOP_InREPLY = 9;  
{ (ATM)ARP NAK.   }
  ARPOP_NAK = 10;  
{ See RFC 826 for protocol description.  ARP packets are variable
   in size; the arphdr structure defines the fixed-length portion.
   Protocol type values are the same as those for 10 Mb/s Ethernet.
   It is followed by the variable-sized fields ar_sha, arp_spa,
   arp_tha and arp_tpa in that order, according to the lengths
   specified.  Field names used correspond to RFC 826.   }
{ Format of hardware address.   }
{ Format of protocol address.   }
{ Length of hardware address.   }
{ Length of protocol address.   }
{ ARP opcode (command).   }
{$if 0}
{ Ethernet looks like this : This bit is variable sized
       however...   }
{ Sender hardware address.   }
{ Sender IP address.   }
{ Target hardware address.   }
{ Target IP address.   }
{$endif}
type
  Parphdr = ^Tarphdr;
  Tarphdr = record
      ar_hrd : word;
      ar_pro : word;
      ar_hln : byte;
      ar_pln : byte;
      ar_op : word;
      __ar_sha : array[0..(ETH_ALEN)-1] of byte;
      __ar_sip : array[0..3] of byte;
      __ar_tha : array[0..(ETH_ALEN)-1] of byte;
      __ar_tip : array[0..3] of byte;
    end;

{ ARP protocol HARDWARE identifiers.  }
{ From KA9Q: NET/ROM pseudo.  }

const
  ARPHRD_NETROM = 0;  
{ Ethernet 10/100Mbps.   }
  ARPHRD_ETHER = 1;  
{ Experimental Ethernet.   }
  ARPHRD_EETHER = 2;  
{ AX.25 Level 2.   }
  ARPHRD_AX25 = 3;  
{ PROnet token ring.   }
  ARPHRD_PRONET = 4;  
{ Chaosnet.   }
  ARPHRD_CHAOS = 5;  
{ IEEE 802.2 Ethernet/TR/TB.   }
  ARPHRD_IEEE802 = 6;  
{ ARCnet.   }
  ARPHRD_ARCNET = 7;  
{ APPLEtalk.   }
  ARPHRD_APPLETLK = 8;  
{ Frame Relay DLCI.   }
  ARPHRD_DLCI = 15;  
{ ATM.   }
  ARPHRD_ATM = 19;  
{ Metricom STRIP (new IANA id).   }
  ARPHRD_METRICOM = 23;  
{ IEEE 1394 IPv4 - RFC 2734.   }
  ARPHRD_IEEE1394 = 24;  
{ EUI-64.   }
  ARPHRD_EUI64 = 27;  
{ InfiniBand.   }
  ARPHRD_INFINIBAND = 32;  
{ Dummy types for non ARP hardware  }
  ARPHRD_SLIP = 256;  
  ARPHRD_CSLIP = 257;  
  ARPHRD_SLIP6 = 258;  
  ARPHRD_CSLIP6 = 259;  
{ Notional KISS type.   }
  ARPHRD_RSRVD = 260;  
  ARPHRD_ADAPT = 264;  
  ARPHRD_ROSE = 270;  
{ CCITT X.25.   }
  ARPHRD_X25 = 271;  
{ Boards with X.25 in firmware.   }
  ARPHRD_HWX25 = 272;  
{ Controller Area Network.   }
  ARPHRD_CAN = 280;  
  ARPHRD_MCTP = 290;  
  ARPHRD_PPP = 512;  
{ Cisco HDLC.   }
  ARPHRD_CISCO = 513;  
  ARPHRD_HDLC = ARPHRD_CISCO;  
{ LAPB.   }
  ARPHRD_LAPB = 516;  
{ Digital's DDCMP.   }
  ARPHRD_DDCMP = 517;  
{ Raw HDLC.   }
  ARPHRD_RAWHDLC = 518;  
{ Raw IP.   }
  ARPHRD_RAWIP = 519;  
{ IPIP tunnel.   }
  ARPHRD_TUNNEL = 768;  
{ IPIP6 tunnel.   }
  ARPHRD_TUNNEL6 = 769;  
{ Frame Relay Access Device.   }
  ARPHRD_FRAD = 770;  
{ SKIP vif.   }
  ARPHRD_SKIP = 771;  
{ Loopback device.   }
  ARPHRD_LOOPBACK = 772;  
{ Localtalk device.   }
  ARPHRD_LOCALTLK = 773;  
{ Fiber Distributed Data Interface.  }
  ARPHRD_FDDI = 774;  
{ AP1000 BIF.   }
  ARPHRD_BIF = 775;  
{ sit0 device - IPv6-in-IPv4.   }
  ARPHRD_SIT = 776;  
{ IP-in-DDP tunnel.   }
  ARPHRD_IPDDP = 777;  
{ GRE over IP.   }
  ARPHRD_IPGRE = 778;  
{ PIMSM register interface.   }
  ARPHRD_PIMREG = 779;  
{ High Performance Parallel I'face.  }
  ARPHRD_HIPPI = 780;  
{ (Nexus Electronics) Ash.   }
  ARPHRD_ASH = 781;  
{ Acorn Econet.   }
  ARPHRD_ECONET = 782;  
{ Linux-IrDA.   }
  ARPHRD_IRDA = 783;  
{ Point to point fibrechanel.   }
  ARPHRD_FCPP = 784;  
{ Fibrechanel arbitrated loop.   }
  ARPHRD_FCAL = 785;  
{ Fibrechanel public loop.   }
  ARPHRD_FCPL = 786;  
{ Fibrechanel fabric.   }
  ARPHRD_FCFABRIC = 787;  
{ Magic type ident for TR.   }
  ARPHRD_IEEE802_TR = 800;  
{ IEEE 802.11.   }
  ARPHRD_IEEE80211 = 801;  
{ IEEE 802.11 + Prism2 header.   }
  ARPHRD_IEEE80211_PRISM = 802;  
{ IEEE 802.11 + radiotap header.   }
  ARPHRD_IEEE80211_RADIOTAP = 803;  
{ IEEE 802.15.4 header.   }
  ARPHRD_IEEE802154 = 804;  
{ IEEE 802.15.4 PHY header.   }
  ARPHRD_IEEE802154_PHY = 805;  
{ Void type, nothing is known.   }
  ARPHRD_VOID = $FFFF;  
{ Zero header length.   }
  ARPHRD_NONE = $FFFE;  
{ ARP ioctl request.   }
{ Protocol address.   }
{ Hardware address.   }
{ Flags.   }
{ Netmask (only for proxy arps).   }
type
  Parpreq = ^Tarpreq;
  Tarpreq = record
      arp_pa : Tsockaddr;
      arp_ha : Tsockaddr;
      arp_flags : longint;
      arp_netmask : Tsockaddr;
      arp_dev : array[0..15] of char;
    end;

{ Protocol address.   }
{ Hardware address.   }
{ Flags.   }
{ Netmask (only for proxy arps).   }
  Parpreq_old = ^Tarpreq_old;
  Tarpreq_old = record
      arp_pa : Tsockaddr;
      arp_ha : Tsockaddr;
      arp_flags : longint;
      arp_netmask : Tsockaddr;
    end;

{ ARP Flag values.   }
{ Completed entry (ha valid).   }

const
  ATF_COM = $02;  
{ Permanent entry.   }
  ATF_PERM = $04;  
{ Publish entry.   }
  ATF_PUBL = $08;  
{ Has requested trailers.   }
  ATF_USETRAILERS = $10;  
{ Want to use a netmask (only
					   for proxy entries).   }
  ATF_NETMASK = $20;  
{ Don't answer this addresses.   }
  ATF_DONTPUB = $40;  
{ Automatically added entry.   }
  ATF_MAGIC = $80;  
{ Support for the user space arp daemon, arpd.   }
  ARPD_UPDATE = $01;  
  ARPD_LOOKUP = $02;  
  ARPD_FLUSH = $03;  
{ Request type.   }
{ IP address of entry.   }
{ Device entry is tied to.   }
{ Hardware address.   }
type
  Parpd_request = ^Tarpd_request;
  Tarpd_request = record
      req : word;
      ip : Tuint32_t;
      dev : dword;
      stamp : dword;
      updated : dword;
      ha : array[0..(MAX_ADDR_LEN)-1] of byte;
    end;

{$endif}
{ net/if_arp.h  }

// === Konventiert am: 12-8-25 17:05:49 ===


implementation



end.
