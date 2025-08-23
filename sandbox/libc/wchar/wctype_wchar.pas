unit wctype_wchar;

interface

uses
  clib, wctype, wint_t;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // /usr/include/x86_64-linux-gnu/bits/wctype-wchar.h


function iswalnum(__wc: Twint_t): longint; cdecl; external libc;
function iswalpha(__wc: Twint_t): longint; cdecl; external libc;
function iswcntrl(__wc: Twint_t): longint; cdecl; external libc;
function iswdigit(__wc: Twint_t): longint; cdecl; external libc;
function iswgraph(__wc: Twint_t): longint; cdecl; external libc;
function iswlower(__wc: Twint_t): longint; cdecl; external libc;
function iswprint(__wc: Twint_t): longint; cdecl; external libc;
function iswpunct(__wc: Twint_t): longint; cdecl; external libc;
function iswspace(__wc: Twint_t): longint; cdecl; external libc;
function iswupper(__wc: Twint_t): longint; cdecl; external libc;
function iswxdigit(__wc: Twint_t): longint; cdecl; external libc;
function iswblank(__wc: Twint_t): longint; cdecl; external libc;
function wctype(__property: pchar): Twctype_t; cdecl; external libc;
function iswctype(__wc: Twint_t; __desc: Twctype_t): longint; cdecl; external libc;
function towlower(__wc: Twint_t): Twint_t; cdecl; external libc;
function towupper(__wc: Twint_t): Twint_t; cdecl; external libc;

// === Konventiert am: 23-8-25 13:57:53 ===


implementation



end.
