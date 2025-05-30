unit efl_ui_collection_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary, efl_ui_item_eo, efl_ui_position_manager_entity_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Collection = ^TEfl_Ui_Collection;
  TEfl_Ui_Collection = TEo;

function EFL_UI_COLLECTION_CLASS: PEfl_Config;

function efl_ui_collection_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_collection_item_scroll(obj: PEo; item: PEfl_Ui_Item; animation: TEina_Bool); cdecl; external libelementary;
procedure efl_ui_collection_item_scroll_align(obj: PEo; item: PEfl_Ui_Item; align: double; animation: TEina_Bool); cdecl; external libelementary;

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_collection_position_manager_set(obj: PEo; position_manager: PEfl_Ui_Position_Manager_Entity); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_collection_position_manager_get(obj: PEo): PEfl_Ui_Position_Manager_Entity; cdecl; external libelementary;
{$endif}

// === Konventiert am: 30-5-25 17:16:37 ===


implementation


function EFL_UI_COLLECTION_CLASS: PEfl_Config;
begin
  EFL_UI_COLLECTION_CLASS := efl_ui_collection_class_get;
end;


end.
