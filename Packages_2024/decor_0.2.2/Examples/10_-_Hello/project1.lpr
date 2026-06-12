program project1;

uses
  BaseUnix,
  fp_wayland,
  fp_decor;

  function memfd_create(name: pchar; flags: cardinal): integer; cdecl; external 'c';

const
  DEFAULT_WIDTH = 400;
  DEFAULT_HEIGHT = 300;
  BG_COLOR_XRGB = $FFaa66ff;

type
  TWindow = record
    wl_surface: Pwl_surface;
    frame: Plibdecor_frame;
    current_buffer: Pwl_buffer;
    width, height: integer;
    scale: integer;
  end;

  TWaylandApp = record
    display: Pwl_display;
    registry: Pwl_registry;
    compositor: Pwl_compositor;
    shm: Pwl_shm;
    ctx: Plibdecor;

    has_xrgb: boolean;
    first_configure: boolean;
    quit: boolean;

    window: TWindow;
  end;
  PWaylandApp = ^TWaylandApp;

var
  shm_listener: Twl_shm_listener;
  buffer_listener: Twl_buffer_listener;
  frame_iface: Tlibdecor_frame_interface;
  registry_listener: Twl_registry_listener;
  decor_iface: Tlibdecor_interface;


  procedure shm_format(data: Pointer; wl_shm: Pwl_shm; format: uint32); cdecl;
  var
    app: PWaylandApp absolute data;
  begin
    if format = WL_SHM_FORMAT_XRGB8888 then begin
      app^.has_xrgb := True;
    end;
  end;

  procedure buffer_release(data: Pointer; wl_buffer: Pwl_buffer); cdecl;
  begin
    wl_buffer_destroy(wl_buffer);
  end;

  function create_buffer(app: PWaylandApp; width, height: integer): Pwl_buffer;
  var
    stride, size: integer;
    fd: integer;
    pixels: Puint32;
    i: integer;
    pool: Pwl_shm_pool;
    buffer: Pwl_buffer;
  begin
    stride := width * 4;
    size := stride * height;

    fd := memfd_create('wayland-shm', 0);
    if fd < 0 then begin
      Exit(nil);
    end;

    if fpfTruncate(fd, size) < 0 then begin
      fpClose(fd);
      Exit(nil);
    end;

    pixels := Fpmmap(nil, size, PROT_READ or PROT_WRITE, MAP_SHARED, fd, 0);
    if pixels = MAP_FAILED then begin
      fpClose(fd);
      Exit(nil);
    end;

    for i := 0 to (width * height) - 1 do begin
      pixels[i] := BG_COLOR_XRGB;
    end;

    pool := wl_shm_create_pool(app^.shm, fd, size);
    buffer := wl_shm_pool_create_buffer(pool, 0, width, height, stride, WL_SHM_FORMAT_XRGB8888);

    wl_buffer_add_listener(buffer, @buffer_listener, nil);

    Fpmunmap(pixels, size);
    wl_shm_pool_destroy(pool);
    fpClose(fd);

    Result := buffer;
  end;

  procedure redraw(app: PWaylandApp);
  var
    buffer: Pwl_buffer;
  begin
    buffer := create_buffer(app, app^.window.width * app^.window.scale, app^.window.height * app^.window.scale);

    app^.window.current_buffer := buffer;

    wl_surface_attach(app^.window.wl_surface, buffer, 0, 0);
    wl_surface_set_buffer_scale(app^.window.wl_surface, app^.window.scale);
    wl_surface_damage_buffer(app^.window.wl_surface, 0, 0, app^.window.width * app^.window.scale, app^.window.height * app^.window.scale);

    wl_surface_commit(app^.window.wl_surface);
  end;


  procedure handle_configure_cp(frame: Plibdecor_frame; config: Plibdecor_configuration; data: Pointer); cdecl;
  var
    app: PWaylandApp absolute data;
    width, height: integer;
    state: Plibdecor_state;
  begin
    width := DEFAULT_WIDTH;
    height := DEFAULT_HEIGHT;

    libdecor_configuration_get_content_size(config, frame, @width, @height);
    if width <= 0 then begin
      width := DEFAULT_WIDTH;
    end;
    if height <= 0 then begin
      height := DEFAULT_HEIGHT;
    end;

    app^.window.width := width;
    app^.window.height := height;

    state := libdecor_state_new(width, height);
    libdecor_frame_commit(frame, state, config);
    libdecor_state_free(state);

    redraw(app);
  end;

  procedure handle_close_cp(frame: Plibdecor_frame; data: Pointer); cdecl;
  var
    app: PWaylandApp absolute data;
  begin
    app^.quit := True;
  end;

  procedure handle_commit_cp(frame: Plibdecor_frame; data: Pointer); cdecl;
  var
    app: PWaylandApp absolute data;
  begin
    if app^.first_configure then begin
      app^.first_configure := False;
      redraw(app);
    end;
  end;

  procedure decor_error_cp(ctx: Plibdecor; error: Tlibdecor_error; message: pchar); cdecl;
  begin
    WriteLn(StdErr, 'libdecor Fehler: ', message);
  end;


  procedure registry_global_cp(data: Pointer; registry: Pwl_registry; id: uint32; iface: pchar; version: uint32); cdecl;
  var
    app: PWaylandApp absolute data;
  begin
    case string(iface) of
      'wl_compositor': begin
        app^.compositor := Pwl_compositor(wl_registry_bind(registry, id, @wl_compositor_interface, 4));
      end;
      'wl_shm': begin
        app^.shm := Pwl_shm(wl_registry_bind(registry, id, @wl_shm_interface, 1));
        wl_shm_add_listener(app^.shm, @shm_listener, app);
      end;
    end;
  end;

  procedure registry_global_remove_cp(data: Pointer; registry: Pwl_registry; name: uint32); cdecl;
  begin
  end;


  procedure main;
  var
    app: TWaylandApp;
  begin
    FillByte(app, SizeOf(app), 0);
    app.first_configure := True;
    app.window.scale := 1;
    app.window.width := DEFAULT_WIDTH;
    app.window.height := DEFAULT_HEIGHT;

    shm_listener.format := @shm_format;
    buffer_listener.release := @buffer_release;

    frame_iface.configure := @handle_configure_cp;
    frame_iface.close := @handle_close_cp;
    frame_iface.commit := @handle_commit_cp;

    registry_listener.global := @registry_global_cp;
    registry_listener.global_remove := @registry_global_remove_cp;

    decor_iface.error := @decor_error_cp;

    app.display := wl_display_connect(nil);
    if app.display = nil then begin
      WriteLn(StdErr, 'Fehler: Konnte nicht mit Wayland verbinden.');
      Halt(1);
    end;

    app.registry := wl_display_get_registry(app.display);
    wl_registry_add_listener(app.registry, @registry_listener, @app);

    wl_display_roundtrip(app.display);
    wl_display_roundtrip(app.display);

    if (app.compositor = nil) or (app.shm = nil) or (not app.has_xrgb) then begin
      WriteLn(StdErr, 'Fehler: Es fehlen benötigte Wayland-Globals (Compositor oder SHM).');
      wl_display_disconnect(app.display);
      Halt(1);
    end;

    app.window.wl_surface := wl_compositor_create_surface(app.compositor);

    app.ctx := libdecor_new(app.display, @decor_iface);
    app.window.frame := libdecor_decorate(app.ctx, app.window.wl_surface, @frame_iface, @app);
    libdecor_frame_set_title(app.window.frame, 'Minimal libdecor ✅');
    libdecor_frame_map(app.window.frame);

    while not app.quit do begin
      if libdecor_dispatch(app.ctx, -1) < 0 then begin
        app.quit := True;
      end;
    end;

    if app.window.current_buffer <> nil then begin
//      wl_buffer_destroy(app.window.current_buffer);
    end;

    libdecor_unref(app.ctx);
    wl_surface_destroy(app.window.wl_surface);
    if app.registry <> nil then begin
      wl_registry_destroy(app.registry);
    end;
    wl_display_disconnect(app.display);
  end;

begin
  main;
end.
