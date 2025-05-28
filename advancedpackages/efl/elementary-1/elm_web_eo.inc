{$IFDEF read_interface}


type
  PElm_Web = ^TElm_Web;
  TElm_Web = TEo;

function ELM_WEB_CLASS: PEfl_Class;

function elm_web_class_get: PEfl_Class; cdecl; external libelementary;
function elm_obj_web_text_matches_highlight_set(obj: PEo; highlight: TEina_Bool): TEina_Bool; cdecl; external libelementary;
function elm_obj_web_text_matches_highlight_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_obj_web_useragent_set(obj: PEo; user_agent: pchar); cdecl; external libelementary;
function elm_obj_web_useragent_get(obj: PEo): pchar; cdecl; external libelementary;
function elm_obj_web_url_set(obj: PEo; url: pchar): TEina_Bool; cdecl; external libelementary;
function elm_obj_web_url_get(obj: PEo): pchar; cdecl; external libelementary;
procedure elm_obj_web_bg_color_set(obj: PEo; r: longint; g: longint; b: longint; a: longint); cdecl; external libelementary;
procedure elm_obj_web_bg_color_get(obj: PEo; r: Plongint; g: Plongint; b: Plongint; a: Plongint); cdecl; external libelementary;
procedure elm_obj_web_inwin_mode_set(obj: PEo; value: TEina_Bool); cdecl; external libelementary;
function elm_obj_web_inwin_mode_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_obj_web_tab_propagate_set(obj: PEo; propagate: TEina_Bool); cdecl; external libelementary;
function elm_obj_web_tab_propagate_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_obj_web_history_enabled_set(obj: PEo; enable: TEina_Bool); cdecl; external libelementary;
function elm_obj_web_history_enabled_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_obj_web_console_message_hook_set(obj: PEo; func: TElm_Web_Console_Message; data: pointer); cdecl; external libelementary;
procedure elm_obj_web_window_create_hook_set(obj: PEo; func: TElm_Web_Window_Open; data: pointer); cdecl; external libelementary;
procedure elm_obj_web_dialog_file_selector_hook_set(obj: PEo; func: TElm_Web_Dialog_File_Selector; data: pointer); cdecl; external libelementary;
procedure elm_obj_web_dialog_confirm_hook_set(obj: PEo; func: TElm_Web_Dialog_Confirm; data: pointer); cdecl; external libelementary;
procedure elm_obj_web_popup_selected_set(obj: PEo; idx: longint); cdecl; external libelementary;
procedure elm_obj_web_dialog_prompt_hook_set(obj: PEo; func: TElm_Web_Dialog_Prompt; data: pointer); cdecl; external libelementary;
procedure elm_obj_web_dialog_alert_hook_set(obj: PEo; func: TElm_Web_Dialog_Alert; data: pointer); cdecl; external libelementary;
function elm_obj_web_forward_possible_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
function elm_obj_web_webkit_view_get(obj: PEo): PEfl_Canvas_Object; cdecl; external libelementary;
function elm_obj_web_back_possible_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
function elm_obj_web_load_progress_get(obj: PEo): double; cdecl; external libelementary;
function elm_obj_web_selection_get(obj: PEo): pchar; cdecl; external libelementary;
function elm_obj_web_title_get(obj: PEo): PEina_Stringshare; cdecl; external libelementary;
function elm_obj_web_navigate(obj: PEo; steps: longint): TEina_Bool; cdecl; external libelementary;
function elm_obj_web_back(obj: PEo): TEina_Bool; cdecl; external libelementary;
function elm_obj_web_html_string_load(obj: PEo; html: pchar; base_url: pchar; unreachable_url: pchar): TEina_Bool; cdecl; external libelementary;
function elm_obj_web_text_search(obj: PEo; _string: pchar; case_sensitive: TEina_Bool; forward: TEina_Bool; wrap: TEina_Bool): TEina_Bool; cdecl; external libelementary;
function elm_obj_web_popup_destroy(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_obj_web_region_show(obj: PEo; x: longint; y: longint; w: longint; h: longint); cdecl; external libelementary;
function elm_obj_web_forward(obj: PEo): TEina_Bool; cdecl; external libelementary;
function elm_obj_web_text_matches_mark(obj: PEo; _string: pchar; case_sensitive: TEina_Bool; highlight: TEina_Bool; limit: dword): dword; cdecl; external libelementary;
procedure elm_obj_web_region_bring_in(obj: PEo; x: longint; y: longint; w: longint; h: longint); cdecl; external libelementary;
function elm_obj_web_stop(obj: PEo): TEina_Bool; cdecl; external libelementary;
function elm_obj_web_navigate_possible_get(obj: PEo; steps: longint): TEina_Bool; cdecl; external libelementary;
function elm_obj_web_reload_full(obj: PEo): TEina_Bool; cdecl; external libelementary;
function elm_obj_web_text_matches_unmark_all(obj: PEo): TEina_Bool; cdecl; external libelementary;
function elm_obj_web_reload(obj: PEo): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 26-5-25 15:23:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function ELM_WEB_CLASS: PEfl_Class;
begin
  ELM_WEB_CLASS := elm_web_class_get;
end;


{$ENDIF read_implementation}
