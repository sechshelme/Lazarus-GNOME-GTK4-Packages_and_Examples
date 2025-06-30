unit termios_c_cc;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  VINTR = 0;
  VQUIT = 1;
  VERASE = 2;
  VKILL = 3;
  VEOF = 4;
  VTIME = 5;
  VMIN = 6;
  VSWTC = 7;
  VSTART = 8;
  VSTOP = 9;
  VSUSP = 10;
  VEOL = 11;
  VREPRINT = 12;
  VDISCARD = 13;
  VWERASE = 14;
  VLNEXT = 15;
  VEOL2 = 16;

  // === Konventiert am: 30-6-25 20:06:58 ===


implementation



end.
