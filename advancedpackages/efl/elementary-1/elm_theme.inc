{$IFDEF read_interface}


type
  TElm_Theme = record
  end;
  PElm_Theme = ^TElm_Theme;

function elm_theme_color_class_list(th: PElm_Theme): PEina_List; cdecl; external libelementary;
procedure elm_theme_color_class_list_free(list: PEina_List); cdecl; external libelementary;
function elm_theme_new: PElm_Theme; cdecl; external libelementary;
procedure elm_theme_free(th: PElm_Theme); cdecl; external libelementary;
procedure elm_theme_copy(th: PElm_Theme; thdst: PElm_Theme); cdecl; external libelementary;
procedure elm_theme_ref_set(th: PElm_Theme; thref: PElm_Theme); cdecl; external libelementary;
function elm_theme_ref_get(th: PElm_Theme): PElm_Theme; cdecl; external libelementary;
function elm_theme_default_get: PElm_Theme; cdecl; external libelementary;
procedure elm_theme_overlay_add(th: PElm_Theme; item: pchar); cdecl; external libelementary;
procedure elm_theme_overlay_del(th: PElm_Theme; item: pchar); cdecl; external libelementary;
procedure elm_theme_overlay_mmap_add(th: PElm_Theme; f: PEina_File); cdecl; external libelementary;
procedure elm_theme_overlay_mmap_del(th: PElm_Theme; f: PEina_File); cdecl; external libelementary;
function elm_theme_overlay_list_get(th: PElm_Theme): PEina_List; cdecl; external libelementary;
procedure elm_theme_extension_add(th: PElm_Theme; item: pchar); cdecl; external libelementary;
procedure elm_theme_extension_del(th: PElm_Theme; item: pchar); cdecl; external libelementary;
procedure elm_theme_extension_mmap_add(th: PElm_Theme; f: PEina_File); cdecl; external libelementary;
procedure elm_theme_extension_mmap_del(th: PElm_Theme; f: PEina_File); cdecl; external libelementary;
function elm_theme_extension_list_get(th: PElm_Theme): PEina_List; cdecl; external libelementary;
procedure elm_theme_set(th: PElm_Theme; theme: pchar); cdecl; external libelementary;
function elm_theme_get(th: PElm_Theme): pchar; cdecl; external libelementary;
function elm_theme_list_get(th: PElm_Theme): PEina_List; cdecl; external libelementary;
function elm_theme_list_item_path_get(f: pchar; in_search_path: PEina_Bool): pchar; cdecl; external libelementary;
procedure elm_theme_flush(th: PElm_Theme); cdecl; external libelementary;
procedure elm_theme_full_flush; cdecl; external libelementary;
function elm_theme_name_available_list_new: PEina_List; cdecl; external libelementary;
procedure elm_theme_name_available_list_free(list: PEina_List); cdecl; external libelementary;
procedure elm_object_theme_set(obj: PEvas_Object; th: PElm_Theme); cdecl; external libelementary;
function elm_object_theme_get(obj: PEvas_Object): PElm_Theme; cdecl; external libelementary;
function elm_theme_data_get(th: PElm_Theme; key: pchar): pchar; cdecl; external libelementary;
function elm_theme_group_path_find(th: PElm_Theme; group: pchar): pchar; cdecl; external libelementary;
function elm_theme_group_base_list(th: PElm_Theme; base: pchar): PEina_List; cdecl; external libelementary;
function elm_theme_system_dir_get: pchar; cdecl; external libelementary;
function elm_theme_user_dir_get: pchar; cdecl; external libelementary;

// === Konventiert am: 25-5-25 18:50:10 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
