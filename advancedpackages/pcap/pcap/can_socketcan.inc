{$IFDEF read_interface}


type
  Tpcap_can_socketcan_hdr = record
    can_id: Tuint32_t;
    payload_length: Tuint8_t;
    fd_flags: Tuint8_t;
    reserved1: Tuint8_t;
    reserved2: Tuint8_t;
  end;
  Ppcap_can_socketcan_hdr = ^Tpcap_can_socketcan_hdr;

const
  CANFD_BRS = $01;
  CANFD_ESI = $02;
  CANFD_FDF = $04;

  // === Konventiert am: 30-8-25 19:14:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
