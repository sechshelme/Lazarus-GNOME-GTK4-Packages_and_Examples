unit efl_ui_item_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Item = ^TEfl_Ui_Item;
  TEfl_Ui_Item = TEo;

function EFL_UI_ITEM_CLASS: PEfl_Class;

function efl_ui_item_class_get: PEfl_Class; cdecl; external libelementary;
function efl_ui_item_index_get(obj: PEo): longint; cdecl; external libelementary;
procedure efl_ui_item_container_set(obj: PEo; container: PEfl_Ui_Widget); cdecl; external libelementary;
function efl_ui_item_container_get(obj: PEo): PEfl_Ui_Widget; cdecl; external libelementary;
procedure efl_ui_item_parent_set(obj: PEo; parent: PEfl_Ui_Item); cdecl; external libelementary;
function efl_ui_item_parent_get(obj: PEo): PEfl_Ui_Item; cdecl; external libelementary;
procedure efl_ui_item_calc_locked_set(obj: PEo; locked: TEina_Bool); cdecl; external libelementary;
function efl_ui_item_calc_locked_get(obj: PEo): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 28-5-25 16:53:55 ===


implementation


function EFL_UI_ITEM_CLASS: PEfl_Class;
begin
  EFL_UI_ITEM_CLASS := efl_ui_item_class_get;
end;


end.
