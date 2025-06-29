unit termbits;

interface

uses
  termbits_common,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



type
  Ptcflag_t = ^Ttcflag_t;
  Ttcflag_t = dword;

const
  NCCS = 19;

type
  Ttermios = record
    c_iflag: Ttcflag_t;
    c_oflag: Ttcflag_t;
    c_cflag: Ttcflag_t;
    c_lflag: Ttcflag_t;
    c_line: Tcc_t;
    c_cc: array[0..(NCCS) - 1] of Tcc_t;
  end;
  Ptermios = ^Ttermios;

  Ttermios2 = record
    c_iflag: Ttcflag_t;
    c_oflag: Ttcflag_t;
    c_cflag: Ttcflag_t;
    c_lflag: Ttcflag_t;
    c_line: Tcc_t;
    c_cc: array[0..(NCCS) - 1] of Tcc_t;
    c_ispeed: Tspeed_t;
    c_ospeed: Tspeed_t;
  end;
  Ptermios2 = ^Ttermios2;

  Tktermios = record
    c_iflag: Ttcflag_t;
    c_oflag: Ttcflag_t;
    c_cflag: Ttcflag_t;
    c_lflag: Ttcflag_t;
    c_line: Tcc_t;
    c_cc: array[0..(NCCS) - 1] of Tcc_t;
    c_ispeed: Tspeed_t;
    c_ospeed: Tspeed_t;
  end;
  Pktermios = ^Tktermios;

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
  IUCLC = $0200;
  IXON = $0400;
  IXOFF = $1000;
  IMAXBEL = $2000;
  IUTF8 = $4000;
  OLCUC = $00002;
  ONLCR = $00004;
  NLDLY = $00100;
  NL0 = $00000;
  NL1 = $00100;
  CRDLY = $00600;
  CR0 = $00000;
  CR1 = $00200;
  CR2 = $00400;
  CR3 = $00600;
  TABDLY = $01800;
  TAB0 = $00000;
  TAB1 = $00800;
  TAB2 = $01000;
  TAB3 = $01800;
  XTABS = $01800;
  BSDLY = $02000;
  BS0 = $00000;
  BS1 = $02000;
  VTDLY = $04000;
  VT0 = $00000;
  VT1 = $04000;
  FFDLY = $08000;
  FF0 = $00000;
  FF1 = $08000;
  CBAUD = $0000100f;
  CSIZE = $00000030;
  CS5 = $00000000;
  CS6 = $00000010;
  CS7 = $00000020;
  CS8 = $00000030;
  CSTOPB = $00000040;
  CREAD = $00000080;
  PARENB = $00000100;
  PARODD = $00000200;
  HUPCL = $00000400;
  CLOCAL = $00000800;
  CBAUDEX = $00001000;
  BOTHER = $00001000;
  B57600 = $00001001;
  B115200 = $00001002;
  B230400 = $00001003;
  B460800 = $00001004;
  B500000 = $00001005;
  B576000 = $00001006;
  B921600 = $00001007;
  B1000000 = $00001008;
  B1152000 = $00001009;
  B1500000 = $0000100a;
  B2000000 = $0000100b;
  B2500000 = $0000100c;
  B3000000 = $0000100d;
  B3500000 = $0000100e;
  B4000000 = $0000100f;
  CIBAUD = $100f0000;
  ISIG = $00001;
  ICANON = $00002;
  XCASE = $00004;
  ECHO = $00008;
  ECHOE = $00010;
  ECHOK = $00020;
  ECHONL = $00040;
  NOFLSH = $00080;
  TOSTOP = $00100;
  ECHOCTL = $00200;
  ECHOPRT = $00400;
  ECHOKE = $00800;
  FLUSHO = $01000;
  PENDIN = $04000;
  IEXTEN = $08000;
  EXTPROC = $10000;
  TCSANOW = 0;
  TCSADRAIN = 1;
  TCSAFLUSH = 2;

  // === Konventiert am: 29-6-25 19:37:45 ===


implementation



end.
