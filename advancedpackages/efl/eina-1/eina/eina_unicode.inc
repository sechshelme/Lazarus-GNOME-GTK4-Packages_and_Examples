{$IFDEF read_interface}


type
  TEina_Unicode = Twchar_t;
  PEina_Unicode = ^TEina_Unicode;
  PPEina_Unicode = ^PEina_Unicode;

var
  EINA_UNICODE_EMPTY_STRING: PEina_Unicode; cvar;external libeina;

function eina_unicode_strlen(ustr: PEina_Unicode): Tsize_t; cdecl; external libeina;
function eina_unicode_strnlen(ustr: PEina_Unicode; n: longint): Tsize_t; cdecl; external libeina;
function eina_unicode_strdup(text: PEina_Unicode): PEina_Unicode; cdecl; external libeina;
function eina_unicode_strndup(text: PEina_Unicode; n: Tsize_t): PEina_Unicode; cdecl; external libeina;
function eina_unicode_strcmp(a: PEina_Unicode; b: PEina_Unicode): longint; cdecl; external libeina;
function eina_unicode_strcpy(dest: PEina_Unicode; source: PEina_Unicode): PEina_Unicode; cdecl; external libeina;
function eina_unicode_strstr(haystack: PEina_Unicode; needle: PEina_Unicode): PEina_Unicode; cdecl; external libeina;
function eina_unicode_strncpy(dest: PEina_Unicode; source: PEina_Unicode; n: Tsize_t): PEina_Unicode; cdecl; external libeina;
function eina_unicode_escape(str: PEina_Unicode): PEina_Unicode; cdecl; external libeina;
function eina_unicode_utf8_get_next(buf: pchar; iindex: Plongint): TEina_Unicode; cdecl; external libeina; deprecated;
function eina_unicode_utf8_get_prev(buf: pchar; iindex: Plongint): TEina_Unicode; cdecl; external libeina;
function eina_unicode_utf8_get_len(buf: pchar): longint; cdecl; external libeina;
function eina_unicode_utf8_to_unicode(utf: pchar; _len: Plongint): PEina_Unicode; cdecl; external libeina;
function eina_unicode_unicode_to_utf8_range(uni: PEina_Unicode; ulen: longint; _len: Plongint): pchar; cdecl; external libeina;
function eina_unicode_unicode_to_utf8(uni: PEina_Unicode; _len: Plongint): pchar; cdecl; external libeina;

// === Konventiert am: 15-5-25 17:13:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
