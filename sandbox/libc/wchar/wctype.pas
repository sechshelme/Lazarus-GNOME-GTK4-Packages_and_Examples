unit wctype;

interface

uses
  clib, wint_t;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // /usr/include/x86_64-linux-gnu/bits/wctype-wchar.h
  type
    Pwctype_t = ^Twctype_t;
    Twctype_t = dword;

  // /usr/include/wctype.h


const
  WEOF = $ffffffff;



type
  Pwctrans_t = ^Twctrans_t;
  Twctrans_t = Pint32_t;

function wctrans(__property: pchar): Twctrans_t; cdecl; external libc;
function towctrans(__wc: Twint_t; __desc: Twctrans_t): Twint_t; cdecl; external libc;
function iswalnum_l(__wc: Twint_t; __locale: Tlocale_t): longint; cdecl; external libc;
function iswalpha_l(__wc: Twint_t; __locale: Tlocale_t): longint; cdecl; external libc;
function iswcntrl_l(__wc: Twint_t; __locale: Tlocale_t): longint; cdecl; external libc;
function iswdigit_l(__wc: Twint_t; __locale: Tlocale_t): longint; cdecl; external libc;
function iswgraph_l(__wc: Twint_t; __locale: Tlocale_t): longint; cdecl; external libc;
function iswlower_l(__wc: Twint_t; __locale: Tlocale_t): longint; cdecl; external libc;
function iswprint_l(__wc: Twint_t; __locale: Tlocale_t): longint; cdecl; external libc;
function iswpunct_l(__wc: Twint_t; __locale: Tlocale_t): longint; cdecl; external libc;
function iswspace_l(__wc: Twint_t; __locale: Tlocale_t): longint; cdecl; external libc;
function iswupper_l(__wc: Twint_t; __locale: Tlocale_t): longint; cdecl; external libc;
function iswxdigit_l(__wc: Twint_t; __locale: Tlocale_t): longint; cdecl; external libc;
function iswblank_l(__wc: Twint_t; __locale: Tlocale_t): longint; cdecl; external libc;
function wctype_l(__property: pchar; __locale: Tlocale_t): Twctype_t; cdecl; external libc;
function iswctype_l(__wc: Twint_t; __desc: Twctype_t; __locale: Tlocale_t): longint; cdecl; external libc;
function towlower_l(__wc: Twint_t; __locale: Tlocale_t): Twint_t; cdecl; external libc;
function towupper_l(__wc: Twint_t; __locale: Tlocale_t): Twint_t; cdecl; external libc;
function wctrans_l(__property: pchar; __locale: Tlocale_t): Twctrans_t; cdecl; external libc;
function towctrans_l(__wc: Twint_t; __desc: Twctrans_t; __locale: Tlocale_t): Twint_t; cdecl; external libc;

// === Konventiert am: 23-8-25 14:10:32 ===


implementation



end.
