{$IFDEF read_interface}


type
  PEfl_Ui_Tab_Bar_Default_Item = ^TEfl_Ui_Tab_Bar_Default_Item;
  TEfl_Ui_Tab_Bar_Default_Item = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_TAB_BAR_DEFAULT_ITEM_CLASS: PEfl_Class;

function efl_ui_tab_bar_default_item_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_tab_bar_default_item_icon_set(obj: PEo; standard_name: pchar); cdecl; external libelementary;
function efl_ui_tab_bar_default_item_icon_get(obj: PEo): pchar; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 17:37:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_TAB_BAR_DEFAULT_ITEM_CLASS: PEfl_Class;
begin
  EFL_UI_TAB_BAR_DEFAULT_ITEM_CLASS := efl_ui_tab_bar_default_item_class_get;
end;
{$endif}


{$ENDIF read_implementation}
