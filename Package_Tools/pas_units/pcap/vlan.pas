unit vlan;

interface

uses
  pcap_inttypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tvlan_tag = record
    vlan_tpid: Tuint16_t;
    vlan_tci: Tuint16_t;
  end;
  Pvlan_tag = ^Tvlan_tag;

const
  VLAN_TAG_LEN = 4;

  // === Konventiert am: 30-8-25 19:14:23 ===


implementation



end.
