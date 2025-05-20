{$IFDEF read_interface}


type
  PEfl_File = ^TEfl_File;
  TEfl_File = TEo;

function EFL_FILE_MIXIN: PEfl_Class;

function efl_file_mixin_get: PEfl_Class; cdecl; external libefl;
function efl_file_mmap_set(obj: PEo; f: PEina_File): TEina_Error; cdecl; external libefl;
function efl_file_mmap_get(obj: PEo): PEina_File; cdecl; external libefl;
function efl_file_set(obj: PEo; file_: pchar): TEina_Error; cdecl; external libefl;
function efl_file_get(obj: PEo): pchar; cdecl; external libefl;
procedure efl_file_key_set(obj: PEo; key: pchar); cdecl; external libefl;
function efl_file_key_get(obj: PEo): pchar; cdecl; external libefl;
function efl_file_loaded_get(obj: PEo): TEina_Bool; cdecl; external libefl;
function efl_file_load(obj: PEo): TEina_Error; cdecl; external libefl;
procedure efl_file_unload(obj: PEo); cdecl; external libefl;

// === Konventiert am: 19-5-25 19:44:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_FILE_MIXIN: PEfl_Class;
begin
  EFL_FILE_MIXIN := efl_file_mixin_get;
end;


{$ENDIF read_implementation}
