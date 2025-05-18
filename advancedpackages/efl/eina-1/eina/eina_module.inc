{$IFDEF read_interface}


type
  TEina_Module = record
  end;
  PEina_Module = ^TEina_Module;

  TEina_Module_Cb = function(m: PEina_Module; data: pointer): TEina_Bool; cdecl;
  TEina_Module_Init = function(para1: pointer): TEina_Bool; cdecl;
  TEina_Module_Shutdown = procedure(para1: pointer); cdecl;

var
  EINA_ERROR_WRONG_MODULE: TEina_Error; cvar;external libeina;
  EINA_ERROR_MODULE_INIT_FAILED: TEina_Error; cvar;external libeina;

function eina_module_new(file_: pchar): PEina_Module; cdecl; external libeina;
function eina_module_free(module: PEina_Module): TEina_Bool; cdecl; external libeina;
function eina_module_load(module: PEina_Module): TEina_Bool; cdecl; external libeina;
function eina_module_unload(module: PEina_Module): TEina_Bool; cdecl; external libeina;
function eina_module_symbol_get(module: PEina_Module; symbol: pchar): pointer; cdecl; external libeina;
function eina_module_file_get(module: PEina_Module): pchar; cdecl; external libeina;
procedure eina_module_symbol_global_set(module: PEina_Module; global: TEina_Bool); cdecl; external libeina;
function eina_module_symbol_path_get(symbol: pointer; sub_dir: pchar): pchar; cdecl; external libeina;
function eina_module_environment_path_get(env: pchar; sub_dir: pchar): pchar; cdecl; external libeina;
function eina_module_arch_list_get(arr: PEina_Array; path: pchar; arch: pchar): PEina_Array; cdecl; external libeina;
function eina_module_list_get(arr: PEina_Array; path: pchar; recursive: TEina_Bool; cb: TEina_Module_Cb; data: pointer): PEina_Array; cdecl; external libeina;
procedure eina_module_list_load(arr: PEina_Array); cdecl; external libeina;
procedure eina_module_list_unload(arr: PEina_Array); cdecl; external libeina;
procedure eina_module_list_free(arr: PEina_Array); cdecl; external libeina;
function eina_module_find(arr: PEina_Array; module: pchar): PEina_Module; cdecl; external libeina;

// === Konventiert am: 17-5-25 13:01:40 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
