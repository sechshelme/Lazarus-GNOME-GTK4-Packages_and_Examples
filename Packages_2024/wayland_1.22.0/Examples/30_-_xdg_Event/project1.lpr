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

const
  quit: boolean = False;

  function wl_f(v: Twl_fixed_t): double; inline;
  begin
    Result := v / 256.0;
  end;

  procedure DrawRect(pixels: Puint32; w, h: integer);
  var
    x, y: Integer;
  begin
    for x := 0 to w do begin
      pixels[x + 0] := $FF00FF00;
      pixels[x+  (h-1)*w] := $FF00FF00;
    end;

    for y := 0 to h do begin
      pixels[y*w] := $FF00FF00;
      pixels[y*w+(w-1)] := $FF00FF00;
    end;
  end;

  procedure draw_window(w, h: integer);
  var
    stride, size, fd: integer;
    pixels: puint32;
    pool: Pwl_shm_pool;
    buffer: Pwl_buffer;
    x, y: integer;
  begin
    stride := w * 4;
    size := stride * h;

    fd := memfd_create('wayland-shm', 0);
    fpftruncate(fd, size);

    pixels := fpmmap(nil, size, PROT_READ or PROT_WRITE, MAP_SHARED, fd, 0);

    for y := 0 to h - 1 do begin
      for x := 0 to w - 1 do begin
        pixels[y * w + x] := $FF000000 or random($FFFFFF);
      end;
    end;

    DrawRect(pixels,w,h);

    pool := wl_shm_create_pool(shm, fd, size);
    buffer := wl_shm_pool_create_buffer(pool, 0, w, h, stride, WL_SHM_FORMAT_ARGB8888);

    wl_surface_attach(surface, buffer, 0, 0);
    wl_surface_damage(surface, 0, 0, w, h);
    wl_surface_commit(surface);

    fpmunmap(pixels, size);
    wl_shm_pool_destroy(pool);
    fpclose(fd);
  end;



  // ==== Maus

  procedure pointer_enter(data: pointer; wl_pointer: Pwl_pointer; serial: Tuint32_t; surface: Pwl_surface; surface_x, surface_y: Twl_fixed_t); cdecl;
  begin
    WriteLn('--> Enter bei: ', wl_f(surface_x): 0: 2, ' / ', wl_f(surface_y): 0: 2);
  end;

  procedure pointer_button(data: Pointer; pwl_pointer: Pwl_pointer; serial, time, button, state: Tuint32_t); cdecl;
  const
    STATES: array[0..1] of string = ('RELEASE', 'PRESS');
  begin
    case state of
      0: begin
        WriteLn('Button:', button, ' [release]');
      end;
      1: begin
        WriteLn('Button:', button, ' [press]');
      end;
    end;
  end;

  procedure pointer_axis(data: pointer; wl_pointer: Pwl_pointer; time, axis: Tuint32_t; value: Twl_fixed_t); cdecl;
  begin
    WriteLn('Scroll: Achse ', axis, ' Wert: ', wl_f(value): 0: 2);
  end;


  procedure pointer_leave(data: Pointer; pwl_pointer: Pwl_pointer; serial: Tuint32_t; psurface: Pwl_surface); cdecl;
  begin
    WriteLn('<-- Maus hat das Fenster verlassen');
  end;

  procedure pointer_motion(data: Pointer; pwl_pointer: Pwl_pointer; time: Tuint32_t; sx, sy: Twl_fixed_t); cdecl;
  begin
    Write('.');
  end;

  procedure pointer_frame(data: Pointer; pwl_pointer: Pwl_pointer); cdecl;
  begin
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
    axis_discrete: @pointer_axis_discrete);

  // ==== Keyboard

  procedure keyboard_keymap(data: Pointer; pwl_keyboard: Pwl_keyboard; format: Tuint32_t; fd: Tint32_t; size: Tuint32_t); cdecl;
  begin
    fpClose(fd);
  end;

  procedure keyboard_enter(data: Pointer; pwl_keyboard: Pwl_keyboard; serial: Tuint32_t; surface: Pwl_surface; keys: Pwl_array); cdecl;
  begin
    WriteLn('Tastatur-Fokus im Fenster erhalten.');
  end;

  procedure keyboard_leave(data: Pointer; pwl_keyboard: Pwl_keyboard; serial: Tuint32_t; surface: Pwl_surface); cdecl;
  begin
    WriteLn('Tastatur-Fokus verloren.');
  end;

  procedure keyboard_key(data: Pointer; pwl_keyboard: Pwl_keyboard; serial, time, key, state: Tuint32_t); cdecl;
  begin
    if state = 1 then begin
      WriteLn('Taste gedrückt: Scancode ', key);
      case key of
        2: begin
          draw_window(200, 300);
        end;
        3: begin
          draw_window(100, 200);
        end;
        16: begin
          quit := True;
        end;
      end;;
    end;
  end;

  procedure keyboard_modifiers(data: Pointer; pwl_keyboard: Pwl_keyboard; serial, mods_depressed, mods_latched, mods_locked, group: Tuint32_t); cdecl;
  const
    Keys: array[0..7] of pchar = ('Shift', 'Caps', 'Ctrl', 'Alt', 'Num', 'Mod3', 'Win', 'AltGr');
  var
    i: integer;
  begin
    WriteLn('mods_depressed; ', mods_depressed);
    WriteLn('mods_latched; ', mods_latched);
    WriteLn('mods_locked; ', mods_locked);
    for i := 0 to Length(Keys) - 1 do begin
      if (mods_depressed shr i) and 1 = 1 then begin
        Write('[', Keys[i], '] ');
      end;
    end;
  end;

  procedure keyboard_repeat_info(data: Pointer; pwl_keyboard: Pwl_keyboard; rate, delay: Tint32_t); cdecl;
  begin
    WriteLn('rate: ', rate, '  delay: ', delay);
  end;


