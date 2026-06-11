program project1;

uses
  fp_xdg,
  fp_wayland,

  ctypes,
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

  // --- 3. Zeichnen und Buffer erstellen ---
  procedure draw_window();
  var
    stride, size, fd: integer;
    pixels: puint32;
    pool: Pwl_shm_pool;
    buffer: Pwl_buffer;
    x, y: integer;
  begin
    stride := window_width * 4;
    size := stride * window_height;

    // memfd_create Ersatz via Syscall (Nr 319 für x86_64)
    fd := memfd_create('wayland-shm', 0);
    fpftruncate(fd, size);

    pixels := fpmmap(nil, size, PROT_READ or PROT_WRITE, MAP_SHARED, fd, 0);

    // Fenster mit Blau füllen
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

  // --- 2. XDG-Shell Listener ---
  procedure xdg_surface_configure(data: Pointer; xdg_surf: Pxdg_surface; serial: Tuint32_t); cdecl;
  begin
    xdg_surface_ack_configure(xdg_surf, serial);
    draw_window();
  end;

const
  xdg_surface_listener: Txdg_surface_listener = (
    configure: @xdg_surface_configure
    );

  procedure xdg_wm_base_ping(data: Pointer; xdg_wm: Pxdg_wm_base; serial: Tuint32_t); cdecl;
  begin
    xdg_wm_base_pong(xdg_wm, serial);
  end;

const
  xdg_wm_base_listener: Txdg_wm_base_listener = (
    ping: @xdg_wm_base_ping
    );

  // --- 1. Registry Listener ---
  procedure registry_handler(data: Pointer; registry: Pwl_registry; id: Tuint32_t; iface: pchar; version: Tuint32_t); cdecl;
  begin
    WriteLn(1111111);
    WriteLn('Globales Objekt gefunden: ', iface, ' (Version ', version, ')');

    if iface = 'wl_compositor' then begin
      compositor := wl_registry_bind(registry, id, @wl_compositor_interface, 1);
    end else if iface = 'wl_shm' then begin
      shm := wl_registry_bind(registry, id, @wl_shm_interface, 1);
    end else if iface = 'xdg_wm_base' then begin
      xdg_wm_base := wl_registry_bind(registry, id, @xdg_wm_base_interface, 1);
    end;
  end;

const
  registry_listener: Twl_registry_listener = (
    global: @registry_handler;
    global_remove: nil
    );

  // --- MAIN ---
  procedure main;
  begin
    display := wl_display_connect(nil);
    if display = nil then begin
      Halt(1);
    end;

    // Registry abrufen
    wl_registry_add_listener(wl_display_get_registry(display), @registry_listener, nil);
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
      WriteLn(999);
    end;

    wl_display_disconnect(display);
  end;

begin
  main;
end.
