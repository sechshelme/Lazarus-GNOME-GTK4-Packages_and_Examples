unit efl_canvas_event_grabber_eo;

interface

uses
  ctypes, fp_eina, efl,fp_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Canvas_Event_Grabber = ^TEfl_Canvas_Event_Grabber;
  TEfl_Canvas_Event_Grabber = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_EVENT_GRABBER_CLASS: PEfl_Class;

function efl_canvas_event_grabber_class_get: PEfl_Class; cdecl; external libevas;
procedure efl_canvas_event_grabber_freeze_when_visible_set(obj: PEo; set_: TEina_Bool); cdecl; external libevas;
function efl_canvas_event_grabber_freeze_when_visible_get(obj: PEo): TEina_Bool; cdecl; external libevas;
{$endif}

// === Konventiert am: 14-5-25 15:08:34 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_EVENT_GRABBER_CLASS: PEfl_Class;
begin
  EFL_CANVAS_EVENT_GRABBER_CLASS := efl_canvas_event_grabber_class_get;
end;
{$endif}


end.
