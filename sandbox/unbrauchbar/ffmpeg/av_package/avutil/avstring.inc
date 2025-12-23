{$IFDEF read_interface}


function av_strstart(str: pchar; pfx: pchar; ptr: PPchar): longint; cdecl; external libavutil;
function av_stristart(str: pchar; pfx: pchar; ptr: PPchar): longint; cdecl; external libavutil;
function av_stristr(haystack: pchar; needle: pchar): pchar; cdecl; external libavutil;
function av_strnstr(haystack: pchar; needle: pchar; hay_length: Tsize_t): pchar; cdecl; external libavutil;
function av_strlcpy(dst: pchar; src: pchar; size: Tsize_t): Tsize_t; cdecl; external libavutil;
function av_strlcat(dst: pchar; src: pchar; size: Tsize_t): Tsize_t; cdecl; external libavutil;
function av_strlcatf(dst: pchar; size: Tsize_t; fmt: pchar): Tsize_t; cdecl; varargs; external libavutil;
function av_asprintf(fmt: pchar): pchar; cdecl; varargs; external libavutil;
function av_get_token(buf: PPchar; term: pchar): pchar; cdecl; external libavutil;
function av_strtok(s: pchar; delim: pchar; saveptr: PPchar): pchar; cdecl; external libavutil;
function av_strcasecmp(a: pchar; b: pchar): longint; cdecl; external libavutil;
function av_strncasecmp(a: pchar; b: pchar; n: Tsize_t): longint; cdecl; external libavutil;
function av_strireplace(str: pchar; from: pchar; to_: pchar): pchar; cdecl; external libavutil;
function av_basename(path: pchar): pchar; cdecl; external libavutil;
function av_dirname(path: pchar): pchar; cdecl; external libavutil;
function av_match_name(name: pchar; names: pchar): longint; cdecl; external libavutil;
function av_append_path_component(path: pchar; component: pchar): pchar; cdecl; external libavutil;

type
  TAVEscapeMode = longint;

const
  AV_ESCAPE_MODE_AUTO = 0;
  AV_ESCAPE_MODE_BACKSLASH = 1;
  AV_ESCAPE_MODE_QUOTE = 2;
  AV_ESCAPE_MODE_XML = 3;

const
  AV_ESCAPE_FLAG_WHITESPACE = 1 shl 0;
  AV_ESCAPE_FLAG_STRICT = 1 shl 1;
  AV_ESCAPE_FLAG_XML_SINGLE_QUOTES = 1 shl 2;
  AV_ESCAPE_FLAG_XML_DOUBLE_QUOTES = 1 shl 3;

function av_escape(dst: PPchar; src: pchar; special_chars: pchar; mode: TAVEscapeMode; flags: longint): longint; cdecl; external libavutil;

const
  AV_UTF8_FLAG_ACCEPT_INVALID_BIG_CODES = 1;
  AV_UTF8_FLAG_ACCEPT_NON_CHARACTERS = 2;
  AV_UTF8_FLAG_ACCEPT_SURROGATES = 4;
  AV_UTF8_FLAG_EXCLUDE_XML_INVALID_CONTROL_CODES = 8;
  AV_UTF8_FLAG_ACCEPT_ALL = AV_UTF8_FLAG_ACCEPT_INVALID_BIG_CODES or AV_UTF8_FLAG_ACCEPT_NON_CHARACTERS or AV_UTF8_FLAG_ACCEPT_SURROGATES;

function av_utf8_decode(codep: Pint32_t; bufp: PPuint8_t; buf_end: Puint8_t; flags: dword): longint; cdecl; external libavutil;
function av_match_list(name: pchar; list: pchar; separator: char): longint; cdecl; external libavutil;
function av_sscanf(_string: pchar; format: pchar): longint; cdecl; varargs; external libavutil;

// === Konventiert am: 14-12-25 15:59:43 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
