program project1;

uses
  fp_manette,
  fp_glib2;

  procedure on_button_pressed(device: PManetteDevice; event: PManetteEvent; user_data: Tgpointer); cdecl;
  var
    v, i, c, t: Tguint16;
    et: TManetteEventType;
  begin
    v:=manette_event_get_hardware_value(event);
    c:=manette_event_get_hardware_code(event);
    i:=manette_event_get_hardware_index(event);
    t:=manette_event_get_hardware_type(event);
    et:= manette_event_get_event_type(event);

    g_printf('Button Down   Index: %d   Code: %d   Value: %3d   Type: %d    ET: %d'#10,i,c ,v,t,et);
  end;

  procedure on_button_release(device: PManetteDevice; event: PManetteEvent; user_data: Tgpointer); cdecl;
  var
    v, i, c, t: Tguint16;
    et: TManetteEventType;
  begin
    v:=manette_event_get_hardware_value(event);
    c:=manette_event_get_hardware_code(event);
    i:=manette_event_get_hardware_index(event);
    t:=manette_event_get_hardware_type(event);
   et:= manette_event_get_event_type(event);

    g_printf('Button Up     Index: %d   Code: %d   Value: %3d   Type: %d    ET: %d'#10,i,c ,v,t,et);
  end;

  procedure on_axis_changed(device: PManetteDevice; event: PManetteEvent; user_data: Tgpointer); cdecl;
  var
    v, i, c, t: Tguint16;
    et: TManetteEventType;
  begin
    v:=manette_event_get_hardware_value(event);
    c:=manette_event_get_hardware_code(event);
    i:=manette_event_get_hardware_index(event);
    t:=manette_event_get_hardware_type(event);
    et:= manette_event_get_event_type(event);

    g_printf('Axis          Index: %d   Code: %d   Value: %3d   Type: %d    ET: %d'#10,i,c ,v,t,et);
  end;

  procedure on_device_added(self: PManetteMonitor; device: PManetteDevice; user_data: Tgpointer); cdecl;
  begin
    g_printf('Gerät hinzugefügt: %s'#10, manette_device_get_name(device));

    g_signal_connect(device, 'button-press-event', G_CALLBACK(@on_button_pressed), nil);
    g_signal_connect(device, 'button-release-event', G_CALLBACK(@on_button_release), nil);
    g_signal_connect(device, 'absolute-axis-event', G_CALLBACK(@on_axis_changed), nil);
  end;

  procedure on_device_remove(self: PManetteMonitor; device: PManetteDevice; user_data: Tgpointer); cdecl;
  begin
    g_printf('Gerät entfernt: %s'#10, manette_device_get_name(device));
  end;

  procedure main;
  var
    monitor: PManetteMonitor;
    loop: PGMainLoop;
    it: PManetteMonitorIter;
    device: PManetteDevice;
  begin
    monitor := manette_monitor_new;
    loop := g_main_loop_new(nil, False);

    it := manette_monitor_iterate(monitor);
    while manette_monitor_iter_next(it, @device) do begin
      on_device_added(monitor, device, nil);
    end;
    manette_monitor_iter_free(it);

    g_signal_connect(monitor, 'device-connected', G_CALLBACK(@on_device_added), nil);
    g_signal_connect(monitor, 'device-disconnected', G_CALLBACK(@on_device_remove), nil);

    g_printf('libmanette läuft. Verbinde Controller. Strg+C zum Beenden.'#10);
    g_main_loop_run(loop);

    g_main_loop_unref(loop);
    g_object_unref(monitor);
  end;

begin
  main;
end.
