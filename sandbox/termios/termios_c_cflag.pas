unit termios_c_cflag;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



const
  CSIZE = 0000060;
  CS5 = 0000000;
  CS6 = 0000020;
  CS7 = 0000040;
  CS8 = 0000060;
  CSTOPB = 0000100;
  CREAD = 0000200;
  PARENB = 0000400;
  PARODD = 0001000;
  HUPCL = 0002000;
  CLOCAL = 0004000;
  ADDRB = 04000000000;

  // === Konventiert am: 30-6-25 19:57:39 ===


implementation



end.
