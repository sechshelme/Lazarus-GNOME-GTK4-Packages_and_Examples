{$IFDEF read_interface}


type
  PEfl_Ui_Multi_Selectable_Index_Range = ^TEfl_Ui_Multi_Selectable_Index_Range;
  TEfl_Ui_Multi_Selectable_Index_Range = TEo;

function EFL_UI_MULTI_SELECTABLE_INDEX_RANGE_INTERFACE: PEfl_Config;

function efl_ui_multi_selectable_index_range_interface_get: PEfl_Class; cdecl; external libelementary;
function efl_ui_multi_selectable_selected_ndx_iterator_new(obj: PEo): PEina_Iterator; cdecl; external libelementary;
function efl_ui_multi_selectable_unselected_ndx_iterator_new(obj: PEo): PEina_Iterator; cdecl; external libelementary;

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_multi_selectable_ndx_range_select(obj: PEo; a: dword; b: dword); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_multi_selectable_ndx_range_unselect(obj: PEo; a: dword; b: dword); cdecl; external libelementary;
{$endif}

// === Konventiert am: 30-5-25 15:25:40 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_MULTI_SELECTABLE_INDEX_RANGE_INTERFACE: PEfl_Config;
begin
  EFL_UI_MULTI_SELECTABLE_INDEX_RANGE_INTERFACE := efl_ui_multi_selectable_index_range_interface_get;
end;


{$ENDIF read_implementation}
