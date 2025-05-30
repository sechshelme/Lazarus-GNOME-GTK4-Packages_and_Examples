{$IFDEF read_interface}


type
  PEfl_Ui_Multi_Selectable_Object_Range = ^TEfl_Ui_Multi_Selectable_Object_Range;
  TEfl_Ui_Multi_Selectable_Object_Range = TEo;

function EFL_UI_MULTI_SELECTABLE_OBJECT_RANGE_INTERFACE: PEfl_Class;

function efl_ui_multi_selectable_object_range_interface_get: PEfl_Class; cdecl; external libelementary;
function efl_ui_multi_selectable_selected_iterator_new(obj: PEo): PEina_Iterator; cdecl; external libelementary;

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_multi_selectable_range_select(obj: PEo; a: PEfl_Ui_Selectable; b: PEfl_Ui_Selectable); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_multi_selectable_range_unselect(obj: PEo; a: PEfl_Ui_Selectable; b: PEfl_Ui_Selectable); cdecl; external libelementary;
{$endif}

// === Konventiert am: 30-5-25 19:27:56 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_MULTI_SELECTABLE_OBJECT_RANGE_INTERFACE: PEfl_Class;
begin
  EFL_UI_MULTI_SELECTABLE_OBJECT_RANGE_INTERFACE := efl_ui_multi_selectable_object_range_interface_get;
end;


{$ENDIF read_implementation}
