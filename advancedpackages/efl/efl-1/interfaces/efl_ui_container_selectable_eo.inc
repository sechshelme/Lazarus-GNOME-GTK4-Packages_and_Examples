{$IFDEF read_interface}


type
  PEfl_Ui_Container_Selectable = ^TEfl_Ui_Container_Selectable;
  TEfl_Ui_Container_Selectable = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_CONTAINER_SELECTABLE_INTERFACE: PEfl_Class;

function efl_ui_container_selectable_interface_get: PEfl_Class; cdecl; external libefl;

var
  _EFL_UI_EVENT_ITEM_SELECTED: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_EVENT_ITEM_UNSELECTED: TEfl_Event_Description; cvar;external libefl;

function EFL_UI_EVENT_ITEM_SELECTED: PEfl_Event_Description;
function EFL_UI_EVENT_ITEM_UNSELECTED: PEfl_Event_Description;
{$endif}

// === Konventiert am: 20-5-25 15:00:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_CONTAINER_SELECTABLE_INTERFACE: PEfl_Class;
begin
  EFL_UI_CONTAINER_SELECTABLE_INTERFACE := efl_ui_container_selectable_interface_get;
end;

function EFL_UI_EVENT_ITEM_SELECTED: PEfl_Event_Description;
begin
  EFL_UI_EVENT_ITEM_SELECTED := @(_EFL_UI_EVENT_ITEM_SELECTED);
end;

function EFL_UI_EVENT_ITEM_UNSELECTED: PEfl_Event_Description;
begin
  EFL_UI_EVENT_ITEM_UNSELECTED := @(_EFL_UI_EVENT_ITEM_UNSELECTED);
end;
{$endif}


{$ENDIF read_implementation}
