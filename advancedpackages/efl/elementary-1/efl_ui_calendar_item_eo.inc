{$IFDEF read_interface}


type
  PEfl_Ui_Calendar_Item = ^TEfl_Ui_Calendar_Item;
  TEfl_Ui_Calendar_Item = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_CALENDAR_ITEM_CLASS: PEfl_Class;

function efl_ui_calendar_item_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_calendar_item_day_number_set(obj: PEo; i: longint); cdecl; external libelementary;
function efl_ui_calendar_item_day_number_get(obj: PEo): longint; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 15:16:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_CALENDAR_ITEM_CLASS: PEfl_Class;
begin
  EFL_UI_CALENDAR_ITEM_CLASS := efl_ui_calendar_item_class_get;
end;
{$endif}


{$ENDIF read_implementation}
