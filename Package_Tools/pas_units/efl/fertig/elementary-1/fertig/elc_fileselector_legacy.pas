unit elc_fileselector_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, elm_interface_fileselector_eo_legacy, elc_fileselector_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_fileselector_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_fileselector_is_save_set(obj: PEvas_Object; is_save: TEina_Bool); cdecl; external libelementary;
function elm_fileselector_is_save_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_fileselector_folder_only_set(obj: PEvas_Object; only: TEina_Bool); cdecl; external libelementary;
function elm_fileselector_folder_only_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_fileselector_expandable_set(obj: PEvas_Object; expand: TEina_Bool); cdecl; external libelementary;
function elm_fileselector_expandable_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_fileselector_path_set(obj: PEvas_Object; path: pchar); cdecl; external libelementary;
function elm_fileselector_path_get(obj: PEvas_Object): pchar; cdecl; external libelementary;
procedure elm_fileselector_mode_set(obj: PEvas_Object; mode: TElm_Fileselector_Mode); cdecl; external libelementary;
function elm_fileselector_mode_get(obj: PEvas_Object): TElm_Fileselector_Mode; cdecl; external libelementary;
procedure elm_fileselector_multi_select_set(obj: PEvas_Object; multi: TEina_Bool); cdecl; external libelementary;
function elm_fileselector_multi_select_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
function elm_fileselector_selected_set(obj: PEvas_Object; path: pchar): TEina_Bool; cdecl; external libelementary;
function elm_fileselector_selected_get(obj: PEvas_Object): pchar; cdecl; external libelementary;
procedure elm_fileselector_current_name_set(obj: PEvas_Object; name: pchar); cdecl; external libelementary;
function elm_fileselector_current_name_get(obj: PEvas_Object): pchar; cdecl; external libelementary;
function elm_fileselector_selected_paths_get(obj: PEvas_Object): PEina_List; cdecl; external libelementary;
function elm_fileselector_mime_types_filter_append(obj: PEvas_Object; mime_types: pchar; filter_name: pchar): TEina_Bool; cdecl; external libelementary;
function elm_fileselector_custom_filter_append(obj: PEvas_Object; func: TElm_Fileselector_Filter_Func; data: pointer; filter_name: pchar): TEina_Bool; cdecl; external libelementary;
procedure elm_fileselector_filters_clear(obj: PEvas_Object); cdecl; external libelementary;
procedure elm_fileselector_hidden_visible_set(obj: PEvas_Object; visible: TEina_Bool); cdecl; external libelementary;
function elm_fileselector_hidden_visible_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_fileselector_thumbnail_size_set(obj: PEvas_Object; w: TEvas_Coord; h: TEvas_Coord); cdecl; external libelementary;
procedure elm_fileselector_thumbnail_size_get(obj: PEvas_Object; w: PEvas_Coord; h: PEvas_Coord); cdecl; external libelementary;
function elm_fileselector_sort_method_get(obj: PEvas_Object): TElm_Fileselector_Sort; cdecl; external libelementary;
procedure elm_fileselector_sort_method_set(obj: PEvas_Object; sort: TElm_Fileselector_Sort); cdecl; external libelementary;

// === Konventiert am: 27-5-25 16:50:22 ===


implementation



end.
