unit fp_getopt;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  // /usr/include/x86_64-linux-gnu/bits/getopt_ext.h

type
  Toption = record
    name: pchar;
    has_arg: longint;
    flag: Plongint;
    val: longint;
  end;
  Poption = ^Toption;

const
  no_argument = 0;
  required_argument = 1;
  optional_argument = 2;

function getopt_long(___argc: longint; ___argv: PPchar; __shortopts: pchar; __longopts: Poption; __longind: Plongint): longint; cdecl; external libc;
function getopt_long_only(___argc: longint; ___argv: PPchar; __shortopts: pchar; __longopts: Poption; __longind: Plongint): longint; cdecl; external libc;

var
  optarg: pchar; cvar;external libc;
  optind: longint; cvar;external libc;
  opterr: longint; cvar;external libc;
  optopt: longint; cvar;external libc;

  // /usr/include/x86_64-linux-gnu/bits/getopt_core.h

function getopt(___argc: longint; ___argv: PPchar; __shortopts: pchar): longint; cdecl; external libc;




// === Konventiert am: 3-8-25 19:05:24 ===


implementation



end.
