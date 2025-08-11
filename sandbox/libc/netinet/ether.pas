unit ether;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function ether_ntoa(__addr: Pether_addr): pchar; cdecl; external libc;
function ether_ntoa_r(__addr: Pether_addr; __buf: pchar): pchar; cdecl; external libc;
function ether_aton(__asc: pchar): Pether_addr; cdecl; external libc;
function ether_aton_r(__asc: pchar; __addr: Pether_addr): Pether_addr; cdecl; external libc;
function ether_ntohost(__hostname: pchar; __addr: Pether_addr): longint; cdecl; external libc;
function ether_hostton(__hostname: pchar; __addr: Pether_addr): longint; cdecl; external libc;
function ether_line(__line: pchar; __addr: Pether_addr; __hostname: pchar): longint; cdecl; external libc;

// === Konventiert am: 10-8-25 17:27:56 ===


implementation



end.
