unit termbits_common;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pcc_t = ^Tcc_t;
  Tcc_t = byte;

  Pspeed_t = ^Tspeed_t;
  Tspeed_t = dword;

const
  IGNBRK = $001;
  BRKINT = $002;
  IGNPAR = $004;
  PARMRK = $008;
  INPCK = $010;
  ISTRIP = $020;
  INLCR = $040;
  IGNCR = $080;
  ICRNL = $100;
  IXANY = $800;
  OPOST = $01;
  OCRNL = $08;
  ONOCR = $10;
  ONLRET = $20;
  OFILL = $40;
  OFDEL = $80;
  B0 = $00000000;
  B50 = $00000001;
  B75 = $00000002;
  B110 = $00000003;
  B134 = $00000004;
  B150 = $00000005;
  B200 = $00000006;
  B300 = $00000007;
  B600 = $00000008;
  B1200 = $00000009;
  B1800 = $0000000a;
  B2400 = $0000000b;
  B4800 = $0000000c;
  B9600 = $0000000d;
  B19200 = $0000000e;
  B38400 = $0000000f;
  EXTA = B19200;
  EXTB = B38400;
  ADDRB = $20000000;
  CMSPAR = $40000000;
  CRTSCTS = $80000000;
  IBSHIFT = 16;
  TCOOFF = 0;
  TCOON = 1;
  TCIOFF = 2;
  TCION = 3;
  TCIFLUSH = 0;
  TCOFLUSH = 1;
  TCIOFLUSH = 2;

  // === Konventiert am: 29-6-25 19:45:43 ===


implementation



end.
