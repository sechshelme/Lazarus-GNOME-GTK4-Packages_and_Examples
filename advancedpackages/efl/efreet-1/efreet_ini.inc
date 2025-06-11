{$IFDEF read_interface}


type
  TEfreet_Ini = record
    data: PEina_Hash;
    section: PEina_Hash;
  end;
  PEfreet_Ini = ^TEfreet_Ini;

function efreet_ini_new(file_: pchar): PEfreet_Ini; cdecl; external libefreet;
procedure efreet_ini_free(ini: PEfreet_Ini); cdecl; external libefreet;
function efreet_ini_save(ini: PEfreet_Ini; path: pchar): longint; cdecl; external libefreet;
function efreet_ini_section_set(ini: PEfreet_Ini; section: pchar): longint; cdecl; external libefreet;
procedure efreet_ini_section_add(ini: PEfreet_Ini; section: pchar); cdecl; external libefreet;
function efreet_ini_string_get(ini: PEfreet_Ini; key: pchar): pchar; cdecl; external libefreet;
procedure efreet_ini_string_set(ini: PEfreet_Ini; key: pchar; value: pchar); cdecl; external libefreet;
function efreet_ini_localestring_get(ini: PEfreet_Ini; key: pchar): pchar; cdecl; external libefreet;
procedure efreet_ini_localestring_set(ini: PEfreet_Ini; key: pchar; value: pchar); cdecl; external libefreet;
function efreet_ini_boolean_get(ini: PEfreet_Ini; key: pchar): dword; cdecl; external libefreet;
procedure efreet_ini_boolean_set(ini: PEfreet_Ini; key: pchar; value: dword); cdecl; external libefreet;
function efreet_ini_int_get(ini: PEfreet_Ini; key: pchar): longint; cdecl; external libefreet;
procedure efreet_ini_int_set(ini: PEfreet_Ini; key: pchar; value: longint); cdecl; external libefreet;
function efreet_ini_double_get(ini: PEfreet_Ini; key: pchar): double; cdecl; external libefreet;
procedure efreet_ini_double_set(ini: PEfreet_Ini; key: pchar; value: double); cdecl; external libefreet;
procedure efreet_ini_key_unset(ini: PEfreet_Ini; key: pchar); cdecl; external libefreet;

// === Konventiert am: 11-6-25 17:06:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
