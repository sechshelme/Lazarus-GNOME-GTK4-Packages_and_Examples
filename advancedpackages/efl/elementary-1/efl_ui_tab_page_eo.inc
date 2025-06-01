{$IFDEF read_interface}


type
  PEfl_Ui_Tab_Page = ^TEfl_Ui_Tab_Page;
  TEfl_Ui_Tab_Page = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_TAB_PAGE_CLASS: PEfl_Class;

function efl_ui_tab_page_class_get: PEfl_Class; cdecl; external libelementary;
function efl_ui_tab_page_tab_bar_item_get(obj: PEo): PEfl_Ui_Tab_Bar_Default_Item; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 17:38:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_TAB_PAGE_CLASS: PEfl_Class;
begin
  EFL_UI_TAB_PAGE_CLASS := efl_ui_tab_page_class_get;
end;
{$endif}


{$ENDIF read_implementation}
