unit termios_c_iflag;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



const
  IGNBRK = 0000001;
  BRKINT = 0000002;
  IGNPAR = 0000004;
  PARMRK = 0000010;
  INPCK = 0000020;
  ISTRIP = 0000040;
  INLCR = 0000100;
  IGNCR = 0000200;
  ICRNL = 0000400;
  IUCLC = 0001000;
  IXON = 0002000;
  IXANY = 0004000;
  IXOFF = 0010000;
  IMAXBEL = 0020000;
  IUTF8 = 0040000;

  // === Konventiert am: 30-6-25 20:02:44 ===


implementation



end.
