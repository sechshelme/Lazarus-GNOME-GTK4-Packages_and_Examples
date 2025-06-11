{$IFDEF read_interface}



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


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
