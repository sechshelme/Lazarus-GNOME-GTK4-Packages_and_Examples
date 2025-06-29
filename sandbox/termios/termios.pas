unit termios;

interface

uses
  termbits_common,
  termbits;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  libc = 'c';

type
  Ttermios = record
    c_iflag: Ttcflag_t;
    c_oflag: Ttcflag_t;
    c_cflag: Ttcflag_t;
    c_lflag: Ttcflag_t;
    c_line: Tcc_t;
    c_cc: array[0..31] of Tcc_t; // Größe kann je nach System variieren!
    c_ispeed: Tspeed_t;
    c_ospeed: Tspeed_t;
  end;
  Ptermios = ^Ttermios;

type
  Tpid_t = longint;
  Ppid_t = ^Tpid_t;

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
