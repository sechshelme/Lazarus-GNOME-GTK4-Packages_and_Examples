unit usb;

interface

uses
  pcap_inttypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  URB_TRANSFER_IN = $80;
  URB_ISOCHRONOUS = $0;
  URB_INTERRUPT = $1;
  URB_CONTROL = $2;
  URB_BULK = $3;

  URB_SUBMIT = 'S';
  URB_COMPLETE = 'C';
  URB_ERROR = 'E';

type
  Tusb_setup = record
    bmRequestType: Tuint8_t;
    bRequest: Tuint8_t;
    wValue: Tuint16_t;
    wIndex: Tuint16_t;
    wLength: Tuint16_t;
  end;
  Pusb_setup = ^Tusb_setup;

  Tpcap_usb_setup = Tusb_setup;
  Ppcap_usb_setup = ^Tpcap_usb_setup;

  Tiso_rec = record
    error_count: Tint32_t;
    numdesc: Tint32_t;
  end;
  Piso_rec = ^Tiso_rec;

  Tusb_header = record
    id: Tuint64_t;
    event_type: Tuint8_t;
    transfer_type: Tuint8_t;
    endpoint_number: Tuint8_t;
    device_address: Tuint8_t;
    bus_id: Tuint16_t;
    setup_flag: char;
    data_flag: char;
    ts_sec: Tint64_t;
    ts_usec: Tint32_t;
    status: Tint32_t;
    urb_len: Tuint32_t;
    data_len: Tuint32_t;
    setup: Tpcap_usb_setup;
  end;
  Pusb_header = ^Tusb_header;

  Tpcap_usb_header = Tusb_header;
  Ppcap_usb_header = ^Tpcap_usb_header;


  Tusb_header_mmapped = record
    id: Tuint64_t;
    event_type: Tuint8_t;
    transfer_type: Tuint8_t;
    endpoint_number: Tuint8_t;
    device_address: Tuint8_t;
    bus_id: Tuint16_t;
    setup_flag: char;
    data_flag: char;
    ts_sec: Tint64_t;
    ts_usec: Tint32_t;
    status: Tint32_t;
    urb_len: Tuint32_t;
    data_len: Tuint32_t;
    s: record
      case longint of
        0: (setup: Tpcap_usb_setup);
        1: (iso: Tiso_rec);
      end;
    interval: Tint32_t;
    start_frame: Tint32_t;
    xfer_flags: Tuint32_t;
    ndesc: Tuint32_t;
  end;
  Pusb_header_mmapped = ^Tusb_header_mmapped;

  Tpcap_usb_header_mmapped = Tusb_header_mmapped;
  Ppcap_usb_header_mmapped = ^Tpcap_usb_header_mmapped;

  Tusb_isodesc = record
    status: Tint32_t;
    offset: Tuint32_t;
    len: Tuint32_t;
    pad: array[0..3] of Tuint8_t;
  end;
  Pusb_isodesc = ^Tusb_isodesc;

  // === Konventiert am: 30-8-25 19:14:21 ===


implementation



end.
