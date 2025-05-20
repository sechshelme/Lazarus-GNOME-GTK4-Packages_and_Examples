{$IFDEF read_interface}


type
  PEfl_Ui_Property_Bind = ^TEfl_Ui_Property_Bind;
  TEfl_Ui_Property_Bind = TEo;

type
  PEfl_Ui_Property_Event = ^TEfl_Ui_Property_Event;

  TEfl_Ui_Property_Event = record
    changed_properties: PEina_Array;
  end;

function EFL_UI_PROPERTY_BIND_INTERFACE: PEfl_Class;

function efl_ui_property_bind_interface_get: PEfl_Class; cdecl; external libefl;
function efl_ui_property_bind(obj: PEo; key: pchar; _property: pchar): TEina_Error; cdecl; external libefl;

var
  _EFL_UI_PROPERTY_BIND_EVENT_PROPERTIES_CHANGED: TEfl_Event_Description; cvar;external libefl;
  _EFL_UI_PROPERTY_BIND_EVENT_PROPERTY_BOUND: TEfl_Event_Description; cvar;external libefl;

function EFL_UI_PROPERTY_BIND_EVENT_PROPERTIES_CHANGED: PEfl_Event_Description;
function EFL_UI_PROPERTY_BIND_EVENT_PROPERTY_BOUND: PEfl_Event_Description;


// === Konventiert am: 20-5-25 13:30:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_PROPERTY_BIND_INTERFACE: PEfl_Class;
begin
  EFL_UI_PROPERTY_BIND_INTERFACE := efl_ui_property_bind_interface_get;
end;

function EFL_UI_PROPERTY_BIND_EVENT_PROPERTIES_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_PROPERTY_BIND_EVENT_PROPERTIES_CHANGED := @(_EFL_UI_PROPERTY_BIND_EVENT_PROPERTIES_CHANGED);
end;

function EFL_UI_PROPERTY_BIND_EVENT_PROPERTY_BOUND: PEfl_Event_Description;
begin
  EFL_UI_PROPERTY_BIND_EVENT_PROPERTY_BOUND := @(_EFL_UI_PROPERTY_BIND_EVENT_PROPERTY_BOUND);
end;


{$ENDIF read_implementation}
