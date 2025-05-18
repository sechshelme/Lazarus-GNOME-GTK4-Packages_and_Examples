{$IFDEF read_interface}


type
  TEina_Tmpstr = char;
  PEina_Tmpstr = ^TEina_Tmpstr;
  PPEina_Tmpstr = ^PEina_Tmpstr;

function eina_tmpstr_add(str: pchar): PEina_Tmpstr; cdecl; external libeina;
function eina_tmpstr_add_length(str: pchar; length: Tsize_t): PEina_Tmpstr; cdecl; external libeina;
function eina_tmpstr_strlen(tmpstr: PEina_Tmpstr): Tsize_t; cdecl; external libeina; deprecated;
function eina_tmpstr_len(tmpstr: PEina_Tmpstr): Tsize_t; cdecl; external libeina;
procedure eina_tmpstr_del(tmpstr: PEina_Tmpstr); cdecl; external libeina;
function eina_tmpstr_manage_new(str: pchar): PEina_Tmpstr; cdecl; external libeina;
function eina_tmpstr_manage_new_length(str: pchar; length: Tsize_t): PEina_Tmpstr; cdecl; external libeina;

// === Konventiert am: 15-5-25 18:03:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
