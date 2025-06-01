unit efl_ui_dnd_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Dnd = ^TEfl_Ui_Dnd;
  TEfl_Ui_Dnd = TEo;


  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Ui_Drop_Event = record
    position: TEina_Position2D;
    seat: dword;
    available_types: PEina_Accessor;
  end;
  PEfl_Ui_Drop_Event = ^TEfl_Ui_Drop_Event;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Ui_Drop_Dropped_Event = record
    dnd: TEfl_Ui_Drop_Event;
    action: pchar;
  end;
  PEfl_Ui_Drop_Dropped_Event = ^TEfl_Ui_Drop_Dropped_Event;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Ui_Drag_Started_Event = record
    seat: dword;
  end;
  PEfl_Ui_Drag_Started_Event = ^TEfl_Ui_Drag_Started_Event;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Ui_Drag_Finished_Event = record
    seat: dword;
    accepted: TEina_Bool;
  end;
  PEfl_Ui_Drag_Finished_Event = ^TEfl_Ui_Drag_Finished_Event;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_DND_MIXIN: PEfl_Config;

function efl_ui_dnd_mixin_get: PEfl_Class; cdecl; external libelementary;
function efl_ui_dnd_drag_start(obj: PEo; content: PEina_Content; action: pchar; seat: dword): PEfl_Content; cdecl; external libelementary;
procedure efl_ui_dnd_drag_offset_set(obj: PEo; seat: dword; offset: TEina_Size2D); cdecl; external libelementary;
procedure efl_ui_dnd_drag_cancel(obj: PEo; seat: dword); cdecl; external libelementary;
function efl_ui_dnd_drop_data_get(obj: PEo; seat: dword; acceptable_types: PEina_Iterator): PEina_Future; cdecl; external libelementary;

var
  _EFL_UI_DND_EVENT_DROP_ENTERED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_DND_EVENT_DROP_LEFT: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_DND_EVENT_DROP_POSITION_CHANGED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_DND_EVENT_DROP_DROPPED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_DND_EVENT_DRAG_STARTED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_DND_EVENT_DRAG_FINISHED: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_DND_EVENT_DROP_ENTERED: PEfl_Event_Description;
function EFL_UI_DND_EVENT_DROP_LEFT: PEfl_Event_Description;
function EFL_UI_DND_EVENT_DROP_POSITION_CHANGED: PEfl_Event_Description;
function EFL_UI_DND_EVENT_DROP_DROPPED: PEfl_Event_Description;
function EFL_UI_DND_EVENT_DRAG_STARTED: PEfl_Event_Description;
function EFL_UI_DND_EVENT_DRAG_FINISHED: PEfl_Event_Description;
{$endif}

// === Konventiert am: 28-5-25 17:59:02 ===


implementation


function EFL_UI_DND_MIXIN: PEfl_Config;
begin
  EFL_UI_DND_MIXIN := efl_ui_dnd_mixin_get;
end;

function EFL_UI_DND_EVENT_DROP_ENTERED: PEfl_Event_Description;
begin
  EFL_UI_DND_EVENT_DROP_ENTERED := @(_EFL_UI_DND_EVENT_DROP_ENTERED);
end;

function EFL_UI_DND_EVENT_DROP_LEFT: PEfl_Event_Description;
begin
  EFL_UI_DND_EVENT_DROP_LEFT := @(_EFL_UI_DND_EVENT_DROP_LEFT);
end;

function EFL_UI_DND_EVENT_DROP_POSITION_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_DND_EVENT_DROP_POSITION_CHANGED := @(_EFL_UI_DND_EVENT_DROP_POSITION_CHANGED);
end;

function EFL_UI_DND_EVENT_DROP_DROPPED: PEfl_Event_Description;
begin
  EFL_UI_DND_EVENT_DROP_DROPPED := @(_EFL_UI_DND_EVENT_DROP_DROPPED);
end;

function EFL_UI_DND_EVENT_DRAG_STARTED: PEfl_Event_Description;
begin
  EFL_UI_DND_EVENT_DRAG_STARTED := @(_EFL_UI_DND_EVENT_DRAG_STARTED);
end;

function EFL_UI_DND_EVENT_DRAG_FINISHED: PEfl_Event_Description;
begin
  EFL_UI_DND_EVENT_DRAG_FINISHED := @(_EFL_UI_DND_EVENT_DRAG_FINISHED);
end;


end.
