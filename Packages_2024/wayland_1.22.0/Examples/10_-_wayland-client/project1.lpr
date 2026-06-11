program project1;

uses
  fp_wayland;

  procedure registry_handle_global(data: pointer; wl_registry: Pwl_registry; name: Tuint32_t; iface: pchar; version: Tuint32_t); cdecl;
  begin
    WriteLn('Globales Objekt gefunden: ', iface, ' (Version ', version, ')');
  end;

  procedure registry_handle_global_remove(data: pointer; wl_registry: Pwl_registry; name: Tuint32_t); cdecl;
  begin
    WriteLn('Globales); Object entfernt');
  end;

  procedure main;
  var
    display: Pwl_display;
    registry: Pwl_registry;
    registry_listener: Twl_registry_listener;
  begin
    registry_listener.global := @registry_handle_global;
    registry_listener.global_remove := @registry_handle_global_remove;

    display := wl_display_connect(nil);
    if display = nil then begin
      WriteLn('Konnte keine Verbindung zum Wayland-Display herstellen.');
      Exit;
    end;
    WriteLn('Erfolgreich mit Wayland verbunden!');

    registry := wl_display_get_registry(display);
    wl_registry_add_listener(registry, @registry_listener, nil);

    wl_display_dispatch(display);
    wl_display_roundtrip(display);

    wl_registry_destroy(registry);
    wl_display_disconnect(display);
  end;

begin
  main;
end.
