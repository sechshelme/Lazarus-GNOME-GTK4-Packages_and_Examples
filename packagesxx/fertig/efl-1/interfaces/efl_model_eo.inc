{$IFDEF read_interface}


type
  PEfl_Model = ^TEfl_Model;
  TEfl_Model = TEo;

type
  PEfl_Model_Property_Event = ^TEfl_Model_Property_Event;

  TEfl_Model_Property_Event = record
    changed_properties: PEina_Array;
    invalidated_properties: PEina_Array;
  end;
  PEfl_Model_Children_Event = ^TEfl_Model_Children_Event;

  TEfl_Model_Children_Event = record
    index: dword;
    child: PEfl_Object;
  end;

function EFL_MODEL_INTERFACE: PEfl_Class;

function efl_model_interface_get: PEfl_Class; cdecl; external libefl;
function efl_model_properties_get(obj: PEo): PEina_Iterator; cdecl; external libefl;
function efl_model_property_set(obj: PEo; _property: pchar; value: PEina_Value): PEina_Future; cdecl; external libefl;
function efl_model_property_get(obj: PEo; _property: pchar): PEina_Value; cdecl; external libefl;
function efl_model_property_ready_get(obj: PEo; _property: pchar): PEina_Future; cdecl; external libefl;
function efl_model_children_slice_get(obj: PEo; start: dword; count: dword): PEina_Future; cdecl; external libefl;
function efl_model_children_index_get(obj: PEo; indices: PEina_Iterator): PEina_Future; cdecl; external libefl;
function efl_model_children_count_get(obj: PEo): dword; cdecl; external libefl;
function efl_model_child_add(obj: PEo): PEfl_Object; cdecl; external libefl;
procedure efl_model_child_del(obj: PEo; child: PEfl_Object); cdecl; external libefl;

var
  _EFL_MODEL_EVENT_PROPERTIES_CHANGED: TEfl_Event_Description; cvar;external libefl;

function EFL_MODEL_EVENT_PROPERTIES_CHANGED: PEfl_Event_Description;

{$ifdef EFL_BETA_API_SUPPORT}
var
  _EFL_MODEL_EVENT_CHILD_ADDED: TEfl_Event_Description; cvar;external libefl;

function EFL_MODEL_EVENT_CHILD_ADDED: PEfl_Event_Description;

{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
var
  _EFL_MODEL_EVENT_CHILD_REMOVED: TEfl_Event_Description; cvar;external libefl;

function EFL_MODEL_EVENT_CHILD_REMOVED: PEfl_Event_Description;
{$endif}

var
  _EFL_MODEL_EVENT_CHILDREN_COUNT_CHANGED: TEfl_Event_Description; cvar;external libefl;

function EFL_MODEL_EVENT_CHILDREN_COUNT_CHANGED: PEfl_Event_Description;


// === Konventiert am: 18-5-25 17:49:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_MODEL_INTERFACE: PEfl_Class;
begin
  EFL_MODEL_INTERFACE := efl_model_interface_get;
end;

function EFL_MODEL_EVENT_PROPERTIES_CHANGED: PEfl_Event_Description;
begin
  EFL_MODEL_EVENT_PROPERTIES_CHANGED := @(_EFL_MODEL_EVENT_PROPERTIES_CHANGED);
end;

function EFL_MODEL_EVENT_CHILD_ADDED: PEfl_Event_Description;
begin
  EFL_MODEL_EVENT_CHILD_ADDED := @(_EFL_MODEL_EVENT_CHILD_ADDED);
end;

function EFL_MODEL_EVENT_CHILD_REMOVED: PEfl_Event_Description;
begin
  EFL_MODEL_EVENT_CHILD_REMOVED := @(_EFL_MODEL_EVENT_CHILD_REMOVED);
end;

function EFL_MODEL_EVENT_CHILDREN_COUNT_CHANGED: PEfl_Event_Description;
begin
  EFL_MODEL_EVENT_CHILDREN_COUNT_CHANGED := @(_EFL_MODEL_EVENT_CHILDREN_COUNT_CHANGED);
end;


{$ENDIF read_implementation}
