program project1;

uses
  fp_wayland,
  fp_xdg_shell_client,
  fp_xdg_shell,

  BaseUnix,
  Linux;

  function memfd_create(name: pchar; flags: cardinal): integer; cdecl; external 'c';


var
  display: Pwl_display;
  compositor: Pwl_compositor = nil;
  shm: Pwl_shm = nil;
  xdg_wm_base: Pxdg_wm_base = nil;
  surface: Pwl_surface;
  xdg_surface: Pxdg_surface;
  xdg_toplevel: Pxdg_toplevel;

  window_width: integer = 400;
  window_height: integer = 300;

  seat: Pwl_seat = nil;
  m_pointer: Pwl_pointer = nil;


  procedure pointer_enter(data: pointer; wl_pointer: Pwl_pointer; serial: Tuint32_t; surface: Pwl_surface; surface_x: Twl_fixed_t; surface_y: Twl_fixed_t); cdecl;
  begin
    WriteLn('--> Maus im Fenster bei: ', (surface_x / 256): 0: 2, ' x ', (surface_y / 256): 0: 2);
  end;

  procedure pointer_leave(data: Pointer; pwl_pointer: Pwl_pointer; serial: Tuint32_t; psurface: Pwl_surface); cdecl;
  begin
    WriteLn('<-- Maus hat das Fenster verlassen');
  end;

  procedure pointer_button(data: Pointer; pwl_pointer: Pwl_pointer; serial, time, button, state: Tuint32_t); cdecl;
  begin
    if state = 1 then begin
      WriteLn('KLICK! Taste: ', button);
    end;
  end;

  procedure pointer_motion(data: Pointer; pwl_pointer: Pwl_pointer; time: Tuint32_t; sx, sy: Twl_fixed_t); cdecl;
  begin
  end;

  procedure pointer_frame(data: Pointer; pwl_pointer: Pwl_pointer); cdecl;
  begin
  end;

  procedure pointer_axis(data: pointer; wl_pointer: Pwl_pointer; time: Tuint32_t; axis: Tuint32_t; value: Twl_fixed_t); cdecl;
  begin
    WriteLn('Mausrad bewegt: Achse ', axis, ' Wert ', (value / 256): 0: 2);
  end;

  procedure pointer_axis_source(data: Pointer; pwl_pointer: Pwl_pointer; axis_source: Tuint32_t); cdecl;
  begin
  end;

  procedure pointer_axis_stop(data: Pointer; pwl_pointer: Pwl_pointer; time, axis: Tuint32_t); cdecl;
  begin
  end;

  procedure pointer_axis_discrete(data: Pointer; pwl_pointer: Pwl_pointer; axis: Tuint32_t; discrete: Tint32_t); cdecl;
  begin
  end;


const
  pointer_listener: Twl_pointer_listener = (
    enter: @pointer_enter;
    leave: @pointer_leave;
    motion: @pointer_motion;
    button: @pointer_button;
    axis: @pointer_axis;
    frame: @pointer_frame;
    axis_source: @pointer_axis_source;
    axis_stop: @pointer_axis_stop;
    axis_discrete: @pointer_axis_discrete
    );

  procedure seat_capabilities(data: Pointer; p_seat: Pwl_seat; caps: Tuint32_t); cdecl;
  begin
    if (caps and 1) <> 0 then begin
      m_pointer := wl_seat_get_pointer(p_seat);
      wl_pointer_add_listener(m_pointer, @pointer_listener, nil);
      WriteLn('Maus-Support aktiviert.');
    end;
  end;

const
  seat_listener: Twl_seat_listener = (capabilities: @seat_capabilities; name: nil);

  procedure draw_window;
  var
    stride, size, fd: integer;
    pixels: puint32;
    pool: Pwl_shm_pool;
    buffer: Pwl_buffer;
    x, y: integer;
  begin
    stride := window_width * 4;
    size := stride * window_height;

    fd := memfd_create('wayland-shm', 0);
    fpftruncate(fd, size);

    pixels := fpmmap(nil, size, PROT_READ or PROT_WRITE, MAP_SHARED, fd, 0);

    for y := 0 to window_height - 1 do begin
      for x := 0 to window_width - 1 do begin
        pixels[y * window_width + x] := $FF0000FF;
      end;
    end;

    pool := wl_shm_create_pool(shm, fd, size);
    buffer := wl_shm_pool_create_buffer(pool, 0, window_width, window_height, stride, WL_SHM_FORMAT_XRGB8888);

    wl_shm_pool_destroy(pool);
    fpclose(fd);

    wl_surface_attach(surface, buffer, 0, 0);
    wl_surface_commit(surface);
  end;

  procedure xdg_surface_configure(data: Pointer; xdg_surf: Pxdg_surface; serial: Tuint32_t); cdecl;
  begin
    xdg_surface_ack_configure(xdg_surf, serial);
    draw_window();
  end;

const
  xdg_surface_listener: Txdg_surface_listener = (configure: @xdg_surface_configure);

  procedure xdg_wm_base_ping(data: Pointer; xdg_wm: Pxdg_wm_base; serial: Tuint32_t); cdecl;
  begin
    xdg_wm_base_pong(xdg_wm, serial);
  end;

const
  xdg_wm_base_listener: Txdg_wm_base_listener = (ping: @xdg_wm_base_ping);

  procedure registry_handler(data: Pointer; registry: Pwl_registry; id: Tuint32_t; iface: pchar; version: Tuint32_t); cdecl;
  begin
    WriteLn('Globales Objekt gefunden: ', iface, ' (Version ', version, ')');

    case string(iface) of
      'wl_compositor': begin
        compositor := wl_registry_bind(registry, id, @wl_compositor_interface, 1);
      end;
      'wl_shm': begin
        shm := wl_registry_bind(registry, id, @wl_shm_interface, 1);
      end;
      'xdg_wm_base': begin
        xdg_wm_base := wl_registry_bind(registry, id, @xdg_wm_base_interface, 1);
      end;
      'wl_seat': begin
        seat := wl_registry_bind(registry, id, @wl_seat_interface, 1);
        wl_seat_add_listener(seat, @seat_listener, nil);
      end;
      else begin
        WriteLn('müll -> ', iface);
      end;
    end;
  end;

const
  registry_listener: Twl_registry_listener = (global: @registry_handler; global_remove: nil);


  procedure main;
  var
    registry: Pwl_registry;
  begin
    display := wl_display_connect(nil);
    if display = nil then begin
      WriteLn('Kein Wayland');
      Halt(1);
    end;

    registry := wl_display_get_registry(display);
    wl_registry_add_listener(registry, @registry_listener, nil);
    wl_display_roundtrip(display);

    if (compositor = nil) or (shm = nil) or (xdg_wm_base = nil) then begin
      Writeln('Fehler: Wayland-Schnittstellen fehlen!');
      Halt(1);
    end;

    xdg_wm_base_add_listener(xdg_wm_base, @xdg_wm_base_listener, nil);

    surface := wl_compositor_create_surface(compositor);
    xdg_surface := xdg_wm_base_get_xdg_surface(xdg_wm_base, surface);
    xdg_surface_add_listener(xdg_surface, @xdg_surface_listener, nil);

    xdg_toplevel := xdg_surface_get_toplevel(xdg_surface);
    xdg_toplevel_set_title(xdg_toplevel, 'Lazarus Wayland Fenster');

    wl_surface_commit(surface);

    Writeln('Fenster gestartet...');
    while wl_display_dispatch(display) <> -1 do begin
      WriteLn('99999');
    end;

    wl_display_disconnect(display);
  end;

begin
  main;
end.
