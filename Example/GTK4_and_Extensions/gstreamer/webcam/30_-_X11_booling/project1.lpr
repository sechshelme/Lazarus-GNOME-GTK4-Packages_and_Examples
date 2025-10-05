
program project1;

uses
  unixtype,
  ctypes,
  xlib,
  x,
  xutil,
  keysym,
  fp_glib2,
  fp_gst_app,
  fp_gst;

const
  EventMask = KeyPressMask or ExposureMask or PointerMotionMask or ButtonPressMask;

  Width = 640;
  Height = 480;

var
  pipeline, appsink: PGstElement;
  dis: PDisplay;
  scr: cint;
  gc: TGC;
  rootWin, win: TWindow;
  visual: PVisual;
  image: PXImage;
  Event: TXEvent;

  // https://stackoverflow.com/questions/69747987/gstreamer-rtsp-tee-appsink-cant-emit-signal-new-sample

  procedure Draw;
  var
    sample: PGstSample;
    buffer: PGstBuffer;
    map: TGstMapInfo;
  begin
    g_signal_emit_by_name(appsink, 'pull-sample', @sample);
    buffer := gst_sample_get_buffer(sample);
    gst_buffer_map(buffer, @map, GST_MAP_READ);

    image^.Data := pansichar(map.Data);
    XPutImage(dis, win, gc, image, 0, 0, 0, 0, Width, Height);

    gst_buffer_unmap(buffer, @map);
    gst_sample_unref(sample);
  end;

  procedure main;
  var
    quit: boolean = False;
  begin
    // X11

    dis := XOpenDisplay(nil);
    if dis = nil then begin
      WriteLn('Kann nicht das Display öffnen');
      Halt(1);
    end;
    scr := DefaultScreen(dis);
    gc := DefaultGC(dis, scr);
    rootWin := RootWindow(dis, scr);
    win := XCreateSimpleWindow(dis, rootWin, 10, 10, Width, Height, 1, BlackPixel(dis, scr), WhitePixel(dis, scr));
    XStoreName(dis, win, 'Webcam-Fenster');
    XSelectInput(dis, win, EventMask);
    XMapWindow(dis, win);

    gc := XCreateGC(dis, win, 0, nil);

    visual := DefaultVisual(dis, scr);
    image := XCreateImage(dis, visual, 24, ZPixmap, 0, nil, Width, Height, 32, 0);


    // === GST

    gst_init(@argc, @argv);

    pipeline := gst_parse_launch('v4l2src name=cam_src ! videoconvert ! videoscale ! video/x-raw,format=RGBA,width=640,height=480,name=videox ! queue ! videoconvert ! appsink name=sink', nil);
    if pipeline = nil then begin
      WriteLn('pipeline error');
    end;

    appsink := gst_bin_get_by_name(GST_BIN(pipeline), 'sink');
    if appsink = nil then begin
      WriteLn('sink error');
      Halt;
    end;

    gst_element_set_state(pipeline, GST_STATE_PLAYING);

    while not Quit do begin
      if XPending(dis) > 0 then begin
        XNextEvent(dis, @Event);
        case Event._type of
          Expose: begin
          end;
          ButtonPress: begin
            XRaiseWindow(dis, Event.xbutton.window);
          end;
          KeyPress: begin
            if XLookupKeysym(@Event.xkey, 0) = XK_Escape then begin
              quit := True;
            end;
          end;
        end;
      end else begin
        Draw;
      end;
    end;

    XDestroyWindow(dis, win);
    XCloseDisplay(dis);
  end;

begin
  main;
end.
