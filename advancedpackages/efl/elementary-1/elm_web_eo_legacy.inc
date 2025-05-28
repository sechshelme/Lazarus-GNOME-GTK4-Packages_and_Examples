{$IFDEF read_interface}


function elm_web_text_matches_highlight_set(obj:PElm_Web; highlight:TEina_Bool):TEina_Bool;cdecl;external libelementary;
function elm_web_text_matches_highlight_get(obj:PElm_Web):TEina_Bool;cdecl;external libelementary;
procedure elm_web_useragent_set(obj:PElm_Web; user_agent:Pchar);cdecl;external libelementary;
function elm_web_useragent_get(obj:PElm_Web):Pchar;cdecl;external libelementary;
function elm_web_url_set(obj:PElm_Web; url:Pchar):TEina_Bool;cdecl;external libelementary;
function elm_web_url_get(obj:PElm_Web):Pchar;cdecl;external libelementary;
procedure elm_web_bg_color_set(obj:PElm_Web; r:longint; g:longint; b:longint; a:longint);cdecl;external libelementary;
procedure elm_web_bg_color_get(obj:PElm_Web; r:Plongint; g:Plongint; b:Plongint; a:Plongint);cdecl;external libelementary;
procedure elm_web_inwin_mode_set(obj:PElm_Web; value:TEina_Bool);cdecl;external libelementary;
function elm_web_inwin_mode_get(obj:PElm_Web):TEina_Bool;cdecl;external libelementary;
procedure elm_web_tab_propagate_set(obj:PElm_Web; propagate:TEina_Bool);cdecl;external libelementary;
function elm_web_tab_propagate_get(obj:PElm_Web):TEina_Bool;cdecl;external libelementary;
procedure elm_web_history_enabled_set(obj:PElm_Web; enable:TEina_Bool);cdecl;external libelementary;
function elm_web_history_enabled_get(obj:PElm_Web):TEina_Bool;cdecl;external libelementary;
procedure elm_web_console_message_hook_set(obj:PElm_Web; func:TElm_Web_Console_Message; data:pointer);cdecl;external libelementary;
procedure elm_web_window_create_hook_set(obj:PElm_Web; func:TElm_Web_Window_Open; data:pointer);cdecl;external libelementary;
procedure elm_web_dialog_file_selector_hook_set(obj:PElm_Web; func:TElm_Web_Dialog_File_Selector; data:pointer);cdecl;external libelementary;
procedure elm_web_dialog_confirm_hook_set(obj:PElm_Web; func:TElm_Web_Dialog_Confirm; data:pointer);cdecl;external libelementary;
procedure elm_web_popup_selected_set(obj:PElm_Web; idx:longint);cdecl;external libelementary;
procedure elm_web_dialog_prompt_hook_set(obj:PElm_Web; func:TElm_Web_Dialog_Prompt; data:pointer);cdecl;external libelementary;
procedure elm_web_dialog_alert_hook_set(obj:PElm_Web; func:TElm_Web_Dialog_Alert; data:pointer);cdecl;external libelementary;
function elm_web_forward_possible_get(obj:PElm_Web):TEina_Bool;cdecl;external libelementary;
function elm_web_webkit_view_get(obj:PElm_Web):PEfl_Canvas_Object;cdecl;external libelementary;
function elm_web_back_possible_get(obj:PElm_Web):TEina_Bool;cdecl;external libelementary;
function elm_web_load_progress_get(obj:PElm_Web):double;cdecl;external libelementary;
function elm_web_selection_get(obj:PElm_Web):Pchar;cdecl;external libelementary;
function elm_web_title_get(obj:PElm_Web):PEina_Stringshare;cdecl;external libelementary;
function elm_web_navigate(obj:PElm_Web; steps:longint):TEina_Bool;cdecl;external libelementary;
function elm_web_back(obj:PElm_Web):TEina_Bool;cdecl;external libelementary;
function elm_web_html_string_load(obj:PElm_Web; html:Pchar; base_url:Pchar; unreachable_url:Pchar):TEina_Bool;cdecl;external libelementary;
function elm_web_text_search(obj:PElm_Web; _string:Pchar; case_sensitive:TEina_Bool; forward:TEina_Bool; wrap:TEina_Bool):TEina_Bool;cdecl;external libelementary;
function elm_web_popup_destroy(obj:PElm_Web):TEina_Bool;cdecl;external libelementary;
procedure elm_web_region_show(obj:PElm_Web; x:longint; y:longint; w:longint; h:longint);cdecl;external libelementary;
function elm_web_forward(obj:PElm_Web):TEina_Bool;cdecl;external libelementary;
function elm_web_text_matches_mark(obj:PElm_Web; _string:Pchar; case_sensitive:TEina_Bool; highlight:TEina_Bool; limit:dword):dword;cdecl;external libelementary;
procedure elm_web_region_bring_in(obj:PElm_Web; x:longint; y:longint; w:longint; h:longint);cdecl;external libelementary;
function elm_web_stop(obj:PElm_Web):TEina_Bool;cdecl;external libelementary;
function elm_web_navigate_possible_get(obj:PElm_Web; steps:longint):TEina_Bool;cdecl;external libelementary;
function elm_web_reload_full(obj:PElm_Web):TEina_Bool;cdecl;external libelementary;
function elm_web_text_matches_unmark_all(obj:PElm_Web):TEina_Bool;cdecl;external libelementary;
function elm_web_reload(obj:PElm_Web):TEina_Bool;cdecl;external libelementary;

// === Konventiert am: 26-5-25 15:23:47 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
