unit bluetooth;

interface

uses
  pcap_inttypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tpcap_bluetooth_h4_header = record
    direction: Tuint32_t;
  end;
  Ppcap_bluetooth_h4_header = ^Tpcap_bluetooth_h4_header;

  Tpcap_bluetooth_linux_monitor_header = record
    adapter_id: Tuint16_t;
    opcode: Tuint16_t;
  end;
  Ppcap_bluetooth_linux_monitor_header = ^Tpcap_bluetooth_linux_monitor_header;

  // === Konventiert am: 30-8-25 19:12:09 ===


implementation



end.
