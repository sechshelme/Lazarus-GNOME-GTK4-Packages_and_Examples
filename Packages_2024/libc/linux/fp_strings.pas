unit fp_strings;

interface

uses
  clib,
  fp_stdlib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function bcmp(__s1: pointer; __s2: pointer; __n: Tsize_t): longint; cdecl; external libc;
procedure bcopy(__src: pointer; __dest: pointer; __n: Tsize_t); cdecl; external libc;
procedure bzero(__s: pointer; __n: Tsize_t); cdecl; external libc;
function index(__s: pchar; __c: longint): pchar; cdecl; external libc;
function rindex(__s: pchar; __c: longint): pchar; cdecl; external libc;
function ffs(__i: longint): longint; cdecl; external libc;
function ffsl(__l: longint): longint; cdecl; external libc;
function ffsll(__ll: int64): longint; cdecl; external libc;
function strcasecmp(__s1: pchar; __s2: pchar): longint; cdecl; external libc;
function strncasecmp(__s1: pchar; __s2: pchar; __n: Tsize_t): longint; cdecl; external libc;
function strcasecmp_l(__s1: pchar; __s2: pchar; __loc: Tlocale_t): longint; cdecl; external libc;
function strncasecmp_l(__s1: pchar; __s2: pchar; __n: Tsize_t; __loc: Tlocale_t): longint; cdecl; external libc;

// === Konventiert am: 14-7-25 16:28:02 ===


implementation



end.
