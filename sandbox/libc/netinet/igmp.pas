unit igmp;

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
{$ifndef _NETINET_IGMP_H}

const
  _NETINET_IGMP_H = 1;  
{$include <sys/cdefs.h>}
{$include <sys/types.h>}
{$ifdef __USE_MISC}
{$include <netinet/in.h>}
{
 * Copyright (c) 1988 Stephen Deering.
 * Copyright (c) 1992, 1993
 *	The Regents of the University of California.  All rights reserved.
 *
 * This code is derived from software contributed to Berkeley by
 * Stephen Deering of Stanford University.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 4. Neither the name of the University nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
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
 *
 *	@(#)igmp.h	8.1 (Berkeley) 6/10/93
 *	$FreeBSD$
  }
{ IGMP type  }
{ routing code  }
{ checksum  }
{ group address  }
type
  Pigmp = ^Tigmp;
  Tigmp = record
      igmp_type : Tuint8_t;
      igmp_code : Tuint8_t;
      igmp_cksum : Tuint16_t;
      igmp_group : Tin_addr;
    end;


const
  IGMP_MINLEN = 8;  
{
 * Message types, including version number.
  }
{ membership query          }
  IGMP_MEMBERSHIP_QUERY = $11;  
{ Ver. 1 membership report  }
  IGMP_V1_MEMBERSHIP_REPORT = $12;  
{ Ver. 2 membership report  }
  IGMP_V2_MEMBERSHIP_REPORT = $16;  
{ Leave-group message	     }
  IGMP_V2_LEAVE_GROUP = $17;  
{ DVMRP routing message     }
  IGMP_DVMRP = $13;  
{ PIM routing message       }
  IGMP_PIM = $14;  
  IGMP_TRACE = $15;  
{ traceroute resp.(to sender) }
  IGMP_MTRACE_RESP = $1e;  
{ mcast traceroute messages   }
  IGMP_MTRACE = $1f;  
{ From RFC4286.   }
  IGMP_MRDISC_ADV = $30;  
{ max delay for response to      }
  IGMP_MAX_HOST_REPORT_DELAY = 10;  
{  query (in seconds) according  }
{  to RFC1112                    }
{ denotes that the igmp code field  }
  IGMP_TIMER_SCALE = 10;  
{ specifies time in 10th of seconds }
{
 * States for the IGMP v2 state table.
  }
  IGMP_DELAYING_MEMBER = 1;  
  IGMP_IDLE_MEMBER = 2;  
  IGMP_LAZY_MEMBER = 3;  
  IGMP_SLEEPING_MEMBER = 4;  
  IGMP_AWAKENING_MEMBER = 5;  
{
 * States for IGMP router version cache.
  }
  IGMP_v1_ROUTER = 1;  
  IGMP_v2_ROUTER = 2;  
{
 * The following four definitions are for backwards compatibility.
 * They should be removed as soon as all applications are updated to
 * use the new constant names.
  }
  IGMP_HOST_MEMBERSHIP_QUERY = IGMP_MEMBERSHIP_QUERY;  
  IGMP_HOST_MEMBERSHIP_REPORT = IGMP_V1_MEMBERSHIP_REPORT;  
  IGMP_HOST_NEW_MEMBERSHIP_REPORT = IGMP_V2_MEMBERSHIP_REPORT;  
  IGMP_HOST_LEAVE_MESSAGE = IGMP_V2_LEAVE_GROUP;  
{$endif}
{$endif}
{ netinet/igmp.h  }

// === Konventiert am: 10-8-25 17:28:09 ===


implementation



end.
