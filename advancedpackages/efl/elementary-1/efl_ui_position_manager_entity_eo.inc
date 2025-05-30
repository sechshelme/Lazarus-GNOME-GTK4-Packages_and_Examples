{$IFDEF read_interface}


type
  PEfl_Ui_Position_Manager_Entity = ^TEfl_Ui_Position_Manager_Entity;
  TEfl_Ui_Position_Manager_Entity = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Ui_Position_Manager_Range_Update = record
    start_id: dword;
    end_id: dword;
  end;
  PEfl_Ui_Position_Manager_Range_Update = ^TEfl_Ui_Position_Manager_Range_Update;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_POSITION_MANAGER_ENTITY_INTERFACE: PEfl_Config;

function efl_ui_position_manager_entity_interface_get: PEfl_Class; cdecl; external libelementary;
function efl_ui_position_manager_entity_version(obj: PEo; max: longint): longint; cdecl; external libelementary;
procedure efl_ui_position_manager_entity_viewport_set(obj: PEo; viewport: TEina_Rect); cdecl; external libelementary;
procedure efl_ui_position_manager_entity_scroll_position_set(obj: PEo; x: double; y: double); cdecl; external libelementary;
function efl_ui_position_manager_entity_position_single_item(obj: PEo; idx: longint): TEina_Rect; cdecl; external libelementary;
procedure efl_ui_position_manager_entity_item_added(obj: PEo; added_index: longint; subobj: PEfl_Gfx_Entity); cdecl; external libelementary;
procedure efl_ui_position_manager_entity_item_removed(obj: PEo; removed_index: longint; subobj: PEfl_Gfx_Entity); cdecl; external libelementary;
procedure efl_ui_position_manager_entity_item_size_changed(obj: PEo; start_id: longint; end_id: longint); cdecl; external libelementary;
procedure efl_ui_position_manager_entity_entities_ready(obj: PEo; start_id: dword; end_id: dword); cdecl; external libelementary;
function efl_ui_position_manager_entity_relative_item(obj: PEo; current_id: dword; direction: TEfl_Ui_Focus_Direction; index: Pdword): TEina_Bool; cdecl; external libelementary;

var
  _EFL_UI_POSITION_MANAGER_ENTITY_EVENT_CONTENT_SIZE_CHANGED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_POSITION_MANAGER_ENTITY_EVENT_CONTENT_MIN_SIZE_CHANGED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_POSITION_MANAGER_ENTITY_EVENT_VISIBLE_RANGE_CHANGED: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_POSITION_MANAGER_ENTITY_EVENT_CONTENT_SIZE_CHANGED: PEfl_Event_Description;
function EFL_UI_POSITION_MANAGER_ENTITY_EVENT_CONTENT_MIN_SIZE_CHANGED: PEfl_Event_Description;
function EFL_UI_POSITION_MANAGER_ENTITY_EVENT_VISIBLE_RANGE_CHANGED: PEfl_Event_Description;
{$endif}

// === Konventiert am: 28-5-25 17:40:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_POSITION_MANAGER_ENTITY_INTERFACE: PEfl_Config;
begin
  EFL_UI_POSITION_MANAGER_ENTITY_INTERFACE := efl_ui_position_manager_entity_interface_get;
end;

function EFL_UI_POSITION_MANAGER_ENTITY_EVENT_CONTENT_SIZE_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_POSITION_MANAGER_ENTITY_EVENT_CONTENT_SIZE_CHANGED := @(_EFL_UI_POSITION_MANAGER_ENTITY_EVENT_CONTENT_SIZE_CHANGED);
end;

function EFL_UI_POSITION_MANAGER_ENTITY_EVENT_CONTENT_MIN_SIZE_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_POSITION_MANAGER_ENTITY_EVENT_CONTENT_MIN_SIZE_CHANGED := @(_EFL_UI_POSITION_MANAGER_ENTITY_EVENT_CONTENT_MIN_SIZE_CHANGED);
end;

function EFL_UI_POSITION_MANAGER_ENTITY_EVENT_VISIBLE_RANGE_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_POSITION_MANAGER_ENTITY_EVENT_VISIBLE_RANGE_CHANGED := @(_EFL_UI_POSITION_MANAGER_ENTITY_EVENT_VISIBLE_RANGE_CHANGED);
end;
{$endif}


{$ENDIF read_implementation}
