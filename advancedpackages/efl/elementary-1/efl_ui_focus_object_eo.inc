{$IFDEF read_interface}


type
  PEfl_Ui_Focus_Object = ^TEfl_Ui_Focus_Object;
  TEfl_Ui_Focus_Object = TEo;

type
  PEfl_Ui_Focus_Manager = ^TEfl_Ui_Focus_Manager;
   TEfl_Ui_Focus_Manager = TEo;

function EFL_UI_FOCUS_OBJECT_MIXIN: PEfl_Class;

function efl_ui_focus_object_mixin_get: PEfl_Class; cdecl; external libelementary;
function efl_ui_focus_object_focus_geometry_get(obj: PEo): TEina_Rect; cdecl; external libelementary;
procedure efl_ui_focus_object_focus_set(obj: PEo; focus: TEina_Bool); cdecl; external libelementary;
function efl_ui_focus_object_focus_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
function efl_ui_focus_object_focus_manager_get(obj: PEo): PEfl_Ui_Focus_Manager; cdecl; external libelementary;
function efl_ui_focus_object_focus_parent_get(obj: PEo): PEfl_Ui_Focus_Object; cdecl; external libelementary;
procedure efl_ui_focus_object_child_focus_set(obj: PEo; child_focus: TEina_Bool); cdecl; external libelementary;
function efl_ui_focus_object_child_focus_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_focus_object_setup_order(obj: PEo); cdecl; external libelementary;
procedure efl_ui_focus_object_setup_order_non_recursive(obj: PEo); cdecl; external libelementary;
function efl_ui_focus_object_on_focus_update(obj: PEo): TEina_Bool; cdecl; external libelementary;

var
  _EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_CHANGED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_MANAGER_CHANGED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_PARENT_CHANGED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_FOCUS_OBJECT_EVENT_CHILD_FOCUS_CHANGED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_GEOMETRY_CHANGED: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_CHANGED: PEfl_Event_Description;
function EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_MANAGER_CHANGED: PEfl_Event_Description;
function EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_PARENT_CHANGED: PEfl_Event_Description;
function EFL_UI_FOCUS_OBJECT_EVENT_CHILD_FOCUS_CHANGED: PEfl_Event_Description;
function EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_GEOMETRY_CHANGED: PEfl_Event_Description;

// === Konventiert am: 25-5-25 19:03:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_FOCUS_OBJECT_MIXIN: PEfl_Class;
begin
  EFL_UI_FOCUS_OBJECT_MIXIN := efl_ui_focus_object_mixin_get;
end;

function EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_CHANGED := @(_EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_CHANGED);
end;

function EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_MANAGER_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_MANAGER_CHANGED := @(_EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_MANAGER_CHANGED);
end;

function EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_PARENT_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_PARENT_CHANGED := @(_EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_PARENT_CHANGED);
end;

function EFL_UI_FOCUS_OBJECT_EVENT_CHILD_FOCUS_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_FOCUS_OBJECT_EVENT_CHILD_FOCUS_CHANGED := @(_EFL_UI_FOCUS_OBJECT_EVENT_CHILD_FOCUS_CHANGED);
end;

function EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_GEOMETRY_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_GEOMETRY_CHANGED := @(_EFL_UI_FOCUS_OBJECT_EVENT_FOCUS_GEOMETRY_CHANGED);
end;


{$ENDIF read_implementation}
