unit fp_termios;

interface


{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type  // unistd.h
  Tpid_t = longint;
  Ppid_t = ^Tpid_t;



  // ---------- /usr/include/x86_64-linux-gnu/bits/termios.h

type
  Pcc_t = ^Tcc_t;
  Tcc_t = byte;

  Pspeed_t = ^Tspeed_t;
  Tspeed_t = dword;

  Ptcflag_t = ^Ttcflag_t;
  Ttcflag_t = dword;

const
  B0 = 0000000;
  B50 = 0000001;
  B75 = 0000002;
  B110 = 0000003;
  B134 = 0000004;
  B150 = 0000005;
  B200 = 0000006;
  B300 = 0000007;
  B600 = 0000010;
  B1200 = 0000011;
  B1800 = 0000012;
  B2400 = 0000013;
  B4800 = 0000014;
  B9600 = 0000015;
  B19200 = 0000016;
  B38400 = 0000017;

  EXTA = B19200;
  EXTB = B38400;

const
  TIOCSER_TEMT = $01;

const
  TCOOFF = 0;
  TCOON = 1;
  TCIOFF = 2;
  TCION = 3;
  TCIFLUSH = 0;
  TCOFLUSH = 1;
  TCIOFLUSH = 2;


  // ---------- /usr/include/x86_64-linux-gnu/bits/termios-c_cflag.h

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


  // ---------- /usr/include/x86_64-linux-gnu/bits/termios-c_iflag.h

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


  // ---------- /usr/include/x86_64-linux-gnu/bits/termios-c_lflag.h

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


  // ---------- /usr/include/x86_64-linux-gnu/bits/termios-c_oflag.h

const
  OPOST = 0000001;
  OLCUC = 0000002;
  ONLCR = 0000004;
  OCRNL = 0000010;
  ONOCR = 0000020;
  ONLRET = 0000040;
  OFILL = 0000100;
  OFDEL = 0000200;

const
  NLDLY = 0000400;
  NL0 = 0000000;
  NL1 = 0000400;
  CRDLY = 0003000;
  CR0 = 0000000;
  CR1 = 0001000;
  CR2 = 0002000;
  CR3 = 0003000;
  TABDLY = 0014000;
  TAB0 = 0000000;
  TAB1 = 0004000;
  TAB2 = 0010000;
  TAB3 = 0014000;
  BSDLY = 0020000;
  BS0 = 0000000;
  BS1 = 0020000;
  FFDLY = 0100000;
  FF0 = 0000000;
  FF1 = 0100000;

const
  VTDLY = 0040000;
  VT0 = 0000000;
  VT1 = 0040000;
  XTABS = 0014000;


  // ---------- /usr/include/x86_64-linux-gnu/bits/termios-c_cc.h

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


  // ---------- /usr/include/x86_64-linux-gnu/bits/termios-tcflow.h

const
  TCSANOW = 0;
  TCSADRAIN = 1;
  TCSAFLUSH = 2;


  // ---------- /usr/include/x86_64-linux-gnu/bits/termios-baud.h

const
  CBAUD = 000000010017;
  CBAUDEX = 000000010000;
  CIBAUD = 002003600000;
  CMSPAR = 010000000000;
  CRTSCTS = 020000000000;

const
  B57600 = 0010001;
  B115200 = 0010002;
  B230400 = 0010003;
  B460800 = 0010004;
  B500000 = 0010005;
  B576000 = 0010006;
  B921600 = 0010007;
  B1000000 = 0010010;
  B1152000 = 0010011;
  B1500000 = 0010012;
  B2000000 = 0010013;
  B2500000 = 0010014;
  B3000000 = 0010015;
  B3500000 = 0010016;
  B4000000 = 0010017;
  __MAX_BAUD = B4000000;


  // ---------- /usr/include/x86_64-linux-gnu/bits/termios-struct.h

const
  NCCS = 32;

type
  Ttermios = record
    c_iflag: Ttcflag_t;
    c_oflag: Ttcflag_t;
    c_cflag: Ttcflag_t;
    c_lflag: Ttcflag_t;
    c_line: Tcc_t;
    c_cc: array[0..(NCCS) - 1] of Tcc_t;
    c_ispeed: Tspeed_t;
    c_ospeed: Tspeed_t;
  end;
  Ptermios = ^Ttermios;

  // /usr/include/asm-generic/termios.h

type
  Twinsize = record
    ws_row: word;
    ws_col: word;
    ws_xpixel: word;
    ws_ypixel: word;
  end;
  Pwinsize = ^Twinsize;

const
  NCC = 8;

type
  Ttermio = record
    c_iflag: word;
    c_oflag: word;
    c_cflag: word;
    c_lflag: word;
    c_line: byte;
    c_cc: array[0..(NCC) - 1] of byte;
  end;
  Ptermio = ^Ttermio;

  { modem lines  }

const
  TIOCM_LE = $001;
  TIOCM_DTR = $002;
  TIOCM_RTS = $004;
  TIOCM_ST = $008;
  TIOCM_SR = $010;
  TIOCM_CTS = $020;
  TIOCM_CAR = $040;
  TIOCM_RNG = $080;
  TIOCM_DSR = $100;
  TIOCM_CD = TIOCM_CAR;
  TIOCM_RI = TIOCM_RNG;
  TIOCM_OUT1 = $2000;
  TIOCM_OUT2 = $4000;
  TIOCM_LOOP = $8000;



  //
  // ========== Main Header ===========
  //
  // ---------- /usr/include/termios.h

const
  libc = 'c';

function cfgetospeed(__termios_p: Ptermios): Tspeed_t; cdecl; external libc;
function cfgetispeed(__termios_p: Ptermios): Tspeed_t; cdecl; external libc;
function cfsetospeed(__termios_p: Ptermios; __speed: Tspeed_t): longint; cdecl; external libc;
function cfsetispeed(__termios_p: Ptermios; __speed: Tspeed_t): longint; cdecl; external libc;
function cfsetspeed(__termios_p: Ptermios; __speed: Tspeed_t): longint; cdecl; external libc;
function tcgetattr(__fd: longint; __termios_p: Ptermios): longint; cdecl; external libc;
function tcsetattr(__fd: longint; __optional_actions: longint; __termios_p: Ptermios): longint; cdecl; external libc;
procedure cfmakeraw(__termios_p: Ptermios); cdecl; external libc;
function tcsendbreak(__fd: longint; __duration: longint): longint; cdecl; external libc;
function tcdrain(__fd: longint): longint; cdecl; external libc;
function tcflush(__fd: longint; __queue_selector: longint): longint; cdecl; external libc;
function tcflow(__fd: longint; __action: longint): longint; cdecl; external libc;
function tcgetsid(__fd: longint): Tpid_t; cdecl; external libc;

// === Konventiert am: 29-6-25 19:10:35 ===


implementation



end.
