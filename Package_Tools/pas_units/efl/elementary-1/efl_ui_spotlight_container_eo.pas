unit efl_ui_spotlight_container_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, efl_ui_widget_eo, efl_ui_spotlight_manager_eo, efl_ui_spotlight_indicator_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Ui_Spotlight_Transition_Event = record
    from: longint;
    to_: longint;
  end;
  PEfl_Ui_Spotlight_Transition_Event = ^TEfl_Ui_Spotlight_Transition_Event;
{$endif}
function EFL_UI_SPOTLIGHT_CONTAINER_CLASS: PEfl_Class;

function efl_ui_spotlight_container_class_get: PEfl_Class; cdecl; external libelementary;

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_spotlight_manager_set(obj: PEo; spotlight_manager: PEfl_Ui_Spotlight_Manager); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_spotlight_manager_get(obj: PEo): PEfl_Ui_Spotlight_Manager; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_spotlight_indicator_set(obj: PEo; indicator: PEfl_Ui_Spotlight_Indicator); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_spotlight_indicator_get(obj: PEo): PEfl_Ui_Spotlight_Indicator; cdecl; external libelementary;
{$endif}

procedure efl_ui_spotlight_active_element_set(obj: PEo; element: PEfl_Ui_Widget); cdecl; external libelementary;
function efl_ui_spotlight_active_element_get(obj: PEo): PEfl_Ui_Widget; cdecl; external libelementary;
procedure efl_ui_spotlight_size_set(obj: PEo; size: TEina_Size2D); cdecl; external libelementary;
function efl_ui_spotlight_size_get(obj: PEo): TEina_Size2D; cdecl; external libelementary;
procedure efl_ui_spotlight_animated_transition_set(obj: PEo; enable: TEina_Bool); cdecl; external libelementary;
function efl_ui_spotlight_animated_transition_get(obj: PEo): TEina_Bool; cdecl; external libelementary;

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_spotlight_push(obj: PEo; widget: PEfl_Gfx_Entity); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_spotlight_pop(obj: PEo; deletion_on_transition_end: TEina_Bool): PEina_Future; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
var
  _EFL_UI_SPOTLIGHT_EVENT_TRANSITION_START: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_SPOTLIGHT_EVENT_TRANSITION_END: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_SPOTLIGHT_EVENT_TRANSITION_START: PEfl_Event_Description;
function EFL_UI_SPOTLIGHT_EVENT_TRANSITION_END: PEfl_Event_Description;
{$endif}

// === Konventiert am: 27-5-25 19:21:07 ===


implementation


function EFL_UI_SPOTLIGHT_CONTAINER_CLASS: PEfl_Class;
begin
  EFL_UI_SPOTLIGHT_CONTAINER_CLASS := efl_ui_spotlight_container_class_get;
end;

function EFL_UI_SPOTLIGHT_EVENT_TRANSITION_START: PEfl_Event_Description;
begin
  EFL_UI_SPOTLIGHT_EVENT_TRANSITION_START := @(_EFL_UI_SPOTLIGHT_EVENT_TRANSITION_START);
end;

function EFL_UI_SPOTLIGHT_EVENT_TRANSITION_END: PEfl_Event_Description;
begin
  EFL_UI_SPOTLIGHT_EVENT_TRANSITION_END := @(_EFL_UI_SPOTLIGHT_EVENT_TRANSITION_END);
end;


end.
