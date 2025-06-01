unit efl_ui_multi_selectable_index_range_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


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


implementation


function EFL_UI_MULTI_SELECTABLE_INDEX_RANGE_INTERFACE: PEfl_Config;
begin
  EFL_UI_MULTI_SELECTABLE_INDEX_RANGE_INTERFACE := efl_ui_multi_selectable_index_range_interface_get;
end;


end.
