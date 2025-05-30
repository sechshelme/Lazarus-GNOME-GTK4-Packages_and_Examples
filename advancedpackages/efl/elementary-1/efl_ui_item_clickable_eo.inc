{$IFDEF read_interface}


type
  PEfl_Ui_Item_Clickable = ^TEfl_Ui_Item_Clickable;
  TEfl_Ui_Item_Clickable = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Ui_Item_Clickable_Clicked = ^TEfl_Ui_Item_Clickable_Clicked;

  TEfl_Ui_Item_Clickable_Clicked = record
    clicked: TEfl_Input_Clickable_Clicked;
    item: PEfl_Ui_Item;
  end;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Ui_Item_Clickable_Pressed = ^TEfl_Ui_Item_Clickable_Pressed;

  TEfl_Ui_Item_Clickable_Pressed = record
    button: longint;
    item: PEfl_Ui_Item;
  end;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_item_clickable_interface_get: PEfl_Class; cdecl; external libelementary;

function EFL_UI_ITEM_CLICKABLE_INTERFACE: PEfl_Class;

var
  _EFL_UI_EVENT_ITEM_PRESSED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_EVENT_ITEM_UNPRESSED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_EVENT_ITEM_LONGPRESSED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_EVENT_ITEM_CLICKED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_EVENT_ITEM_CLICKED_ANY: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_EVENT_ITEM_PRESSED: PEfl_Event_Description;
function EFL_UI_EVENT_ITEM_UNPRESSED: PEfl_Event_Description;
function EFL_UI_EVENT_ITEM_LONGPRESSED: PEfl_Event_Description;
function EFL_UI_EVENT_ITEM_CLICKED: PEfl_Event_Description;
function EFL_UI_EVENT_ITEM_CLICKED_ANY: PEfl_Event_Description;
{$endif}

// === Konventiert am: 28-5-25 16:53:52 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_ITEM_CLICKABLE_INTERFACE: PEfl_Class;
begin
  EFL_UI_ITEM_CLICKABLE_INTERFACE := efl_ui_item_clickable_interface_get;
end;

function EFL_UI_EVENT_ITEM_PRESSED: PEfl_Event_Description;
begin
  EFL_UI_EVENT_ITEM_PRESSED := @(_EFL_UI_EVENT_ITEM_PRESSED);
end;

function EFL_UI_EVENT_ITEM_UNPRESSED: PEfl_Event_Description;
begin
  EFL_UI_EVENT_ITEM_UNPRESSED := @(_EFL_UI_EVENT_ITEM_UNPRESSED);
end;

function EFL_UI_EVENT_ITEM_LONGPRESSED: PEfl_Event_Description;
begin
  EFL_UI_EVENT_ITEM_LONGPRESSED := @(_EFL_UI_EVENT_ITEM_LONGPRESSED);
end;

function EFL_UI_EVENT_ITEM_CLICKED: PEfl_Event_Description;
begin
  EFL_UI_EVENT_ITEM_CLICKED := @(_EFL_UI_EVENT_ITEM_CLICKED);
end;

function EFL_UI_EVENT_ITEM_CLICKED_ANY: PEfl_Event_Description;
begin
  EFL_UI_EVENT_ITEM_CLICKED_ANY := @(_EFL_UI_EVENT_ITEM_CLICKED_ANY);
end;
{$endif}


{$ENDIF read_implementation}
