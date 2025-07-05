unit netdb_rpc;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Trpcent = record
    r_name: pchar;
    r_aliases: ^pchar;
    r_number: longint;
  end;
  Prpcent = ^Trpcent;
  PPrpcent = ^Prpcent;

procedure setrpcent(__stayopen: longint); cdecl; external libc;
procedure endrpcent; cdecl; external libc;
function getrpcbyname(__name: pchar): Prpcent; cdecl; external libc;
function getrpcbynumber(__number: longint): Prpcent; cdecl; external libc;
function getrpcent: Prpcent; cdecl; external libc;
function getrpcbyname_r(__name: pchar; __result_buf: Prpcent; __buffer: pchar; __buflen: Tsize_t; __result: PPrpcent): longint; cdecl; external libc;
function getrpcbynumber_r(__number: longint; __result_buf: Prpcent; __buffer: pchar; __buflen: Tsize_t; __result: PPrpcent): longint; cdecl; external libc;
function getrpcent_r(__result_buf: Prpcent; __buffer: pchar; __buflen: Tsize_t; __result: PPrpcent): longint; cdecl; external libc;

// === Konventiert am: 5-7-25 19:53:40 ===


implementation



end.
