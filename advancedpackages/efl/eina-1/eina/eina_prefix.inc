{$IFDEF read_interface}

type
  TEina_Prefix = record
  end;
  PEina_Prefix = ^TEina_Prefix;

function eina_prefix_new(argv0: pchar; symbol: pointer; envprefix: pchar; sharedir: pchar; magicsharefile: pchar; pkg_bin: pchar; pkg_lib: pchar; pkg_data: pchar; pkg_locale: pchar): PEina_Prefix; cdecl; external libeina;
procedure eina_prefix_free(pfx: PEina_Prefix); cdecl; external libeina;
function eina_prefix_get(pfx: PEina_Prefix): pchar; cdecl; external libeina;
function eina_prefix_bin_get(pfx: PEina_Prefix): pchar; cdecl; external libeina;
function eina_prefix_lib_get(pfx: PEina_Prefix): pchar; cdecl; external libeina;
function eina_prefix_data_get(pfx: PEina_Prefix): pchar; cdecl; external libeina;
function eina_prefix_locale_get(pfx: PEina_Prefix): pchar; cdecl; external libeina;

// === Konventiert am: 17-5-25 13:01:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
