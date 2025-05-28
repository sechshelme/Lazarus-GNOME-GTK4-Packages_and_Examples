{$IFDEF read_interface}


procedure _elm_fileselector_path_set_internal(obj: PEvas_Object; path: pchar); cdecl; external libelementary;
function _elm_fileselector_path_get_internal(obj: PEvas_Object): pchar; cdecl; external libelementary;
function _elm_fileselector_selected_set_internal(obj: PEvas_Object; _path: pchar): TEina_Bool; cdecl; external libelementary;
function _elm_fileselector_selected_get_internal(obj: PEvas_Object): pchar; cdecl; external libelementary;
function _elm_fileselector_selected_paths_get_internal(obj: PEvas_Object): PEina_List; cdecl; external libelementary;
procedure _elm_fileselector_entry_path_set_internal(obj: PEvas_Object; path: pchar); cdecl; external libelementary;
function _elm_fileselector_entry_path_get_internal(obj: PEvas_Object): pchar; cdecl; external libelementary;
function _elm_fileselector_entry_selected_set_internal(obj: PEvas_Object; path: pchar): TEina_Bool; cdecl; external libelementary;
function _elm_fileselector_entry_selected_get_internal(obj: PEvas_Object): pchar; cdecl; external libelementary;
procedure _elm_fileselector_button_path_set_internal(obj: PEvas_Object; path: pchar); cdecl; external libelementary;
function _elm_fileselector_button_path_get_internal(obj: PEvas_Object): pchar; cdecl; external libelementary;
function _elm_fileselector_button_selected_set_internal(obj: PEvas_Object; _path: pchar): TEina_Bool; cdecl; external libelementary;
function _elm_fileselector_button_selected_get_internal(obj: PEvas_Object): pchar; cdecl; external libelementary;
function _elm_fileselector_button_selected_paths_get_internal(obj: PEvas_Object): PEina_List; cdecl; external libelementary;
procedure _event_to_legacy_call(obj: PEo; evt: pchar; event_info: pointer); cdecl; external libelementary;
procedure _model_event_call(obj: PEo; evt_desc: PEfl_Event_Description; legacy_evt: pchar; model: PEfl_Model; path: pchar); cdecl; external libelementary;

// === Konventiert am: 27-5-25 16:58:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
