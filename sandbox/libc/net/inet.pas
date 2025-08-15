unit inet;

interface

uses
  clib, fp_socket, fp_netinet;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function inet_addr(__cp: pchar): Tin_addr_t; cdecl; external libc;
function inet_lnaof(__in: Tin_addr): Tin_addr_t; cdecl; external libc;
function inet_makeaddr(__net: Tin_addr_t; __host: Tin_addr_t): Tin_addr; cdecl; external libc;
function inet_netof(__in: Tin_addr): Tin_addr_t; cdecl; external libc;
function inet_network(__cp: pchar): Tin_addr_t; cdecl; external libc;
function inet_ntoa(__in: Tin_addr): pchar; cdecl; external libc;
function inet_pton(__af: longint; __cp: pchar; __buf: pointer): longint; cdecl; external libc;
function inet_ntop(__af: longint; __cp: pointer; __buf: pchar; __len: Tsocklen_t): pchar; cdecl; external libc;
function inet_aton(__cp: pchar; __inp: Pin_addr): longint; cdecl; external libc;
function inet_neta(__net: Tin_addr_t; __buf: pchar; __len: Tsize_t): pchar; cdecl; external libc;
function inet_net_ntop(__af: longint; __cp: pointer; __bits: longint; __buf: pchar; __len: Tsize_t): pchar; cdecl; external libc;
function inet_net_pton(__af: longint; __cp: pchar; __buf: pointer; __len: Tsize_t): longint; cdecl; external libc;
function inet_nsap_addr(__cp: pchar; __buf: pbyte; __len: longint): dword; cdecl; external libc;
function inet_nsap_ntoa(__len: longint; __cp: pbyte; __buf: pchar): pchar; cdecl; external libc;

// === Konventiert am: 13-8-25 19:42:50 ===


implementation



end.
