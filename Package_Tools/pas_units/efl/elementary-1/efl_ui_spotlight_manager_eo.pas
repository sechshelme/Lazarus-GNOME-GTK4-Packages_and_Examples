unit efl_ui_spotlight_manager_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Ui_Spotlight_Container = ^TEfl_Ui_Spotlight_Container;
  TEfl_Ui_Spotlight_Container = TEo;

type
  PEfl_Ui_Spotlight_Scroll_Manager = ^TEfl_Ui_Spotlight_Scroll_Manager;
  TEfl_Ui_Spotlight_Scroll_Manager = TEo;

type
  PEfl_Ui_Spotlight_Manager = ^TEfl_Ui_Spotlight_Manager;
  TEfl_Ui_Spotlight_Manager = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Ui_Spotlight_Manager_Switch_Reason = ^TEfl_Ui_Spotlight_Manager_Switch_Reason;
  TEfl_Ui_Spotlight_Manager_Switch_Reason = longint;

const
  EFL_UI_SPOTLIGHT_MANAGER_SWITCH_REASON_JUMP = 0;
  EFL_UI_SPOTLIGHT_MANAGER_SWITCH_REASON_PUSH = 1;
  EFL_UI_SPOTLIGHT_MANAGER_SWITCH_REASON_POP = 2;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_SPOTLIGHT_MANAGER_CLASS: PEfl_Class;

function efl_ui_spotlight_manager_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_spotlight_manager_bind(obj: PEo; spotlight: PEfl_Ui_Spotlight_Container); cdecl; external libelementary;
procedure efl_ui_spotlight_manager_content_add(obj: PEo; subobj: PEfl_Gfx_Entity; index: longint); cdecl; external libelementary;
procedure efl_ui_spotlight_manager_content_del(obj: PEo; subobj: PEfl_Gfx_Entity; index: longint); cdecl; external libelementary;
procedure efl_ui_spotlight_manager_switch_to(obj: PEo; from: longint; to_: longint; reason: TEfl_Ui_Spotlight_Manager_Switch_Reason); cdecl; external libelementary;
procedure efl_ui_spotlight_manager_size_set(obj: PEo; size: TEina_Size2D); cdecl; external libelementary;
procedure efl_ui_spotlight_manager_animated_transition_set(obj: PEo; enable: TEina_Bool); cdecl; external libelementary;
function efl_ui_spotlight_manager_animated_transition_get(obj: PEo): TEina_Bool; cdecl; external libelementary;

var
  _EFL_UI_SPOTLIGHT_MANAGER_EVENT_POS_UPDATE: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_SPOTLIGHT_MANAGER_EVENT_POS_UPDATE: PEfl_Event_Description;
{$endif}

// === Konventiert am: 27-5-25 19:41:27 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_SPOTLIGHT_MANAGER_CLASS: PEfl_Class;
begin
  EFL_UI_SPOTLIGHT_MANAGER_CLASS := efl_ui_spotlight_manager_class_get;
end;

function EFL_UI_SPOTLIGHT_MANAGER_EVENT_POS_UPDATE: PEfl_Event_Description;
begin
  EFL_UI_SPOTLIGHT_MANAGER_EVENT_POS_UPDATE := @(_EFL_UI_SPOTLIGHT_MANAGER_EVENT_POS_UPDATE);
end;
{$endif}


end.
