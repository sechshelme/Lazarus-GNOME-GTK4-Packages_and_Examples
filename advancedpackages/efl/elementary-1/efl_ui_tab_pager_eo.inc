{$IFDEF read_interface}


type
  PEfl_Ui_Tab_Pager = ^TEfl_Ui_Tab_Pager;
  TEfl_Ui_Tab_Pager = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_TAB_PAGER_CLASS: PEfl_Class;

function efl_ui_tab_pager_class_get: PEfl_Class; cdecl; external libelementary;
function efl_ui_tab_pager_tab_bar_get(obj: PEo): PEfl_Ui_Tab_Bar; cdecl; external libelementary;
procedure efl_ui_tab_pager_spotlight_manager_set(obj: PEo; manager: PEfl_Ui_Spotlight_Manager); cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 17:38:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_TAB_PAGER_CLASS: PEfl_Class;
begin
  EFL_UI_TAB_PAGER_CLASS := efl_ui_tab_pager_class_get;
end;
{$endif}


{$ENDIF read_implementation}
