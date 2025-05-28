{$IFDEF read_interface}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_SPOTLIGHT_SCROLL_MANAGER_CLASS: PEfl_Class;

function efl_ui_spotlight_scroll_manager_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_spotlight_manager_scroll_block_set(obj: PEo; scroll_block: TEina_Bool); cdecl; external libelementary;
function efl_ui_spotlight_manager_scroll_block_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
{$endif}

// === Konventiert am: 27-5-25 19:41:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_SPOTLIGHT_SCROLL_MANAGER_CLASS: PEfl_Class;
begin
  EFL_UI_SPOTLIGHT_SCROLL_MANAGER_CLASS := efl_ui_spotlight_scroll_manager_class_get;
end;
{$endif}


{$ENDIF read_implementation}
