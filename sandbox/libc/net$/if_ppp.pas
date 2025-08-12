unit if_ppp;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{	From: if_ppp.h,v 1.3 1995/06/12 11:36:50 paulus Exp  }
{
 * if_ppp.h - Point-to-Point Protocol definitions.
 *
 * Copyright (c) 1989 Carnegie Mellon University.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Neither the name of the University nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY CARNEGIE MELLON UNIVERSITY AND
 * CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE UNIVERSITY OR CONTRIBUTORS BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 * GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
 * IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
 * IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
  }
{
 *  ==FILEVERSION 960926==
 *
 *  NOTE TO MAINTAINERS:
 *     If you modify this file at all, please set the above date.
 *     if_ppp.h is shipped with a PPP distribution as well as with the kernel;
 *     if everyone increases the FILEVERSION number above, then scripts
 *     can do the right thing when deciding whether to install a new if_ppp.h
 *     file.  Don't change the format of that line otherwise, so the
 *     installation script can recognize it.
  }
{$ifndef __NET_IF_PPP_H}

const
  __NET_IF_PPP_H = 1;  
{$include <sys/types.h>}
{$include <stdint.h>}
{$include <net/if.h>}
{$include <sys/ioctl.h>}
{$include <net/ppp_defs.h>}
{
 * Packet sizes
  }
{ Default MTU (size of Info field)  }

const
  PPP_MTU = 1500;  
{ Largest MRU we allow  }
  PPP_MAXMRU = 65000;  
  PPP_VERSION = '2.2.0';  
{ Magic value for the ppp structure  }
  PPP_MAGIC = $5002;  
{ protocol numbers  }
  PROTO_IPX = $002b;  
{ DNA Routing  }
  PROTO_DNA_RT = $0027;  
{
 * Bit definitions for flags.
  }
{ protocol compression (output)  }
  SC_COMP_PROT = $00000001;  
{ header compression (output)  }
  SC_COMP_AC = $00000002;  
{ TCP (VJ) compression (output)  }
  SC_COMP_TCP = $00000004;  
{ disable VJ connection-id comp.  }
  SC_NO_TCP_CCID = $00000008;  
{ reject adrs/ctrl comp. on input  }
  SC_REJ_COMP_AC = $00000010;  
{ reject TCP (VJ) comp. on input  }
  SC_REJ_COMP_TCP = $00000020;  
{ Look at CCP packets  }
  SC_CCP_OPEN = $00000040;  
{ May send/recv compressed packets  }
  SC_CCP_UP = $00000080;  
{ IP packets may be exchanged  }
  SC_ENABLE_IP = $00000100;  
{ compressor has been inited  }
  SC_COMP_RUN = $00001000;  
{ decompressor has been inited  }
  SC_DECOMP_RUN = $00002000;  
{ enable debug messages  }
  SC_DEBUG = $00010000;  
{ log contents of good pkts recvd  }
  SC_LOG_INPKT = $00020000;  
{ log contents of pkts sent  }
  SC_LOG_OUTPKT = $00040000;  
{ log all chars received  }
  SC_LOG_RAWIN = $00080000;  
{ log all chars flushed  }
  SC_LOG_FLUSH = $00100000;  
{ bits that user can change  }
  SC_MASK = $0fE0ffff;  
{ state bits  }
{ saw a PPP_ESCAPE  }
  SC_ESCAPED = $80000000;  
{ flush input until next PPP_FLAG  }
  SC_FLUSH = $40000000;  
{ Need to reset the VJ decompressor  }
  SC_VJ_RESET = $20000000;  
{ ppp_write_wakeup is active  }
  SC_XMIT_BUSY = $10000000;  
{ have rcvd char with odd parity  }
  SC_RCV_ODDP = $08000000;  
{ have rcvd char with even parity  }
  SC_RCV_EVNP = $04000000;  
{ have rcvd char with bit 7 = 1  }
  SC_RCV_B7_1 = $02000000;  
{ have rcvd char with bit 7 = 0  }
  SC_RCV_B7_0 = $01000000;  
{ fatal decomp error detected  }
  SC_DC_FERROR = $00800000;  
{ non-fatal decomp error detected  }
  SC_DC_ERROR = $00400000;  
{
 * Ioctl definitions.
  }
{ PPP protocol, e.g. PPP_IP  }
type
  Pnpioctl = ^Tnpioctl;
  Tnpioctl = record
      protocol : longint;
      mode : TNPmode;
    end;

{ Structure describing a CCP configuration option, for PPPIOCSCOMPRESS  }
  Pppp_option_data = ^Tppp_option_data;
  Tppp_option_data = record
      ptr : Puint8_t;
      length : Tuint32_t;
      transmit : longint;
    end;

{ 'struct ifreq' is only available from net/if.h under __USE_MISC.   }
{$ifdef __USE_MISC}
{ statistic information  }
  Pifpppstatsreq = ^Tifpppstatsreq;
  Tifpppstatsreq = record
      b : Tifreq;
      stats : Tppp_stats;
    end;

  Pifpppcstatsreq = ^Tifpppcstatsreq;
  Tifpppcstatsreq = record
      b : Tifreq;
      stats : Tppp_comp_stats;
    end;


const
  ifr__name = b.(ifr_ifrn.ifrn_name);  
  stats_ptr = b.(ifr_ifru.ifru_data);  
{$endif}
{
 * Ioctl definitions.
  }
{ xxxxxxxxxxx
#define	PPPIOCGFLAGS	_IOR('t', 90, int)
#define	PPPIOCSFLAGS	_IOW('t', 89, int)
#define	PPPIOCGASYNCMAP	_IOR('t', 88, int)
#define	PPPIOCSASYNCMAP	_IOW('t', 87, int)
#define	PPPIOCGUNIT	_IOR('t', 86, int)
#define	PPPIOCGRASYNCMAP _IOR('t', 85, int)
#define	PPPIOCSRASYNCMAP _IOW('t', 84, int)
#define	PPPIOCGMRU	_IOR('t', 83, int)
#define	PPPIOCSMRU	_IOW('t', 82, int)
#define	PPPIOCSMAXCID	_IOW('t', 81, int)
#define PPPIOCGXASYNCMAP _IOR('t', 80, ext_accm) 
#define PPPIOCSXASYNCMAP _IOW('t', 79, ext_accm) 
#define PPPIOCXFERUNIT	_IO('t', 78)	
#define PPPIOCSCOMPRESS	_IOW('t', 77, struct ppp_option_data)
#define PPPIOCGNPMODE	_IOWR('t', 76, struct npioctl)
#define PPPIOCSNPMODE	_IOW('t', 75, struct npioctl) 
#define PPPIOCGDEBUG	_IOR('t', 65, int)
#define PPPIOCSDEBUG	_IOW('t', 64, int)
#define PPPIOCGIDLE	_IOR('t', 63, struct ppp_idle)
 }

const
  SIOCGPPPSTATS = SIOCDEVPRIVATE+0;  
  SIOCGPPPVER = SIOCDEVPRIVATE+1;  
  SIOCGPPPCSTATS = SIOCDEVPRIVATE+2;  
{$if !defined(ifr_mtu)}

const
  ifr_mtu = ifr_ifru.ifru_metric;  
{$endif}
{$endif}
{ net/if_ppp.h  }

// === Konventiert am: 12-8-25 17:05:54 ===


implementation



end.
