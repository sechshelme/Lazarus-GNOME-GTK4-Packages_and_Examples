{$IFDEF read_interface}


type
  Tbson_string_t = record
    str: pchar;
    len: Tuint32_t;
    alloc: Tuint32_t;
  end;
  Pbson_string_t = ^Tbson_string_t;

function bson_string_new(str: pchar): Pbson_string_t; cdecl; external libbson;
function bson_string_free(_string: Pbson_string_t; free_segment: Boolean): pchar; cdecl; external libbson;
procedure bson_string_append(_string: Pbson_string_t; str: pchar); cdecl; external libbson;
procedure bson_string_append_c(_string: Pbson_string_t; str: char); cdecl; external libbson;
procedure bson_string_append_unichar(_string: Pbson_string_t; unichar: Tbson_unichar_t); cdecl; external libbson;
procedure bson_string_append_printf(_string: Pbson_string_t; format: pchar; args: array of const); cdecl; external libbson;
procedure bson_string_append_printf(_string: Pbson_string_t; format: pchar); cdecl; external libbson;
procedure bson_string_truncate(_string: Pbson_string_t; len: Tuint32_t); cdecl; external libbson;
function bson_strdup(str: pchar): pchar; cdecl; external libbson;
function bson_strdup_printf(format: pchar; args: array of const): pchar; cdecl; external libbson;
function bson_strdup_printf(format: pchar): pchar; cdecl; external libbson;
function bson_strdupv_printf(format: pchar; args: Tva_list): pchar; cdecl; external libbson;
function bson_strndup(str: pchar; n_bytes: Tsize_t): pchar; cdecl; external libbson;
procedure bson_strncpy(dst: pchar; src: pchar; size: Tsize_t); cdecl; external libbson;
function bson_vsnprintf(str: pchar; size: Tsize_t; format: pchar; ap: Tva_list): longint; cdecl; external libbson;
function bson_snprintf(str: pchar; size: Tsize_t; format: pchar; args: array of const): longint; cdecl; external libbson;
function bson_snprintf(str: pchar; size: Tsize_t; format: pchar): longint; cdecl; external libbson;
procedure bson_strfreev(strv: PPchar); cdecl; external libbson;
function bson_strnlen(s: pchar; maxlen: Tsize_t): Tsize_t; cdecl; external libbson;
function bson_ascii_strtoll(str: pchar; endptr: PPchar; base: longint): Tint64_t; cdecl; external libbson;
function bson_strcasecmp(s1: pchar; s2: pchar): longint; cdecl; external libbson;
function bson_isspace(c: longint): Boolean; cdecl; external libbson;

// === Konventiert am: 17-5-26 16:53:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
