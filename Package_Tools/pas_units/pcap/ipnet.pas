unit ipnet;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



const
  IPH_AF_INET = 2;
  IPH_AF_INET6 = 26;
  IPNET_OUTBOUND = 1;
  IPNET_INBOUND = 2;

  // === Konventiert am: 30-8-25 19:14:05 ===


implementation



end.
