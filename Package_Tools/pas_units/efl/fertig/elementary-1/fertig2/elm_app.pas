unit elm_app;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure elm_app_info_set(mainfunc: pointer; dom: pchar; checkfile: pchar); cdecl; external libelementary;
procedure elm_app_name_set(name: pchar); cdecl; external libelementary;
procedure elm_app_desktop_entry_set(path: pchar); cdecl; external libelementary;
procedure elm_app_compile_bin_dir_set(dir: pchar); cdecl; external libelementary;
procedure elm_app_compile_lib_dir_set(dir: pchar); cdecl; external libelementary;
procedure elm_app_compile_data_dir_set(dir: pchar); cdecl; external libelementary;
procedure elm_app_compile_locale_set(dir: pchar); cdecl; external libelementary;
function elm_app_name_get: pchar; cdecl; external libelementary;
function elm_app_desktop_entry_get: pchar; cdecl; external libelementary;
function elm_app_prefix_dir_get: pchar; cdecl; external libelementary;
function elm_app_bin_dir_get: pchar; cdecl; external libelementary;
function elm_app_lib_dir_get: pchar; cdecl; external libelementary;
function elm_app_data_dir_get: pchar; cdecl; external libelementary;
function elm_app_locale_dir_get: pchar; cdecl; external libelementary;
procedure elm_app_base_scale_set(base_scale: double); cdecl; external libelementary;
function elm_app_base_scale_get: double; cdecl; external libelementary;

// === Konventiert am: 28-5-25 15:57:03 ===


implementation



end.
