{$IFDEF read_interface}


procedure g_mime_charset_map_init; cdecl; external libgmime3;
procedure g_mime_charset_map_shutdown; cdecl; external libgmime3;
function g_mime_locale_charset: pchar; cdecl; external libgmime3;
function g_mime_locale_language: pchar; cdecl; external libgmime3;
function g_mime_charset_language(charset: pchar): pchar; cdecl; external libgmime3;
function g_mime_charset_canon_name(charset: pchar): pchar; cdecl; external libgmime3;
function g_mime_charset_iconv_name(charset: pchar): pchar; cdecl; external libgmime3;

function g_mime_charset_name(charset: pchar): pchar; cdecl; external libgmime3; deprecated;
function g_mime_charset_locale_name: pchar; cdecl; external libgmime3; deprecated;

function g_mime_charset_iso_to_windows(isocharset: pchar): pchar; cdecl; external libgmime3;

type
  TGMimeCharset = record
    mask: dword;
    level: dword;
  end;
  PGMimeCharset = ^TGMimeCharset;

procedure g_mime_charset_init(charset: PGMimeCharset); cdecl; external libgmime3;
procedure g_mime_charset_step(charset: PGMimeCharset; inbuf: pchar; inlen: Tsize_t); cdecl; external libgmime3;
function g_mime_charset_best_name(charset: PGMimeCharset): pchar; cdecl; external libgmime3;
function g_mime_charset_best(inbuf: pchar; inlen: Tsize_t): pchar; cdecl; external libgmime3;
function g_mime_charset_can_encode(mask: PGMimeCharset; charset: pchar; text: pchar; len: Tsize_t): Tgboolean; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:26:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
