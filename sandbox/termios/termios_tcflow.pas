unit termios_tcflow;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  TCSANOW = 0;
  TCSADRAIN = 1;
  TCSAFLUSH = 2;

  // === Konventiert am: 30-6-25 19:57:42 ===


implementation



end.
