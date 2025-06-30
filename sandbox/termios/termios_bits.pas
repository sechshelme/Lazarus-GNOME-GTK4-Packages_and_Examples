unit termios_bits;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

// /usr/include/x86_64-linux-gnu/bits/termios.h


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

// === Konventiert am: 30-6-25 19:46:24 ===


implementation



end.
