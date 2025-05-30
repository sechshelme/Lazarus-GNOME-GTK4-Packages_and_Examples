unit efl_ui_collection_view_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary, efl_ui_position_manager_entity_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Collection_View = ^TEfl_Ui_Collection_View;
  TEfl_Ui_Collection_View = TEo;

function EFL_UI_COLLECTION_VIEW_CLASS: PEfl_Class;

function efl_ui_collection_view_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_collection_view_factory_set(obj: PEo; factory: PEfl_Ui_Factory); cdecl; external libelementary;
function efl_ui_collection_view_factory_get(obj: PEo): PEfl_Ui_Factory; cdecl; external libelementary;

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_collection_view_position_manager_set(obj: PEo; position_manager: PEfl_Ui_Position_Manager_Entity); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_collection_view_position_manager_get(obj: PEo): PEfl_Ui_Position_Manager_Entity; cdecl; external libelementary;
{$endif}

var
  _EFL_UI_COLLECTION_VIEW_EVENT_ITEM_REALIZED: PEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_COLLECTION_VIEW_EVENT_ITEM_UNREALIZED: PEfl_Event_Description; cvar;external libelementary;

function EFL_UI_COLLECTION_VIEW_EVENT_ITEM_REALIZED: PEfl_Event_Description;
function EFL_UI_COLLECTION_VIEW_EVENT_ITEM_UNREALIZED: PEfl_Event_Description;

// === Konventiert am: 30-5-25 14:00:25 ===


implementation


function EFL_UI_COLLECTION_VIEW_CLASS: PEfl_Class;
begin
  EFL_UI_COLLECTION_VIEW_CLASS := efl_ui_collection_view_class_get;
end;

function EFL_UI_COLLECTION_VIEW_EVENT_ITEM_REALIZED: PEfl_Event_Description;
begin
  EFL_UI_COLLECTION_VIEW_EVENT_ITEM_REALIZED := @(_EFL_UI_COLLECTION_VIEW_EVENT_ITEM_REALIZED);
end;

function EFL_UI_COLLECTION_VIEW_EVENT_ITEM_UNREALIZED: PEfl_Event_Description;
begin
  EFL_UI_COLLECTION_VIEW_EVENT_ITEM_UNREALIZED := @(_EFL_UI_COLLECTION_VIEW_EVENT_ITEM_UNREALIZED);
end;


end.
