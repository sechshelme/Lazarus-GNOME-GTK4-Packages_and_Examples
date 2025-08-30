
unit pcap;
interface

{
  Automatically converted by H2Pas 1.0.0 from pcap.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pcap.h
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
PAirpcapHandle  = ^AirpcapHandle;
Pbpf_int32  = ^bpf_int32;
Pbpf_program  = ^bpf_program;
Pbpf_u_int32  = ^bpf_u_int32;
Pchar  = ^char;
PFILE  = ^FILE;
Plongint  = ^longint;
PPAirpcapHandle  = ^PAirpcapHandle;
Ppcap_addr  = ^pcap_addr;
Ppcap_direction_t  = ^pcap_direction_t;
Ppcap_dumper_t  = ^pcap_dumper_t;
Ppcap_file_header  = ^pcap_file_header;
Ppcap_if  = ^pcap_if;
Ppcap_if_t  = ^pcap_if_t;
Ppcap_pkthdr  = ^pcap_pkthdr;
Ppcap_rmtauth  = ^pcap_rmtauth;
Ppcap_samp  = ^pcap_samp;
Ppcap_send_queue  = ^pcap_send_queue;
Ppcap_stat  = ^pcap_stat;
Ppcap_stat_ex  = ^pcap_stat_ex;
Ppcap_t  = ^pcap_t;
Psize_t  = ^size_t;
Psockaddr  = ^sockaddr;
Ptimeval  = ^timeval;
Pu_char  = ^u_char;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: c; tab-width: 8; indent-tabs-mode: 1; c-basic-offset: 8; -*-  }
{
 * Copyright (c) 1993, 1994, 1995, 1996, 1997
 *	The Regents of the University of California.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *	This product includes software developed by the Computer Systems
 *	Engineering Group at Lawrence Berkeley Laboratory.
 * 4. Neither the name of the University nor of the Laboratory may be used
 *    to endorse or promote products derived from this software without
 *    specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
  }
{
 * Remote packet capture mechanisms and extensions from WinPcap:
 *
 * Copyright (c) 2002 - 2003
 * NetGroup, Politecnico di Torino (Italy)
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 * 3. Neither the name of the Politecnico di Torino nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
  }
{$ifndef lib_pcap_pcap_h}
{$define lib_pcap_pcap_h}
{
 * Some software that uses libpcap/WinPcap/Npcap defines _MSC_VER before
 * including pcap.h if it's not defined - and it defines it to 1500.
 * (I'm looking at *you*, lwIP!)
 *
 * Attempt to detect this, and undefine _MSC_VER so that we can *reliably*
 * use it to know what compiler is being used and, if it's Visual Studio,
 * what version is being used.
  }
{$if defined(_MSC_VER)}
{
   * We assume here that software such as that doesn't define _MSC_FULL_VER
   * as well and that it defines _MSC_VER with a value > 1200.
   *
   * DO NOT BREAK THESE ASSUMPTIONS.  IF YOU FEEL YOU MUST DEFINE _MSC_VER
   * WITH A COMPILER THAT'S NOT MICROSOFT'S C COMPILER, PLEASE CONTACT
   * US SO THAT WE CAN MAKE IT SO THAT YOU DON'T HAVE TO DO THAT.  THANK
   * YOU.
   *
   * OK, is _MSC_FULL_VER defined?
    }
{$if !defined(_MSC_FULL_VER)}
{
     * According to
     *
     *    https://sourceforge.net/p/predef/wiki/Compilers/
     *
     * with "Visual C++ 6.0 Processor Pack"/Visual C++ 6.0 SP6 and
     * later, _MSC_FULL_VER is defined, so either this is an older
     * version of Visual C++ or it's not Visual C++ at all.
     *
     * For Visual C++ 6.0, _MSC_VER is defined as 1200.
      }
{$if _MSC_VER > 1200}
{
       * If this is Visual C++, _MSC_FULL_VER should be defined, so we
       * assume this isn't Visual C++, and undo the lie that it is.
        }
{$undef _MSC_VER}
{$endif}
{$endif}
{$endif}
{$include <pcap/funcattrs.h>}
{$include <pcap/pcap-inttypes.h>}
{$if defined(_WIN32)}
{$include <winsock2.h>		/* u_int, u_char etc. */}
{$include <io.h>		/* _get_osfhandle() */}
(*** was #elif ****){$else defined(MSDOS)}
{$include <sys/types.h>	/* u_int, u_char etc. */}
{$include <sys/socket.h>}
{$else}
{ UN*X  }
{$include <sys/types.h>	/* u_int, u_char etc. */}
{$include <sys/time.h>}
{$endif}
{ _WIN32/MSDOS/UN*X  }
{$include <pcap/socket.h>	/* for SOCKET, as the active-mode rpcap APIs use it */}
{$ifndef PCAP_DONT_INCLUDE_PCAP_BPF_H}
{$include <pcap/bpf.h>}
{$endif}
{$include <stdio.h>}
{ C++ extern C conditionnal removed }
{
 * Version number of the current version of the pcap file format.
 *
 * NOTE: this is *NOT* the version number of the libpcap library.
 * To fetch the version information for the version of libpcap
 * you're using, use pcap_lib_version().
  }

const
  PCAP_VERSION_MAJOR = 2;  
  PCAP_VERSION_MINOR = 4;  
  PCAP_ERRBUF_SIZE = 256;  
{
 * Compatibility for systems that have a bpf.h that
 * predates the bpf typedefs for 64-bit support.
  }
{$if BPF_RELEASE - 0 < 199406}
type
  Pbpf_int32 = ^Tbpf_int32;
  Tbpf_int32 = longint;

  Pbpf_u_int32 = ^Tbpf_u_int32;
  Tbpf_u_int32 = Tu_int;
{$endif}
type
  Tpcap = Tpcap_t;
  Tpcap_dumper = Tpcap_dumper_t;
  Tpcap_if = Tpcap_if_t;
  Tpcap_addr = Tpcap_addr_t;
{
 * The first record in the file contains saved values for some
 * of the flags used in the printout phases of tcpdump.
 * Many fields here are 32 bit ints so compilers won't insert unwanted
 * padding; these files need to be interchangeable across architectures.
 * Documentation: https://www.tcpdump.org/manpages/pcap-savefile.5.txt.
 *
 * Do not change the layout of this structure, in any way (this includes
 * changes that only affect the length of fields in this structure).
 *
 * Also, do not change the interpretation of any of the members of this
 * structure, in any way (this includes using values other than
 * LINKTYPE_ values, as defined in "savefile.c", in the "linktype"
 * field).
 *
 * Instead:
 *
 *	introduce a new structure for the new format, if the layout
 *	of the structure changed;
 *
 *	send mail to "tcpdump-workers@lists.tcpdump.org", requesting
 *	a new magic number for your new capture file format, and, when
 *	you get the new magic number, put it in "savefile.c";
 *
 *	use that magic number for save files with the changed file
 *	header;
 *
 *	make the code in "savefile.c" capable of reading files with
 *	the old file header as well as files with the new file header
 *	(using the magic number to determine the header format).
 *
 * Then supply the changes by forking the branch at
 *
 *	https://github.com/the-tcpdump-group/libpcap/tree/master
 *
 * and issuing a pull request, so that future versions of libpcap and
 * programs that use it (such as tcpdump) will be able to read your new
 * capture file format.
  }
{ gmt to local correction; this is always 0  }
{ accuracy of timestamps; this is always 0  }
{ max length saved portion of each pkt  }
{ data link type (LINKTYPE_*)  }
  Ppcap_file_header = ^Tpcap_file_header;
  Tpcap_file_header = record
      magic : Tbpf_u_int32;
      version_major : Tu_short;
      version_minor : Tu_short;
      thiszone : Tbpf_int32;
      sigfigs : Tbpf_u_int32;
      snaplen : Tbpf_u_int32;
      linktype : Tbpf_u_int32;
    end;

{
 * Macros for the value returned by pcap_datalink_ext().
 *
 * If LT_FCS_LENGTH_PRESENT(x) is true, the LT_FCS_LENGTH(x) macro
 * gives the FCS length of packets in the capture.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function LT_FCS_LENGTH_PRESENT(x : longint) : Tx;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LT_FCS_LENGTH(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LT_FCS_DATALINK_EXT(x : longint) : longint;

type
  Ppcap_direction_t = ^Tpcap_direction_t;
  Tpcap_direction_t =  Longint;
  Const
    PCAP_D_INOUT = 0;
    PCAP_D_IN = 1;
    PCAP_D_OUT = 2;
;
{
 * Generic per-packet information, as supplied by libpcap.
 *
 * The time stamp can and should be a "struct timeval", regardless of
 * whether your system supports 32-bit tv_sec in "struct timeval",
 * 64-bit tv_sec in "struct timeval", or both if it supports both 32-bit
 * and 64-bit applications.  The on-disk format of savefiles uses 32-bit
 * tv_sec (and tv_usec); this structure is irrelevant to that.  32-bit
 * and 64-bit versions of libpcap, even if they're on the same platform,
 * should supply the appropriate version of "struct timeval", even if
 * that's not what the underlying packet capture mechanism supplies.
  }
{ time stamp  }
{ length of portion present  }
{ length of this packet (off wire)  }
type
  Ppcap_pkthdr = ^Tpcap_pkthdr;
  Tpcap_pkthdr = record
      ts : Ttimeval;
      caplen : Tbpf_u_int32;
      len : Tbpf_u_int32;
    end;

{
 * As returned by the pcap_stats()
  }
{ number of packets received  }
{ number of packets dropped  }
{ drops by interface -- only supported on some platforms  }
{$ifdef _WIN32}
{ number of packets that reach the application  }
{ number of packets sent by the server on the network  }
{ number of packets lost on the network  }
{$endif}
{ _WIN32  }
type
  Ppcap_stat = ^Tpcap_stat;
  Tpcap_stat = record
      ps_recv : Tu_int;
      ps_drop : Tu_int;
      ps_ifdrop : Tu_int;
      ps_capt : Tu_int;
      ps_sent : Tu_int;
      ps_netdrop : Tu_int;
    end;

{$ifdef MSDOS}
{
 * As returned by the pcap_stats_ex()
  }
{ total packets received        }
{ total packets transmitted     }
{ total bytes received          }
{ total bytes transmitted       }
{ bad packets received          }
{ packet transmit problems      }
{ no space in Rx buffers        }
{ no space available for Tx     }
{ multicast packets received    }
{ detailed rx_errors:  }
{ receiver ring buff overflow   }
{ recv'd pkt with crc error     }
{ recv'd frame alignment error  }
{ recv'r fifo overrun           }
{ recv'r missed packet          }
{ detailed tx_errors  }
  Ppcap_stat_ex = ^Tpcap_stat_ex;
  Tpcap_stat_ex = record
      rx_packets : Tu_long;
      tx_packets : Tu_long;
      rx_bytes : Tu_long;
      tx_bytes : Tu_long;
      rx_errors : Tu_long;
      tx_errors : Tu_long;
      rx_dropped : Tu_long;
      tx_dropped : Tu_long;
      multicast : Tu_long;
      collisions : Tu_long;
      rx_length_errors : Tu_long;
      rx_over_errors : Tu_long;
      rx_crc_errors : Tu_long;
      rx_frame_errors : Tu_long;
      rx_fifo_errors : Tu_long;
      rx_missed_errors : Tu_long;
      tx_aborted_errors : Tu_long;
      tx_carrier_errors : Tu_long;
      tx_fifo_errors : Tu_long;
      tx_heartbeat_errors : Tu_long;
      tx_window_errors : Tu_long;
    end;

{$endif}
{
 * Item in a list of interfaces.
  }
{ name to hand to "pcap_open_live()"  }
{ textual description of interface, or NULL  }
{ PCAP_IF_ interface flags  }
type
  Ppcap_if = ^Tpcap_if;
  Tpcap_if = record
      next : Ppcap_if;
      name : Pchar;
      description : Pchar;
      addresses : Ppcap_addr;
      flags : Tbpf_u_int32;
    end;

{ interface is loopback  }

const
  PCAP_IF_LOOPBACK = $00000001;  
{ interface is up  }
  PCAP_IF_UP = $00000002;  
{ interface is running  }
  PCAP_IF_RUNNING = $00000004;  
{ interface is wireless (*NOT* necessarily Wi-Fi!)  }
  PCAP_IF_WIRELESS = $00000008;  
{ connection status:  }
  PCAP_IF_CONNECTION_STATUS = $00000030;  
{ unknown  }
  PCAP_IF_CONNECTION_STATUS_UNKNOWN = $00000000;  
{ connected  }
  PCAP_IF_CONNECTION_STATUS_CONNECTED = $00000010;  
{ disconnected  }
  PCAP_IF_CONNECTION_STATUS_DISCONNECTED = $00000020;  
{ not applicable  }
  PCAP_IF_CONNECTION_STATUS_NOT_APPLICABLE = $00000030;  
{
 * Representation of an interface address.
  }
{ address  }
{ netmask for that address  }
{ broadcast address for that address  }
{ P2P destination address for that address  }
type
  Ppcap_addr = ^Tpcap_addr;
  Tpcap_addr = record
      next : Ppcap_addr;
      addr : Psockaddr;
      netmask : Psockaddr;
      broadaddr : Psockaddr;
      dstaddr : Psockaddr;
    end;

(* Const before type ignored *)
(* Const before type ignored *)

  Tpcap_handler = procedure (para1:Pu_char; para2:Ppcap_pkthdr; para3:Pu_char);cdecl;
{
 * Error codes for the pcap API.
 * These will all be negative, so you can check for the success or
 * failure of a call that returns these codes by checking for a
 * negative value.
  }
{ generic error code  }

const
  PCAP_ERROR = -(1);  
{ loop terminated by pcap_breakloop  }
  PCAP_ERROR_BREAK = -(2);  
{ the capture needs to be activated  }
  PCAP_ERROR_NOT_ACTIVATED = -(3);  
{ the operation can't be performed on already activated captures  }
  PCAP_ERROR_ACTIVATED = -(4);  
{ no such device exists  }
  PCAP_ERROR_NO_SUCH_DEVICE = -(5);  
{ this device doesn't support rfmon (monitor) mode  }
  PCAP_ERROR_RFMON_NOTSUP = -(6);  
{ operation supported only in monitor mode  }
  PCAP_ERROR_NOT_RFMON = -(7);  
{ no permission to open the device  }
  PCAP_ERROR_PERM_DENIED = -(8);  
{ interface isn't up  }
  PCAP_ERROR_IFACE_NOT_UP = -(9);  
{ this device doesn't support setting the time stamp type  }
  PCAP_ERROR_CANTSET_TSTAMP_TYPE = -(10);  
{ you don't have permission to capture in promiscuous mode  }
  PCAP_ERROR_PROMISC_PERM_DENIED = -(11);  
{ the requested time stamp precision is not supported  }
  PCAP_ERROR_TSTAMP_PRECISION_NOTSUP = -(12);  
{
 * Warning codes for the pcap API.
 * These will all be positive and non-zero, so they won't look like
 * errors.
  }
{ generic warning code  }
  PCAP_WARNING = 1;  
{ this device doesn't support promiscuous mode  }
  PCAP_WARNING_PROMISC_NOTSUP = 2;  
{ the requested time stamp type is not supported  }
  PCAP_WARNING_TSTAMP_TYPE_NOTSUP = 3;  
{
 * Value to pass to pcap_compile() as the netmask if you don't know what
 * the netmask is.
  }
  PCAP_NETMASK_UNKNOWN = $ffffffff;  
{
 * Initialize pcap.  If this isn't called, pcap is initialized to
 * a mode source-compatible and binary-compatible with older versions
 * that lack this routine.
  }
{
 * Initialization options.
 * All bits not listed here are reserved for expansion.
 *
 * On UNIX-like systems, the local character encoding is assumed to be
 * UTF-8, so no character encoding transformations are done.
 *
 * On Windows, the local character encoding is the local ANSI code page.
  }
{ strings are in the local character encoding  }
  PCAP_CHAR_ENC_LOCAL = $00000000;  
{ strings are in UTF-8  }
  PCAP_CHAR_ENC_UTF_8 = $00000001;  

function pcap_init(para1:dword; para2:Pchar):longint;cdecl;external;
{
 * We're deprecating pcap_lookupdev() for various reasons (not
 * thread-safe, can behave weirdly with WinPcap).  Callers
 * should use pcap_findalldevs() and use the first device.
  }
{ PCAP_DEPRECATED("use 'pcap_findalldevs' and use the first device") }
function pcap_lookupdev(para1:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function pcap_lookupnet(para1:Pchar; para2:Pbpf_u_int32; para3:Pbpf_u_int32; para4:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function pcap_create(para1:Pchar; para2:Pchar):Ppcap_t;cdecl;external;
function pcap_set_snaplen(para1:Ppcap_t; para2:longint):longint;cdecl;external;
function pcap_set_promisc(para1:Ppcap_t; para2:longint):longint;cdecl;external;
function pcap_can_set_rfmon(para1:Ppcap_t):longint;cdecl;external;
function pcap_set_rfmon(para1:Ppcap_t; para2:longint):longint;cdecl;external;
function pcap_set_timeout(para1:Ppcap_t; para2:longint):longint;cdecl;external;
function pcap_set_tstamp_type(para1:Ppcap_t; para2:longint):longint;cdecl;external;
function pcap_set_immediate_mode(para1:Ppcap_t; para2:longint):longint;cdecl;external;
function pcap_set_buffer_size(para1:Ppcap_t; para2:longint):longint;cdecl;external;
function pcap_set_tstamp_precision(para1:Ppcap_t; para2:longint):longint;cdecl;external;
function pcap_get_tstamp_precision(para1:Ppcap_t):longint;cdecl;external;
function pcap_activate(para1:Ppcap_t):longint;cdecl;external;
function pcap_list_tstamp_types(para1:Ppcap_t; para2:PPlongint):longint;cdecl;external;
procedure pcap_free_tstamp_types(para1:Plongint);cdecl;external;
(* Const before type ignored *)
function pcap_tstamp_type_name_to_val(para1:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function pcap_tstamp_type_val_to_name(para1:longint):Pchar;cdecl;external;
(* Const before type ignored *)
function pcap_tstamp_type_val_to_description(para1:longint):Pchar;cdecl;external;
{$ifdef __linux__}
function pcap_set_protocol_linux(para1:Ppcap_t; para2:longint):longint;cdecl;external;
{$endif}
{
 * Time stamp types.
 * Not all systems and interfaces will necessarily support all of these.
 *
 * A system that supports PCAP_TSTAMP_HOST is offering time stamps
 * provided by the host machine, rather than by the capture device,
 * but not committing to any characteristics of the time stamp.
 *
 * PCAP_TSTAMP_HOST_LOWPREC is a time stamp, provided by the host machine,
 * that's low-precision but relatively cheap to fetch; it's normally done
 * using the system clock, so it's normally synchronized with times you'd
 * fetch from system calls.
 *
 * PCAP_TSTAMP_HOST_HIPREC is a time stamp, provided by the host machine,
 * that's high-precision; it might be more expensive to fetch.  It is
 * synchronized with the system clock.
 *
 * PCAP_TSTAMP_HOST_HIPREC_UNSYNCED is a time stamp, provided by the host
 * machine, that's high-precision; it might be more expensive to fetch.
 * It is not synchronized with the system clock, and might have
 * problems with time stamps for packets received on different CPUs,
 * depending on the platform.  It might be more likely to be strictly
 * monotonic than PCAP_TSTAMP_HOST_HIPREC.
 *
 * PCAP_TSTAMP_ADAPTER is a high-precision time stamp supplied by the
 * capture device; it's synchronized with the system clock.
 *
 * PCAP_TSTAMP_ADAPTER_UNSYNCED is a high-precision time stamp supplied by
 * the capture device; it's not synchronized with the system clock.
 *
 * Note that time stamps synchronized with the system clock can go
 * backwards, as the system clock can go backwards.  If a clock is
 * not in sync with the system clock, that could be because the
 * system clock isn't keeping accurate time, because the other
 * clock isn't keeping accurate time, or both.
 *
 * Note that host-provided time stamps generally correspond to the
 * time when the time-stamping code sees the packet; this could
 * be some unknown amount of time after the first or last bit of
 * the packet is received by the network adapter, due to batching
 * of interrupts for packet arrival, queueing delays, etc..
  }
{ host-provided, unknown characteristics  }

const
  PCAP_TSTAMP_HOST = 0;  
{ host-provided, low precision, synced with the system clock  }
  PCAP_TSTAMP_HOST_LOWPREC = 1;  
{ host-provided, high precision, synced with the system clock  }
  PCAP_TSTAMP_HOST_HIPREC = 2;  
{ device-provided, synced with the system clock  }
  PCAP_TSTAMP_ADAPTER = 3;  
{ device-provided, not synced with the system clock  }
  PCAP_TSTAMP_ADAPTER_UNSYNCED = 4;  
{ host-provided, high precision, not synced with the system clock  }
  PCAP_TSTAMP_HOST_HIPREC_UNSYNCED = 5;  
{
 * Time stamp resolution types.
 * Not all systems and interfaces will necessarily support all of these
 * resolutions when doing live captures; all of them can be requested
 * when reading a savefile.
  }
{ use timestamps with microsecond precision, default  }
  PCAP_TSTAMP_PRECISION_MICRO = 0;  
{ use timestamps with nanosecond precision  }
  PCAP_TSTAMP_PRECISION_NANO = 1;  
(* Const before type ignored *)

function pcap_open_live(para1:Pchar; para2:longint; para3:longint; para4:longint; para5:Pchar):Ppcap_t;cdecl;external;
function pcap_open_dead(para1:longint; para2:longint):Ppcap_t;cdecl;external;
function pcap_open_dead_with_tstamp_precision(para1:longint; para2:longint; para3:Tu_int):Ppcap_t;cdecl;external;
(* Const before type ignored *)
function pcap_open_offline_with_tstamp_precision(para1:Pchar; para2:Tu_int; para3:Pchar):Ppcap_t;cdecl;external;
(* Const before type ignored *)
function pcap_open_offline(para1:Pchar; para2:Pchar):Ppcap_t;cdecl;external;
{$ifdef _WIN32}
function pcap_hopen_offline_with_tstamp_precision(para1:Tintptr_t; para2:Tu_int; para3:Pchar):Ppcap_t;cdecl;external;
function pcap_hopen_offline(para1:Tintptr_t; para2:Pchar):Ppcap_t;cdecl;external;
{
   * If we're building libpcap, these are internal routines in savefile.c,
   * so we must not define them as macros.
   *
   * If we're not building libpcap, given that the version of the C runtime
   * with which libpcap was built might be different from the version
   * of the C runtime with which an application using libpcap was built,
   * and that a FILE structure may differ between the two versions of the
   * C runtime, calls to _fileno() must use the version of _fileno() in
   * the C runtime used to open the FILE *, not the version in the C
   * runtime with which libpcap was built.  (Maybe once the Universal CRT
   * rules the world, this will cease to be a problem.)
    }
{$ifndef BUILDING_PCAP}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function pcap_fopen_offline_with_tstamp_precision(f,p,b : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function pcap_fopen_offline(f,b : longint) : longint;

{$endif}
{$else}
{_WIN32 }

function pcap_fopen_offline_with_tstamp_precision(para1:PFILE; para2:Tu_int; para3:Pchar):Ppcap_t;cdecl;external;
function pcap_fopen_offline(para1:PFILE; para2:Pchar):Ppcap_t;cdecl;external;
{$endif}
{_WIN32 }

procedure pcap_close(para1:Ppcap_t);cdecl;external;
function pcap_loop(para1:Ppcap_t; para2:longint; para3:Tpcap_handler; para4:Pu_char):longint;cdecl;external;
function pcap_dispatch(para1:Ppcap_t; para2:longint; para3:Tpcap_handler; para4:Pu_char):longint;cdecl;external;
(* Const before type ignored *)
function pcap_next(para1:Ppcap_t; para2:Ppcap_pkthdr):Pu_char;cdecl;external;
(* Const before type ignored *)
function pcap_next_ex(para1:Ppcap_t; para2:PPpcap_pkthdr; para3:PPu_char):longint;cdecl;external;
procedure pcap_breakloop(para1:Ppcap_t);cdecl;external;
function pcap_stats(para1:Ppcap_t; para2:Ppcap_stat):longint;cdecl;external;
function pcap_setfilter(para1:Ppcap_t; para2:Pbpf_program):longint;cdecl;external;
function pcap_setdirection(para1:Ppcap_t; para2:Tpcap_direction_t):longint;cdecl;external;
function pcap_getnonblock(para1:Ppcap_t; para2:Pchar):longint;cdecl;external;
function pcap_setnonblock(para1:Ppcap_t; para2:longint; para3:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function pcap_inject(para1:Ppcap_t; para2:pointer; para3:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function pcap_sendpacket(para1:Ppcap_t; para2:Pu_char; para3:longint):longint;cdecl;external;
(* Const before type ignored *)
function pcap_statustostr(para1:longint):Pchar;cdecl;external;
(* Const before type ignored *)
function pcap_strerror(para1:longint):Pchar;cdecl;external;
function pcap_geterr(para1:Ppcap_t):Pchar;cdecl;external;
(* Const before type ignored *)
procedure pcap_perror(para1:Ppcap_t; para2:Pchar);cdecl;external;
(* Const before type ignored *)
function pcap_compile(para1:Ppcap_t; para2:Pbpf_program; para3:Pchar; para4:longint; para5:Tbpf_u_int32):longint;cdecl;external;
{PCAP_DEPRECATED("use pcap_open_dead(), pcap_compile() and pcap_close()") }
(* Const before type ignored *)
function pcap_compile_nopcap(para1:longint; para2:longint; para3:Pbpf_program; para4:Pchar; para5:longint; 
           para6:Tbpf_u_int32):longint;cdecl;external;
{ XXX - this took two arguments in 0.4 and 0.5  }
procedure pcap_freecode(para1:Pbpf_program);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function pcap_offline_filter(para1:Pbpf_program; para2:Ppcap_pkthdr; para3:Pu_char):longint;cdecl;external;
function pcap_datalink(para1:Ppcap_t):longint;cdecl;external;
function pcap_datalink_ext(para1:Ppcap_t):longint;cdecl;external;
function pcap_list_datalinks(para1:Ppcap_t; para2:PPlongint):longint;cdecl;external;
function pcap_set_datalink(para1:Ppcap_t; para2:longint):longint;cdecl;external;
procedure pcap_free_datalinks(para1:Plongint);cdecl;external;
(* Const before type ignored *)
function pcap_datalink_name_to_val(para1:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function pcap_datalink_val_to_name(para1:longint):Pchar;cdecl;external;
(* Const before type ignored *)
function pcap_datalink_val_to_description(para1:longint):Pchar;cdecl;external;
(* Const before type ignored *)
function pcap_datalink_val_to_description_or_dlt(para1:longint):Pchar;cdecl;external;
function pcap_snapshot(para1:Ppcap_t):longint;cdecl;external;
function pcap_is_swapped(para1:Ppcap_t):longint;cdecl;external;
function pcap_major_version(para1:Ppcap_t):longint;cdecl;external;
function pcap_minor_version(para1:Ppcap_t):longint;cdecl;external;
function pcap_bufsize(para1:Ppcap_t):longint;cdecl;external;
{ XXX  }
function pcap_file(para1:Ppcap_t):PFILE;cdecl;external;
{$ifdef _WIN32}
{
 * This probably shouldn't have been kept in WinPcap; most if not all
 * UN*X code that used it won't work on Windows.  We deprecate it; if
 * anybody really needs access to whatever HANDLE may be associated
 * with a pcap_t (there's no guarantee that there is one), we can add
 * a Windows-only pcap_handle() API that returns the HANDLE.
  }
{PCAP_DEPRECATED("request a 'pcap_handle' that returns a HANDLE if you need it") }
function pcap_fileno(para1:Ppcap_t):longint;cdecl;external;
{$else}
{ _WIN32  }

function pcap_fileno(para1:Ppcap_t):longint;cdecl;external;
{$endif}
{ _WIN32  }
{$ifdef _WIN32}

function pcap_wsockinit:longint;cdecl;external;
{$endif}
(* Const before type ignored *)

function pcap_dump_open(para1:Ppcap_t; para2:Pchar):Ppcap_dumper_t;cdecl;external;
{$ifdef _WIN32}
function pcap_dump_hopen(para1:Ppcap_t; para2:Tintptr_t):Ppcap_dumper_t;cdecl;external;
{
   * If we're building libpcap, this is an internal routine in sf-pcap.c, so
   * we must not define it as a macro.
   *
   * If we're not building libpcap, given that the version of the C runtime
   * with which libpcap was built might be different from the version
   * of the C runtime with which an application using libpcap was built,
   * and that a FILE structure may differ between the two versions of the
   * C runtime, calls to _fileno() must use the version of _fileno() in
   * the C runtime used to open the FILE *, not the version in the C
   * runtime with which libpcap was built.  (Maybe once the Universal CRT
   * rules the world, this will cease to be a problem.)
    }
{$ifndef BUILDING_PCAP}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function pcap_dump_fopen(p,f : longint) : longint;

{$endif}
{$else}
{_WIN32 }

function pcap_dump_fopen(para1:Ppcap_t; fp:PFILE):Ppcap_dumper_t;cdecl;external;
{$endif}
{_WIN32 }
(* Const before type ignored *)

function pcap_dump_open_append(para1:Ppcap_t; para2:Pchar):Ppcap_dumper_t;cdecl;external;
function pcap_dump_file(para1:Ppcap_dumper_t):PFILE;cdecl;external;
function pcap_dump_ftell(para1:Ppcap_dumper_t):longint;cdecl;external;
function pcap_dump_ftell64(para1:Ppcap_dumper_t):Tint64_t;cdecl;external;
function pcap_dump_flush(para1:Ppcap_dumper_t):longint;cdecl;external;
procedure pcap_dump_close(para1:Ppcap_dumper_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure pcap_dump(para1:Pu_char; para2:Ppcap_pkthdr; para3:Pu_char);cdecl;external;
function pcap_findalldevs(para1:PPpcap_if_t; para2:Pchar):longint;cdecl;external;
procedure pcap_freealldevs(para1:Ppcap_if_t);cdecl;external;
{
 * We return a pointer to the version string, rather than exporting the
 * version string directly.
 *
 * On at least some UNIXes, if you import data from a shared library into
 * a program, the data is bound into the program binary, so if the string
 * in the version of the library with which the program was linked isn't
 * the same as the string in the version of the library with which the
 * program is being run, various undesirable things may happen (warnings,
 * the string being the one from the version of the library with which the
 * program was linked, or even weirder things, such as the string being the
 * one from the library but being truncated).
 *
 * On Windows, the string is constructed at run time.
  }
(* Const before type ignored *)
function pcap_lib_version:Pchar;cdecl;external;
{$if defined(_WIN32)}
{
   * Win32 definitions
    }
{!
    \brief A queue of raw packets that will be sent to the network with pcap_sendqueue_transmit().
   }
{ Maximum size of the queue, in bytes. This
			   variable contains the size of the buffer field.  }
{ Current size of the queue, in bytes.  }
{ Buffer containing the packets to be sent.  }
type
  Ppcap_send_queue = ^Tpcap_send_queue;
  Tpcap_send_queue = record
      maxlen : Tu_int;cdecl;
      len : Tu_int;
      buffer : Pchar;
    end;

{!
    \brief This typedef is a support for the pcap_get_airpcap_handle() function
   }
{$if !defined(AIRPCAP_HANDLE__EAE405F5_0171_9592_B3C2_C19EC426AD34__DEFINED_)}
{$define AIRPCAP_HANDLE__EAE405F5_0171_9592_B3C2_C19EC426AD34__DEFINED_}
type
  PPAirpcapHandle = ^TPAirpcapHandle;
  TPAirpcapHandle = PAirpcapHandle;
{$endif}

function pcap_setbuff(p:Ppcap_t; dim:longint):longint;cdecl;external;
function pcap_setmode(p:Ppcap_t; mode:longint):longint;cdecl;external;
function pcap_setmintocopy(p:Ppcap_t; size:longint):longint;cdecl;external;
function pcap_getevent(p:Ppcap_t):THANDLE;cdecl;external;
function pcap_oid_get_request(para1:Ppcap_t; para2:Tbpf_u_int32; para3:pointer; para4:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
function pcap_oid_set_request(para1:Ppcap_t; para2:Tbpf_u_int32; para3:pointer; para4:Psize_t):longint;cdecl;external;
function pcap_sendqueue_alloc(memsize:Tu_int):Ppcap_send_queue;cdecl;external;
procedure pcap_sendqueue_destroy(queue:Ppcap_send_queue);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pcap_sendqueue_queue(queue:Ppcap_send_queue; pkt_header:Ppcap_pkthdr; pkt_data:Pu_char):longint;cdecl;external;
function pcap_sendqueue_transmit(p:Ppcap_t; queue:Ppcap_send_queue; sync:longint):Tu_int;cdecl;external;
function pcap_stats_ex(p:Ppcap_t; pcap_stat_size:Plongint):Ppcap_stat;cdecl;external;
function pcap_setuserbuffer(p:Ppcap_t; size:longint):longint;cdecl;external;
function pcap_live_dump(p:Ppcap_t; filename:Pchar; maxsize:longint; maxpacks:longint):longint;cdecl;external;
function pcap_live_dump_ended(p:Ppcap_t; sync:longint):longint;cdecl;external;
function pcap_start_oem(err_str:Pchar; flags:longint):longint;cdecl;external;
function pcap_get_airpcap_handle(p:Ppcap_t):TPAirpcapHandle;cdecl;external;
const
  MODE_CAPT = 0;  
  MODE_STAT = 1;  
  MODE_MON = 2;  
(*** was #elif ****){$else defined(MSDOS)}
{
   * MS-DOS definitions
    }

function pcap_stats_ex(para1:Ppcap_t; para2:Ppcap_stat_ex):longint;cdecl;external;
procedure pcap_set_wait(p:Ppcap_t; yield:procedure ; wait:longint);cdecl;external;
function pcap_mac_packets:Tu_long;cdecl;external;
{$else}
{ UN*X  }
{
   * UN*X definitions
    }

function pcap_get_selectable_fd(para1:Ppcap_t):longint;cdecl;external;
(* Const before type ignored *)
function pcap_get_required_select_timeout(para1:Ppcap_t):Ptimeval;cdecl;external;
{$endif}
{ _WIN32/MSDOS/UN*X  }
{
 * Remote capture definitions.
 *
 * These routines are only present if libpcap has been configured to
 * include remote capture support.
  }
{
 * The maximum buffer size in which address, port, interface names are kept.
 *
 * In case the adapter name or such is larger than this value, it is truncated.
 * This is not used by the user; however it must be aware that an hostname / interface
 * name longer than this value will be truncated.
  }

const
  PCAP_BUF_SIZE = 1024;  
{
 * The type of input source, passed to pcap_open().
  }
{ local savefile  }
  PCAP_SRC_FILE = 2;  
{ local network interface  }
  PCAP_SRC_IFLOCAL = 3;  
{ interface on a remote host, using RPCAP  }
  PCAP_SRC_IFREMOTE = 4;  
{
 * The formats allowed by pcap_open() are the following:
 * - file://path_and_filename [opens a local file]
 * - rpcap://devicename [opens the selected device available on the local host, without using the RPCAP protocol]
 * - rpcap://host/devicename [opens the selected device available on a remote host]
 * - rpcap://host:port/devicename [opens the selected device available on a remote host, using a non-standard port for RPCAP]
 * - adaptername [to open a local adapter; kept for compatibility, but it is strongly discouraged]
 * - (NULL) [to open the first local adapter; kept for compatibility, but it is strongly discouraged]
 *
 * The formats allowed by the pcap_findalldevs_ex() are the following:
 * - file://folder/ [lists all the files in the given folder]
 * - rpcap:// [lists all local adapters]
 * - rpcap://host:port/ [lists the devices available on a remote host]
 *
 * In all the above, "rpcaps://" can be substituted for "rpcap://" to enable
 * SSL (if it has been compiled in).
 *
 * Referring to the 'host' and 'port' parameters, they can be either numeric or literal. Since
 * IPv6 is fully supported, these are the allowed formats:
 *
 * - host (literal): e.g. host.foo.bar
 * - host (numeric IPv4): e.g. 10.11.12.13
 * - host (numeric IPv4, IPv6 style): e.g. [10.11.12.13]
 * - host (numeric IPv6): e.g. [1:2:3::4]
 * - port: can be either numeric (e.g. '80') or literal (e.g. 'http')
 *
 * Here you find some allowed examples:
 * - rpcap://host.foo.bar/devicename [everything literal, no port number]
 * - rpcap://host.foo.bar:1234/devicename [everything literal, with port number]
 * - rpcap://10.11.12.13/devicename [IPv4 numeric, no port number]
 * - rpcap://10.11.12.13:1234/devicename [IPv4 numeric, with port number]
 * - rpcap://[10.11.12.13]:1234/devicename [IPv4 numeric with IPv6 format, with port number]
 * - rpcap://[1:2:3::4]/devicename [IPv6 numeric, no port number]
 * - rpcap://[1:2:3::4]:1234/devicename [IPv6 numeric, with port number]
 * - rpcap://[1:2:3::4]:http/devicename [IPv6 numeric, with literal port number]
  }
{
 * URL schemes for capture source.
  }
{
 * This string indicates that the user wants to open a capture from a
 * local file.
  }
  PCAP_SRC_FILE_STRING = 'file://';  
{
 * This string indicates that the user wants to open a capture from a
 * network interface.  This string does not necessarily involve the use
 * of the RPCAP protocol. If the interface required resides on the local
 * host, the RPCAP protocol is not involved and the local functions are used.
  }
  PCAP_SRC_IF_STRING = 'rpcap://';  
{
 * Flags to pass to pcap_open().
  }
{
 * Specifies whether promiscuous mode is to be used.
  }
  PCAP_OPENFLAG_PROMISCUOUS = $00000001;  
{
 * Specifies, for an RPCAP capture, whether the data transfer (in
 * case of a remote capture) has to be done with UDP protocol.
 *
 * If it is '1' if you want a UDP data connection, '0' if you want
 * a TCP data connection; control connection is always TCP-based.
 * A UDP connection is much lighter, but it does not guarantee that all
 * the captured packets arrive to the client workstation. Moreover,
 * it could be harmful in case of network congestion.
 * This flag is meaningless if the source is not a remote interface.
 * In that case, it is simply ignored.
  }
  PCAP_OPENFLAG_DATATX_UDP = $00000002;  
{
 * Specifies whether the remote probe will capture its own generated
 * traffic.
 *
 * In case the remote probe uses the same interface to capture traffic
 * and to send data back to the caller, the captured traffic includes
 * the RPCAP traffic as well.  If this flag is turned on, the RPCAP
 * traffic is excluded from the capture, so that the trace returned
 * back to the collector is does not include this traffic.
 *
 * Has no effect on local interfaces or savefiles.
  }
  PCAP_OPENFLAG_NOCAPTURE_RPCAP = $00000004;  
{
 * Specifies whether the local adapter will capture its own generated traffic.
 *
 * This flag tells the underlying capture driver to drop the packets
 * that were sent by itself.  This is useful when building applications
 * such as bridges that should ignore the traffic they just sent.
 *
 * Supported only on Windows.
  }
  PCAP_OPENFLAG_NOCAPTURE_LOCAL = $00000008;  
{
 * This flag configures the adapter for maximum responsiveness.
 *
 * In presence of a large value for nbytes, WinPcap waits for the arrival
 * of several packets before copying the data to the user. This guarantees
 * a low number of system calls, i.e. lower processor usage, i.e. better
 * performance, which is good for applications like sniffers. If the user
 * sets the PCAP_OPENFLAG_MAX_RESPONSIVENESS flag, the capture driver will
 * copy the packets as soon as the application is ready to receive them.
 * This is suggested for real time applications (such as, for example,
 * a bridge) that need the best responsiveness.
 *
 * The equivalent with pcap_create()/pcap_activate() is "immediate mode".
  }
  PCAP_OPENFLAG_MAX_RESPONSIVENESS = $00000010;  
{
 * Remote authentication methods.
 * These are used in the 'type' member of the pcap_rmtauth structure.
  }
{
 * NULL authentication.
 *
 * The 'NULL' authentication has to be equal to 'zero', so that old
 * applications can just put every field of struct pcap_rmtauth to zero,
 * and it does work.
  }
  RPCAP_RMTAUTH_NULL = 0;  
{
 * Username/password authentication.
 *
 * With this type of authentication, the RPCAP protocol will use the username/
 * password provided to authenticate the user on the remote machine. If the
 * authentication is successful (and the user has the right to open network
 * devices) the RPCAP connection will continue; otherwise it will be dropped.
 *
 * *******NOTE********: unless TLS is being used, the username and password
 * are sent over the network to the capture server *IN CLEAR TEXT*.  Don't
 * use this, without TLS (i.e., with rpcap:// rather than rpcaps://) on
 * a network that you don't completely control!  (And be *really* careful
 * in your definition of "completely"!)
  }
  RPCAP_RMTAUTH_PWD = 1;  
{
 * This structure keeps the information needed to authenticate the user
 * on a remote machine.
 *
 * The remote machine can either grant or refuse the access according
 * to the information provided.
 * In case the NULL authentication is required, both 'username' and
 * 'password' can be NULL pointers.
 *
 * This structure is meaningless if the source is not a remote interface;
 * in that case, the functions which requires such a structure can accept
 * a NULL pointer as well.
  }
{
	 * \brief Type of the authentication required.
	 *
	 * In order to provide maximum flexibility, we can support different types
	 * of authentication based on the value of this 'type' variable. The currently
	 * supported authentication methods are defined into the
	 * \link remote_auth_methods Remote Authentication Methods Section\endlink.
	  }
{
	 * \brief Zero-terminated string containing the username that has to be
	 * used on the remote machine for authentication.
	 *
	 * This field is meaningless in case of the RPCAP_RMTAUTH_NULL authentication
	 * and it can be NULL.
	  }
{
	 * \brief Zero-terminated string containing the password that has to be
	 * used on the remote machine for authentication.
	 *
	 * This field is meaningless in case of the RPCAP_RMTAUTH_NULL authentication
	 * and it can be NULL.
	  }
type
  Ppcap_rmtauth = ^Tpcap_rmtauth;
  Tpcap_rmtauth = record
      _type : longint;cdecl;
      username : Pchar;
      password : Pchar;
    end;

{
 * This routine can open a savefile, a local device, or a device on
 * a remote machine running an RPCAP server.
 *
 * For opening a savefile, the pcap_open_offline routines can be used,
 * and will work just as well; code using them will work on more
 * platforms than code using pcap_open() to open savefiles.
 *
 * For opening a local device, pcap_open_live() can be used; it supports
 * most of the capabilities that pcap_open() supports, and code using it
 * will work on more platforms than code using pcap_open().  pcap_create()
 * and pcap_activate() can also be used; they support all capabilities
 * that pcap_open() supports, except for the Windows-only
 * PCAP_OPENFLAG_NOCAPTURE_LOCAL, and support additional capabilities.
 *
 * For opening a remote capture, pcap_open() is currently the only
 * API available.
  }
(* Const before type ignored *)

function pcap_open(source:Pchar; snaplen:longint; flags:longint; read_timeout:longint; auth:Ppcap_rmtauth; 
           errbuf:Pchar):Ppcap_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function pcap_createsrcstr(source:Pchar; _type:longint; host:Pchar; port:Pchar; name:Pchar; 
           errbuf:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function pcap_parsesrcstr(source:Pchar; _type:Plongint; host:Pchar; port:Pchar; name:Pchar; 
           errbuf:Pchar):longint;cdecl;external;
{
 * This routine can scan a directory for savefiles, list local capture
 * devices, or list capture devices on a remote machine running an RPCAP
 * server.
 *
 * For scanning for savefiles, it can be used on both UN*X systems and
 * Windows systems; for each directory entry it sees, it tries to open
 * the file as a savefile using pcap_open_offline(), and only includes
 * it in the list of files if the open succeeds, so it filters out
 * files for which the user doesn't have read permission, as well as
 * files that aren't valid savefiles readable by libpcap.
 *
 * For listing local capture devices, it's just a wrapper around
 * pcap_findalldevs(); code using pcap_findalldevs() will work on more
 * platforms than code using pcap_findalldevs_ex().
 *
 * For listing remote capture devices, pcap_findalldevs_ex() is currently
 * the only API available.
  }
(* Const before type ignored *)
function pcap_findalldevs_ex(source:Pchar; auth:Ppcap_rmtauth; alldevs:PPpcap_if_t; errbuf:Pchar):longint;cdecl;external;
{
 * Sampling methods.
 *
 * These allow pcap_loop(), pcap_dispatch(), pcap_next(), and pcap_next_ex()
 * to see only a sample of packets, rather than all packets.
 *
 * Currently, they work only on Windows local captures.
  }
{
 * Specifies that no sampling is to be done on the current capture.
 *
 * In this case, no sampling algorithms are applied to the current capture.
  }
const
  PCAP_SAMP_NOSAMP = 0;  
{
 * Specifies that only 1 out of N packets must be returned to the user.
 *
 * In this case, the 'value' field of the 'pcap_samp' structure indicates the
 * number of packets (minus 1) that must be discarded before one packet got
 * accepted.
 * In other words, if 'value = 10', the first packet is returned to the
 * caller, while the following 9 are discarded.
  }
  PCAP_SAMP_1_EVERY_N = 1;  
{
 * Specifies that we have to return 1 packet every N milliseconds.
 *
 * In this case, the 'value' field of the 'pcap_samp' structure indicates
 * the 'waiting time' in milliseconds before one packet got accepted.
 * In other words, if 'value = 10', the first packet is returned to the
 * caller; the next returned one will be the first packet that arrives
 * when 10ms have elapsed.
  }
  PCAP_SAMP_FIRST_AFTER_N_MS = 2;  
{
 * This structure defines the information related to sampling.
 *
 * In case the sampling is requested, the capturing device should read
 * only a subset of the packets coming from the source. The returned packets
 * depend on the sampling parameters.
 *
 * WARNING: The sampling process is applied *after* the filtering process.
 * In other words, packets are filtered first, then the sampling process
 * selects a subset of the 'filtered' packets and it returns them to the
 * caller.
  }
{
	 * Method used for sampling; see above.
	  }
{
	 * This value depends on the sampling method defined.
	 * For its meaning, see above.
	  }
type
  Ppcap_samp = ^Tpcap_samp;
  Tpcap_samp = record
      method : longint;
      value : longint;
    end;

{
 * New functions.
  }

function pcap_setsampling(p:Ppcap_t):Ppcap_samp;cdecl;external;
{
 * RPCAP active mode.
  }
{ Maximum length of an host name (needed for the RPCAP active mode)  }
const
  RPCAP_HOSTLIST_SIZE = 1024;  
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function pcap_remoteact_accept(address:Pchar; port:Pchar; hostlist:Pchar; connectinghost:Pchar; auth:Ppcap_rmtauth; 
           errbuf:Pchar):TSOCKET;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function pcap_remoteact_accept_ex(address:Pchar; port:Pchar; hostlist:Pchar; connectinghost:Pchar; auth:Ppcap_rmtauth; 
           uses_ssl:longint; errbuf:Pchar):TSOCKET;cdecl;external;
function pcap_remoteact_list(hostlist:Pchar; sep:char; size:longint; errbuf:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function pcap_remoteact_close(host:Pchar; errbuf:Pchar):longint;cdecl;external;
procedure pcap_remoteact_cleanup;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ lib_pcap_pcap_h  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function LT_FCS_LENGTH_PRESENT(x : longint) : Tx;
begin
  LT_FCS_LENGTH_PRESENT:=Tx(@($04000000));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LT_FCS_LENGTH(x : longint) : longint;
begin
  LT_FCS_LENGTH:=(Tx(@($F0000000))) shr 28;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LT_FCS_DATALINK_EXT(x : longint) : longint;
begin
  LT_FCS_DATALINK_EXT:=((Tx(@($F))) shl 28) or $04000000;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function pcap_fopen_offline_with_tstamp_precision(f,p,b : longint) : longint;
begin
  pcap_fopen_offline_with_tstamp_precision:=pcap_hopen_offline_with_tstamp_precision(_get_osfhandle(_fileno(f)),p,b);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function pcap_fopen_offline(f,b : longint) : longint;
begin
  pcap_fopen_offline:=pcap_hopen_offline(_get_osfhandle(_fileno(f)),b);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function pcap_dump_fopen(p,f : longint) : longint;
begin
  pcap_dump_fopen:=pcap_dump_hopen(p,_get_osfhandle(_fileno(f)));
end;


end.
