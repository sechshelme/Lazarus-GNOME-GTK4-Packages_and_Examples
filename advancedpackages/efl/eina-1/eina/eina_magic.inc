{$IFDEF read_interface}

type
  PEina_Magic = ^TEina_Magic;
  TEina_Magic = dword;

function eina_magic_string_get(magic: TEina_Magic): pchar; cdecl; external libeina;
function eina_magic_string_set(magic: TEina_Magic; magic_name: pchar): TEina_Bool; cdecl; external libeina;
function eina_magic_string_static_set(magic: TEina_Magic; magic_name: pchar): TEina_Bool; cdecl; external libeina;

const
  EINA_MAGIC_NONE = $1234fedc;

var
  EINA_ERROR_MAGIC_FAILED: TEina_Error; cvar;external libeina;

  // === Konventiert am: 17-5-25 13:01:37 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
