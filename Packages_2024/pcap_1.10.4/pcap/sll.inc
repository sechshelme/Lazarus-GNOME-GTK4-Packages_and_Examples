{$IFDEF read_interface}


const
  SLL_HDR_LEN = 16;
  SLL_ADDRLEN = 8;

type
  Tsll_header = record
    sll_pkttype: Tuint16_t;
    sll_hatype: Tuint16_t;
    sll_halen: Tuint16_t;
    sll_addr: array[0..(SLL_ADDRLEN) - 1] of Tuint8_t;
    sll_protocol: Tuint16_t;
  end;
  Psll_header = ^Tsll_header;

const
  SLL2_HDR_LEN = 20;

type
  Tsll2_header = record
    sll2_protocol: Tuint16_t;
    sll2_reserved_mbz: Tuint16_t;
    sll2_if_index: Tuint32_t;
    sll2_hatype: Tuint16_t;
    sll2_pkttype: Tuint8_t;
    sll2_halen: Tuint8_t;
    sll2_addr: array[0..(SLL_ADDRLEN) - 1] of Tuint8_t;
  end;
  Psll2_header = ^Tsll2_header;

const
  LINUX_SLL_HOST = 0;
  LINUX_SLL_BROADCAST = 1;
  LINUX_SLL_MULTICAST = 2;
  LINUX_SLL_OTHERHOST = 3;
  LINUX_SLL_OUTGOING = 4;

  LINUX_SLL_P_802_3 = $0001;
  LINUX_SLL_P_802_2 = $0004;
  LINUX_SLL_P_CAN = $000C;
  LINUX_SLL_P_CANFD = $000D;

  // === Konventiert am: 30-8-25 19:14:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