const
  keyboard_listener: Twl_keyboard_listener = (
    keymap: @keyboard_keymap;
    enter: @keyboard_enter;
    leave: @keyboard_leave;
    key: @keyboard_key;
    modifiers: @keyboard_modifiers;
    repeat_info: @keyboard_repeat_info);

  procedure seat_capabilities(data: Pointer; p_seat: Pwl_seat; caps: Tuint32_t); cdecl;
  var
    m_pointer: Pwl_pointer;
    m_keyboard: Pwl_keyboard;
  begin
    WriteLn('seat_capabilities   ', caps);
    if (caps and 1) <> 0 then begin
      m_pointer := wl_seat_get_pointer(p_seat);
      wl_pointer_add_listener(m_pointer, @pointer_listener, nil);
      WriteLn('Maus-Support aktiviert.');
    end;
    if (caps and 2) <> 0 then begin
      m_keyboard := wl_seat_get_keyboard(p_seat);
      wl_keyboard_add_listener(m_keyboard, @keyboard_listener, nil);
      WriteLn('Tastatur-Support aktiviert.');
    end;
  end;

  procedure xdg_surface_configure(data: Pointer; xdg_surf: Pxdg_surface; serial: Tuint32_t); cdecl;
  begin
    xdg_surface_ack_configure(xdg_surf, serial);
    draw_window(300, 200);
  end;

  procedure xdg_wm_base_ping(data: Pointer; xdg_wm: Pxdg_wm_base; serial: Tuint32_t); cdecl;
  begin
    xdg_wm_base_pong(xdg_wm, serial);
  end;


  procedure registry_handler(data: Pointer; registry: Pwl_registry; id: Tuint32_t; iface: pchar; version: Tuint32_t); cdecl;
  var
    seat: Pointer;
  const
    seat_listener: Twl_seat_listener = (capabilities: @seat_capabilities; name: nil);
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

  procedure main;
  var
    registry: Pwl_registry;
  const
    registry_listener: Twl_registry_listener = (global: @registry_handler; global_remove: nil);
    xdg_wm_base_listener: Txdg_wm_base_listener = (ping: @xdg_wm_base_ping);
    xdg_surface_listener: Txdg_surface_listener = (configure: @xdg_surface_configure);
  begin
    display := wl_display_connect(nil);
    if display = nil then begin
      WriteLn('no Wayland!');
      Halt(1);
    end;

    registry := wl_display_get_registry(display);
    wl_registry_add_listener(registry, @registry_listener, nil);
    wl_display_roundtrip(display);

    if (compositor = nil) or (shm = nil) or (xdg_wm_base = nil) then begin
      Writeln('Wayland-Interface failure!');
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
    while (wl_display_dispatch(display) <> -1) and not quit do begin
      //      WriteLn('99999');
    end;

    xdg_toplevel_destroy(xdg_toplevel);
    xdg_surface_destroy(xdg_surface);
    wl_surface_destroy(surface);
    wl_display_disconnect(display);
  end;

begin
  main;
end.
