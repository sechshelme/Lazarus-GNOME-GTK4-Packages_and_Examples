unit efl_access_window;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary, efl_access_window_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_access_window_activated_signal_emit(obj: PEfl_Access_Object);
procedure efl_access_window_deactivated_signal_emit(obj: PEfl_Access_Object);
procedure efl_access_window_created_signal_emit(obj: PEfl_Access_Object);
procedure efl_access_window_destroyed_signal_emit(obj: PEfl_Access_Object);
procedure efl_access_window_maximized_signal_emit(obj: PEfl_Access_Object);
procedure efl_access_window_minimized_signal_emit(obj: PEfl_Access_Object);
procedure efl_access_window_restored_signal_emit(obj: PEfl_Access_Object);
{$endif}

// === Konventiert am: 31-5-25 13:24:35 ===


implementation

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_access_window_activated_signal_emit(obj: PEfl_Access_Object);
begin
  efl_access_object_event_emit(obj, EFL_ACCESS_WINDOW_EVENT_WINDOW_ACTIVATED, nil);
end;

procedure efl_access_window_deactivated_signal_emit(obj: PEfl_Access_Object);
begin
  efl_access_object_event_emit(obj, EFL_ACCESS_WINDOW_EVENT_WINDOW_DEACTIVATED, nil);
end;

procedure efl_access_window_created_signal_emit(obj: PEfl_Access_Object);
begin
  efl_access_object_event_emit(obj, EFL_ACCESS_WINDOW_EVENT_WINDOW_CREATED, nil);
end;

procedure efl_access_window_destroyed_signal_emit(obj: PEfl_Access_Object);
begin
  efl_access_object_event_emit(obj, EFL_ACCESS_WINDOW_EVENT_WINDOW_DESTROYED, nil);
end;

procedure efl_access_window_maximized_signal_emit(obj: PEfl_Access_Object);
begin
  efl_access_object_event_emit(obj, EFL_ACCESS_WINDOW_EVENT_WINDOW_MAXIMIZED, nil);
end;

procedure efl_access_window_minimized_signal_emit(obj: PEfl_Access_Object);
begin
  efl_access_object_event_emit(obj, EFL_ACCESS_WINDOW_EVENT_WINDOW_MINIMIZED, nil);
end;

procedure efl_access_window_restored_signal_emit(obj: PEfl_Access_Object);
begin
  efl_access_object_event_emit(obj, EFL_ACCESS_WINDOW_EVENT_WINDOW_RESTORED, nil);
end;
{$endif}


end.
