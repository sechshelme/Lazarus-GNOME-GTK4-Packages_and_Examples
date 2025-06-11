unit efreet_utils;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore, efreet_desktop;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function efreet_util_path_to_file_id(path: pchar): pchar; cdecl; external libefreet;
function efreet_util_desktop_mime_list(mime: pchar): PEina_List; cdecl; external libefreet;
function efreet_util_desktop_wm_class_find(wmname: pchar; wmclass: pchar): PEfreet_Desktop; cdecl; external libefreet;
function efreet_util_desktop_file_id_find(file_id: pchar): PEfreet_Desktop; cdecl; external libefreet;
function efreet_util_desktop_exec_find(exec: pchar): PEfreet_Desktop; cdecl; external libefreet;
function efreet_util_desktop_name_find(name: pchar): PEfreet_Desktop; cdecl; external libefreet;
function efreet_util_desktop_generic_name_find(generic_name: pchar): PEfreet_Desktop; cdecl; external libefreet;
function efreet_util_desktop_name_glob_list(glob: pchar): PEina_List; cdecl; external libefreet;
function efreet_util_desktop_exec_glob_list(glob: pchar): PEina_List; cdecl; external libefreet;
function efreet_util_desktop_generic_name_glob_list(glob: pchar): PEina_List; cdecl; external libefreet;
function efreet_util_desktop_comment_glob_list(glob: pchar): PEina_List; cdecl; external libefreet;
function efreet_util_desktop_categories_list: PEina_List; cdecl; external libefreet;
function efreet_util_desktop_category_list(category: pchar): PEina_List; cdecl; external libefreet;
function efreet_util_menus_find: PEina_List; cdecl; external libefreet;
function efreet_util_desktop_environments_list: PEina_List; cdecl; external libefreet;

// === Konventiert am: 11-6-25 17:06:30 ===


implementation



end.
