unit if_packet;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tsockaddr_pkt = record
    spkt_family: word;       // ???? sa_family_t
    spkt_device: array[0..13] of byte;
    spkt_protocol: word;
  end;
  Psockaddr_pkt = ^Tsockaddr_pkt;


  // === Konventiert am: 12-8-25 17:05:52 ===


implementation



end.
