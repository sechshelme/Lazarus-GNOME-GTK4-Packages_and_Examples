program project1;

uses
  keysym,
  xlib,
  xproto,
  xcb,
  xcb_keysyms,
  fp_xcb;

  procedure paint(conn: Pxcb_connection_t; window: Txcb_window_t; gc: Txcb_gcontext_t);
  const
    points: array[0..3] of Txcb_point_t = (
      (x: 10; y: 10), (x: 10; y: 20), (x: 20; y: 10), (x: 20; y: 20));
    polyline: array[0..3] of Txcb_point_t = (
      (x: 50; y: 10), (x: 5; y: 20), (x: 25; y: -20), (x: 10; y: 10));
    segments: array[0..1] of Txcb_segment_t = (
      (x1: 100; y1: 10; x2: 140; y2: 30), (x1: 110; y1: 25; x2: 130; y2: 60));
    rectangles: array[0..1] of Txcb_rectangle_t = ((x: 10; y: 50; width: 40; height: 20), (x: 80; y: 50; width: 10; height: 40));
    arcs: array[0..1] of Txcb_arc_t = (
      (x: 10; y: 100; width: 60; height: 40; angle1: 0; angle2: 90 shl 6), (x: 90; y: 100; width: 55; height: 40; angle1: 0; angle2: 270 shl 6));
  begin
    xcb_poly_point(conn, XCB_COORD_MODE_ORIGIN, window, gc, 4, @points[0]);
    xcb_poly_line(conn, XCB_COORD_MODE_PREVIOUS, window, gc, 4, @polyline[0]);
    xcb_poly_segment(conn, window, gc, 2, @segments[0]);
    xcb_poly_rectangle(conn, window, gc, 2, @rectangles[0]);
    xcb_poly_arc(conn, window, gc, 2, @arcs[0]);
    xcb_flush(conn);
  end;

  procedure main;
  var
    conn: Pxcb_connection_t;
    screen: Pxcb_screen_t;
    window: Txcb_window_t;
    gc: Txcb_gcontext_t;
    mask: integer;
    values, gc_values: array[0..1] of integer;
    event: Pxcb_generic_event_t;
    kp: Pxcb_key_press_event_t;
    keysyms: Pxcb_key_symbols_t;
    keysym: Txcb_keysym_t;
    quit: boolean = False;
    color: uint32;
  begin
    conn := xcb_connect(nil, nil);
    if xcb_connection_has_error(conn) <> 0 then begin
      WriteLn('Error opening display');
      Exit;
    end;

    screen := xcb_setup_roots_iterator(xcb_get_setup(conn)).data;
    window := xcb_generate_id(conn);

    mask := XCB_CW_BACK_PIXEL or XCB_CW_EVENT_MASK;
    values[0] := screen^.white_pixel;
    values[1] := XCB_EVENT_MASK_EXPOSURE or XCB_EVENT_MASK_KEY_PRESS;
    xcb_create_window(conn, XCB_COPY_FROM_PARENT, window, screen^.root, 0, 0, 400, 300, 10,
      XCB_WINDOW_CLASS_INPUT_OUTPUT, screen^.root_visual, mask, @values);

    xcb_map_window(conn, window);
    xcb_flush(conn);

    gc := xcb_generate_id(conn);
    gc_values[0] := screen^.black_pixel;
    gc_values[1] := 0;
    xcb_create_gc(conn, gc, window, XCB_GC_FOREGROUND or XCB_GC_GRAPHICS_EXPOSURES, @gc_values);

    repeat
      event := xcb_wait_for_event(conn);
      if event = nil then begin
        Break;
      end;

      case event^.response_type and not $80 of
        XCB_EXPOSE: begin
          paint(conn, window, gc);
        end;
        XCB_KEY_PRESS: begin
          kp := Pxcb_key_press_event_t(event);
          keysyms := xcb_key_symbols_alloc(conn);
          if keysyms <> nil then begin
            keysym := xcb_key_symbols_get_keysym(keysyms, kp^.detail, 0);
            xcb_key_symbols_free(keysyms);
            case keysym of
              XK_Escape: begin
                quit := True;
              end;
              XK_space: begin
                color := random($FFFFFF);
                xcb_change_window_attributes(conn, window, XCB_CW_BACK_PIXEL, @color);
                xcb_clear_area(conn, 0, window, 0, 0, 400, 300);
                paint(conn, window, gc);
              end;
            end;
          end;
        end;
      end;

      xfree(event);
    until quit;
    xcb_disconnect(conn);
  end;

begin
  main;
end.
