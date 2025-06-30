unit termios_c_lflag;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  ISIG = 0000001;
  ICANON = 0000002;

const
  XCASE = 0000004;

const
  ECHO = 0000010;
  ECHOE = 0000020;
  ECHOK = 0000040;
  ECHONL = 0000100;
  NOFLSH = 0000200;
  TOSTOP = 0000400;
  ECHOCTL = 0001000;
  ECHOPRT = 0002000;
  ECHOKE = 0004000;
  FLUSHO = 0010000;
  PENDIN = 0040000;

const
  IEXTEN = 0100000;
  EXTPROC = 0200000;

  // === Konventiert am: 30-6-25 20:01:14 ===


implementation



end.
