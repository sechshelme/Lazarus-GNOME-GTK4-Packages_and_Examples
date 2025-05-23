{$IFDEF read_interface}


type
  PEfl_Ui_Factory = ^TEfl_Ui_Factory;
  TEfl_Ui_Factory = TEo;

type
  PEfl_Ui_Factory_Item_Created_Event = ^TEfl_Ui_Factory_Item_Created_Event;

  TEfl_Ui_Factory_Item_Created_Event = record
    model: PEfl_Model;
    item: PEfl_Gfx_Entity;
  end;

function EFL_UI_FACTORY_INTERFACE: PEfl_Class;

function efl_ui_factory_interface_get: PEfl_Class; cdecl; external libefl;
function efl_ui_factory_create(obj: PEo; models: PEina_Iterator): PEina_Future; cdecl; external libefl;
procedure efl_ui_factory_release(obj: PEo; ui_views: PEina_Iterator); cdecl; external libefl;

var
  _EFL_UI_FACTORY_EVENT_ITEM_CONSTRUCTING: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_FACTORY_EVENT_ITEM_BUILDING: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_FACTORY_EVENT_ITEM_CREATED: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_FACTORY_EVENT_ITEM_RELEASING: TEfl_Event_Description; cvar;external libefl;

function EFL_UI_FACTORY_EVENT_ITEM_CONSTRUCTING: PEfl_Event_Description;
function EFL_UI_FACTORY_EVENT_ITEM_BUILDING: PEfl_Event_Description;
function EFL_UI_FACTORY_EVENT_ITEM_CREATED: PEfl_Event_Description;
function EFL_UI_FACTORY_EVENT_ITEM_RELEASING: PEfl_Event_Description;


// === Konventiert am: 20-5-25 13:05:47 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_FACTORY_INTERFACE: PEfl_Class;
begin
  EFL_UI_FACTORY_INTERFACE := efl_ui_factory_interface_get;
end;

function EFL_UI_FACTORY_EVENT_ITEM_CONSTRUCTING: PEfl_Event_Description;
begin
  EFL_UI_FACTORY_EVENT_ITEM_CONSTRUCTING := @(_EFL_UI_FACTORY_EVENT_ITEM_CONSTRUCTING);
end;

function EFL_UI_FACTORY_EVENT_ITEM_BUILDING: PEfl_Event_Description;
begin
  EFL_UI_FACTORY_EVENT_ITEM_BUILDING := @(_EFL_UI_FACTORY_EVENT_ITEM_BUILDING);
end;

function EFL_UI_FACTORY_EVENT_ITEM_CREATED: PEfl_Event_Description;
begin
  EFL_UI_FACTORY_EVENT_ITEM_CREATED := @(_EFL_UI_FACTORY_EVENT_ITEM_CREATED);
end;

function EFL_UI_FACTORY_EVENT_ITEM_RELEASING: PEfl_Event_Description;
begin
  EFL_UI_FACTORY_EVENT_ITEM_RELEASING := @(_EFL_UI_FACTORY_EVENT_ITEM_RELEASING);
end;


{$ENDIF read_implementation}
