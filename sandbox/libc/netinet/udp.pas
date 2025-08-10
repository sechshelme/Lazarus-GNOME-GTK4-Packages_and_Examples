unit udp;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tudphdr = packed record
    case integer of
      0: (
        uh_sport: word;
        uh_dport: word;
        uh_ulen: word;
        uh_sum: word
      );
      1: (
        source: word;
        dest: word;
        len: word;
        check: word
      );
  end;

const
  UDP_CORK = 1;
  UDP_ENCAP = 100;
  UDP_NO_CHECK6_TX = 101;
  UDP_NO_CHECK6_RX = 102;
  UDP_SEGMENT = 103;
  UDP_GRO = 104;
  UDP_ENCAP_ESPINUDP_NON_IKE = 1;
  UDP_ENCAP_ESPINUDP = 2;
  UDP_ENCAP_L2TPINUDP = 3;
  UDP_ENCAP_GTP0 = 4;
  UDP_ENCAP_GTP1U = 5;
  SOL_UDP = 17;

  // === Konventiert am: 10-8-25 17:28:28 ===


implementation



end.
