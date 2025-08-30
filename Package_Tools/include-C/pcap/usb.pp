
unit usb;
interface

{
  Automatically converted by H2Pas 1.0.0 from usb.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    usb.h
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
Piso_rec  = ^iso_rec;
Ppcap_usb_header  = ^pcap_usb_header;
Ppcap_usb_header_mmapped  = ^pcap_usb_header_mmapped;
Ppcap_usb_setup  = ^pcap_usb_setup;
Pusb_header  = ^usb_header;
Pusb_header_mmapped  = ^usb_header_mmapped;
Pusb_isodesc  = ^usb_isodesc;
Pusb_setup  = ^usb_setup;
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
 * Basic USB data struct
 * By Paolo Abeni <paolo.abeni@email.it>
  }
{$ifndef lib_pcap_usb_h}
{$define lib_pcap_usb_h}
{$include <pcap/pcap-inttypes.h>}
{
 * possible transfer mode
  }

const
  URB_TRANSFER_IN = $80;  
  URB_ISOCHRONOUS = $0;  
  URB_INTERRUPT = $1;  
  URB_CONTROL = $2;  
  URB_BULK = $3;  
{
 * possible event type
  }
  URB_SUBMIT = 'S';  
  URB_COMPLETE = 'C';  
  URB_ERROR = 'E';  
{
 * USB setup header as defined in USB specification.
 * Appears at the front of each Control S-type packet in DLT_USB captures.
  }
type
  Pusb_setup = ^Tusb_setup;
  Tusb_setup = record
      bmRequestType : Tuint8_t;
      bRequest : Tuint8_t;
      wValue : Tuint16_t;
      wIndex : Tuint16_t;
      wLength : Tuint16_t;
    end;
  Tpcap_usb_setup = Tusb_setup;
  Ppcap_usb_setup = ^Tpcap_usb_setup;
{
 * Information from the URB for Isochronous transfers.
  }

  Piso_rec = ^Tiso_rec;
  Tiso_rec = record
      error_count : Tint32_t;
      numdesc : Tint32_t;
    end;
{
 * Header prepended by linux kernel to each event.
 * Appears at the front of each packet in DLT_USB_LINUX captures.
  }
{if !=0 the urb setup header is not present }
{if !=0 no urb data is present }
{ amount of urb data really present in this event }

  Pusb_header = ^Tusb_header;
  Tusb_header = record
      id : Tuint64_t;
      event_type : Tuint8_t;
      transfer_type : Tuint8_t;
      endpoint_number : Tuint8_t;
      device_address : Tuint8_t;
      bus_id : Tuint16_t;
      setup_flag : char;
      data_flag : char;
      ts_sec : Tint64_t;
      ts_usec : Tint32_t;
      status : Tint32_t;
      urb_len : Tuint32_t;
      data_len : Tuint32_t;
      setup : Tpcap_usb_setup;
    end;
  Tpcap_usb_header = Tusb_header;
  Ppcap_usb_header = ^Tpcap_usb_header;
{
 * Header prepended by linux kernel to each event for the 2.6.31
 * and later kernels; for the 2.6.21 through 2.6.30 kernels, the
 * "iso_rec" information, and the fields starting with "interval"
 * are zeroed-out padding fields.
 *
 * Appears at the front of each packet in DLT_USB_LINUX_MMAPPED captures.
  }
{if !=0 the urb setup header is not present }
{if !=0 no urb data is present }
{ amount of urb data really present in this event }
{ for Interrupt and Isochronous events  }
{ for Isochronous events  }
{ copy of URB's transfer flags  }
{ number of isochronous descriptors  }

  Pusb_header_mmapped = ^Tusb_header_mmapped;
  Tusb_header_mmapped = record
      id : Tuint64_t;
      event_type : Tuint8_t;
      transfer_type : Tuint8_t;
      endpoint_number : Tuint8_t;
      device_address : Tuint8_t;
      bus_id : Tuint16_t;
      setup_flag : char;
      data_flag : char;
      ts_sec : Tint64_t;
      ts_usec : Tint32_t;
      status : Tint32_t;
      urb_len : Tuint32_t;
      data_len : Tuint32_t;
      s : record
          case longint of
            0 : ( setup : Tpcap_usb_setup );
            1 : ( iso : Tiso_rec );
          end;
      interval : Tint32_t;
      start_frame : Tint32_t;
      xfer_flags : Tuint32_t;
      ndesc : Tuint32_t;
    end;
  Tpcap_usb_header_mmapped = Tusb_header_mmapped;
  Ppcap_usb_header_mmapped = ^Tpcap_usb_header_mmapped;
{
 * Isochronous descriptors; for isochronous transfers there might be
 * one or more of these at the beginning of the packet data.  The
 * number of descriptors is given by the "ndesc" field in the header;
 * as indicated, in older kernels that don't put the descriptors at
 * the beginning of the packet, that field is zeroed out, so that field
 * can be trusted even in captures from older kernels.
  }

  Pusb_isodesc = ^Tusb_isodesc;
  Tusb_isodesc = record
      status : Tint32_t;
      offset : Tuint32_t;
      len : Tuint32_t;
      pad : array[0..3] of Tuint8_t;
    end;
{$endif}

implementation


end.
