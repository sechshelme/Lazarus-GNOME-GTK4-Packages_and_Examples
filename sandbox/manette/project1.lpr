program project1;

uses
  fp_glib2,
  fp_manette;

  procedure on_button_pressed(device: PManetteDevice; button: Tguint; user_data: Tgpointer); cdecl;
  begin
    g_printf('Taste %u gedrückt'#10, button);
  end;

  procedure on_button_release(device: PManetteDevice; button: Tguint; user_data: Tgpointer); cdecl;
  begin
    g_printf('Taste %u gehoben'#10, button);
  end;

  procedure on_axis_changed(device: PManetteDevice; axis: Tguint; value: Tgfloat; user_data: Tgpointer); cdecl;
  begin
    g_printf('Achse %u: %.2f'#10, axis, value);
  end;

  procedure on_device_added(self: PManetteMonitor; device: PManetteDevice; user_data: Tgpointer); cdecl;
  begin
    g_printf('Gerät hinzugefügt: '#10, manette_device_get_name(device));

    g_signal_connect(device, 'button-press-event', G_CALLBACK(@on_button_pressed), nil);
    g_signal_connect(device, 'button-release-event', G_CALLBACK(@on_button_release), nil);
    g_signal_connect(device, 'absolute-axis-event', G_CALLBACK(@on_axis_changed), nil);
  end;

  procedure on_device_remove(self: PManetteMonitor; device: PManetteDevice; user_data: Tgpointer); cdecl;
  begin
    g_printf('Gerät entfernt: '#10, manette_device_get_name(device));
  end;

  procedure main;
  var
    monitor: PManetteMonitor;
    loop: PGMainLoop;
  begin
    monitor := manette_monitor_new;
    loop := g_main_loop_new(nil, False);

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
