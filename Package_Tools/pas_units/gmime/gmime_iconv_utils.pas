unit gmime_iconv_utils;

interface

uses
  fp_glib2, fp_gmime3;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function g_mime_iconv_strdup(cd: Ticonv_t; str: pchar): pchar; cdecl; external libgmime3;
function g_mime_iconv_strndup(cd: Ticonv_t; str: pchar; n: Tsize_t): pchar; cdecl; external libgmime3;
function g_mime_iconv_locale_to_utf8(str: pchar): pchar; cdecl; external libgmime3;
function g_mime_iconv_locale_to_utf8_length(str: pchar; n: Tsize_t): pchar; cdecl; external libgmime3;
function g_mime_iconv_utf8_to_locale(str: pchar): pchar; cdecl; external libgmime3;
function g_mime_iconv_utf8_to_locale_length(str: pchar; n: Tsize_t): pchar; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:29:24 ===


implementation



end.
