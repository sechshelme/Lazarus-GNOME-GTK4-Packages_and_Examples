unit fp_iconv;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  _ICONV_H = 1;

type
  Piconv_t = ^Ticonv_t;
  Ticonv_t = pointer;

function iconv_close(__cd: Ticonv_t): longint; cdecl; external libc;
function iconv_open(__tocode: pchar; __fromcode: pchar): Ticonv_t; cdecl; external libc;
function iconv(__cd: Ticonv_t; __inbuf: PPchar; __inbytesleft: Psize_t; __outbuf: PPchar; __outbytesleft: Psize_t): Tsize_t; cdecl; external libc;

// === Konventiert am: 19-8-26 12:38:23 ===


implementation



end.
