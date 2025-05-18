{$IFDEF read_interface}


function eina_strlcpy(dst: pchar; src: pchar; siz: Tsize_t): Tsize_t; cdecl; external libeina;
function eina_strlcat(dst: pchar; src: pchar; siz: Tsize_t): Tsize_t; cdecl; external libeina;
function eina_str_has_prefix(str: pchar; prefix: pchar): TEina_Bool; cdecl; external libeina;
function eina_str_has_suffix(str: pchar; suffix: pchar): TEina_Bool; cdecl; external libeina;
function eina_str_has_extension(str: pchar; ext: pchar): TEina_Bool; cdecl; external libeina;
function eina_str_split(_string: pchar; delimiter: pchar; max_tokens: longint): PPchar; cdecl; external libeina;
function eina_str_split_full(_string: pchar; delimiter: pchar; max_tokens: longint; elements: Pdword): PPchar; cdecl; external libeina;
function eina_str_join_len(dst: pchar; size: Tsize_t; sep: char; a: pchar; a_len: Tsize_t; b: pchar; b_len: Tsize_t): Tsize_t; cdecl; external libeina;
function eina_str_convert(enc_from: pchar; enc_to: pchar; text: pchar): pchar; cdecl; external libeina;
function eina_str_convert_len(enc_from: pchar; enc_to: pchar; text: pchar; len: Tsize_t; retlen: Psize_t): pchar; cdecl; external libeina;
function eina_str_escape(str: pchar): pchar; cdecl; external libeina;
procedure eina_str_tolower(str: PPchar); cdecl; external libeina;
procedure eina_str_toupper(str: PPchar); cdecl; external libeina;
function eina_memdup(mem: pbyte; size: Tsize_t; terminate: TEina_Bool): pbyte; cdecl; external libeina;
function eina_strftime(format: pchar; tm: Ptm): pchar; cdecl; external libeina;

// === Konventiert am: 16-5-25 19:39:40 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
