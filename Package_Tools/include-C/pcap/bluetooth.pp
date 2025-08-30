
unit bluetooth;
interface

{
  Automatically converted by H2Pas 1.0.0 from bluetooth.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bluetooth.h
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
Ppcap_bluetooth_h4_header  = ^pcap_bluetooth_h4_header;
Ppcap_bluetooth_linux_monitor_header  = ^pcap_bluetooth_linux_monitor_header;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c) 2006 Paolo Abeni (Italy)
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
 * 3. The name of the author may not be used to endorse or promote
 * products derived from this software without specific prior written
 * permission.
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
 * bluetooth data struct
 * By Paolo Abeni <paolo.abeni@email.it>
  }
{$ifndef lib_pcap_bluetooth_h}
{$define lib_pcap_bluetooth_h}
{$include <pcap/pcap-inttypes.h>}
{
 * Header prepended libpcap to each bluetooth h4 frame,
 * fields are in network byte order
  }
{ if first bit is set direction is incoming  }
type
  Ppcap_bluetooth_h4_header = ^Tpcap_bluetooth_h4_header;
  Tpcap_bluetooth_h4_header = record
      direction : Tuint32_t;
    end;
{
 * Header prepended libpcap to each bluetooth linux monitor frame,
 * fields are in network byte order
  }

  Ppcap_bluetooth_linux_monitor_header = ^Tpcap_bluetooth_linux_monitor_header;
  Tpcap_bluetooth_linux_monitor_header = record
      adapter_id : Tuint16_t;
      opcode : Tuint16_t;
    end;
{$endif}

implementation


end.
